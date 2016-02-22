/*
 * Copyright (C) 2013 by the Widelands Development Team
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

#ifndef WL_LOGIC_MAP_REVISION_H
#define WL_LOGIC_MAP_REVISION_H

#include <cstring>
#include <ctime>
#include <memory>
#include <set>
#include <string>
#include <vector>

namespace Widelands {




struct MapVersion {

	std::string map_source_url_;
	std::string map_source_release_;
	std::string map_creator_version_;
	int32_t     map_version_major_;
	int32_t     map_version_minor_;
	uint32_t    map_version_timestamp_;

	MapVersion();

};

}



#endif  // end of include guard: WL_LOGIC_MAP_REVISION_H
