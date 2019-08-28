dirname = path.dirname (__file__)

tribes:new_trainingsite_type {
   msgctxt = "amazons_building",
   name = "amazons_training_glade",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("amazons_building", "Training Glade"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      ironwood = 4,
      log = 5,
      granite = 4,
      rubber = 4,
      rope = 2,
      gold = 3
   },
   return_on_dismantle = {
      ironwood = 2,
      log = 3,
      granite = 2,
      rubber = 2,
      rope = 1,
      gold = 1
   },

   animations = {
      idle = {
         pictures = path.list_files (dirname .. "idle_??.png"),
         hotspot = {114, 124},
         fps = 10,
      },
      working = {
         pictures = path.list_files (dirname .. "working_??.png"),
         hotspot = {114, 124},
         fps = 10,
      },
      unoccupied = {
         pictures = path.list_files (dirname .. "unoccupied_?.png"),
         hotspot = {114, 98},
      },
   },

   aihints = {
      trainingsites_max_percent = 40,
      prohibited_till = 1500,
      very_weak_ai_limit = 0,
      weak_ai_limit = 1
   },

   working_positions = {
      amazons_trainer = 1
   },

   inputs = {
      { name = "fish", amount = 4 },
      { name = "meat", amount = 4 },
      { name = "bread_amazons", amount = 2 },
      { name = "chocolate", amount = 5 },
      { name = "boots_sturdy", amount = 2 },
      { name = "boots_swift", amount = 2 },
      { name = "boots_hero", amount = 2 },
      { name = "armor_wooden", amount = 2 },
      { name = "helmet_wooden", amount = 2 },
      { name = "warriors_coat", amount = 2 },
      { name = "vest_padded", amount = 2 },
      { name = "protector_padded", amount = 2 },
   },
   outputs = {
      "amazons_soldier",
   },

   ["soldier evade"] = {
      min_level = 0,
      max_level = 2,
      food = {
         {"fish", "meat"},
         {"chocolate"},
         {"bread_amazons"}
      },
      weapons = {
         "boots_sturdy",
         "boots_swift",
         "boots_hero",
      }
   },
   ["soldier health"] = {
      min_level = 0,
      max_level = 2,
      food = {
         {"fish", "meat"},
         {"chocolate"},
         {"bread_amazons"}
      },
      weapons = {
         "armor_wooden",
         "helmet_wooden",
         "warriors_coat",
      }
   },
   ["soldier defense"] = {
      min_level = 0,
      max_level = 1,
      food = {
         {"fish", "meat"},
         {"chocolate"},
         {"bread_amazons"}
      },
      weapons = {
         "vest_padded",
         "protector_padded"
      }
   },

   programs = {
      sleep = {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping",
         actions = {
            "sleep=5000",
            "return=no_stats",
         }
      },
      upgrade_soldier_evade_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "checksoldier=soldier evade 0",
            "return=failed unless site has boots_sturdy",
            "return=failed unless site has chocolate",
            "return=failed unless site has fish,meat",
            "animate=working 22800",
            "checksoldier=soldier evade 0", -- Because the soldier can be expelled by the player
            "consume=boots_sturdy chocolate fish,meat",
            "train=soldier evade 0 1"
         }
      },
      upgrade_soldier_evade_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier evade from level 1 to level 2"),
         actions = {
            "checksoldier=soldier evade 1",
            "return=failed unless site has boots_swift",
            "return=failed unless site has chocolate",
            "return=failed unless site has bread_amazons",
            "animate=working 15600",
            "checksoldier=soldier evade 1", -- Because the soldier can be expelled by the player
            "consume=boots_swift bread_amazons chocolate",
            "train=soldier evade 1 2",
         }
      },
      upgrade_soldier_evade_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier evade from level 2 to level 3"),
         actions = {
            "checksoldier=soldier evade 2",
            "return=failed unless site has boots_hero",
            "return=failed unless site has chocolate:2",
            "return=failed unless site has bread_amazons:2",
            "return=failed unless site has fish,meat:2",
            "animate=working 15600",
            "checksoldier=soldier evade 2", -- Because the soldier can be expelled by the player
            "consume=boots_hero bread_amazons:2 chocolate:2 fish,meat:2",
            "train=soldier evade 2 3",
         }
      },
      upgrade_soldier_health_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "checksoldier=soldier health 0",
            "return=failed unless site has armor_wooden",
            "return=failed unless site has chocolate",
            "return=failed unless site has fish,meat",
            "animate=working 22800",
            "checksoldier=soldier health 0", -- Because the soldier can be expelled by the player
            "consume=armor_wooden chocolate fish,meat",
            "train=soldier health 0 1"
         }
      },
      upgrade_soldier_health_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier health 1",
            "return=failed unless site has helmet_wooden",
            "return=failed unless site has chocolate",
            "return=failed unless site has bread_amazons",
            "animate=working 15600",
            "checksoldier=soldier health 1", -- Because the soldier can be expelled by the player
            "consume=helmet_wooden bread_amazons chocolate",
            "train=soldier health 1 2",
         }
      },
      upgrade_soldier_health_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier health from level 2 to level 3"),
         actions = {
            "checksoldier=soldier health 2",
            "return=failed unless site has warriors_coat",
            "return=failed unless site has chocolate",
            "return=failed unless site has bread_amazons",
            "return=failed unless site has fish,meat",
            "animate=working 15600",
            "checksoldier=soldier health 2", -- Because the soldier can be expelled by the player
            "consume=warriors_coat bread_amazons chocolate fish,meat",
            "train=soldier health 2 3",
         }
      },
      upgrade_soldier_defense_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier defense from level 1 to level 2"),
         actions = {
            "checksoldier=soldier defense 0",
            "return=failed unless site has vest_padded",
            "return=failed unless site has chocolate",
            "return=failed unless site has bread_amazons",
            "animate=working 22800",
            "checksoldier=soldier defense 0", -- Because the soldier can be expelled by the player
            "consume=vest_padded bread_amazons chocolate",
            "train=soldier defense 0 1",
         }
      },
      upgrade_soldier_defense_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext ("amazons_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier defense 1",
            "return=failed unless site has protector_padded",
            "return=failed unless site has chocolate",
            "return=failed unless site has bread_amazons",
            "return=failed unless site has fish,meat",
            "animate=working 22800",
            "checksoldier=soldier defense 1", -- Because the soldier can be expelled by the player
            "consume=protector_padded bread_amazons chocolate fish,meat",
            "train=soldier health 1 2",

         }
      },
   },

   soldier_capacity = 6,
   trainer_patience = 3
}
