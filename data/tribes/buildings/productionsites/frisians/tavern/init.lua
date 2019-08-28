dirname = path.dirname (__file__)

tribes:new_productionsite_type {
   msgctxt = "frisians_building",
   name = "frisians_tavern",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("frisians_building", "Tavern"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "medium",
   enhancement = "frisians_drinking_hall",

   buildcost = {
      brick = 3,
      log = 2,
      reed = 2
   },
   return_on_dismantle = {
      brick = 2,
      log = 1,
      reed = 1
   },

   animations = {
      idle = {
         pictures = path.list_files (dirname .. "idle_??.png"),
         hotspot = {56, 84},
         fps = 10,
      },
      working = {
         pictures = path.list_files (dirname .. "working_??.png"),
         hotspot = {56, 84},
         fps = 10,
      },
      unoccupied = {
         pictures = path.list_files (dirname .. "unoccupied_?.png"),
         hotspot = {56, 66},
      },
   },

   aihints = {
      prohibited_till = 520,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      basic_amount = 1
   },

   working_positions = {
      frisians_landlady = 1
   },

   inputs = {
      { name = "bread_frisians", amount = 4 },
      { name = "fruit", amount = 4 },
      { name = "smoked_fish", amount = 4 },
      { name = "smoked_meat", amount = 4 },
   },
   outputs = {
      "ration"
   },

   programs = {
      work = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_malus",
            "call=produce_bonus",
            "return=no_stats"
         },
      },
      produce_malus = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing only one ration because ... (can produce more efficient when supply is good)
         descname = _"preparing only one ration",
         actions = {
            -- time total: 49.5
            "return=skipped unless economy needs ration",
            "return=skipped when site has bread_frisians,fruit and site has smoked_fish,smoked_meat",
            "consume=bread_frisians,fruit,smoked_fish,smoked_meat",
            "sleep=5000",
            "animate=working 34500",
            "sleep=10000",
            "produce=ration"
         },
      },
      produce_bonus = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing rations because ...
         descname = _"preparing rations",
         actions = {
            -- time total: 66
            "return=skipped unless economy needs ration",
            "consume=bread_frisians,fruit smoked_fish,smoked_meat",
            "sleep=5000",
            "animate=working 51000",
            "sleep=10000",
            "produce=ration:2"
         },
      },
   },
}
