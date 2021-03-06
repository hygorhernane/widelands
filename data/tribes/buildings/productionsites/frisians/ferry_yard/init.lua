dirname = path.dirname(__file__)

tribes:new_productionsite_type {
   msgctxt = "frisians_building",
   name = "frisians_ferry_yard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Ferry Yard"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"waterways"},

   buildcost = {
      brick = 3,
      granite = 1,
      log = 3,
      reed = 2,
      cloth = 1
   },
   return_on_dismantle = {
      brick = 2,
      log = 2,
      reed = 1
   },

   spritesheets = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {50, 75},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      }
   },
   animations = {
      unoccupied = {
         directory = dirname,
         basename = "unoccupied",
         hotspot = {50, 58}
      }
   },

   aihints = {},

   indicate_workarea_overlaps = {
      frisians_ferry_yard = false,
   },

   working_positions = {
      frisians_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 6 },
      { name = "cloth", amount = 3 },
   },

   programs = {
      work = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "sleep=20000",
            "callworker=buildferry_1",
            "consume=log:2 cloth",
            "callworker=buildferry_2"
         }
      },
   },
}
