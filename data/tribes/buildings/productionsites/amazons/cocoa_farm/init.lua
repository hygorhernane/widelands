dirname = path.dirname (__file__)

tribes:new_productionsite_type {
   msgctxt = "amazons_building",
   name = "amazons_cocoa_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("amazons_building", "Cocoa Farm"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 4,
      rubber = 2,
      granite = 2,
   },
   return_on_dismantle = {
      log = 2,
      rubber = 1,
      granite = 1,
   },

   animations = {
      idle = {
         pictures = path.list_files (dirname .. "idle_??.png"),
         hotspot = {49, 89},
         fps = 10,
      },
      unoccupied = {
         pictures = path.list_files (dirname .. "unoccupied_?.png"),
         hotspot = {49, 66},
      },
   },

   aihints = {
      space_consumer = true,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      basic_amount = 2,
   },

   working_positions = {
      amazons_cocoa_farmer = 1
   },

   outputs = {
      "cocoa_beans"
   },

   indicate_workarea_overlaps = {
      amazons_junglemaster_hut = false,
      amazons_rare_tree_plantation = false,
      amazons_cocoa_farm = false,
      amazons_cassava_root_plantation = false,
   },

   programs = {
      work = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=plant_cocoa",
            "call=harvest_cocoa",
            "return=no_stats"
         }
      },
      plant_cocoa = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
         descname = _"planting cocoa",
         actions = {
            "callworker=plant",
            "sleep=10000"
         }
      },
      harvest_cocoa = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
         descname = _"harvesting cocoa",
         actions = {
            "callworker=harvest",
            "sleep=4000"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Fields",
      heading = _"Out of Fields",
      message = pgettext("amazons_building", "The cocoa farmer working at this cocoa farm has no cleared soil to plant his seeds."),
      productivity_threshold = 20
   },
}
