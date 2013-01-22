/*
 * Copyright (C) 2003, 2006-2011 by the Widelands Development Team
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

#include "icongrid.h"

#include "log.h"

#include "button.h"
#include "mouse_constants.h"

#include "graphic/font_handler.h"
#include "graphic/rendertarget.h"
#include "constants.h"

namespace UI {

struct IconGridButton : public Button {
	IconGridButton
		(Icon_Grid         & parent,
		 std::string const & name,
		 const int32_t x, const int32_t y, const uint32_t w, const uint32_t h,
		 const IPicture* background_pictute_id,
		 const IPicture* foreground_picture_id,
		 const uint32_t callback_argument_id,
		 std::string const & tooltip_text)
		:
		Button
			(&parent, name, x, y, w, h, background_pictute_id,
			 foreground_picture_id,
			 tooltip_text, true, true),
			 m_icongrid(parent),
			 _callback_argument_id(callback_argument_id)
		{}

private:
	Icon_Grid & m_icongrid;
	const uint32_t _callback_argument_id;

	void handle_mousein(bool const inside) {
		if (inside) {
			m_icongrid.mousein(_callback_argument_id);
		} else {
			m_icongrid.mouseout(_callback_argument_id);
		}
		Button::handle_mousein(inside);
	}
};

/**
 * Initialize the grid
*/
Icon_Grid::Icon_Grid
	(Panel  * const parent,
	 int32_t const x, int32_t const y, int32_t const cellw, int32_t const cellh,
	 int32_t  const cols)
	:
	Panel            (parent, x, y, 0, 0),
	m_columns        (cols),
	m_cell_width     (cellw),
	m_cell_height    (cellh)
{}


/**
 * Add a new icon to the list and resize appropriately.
 * Returns the index of the newly added icon.
*/
int32_t Icon_Grid::add
	(std::string const & name, const IPicture* pic,
	 void * const data, std::string const & tooltip_text)
{
	Item it;

	it.data = data;

	m_items.push_back(it);

	// resize
	int32_t const rows = (m_items.size() + m_columns - 1) / m_columns;

	if (rows <= 1) {
		set_desired_size(m_cell_width * m_columns, m_cell_height);
	} else {
		set_desired_size
			(m_cell_width * m_columns, m_cell_height * rows);
	}

	uint32_t idx = m_items.size() - 1;
	uint32_t x = (idx % m_columns) * m_cell_width;
	uint32_t y = (idx / m_columns) * m_cell_height;

	UI::Button * btn = new IconGridButton
		(*this, name,
		 x, y, m_cell_width, m_cell_height,
		 NULL, pic,
		 idx, tooltip_text);
	btn->sigclicked.connect(boost::bind(&Icon_Grid::clicked_button, this, idx));

	return idx;
}

void Icon_Grid::clicked_button(uint32_t idx) {
	clicked(idx);
	play_click();
}

/**
 * Returns the user-defined data of the icon with the given index.
*/
void * Icon_Grid::get_data(int32_t const idx)
{
	assert(static_cast<uint32_t>(idx) < m_items.size());

	return m_items[idx].data;
}

}
