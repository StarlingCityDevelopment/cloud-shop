--? For support, join our Discord server: https://discord.gg/jAnEnyGBef

return {
    Framework = "qbox",                                                                        -- Options: "esx", "qbox", "qbcore", "custom", or "auto" (auto-detects avaible options)
    Locale = "fr",                                                                             -- Options: "en", "de"
    DebugMode = (GetConvar('environment', 'production') == 'development') and "dev" or "prod", -- Options: "prod" (minimal logs), "dev" (detailed logs), false (disable logs)

    EnableSounds = true,                                                                       -- Plays sounds when interacting with the shop interface
    ImagePath = "https://i.fmfile.com/crYy4c7aRNeXoSSaCocBd/",                                 -- Path to the item images --? Local folder: "item_images/"
    WeaponAsItem = true,                                                                       -- Treat weapons as items

    Shops = {
        ["shop"] = {
            PointRadius = 25.0, -- The radius within which markers, peds, and other game elements related to the shop are displayed

            Locations = {
                vec4(-1819.49, 793.59, 138.08, 132.59),
                vec4(-2071.31, -333.17, 13.32, 350.42),
                vec4(191.74, -23.09, 69.92, 251.27),
                vec4(237.51, -910.36, 29.73, 161.48),
                vec4(82.32, -224.13, 54.65, 72.55),
                vec4(-6.04, -1821.26, 25.32, 140.55),
                vec4(372.8008, 328.1116, 103.5665, 262.1354),
                vec4(2555.5110, 380.7313, 108.6229, 0.9597),
                vec4(-3040.5376, 583.9359, 7.9089, 17.7445),
                vec4(-3243.9229, 1000.0519, 12.8307, 0.7583),
                vec4(1134.2589, -983.0569, 46.4158, 278.9547),
                vec4(-1221.4543, -908.0496, 12.3263, 36.5340),
                vec4(-1486.7350, -377.5593, 40.1634, 132.9464),
                vec4(-2966.3162, 391.5883, 15.0433, 86.4455),
                vec4(24.5062, -1345.5989, 29.4970, 263.3659),
                vec4(-47.2886, -1758.5280, 29.4210, 45.3676),
                vec4(1165.0068, -323.6485, 69.2051, 101.2836),
                vec4(-706.0665, -914.6005, 19.2156, 82.3892),
                vec4(430.96, -1967.51, 23.11, 312.74),
                vec4(41.89, -1491.31, 29.8, 323.3),
            },

            --? For icons, use Iconify: https://icon-sets.iconify.design
            Categories = {
                { name = "Tous les produits", type = "all",         icon = "ic:round-clear-all" }, --! Required for all shops
                { name = "Food",              type = "food",        icon = "mdi:food-drumstick" },
                { name = "Drinks",            type = "drinks",      icon = "ion:water-sharp" },
                { name = "Electronics",       type = "electronics", icon = "ic:round-phone-iphone" },
                { name = "Divers",            type = "divers",      icon = "ion:hammer" },
            },

            Items = {
                { name = "sandwich",        label = "Sandwich",          category = "food",        price = 3 },
                { name = "chips",           label = "Chips",             category = "food",        price = 2 },
                { name = "candy",           label = "Bonbon",            category = "food",        price = 1 },
                { name = "chocolatebar",    label = "Barre Chocolatée",  category = "food",        price = 3 },
                { name = "water_bottle",    label = 'Bouteille d\'eau',  category = "drinks",      price = 5 },
                { name = "radio",           label = "Radio",             category = "electronics", price = 375 },
                { name = "phone",           label = "Phone",             category = "electronics", price = 550 },
                { name = "cigarette",       label = "Cigarette",         category = "divers",      price = 1 },
                { name = "skateboard",      label = "Skateboard",        category = "divers",      price = 75 },
                { name = "wallet",          label = "Porte monnaie",     category = "divers",      price = 50 },
                { name = "keyring",         label = "Porte-clés",        category = "divers",      price = 5 },
            },

            Requirement = {
                Job = {
                    required = false, -- Whether a job is required to access the shop
                    jobs = {
                        {
                            label = "Police", -- The display name of the required job
                            name = "police",  -- The name of the required job
                            grade = 0,        -- Minimum job grade required to access the shop
                        },
                    },
                },
                License = {
                    required = false,         -- Whether a license is required to access the shop
                    buyDialog = true,         -- Displays a dialog prompting the player to purchase the required license
                    label = "Weapon License", -- The display name of the required license
                    type = "weapon",          -- The type of the required license (e.g., "weapon")
                    price = 1000,             -- The cost of the license
                },
            },

            Locales = { --? More locales including the currency symbol, button text and more can be found in "locales/"
                MainHeader = {
                    title = "Supérette",
                    tag = "24/7",
                    description =
                    "Bienvenue dans votre marché local, ouvert jour et nuit !\nDécouvrez une sélection de produits de qualité, adaptés à tous vos besoins.",
                },
                CartHeader = {
                    title = "Panier",
                    tag = "Panier",
                    description =
                    "Vérifiez vos articles sélectionnés et procédez à un paiement sécurisé et facile avec plusieurs options.",
                },
            },

            Blip = {
                enabled = true,            -- If true, displays a map blip for the shop locations
                name = "Supérette [24/7]", -- Name displayed on the map
                sprite = 59,               -- Blip icon type --? Reference: https://docs.fivem.net/docs/game-references/blips
                color = 0,                 -- Blip color --? Reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors
                scale = 0.7,               -- Size of the blip
            },

            Indicator = {
                Ped = {
                    enabled = true,                    -- If true, spawns a ped (NPC) at the locations
                    model = `mp_m_shopkeep_01`,        -- Ped model type --? Reference: https://docs.fivem.net/docs/game-references/ped-models
                    scenario = "WORLD_HUMAN_AA_SMOKE", -- Animation scenario for the ped --? Reference: https://github.com/DioneB/gtav-scenarios
                },
                Marker = {
                    enabled = false,               -- If true, displays a marker at the shop locations
                    type = 20,                     -- Marker type --? Reference: https://docs.fivem.net/docs/game-references/markers
                    size = vec3(0.7, 0.7, 0.7),    -- Size of the marker
                    color = { 65, 133, 235, 120 }, -- RGBA color of the marker
                    bobUpAndDown = false,          -- If true, marker moves up and down
                    faceCamera = false,            -- If true, marker faces the player's camera
                    rotate = true,                 -- If true, marker rotates
                },
            },

            Interaction = {
                OpenKey = 38,        -- Default: 38 (E key) --? Reference: https://docs.fivem.net/docs/game-references/controls
                HelpText = {
                    enabled = false, -- If true, displays floating help text near the interaction point
                    distance = 2.5,  -- Distance within which help text appears and is interactable
                },
                FloatingText = {
                    enabled = false,             -- If true, displays floating text above the shop NPC
                    distance = 2.5,              -- Distance within which floating text is visible and interactable
                },
                Target = {                       -- Uses ox_target by default --? (modifiable in config/functions.lua)
                    enabled = true,              -- If true, enables targeting system
                    boxZoneSize = vec3(4, 4, 4), -- Size of the target zone
                    drawSprite = true,           -- If true, displays a sprite for the target zone
                    distance = 2.5,              -- Interaction distance
                },
            },
        },

        ["flower"] = {
            PointRadius = 25.0, -- The radius within which markers, peds, and other game elements related to the shop are displayed

            Locations = {
                vec4(-1583.25, -234.51, 54.84, 63.79),
            },

            --? For icons, use Iconify: https://icon-sets.iconify.design
            Categories = {
                { name = "Tous les produits", type = "all", icon = "ic:round-clear-all" }, --! Required for all shops
                { name = "Outils", type = "outils", icon = "ion:hammer" },
                { name = "Divers", type = "divers", icon = "ic:round-palette" },
            },

            Items = {
                { label = 'Marteau', name = 'hammer', category = "outils", price = 25 },
                { label = 'Truelle', name = 'trowel', category = "outils", price = 13 },
                { label = 'Ciseaux', name = 'scissors', category = "outils", price = 22 },
                { label = 'Colle', name = 'glue', category = "divers", price = 10 },
                { label = 'Bicarbonate de soude', name = 'baking_soda', category = "divers", price = 10 },
                { label = 'Engrais liquide', name = 'liquid_fertilizer', category = "divers", price = 30 },
                { label = 'Engrais', name = 'fertilizer', category = "divers", price = 25 },
                { label = 'Engrais avancé', name = 'advanced_fertilizer', category = "divers", price = 40 },
            },

            Requirement = {
                Job = {
                    required = false, -- Whether a job is required to access the shop
                    jobs = {
                        {
                            label = "Police", -- The display name of the required job
                            name = "police",  -- The name of the required job
                            grade = 0,        -- Minimum job grade required to access the shop
                        },
                    },
                },
                License = {
                    required = false,         -- Whether a license is required to access the shop
                    buyDialog = true,         -- Displays a dialog prompting the player to purchase the required license
                    label = "Weapon License", -- The display name of the required license
                    type = "weapon",          -- The type of the required license (e.g., "weapon")
                    price = 1000,             -- The cost of the license
                },
            },

            Locales = { --? More locales including the currency symbol, button text and more can be found in "locales/"
                MainHeader = {
                    title = "Fleuriste",
                    tag = "Fleurs",
                    description =
                    "Bienvenue dans votre fleuriste local, où nous sommes toujours là pour vous, jour et nuit !\nExplorez une sélection de produits de qualité, adaptés à tous vos besoins.",
                },
                CartHeader = {
                    title = "Panier",
                    tag = "Panier",
                    description =
                    "Vérifiez vos articles sélectionnés et procédez à un paiement sécurisé et facile avec plusieurs options.",
                },
            },

            Blip = {
                enabled = true,     -- If true, displays a map blip for the shop locations
                name = "Fleuriste", -- Name displayed on the map
                sprite = 86,        -- Blip icon type --? Reference: https://docs.fivem.net/docs/game-references/blips
                color = 41,         -- Blip color --? Reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors
                scale = 0.6,        -- Size of the blip
            },

            Indicator = {
                Ped = {
                    enabled = true,                    -- If true, spawns a ped (NPC) at the locations
                    model = `mp_f_weed_01`,            -- Ped model type --? Reference: https://docs.fivem.net/docs/game-references/ped-models
                    scenario = "WORLD_HUMAN_AA_SMOKE", -- Animation scenario for the ped --? Reference: https://github.com/DioneB/gtav-scenarios
                },
                Marker = {
                    enabled = false,               -- If true, displays a marker at the shop locations
                    type = 20,                     -- Marker type --? Reference: https://docs.fivem.net/docs/game-references/markers
                    size = vec3(0.7, 0.7, 0.7),    -- Size of the marker
                    color = { 65, 133, 235, 120 }, -- RGBA color of the marker
                    bobUpAndDown = false,          -- If true, marker moves up and down
                    faceCamera = false,            -- If true, marker faces the player's camera
                    rotate = true,                 -- If true, marker rotates
                },
            },

            Interaction = {
                OpenKey = 38,        -- Default: 38 (E key) --? Reference: https://docs.fivem.net/docs/game-references/controls
                HelpText = {
                    enabled = false, -- If true, displays floating help text near the interaction point
                    distance = 2.5,  -- Distance within which help text appears and is interactable
                },
                FloatingText = {
                    enabled = false,             -- If true, displays floating text above the shop NPC
                    distance = 2.5,              -- Distance within which floating text is visible and interactable
                },
                Target = {                       -- Uses ox_target by default --? (modifiable in config/functions.lua)
                    enabled = true,              -- If true, enables targeting system
                    boxZoneSize = vec3(4, 4, 4), -- Size of the target zone
                    drawSprite = true,           -- If true, displays a sprite for the target zone
                    distance = 2.5,              -- Interaction distance
                },
            },
        },

        ["pharmacist"] = {
            PointRadius = 25.0, -- The radius within which markers, peds, and other game elements related to the shop are displayed

            Locations = {
                vec4(97.1, -229.11, 54.66, 69.94),
            },

            --? For icons, use Iconify: https://icon-sets.iconify.design
            Categories = {
                { name = "Tous les produits", type = "all", icon = "ic:round-clear-all" }, --! Required for all shops
            },

            Items = {
                { label = 'Bicarbonate de Soude', name = 'bicarbonate', category = "items", price = 5 },
                { label = 'Sirop à la Codéine', name = 'sirop_codeine', category = "items", price = 10 },
                { label = 'Chloroforme', name = 'chloroforme', category = "items", price = 10 },
                { label = 'Pseudoephedrine', name = 'pseudoephedrine', category = "items", price = 30 },
                { label = 'Bain de Bouche', name = 'baindebouche', category = "items", price = 42 },
                { label = 'Seringue', name = 'syringe', category = "items", price = 35 },
            },

            Requirement = {
                Job = {
                    required = false, -- Whether a job is required to access the shop
                    jobs = {
                        {
                            label = "Police", -- The display name of the required job
                            name = "police",  -- The name of the required job
                            grade = 0,        -- Minimum job grade required to access the shop
                        },
                    },
                },
                License = {
                    required = false,         -- Whether a license is required to access the shop
                    buyDialog = true,         -- Displays a dialog prompting the player to purchase the required license
                    label = "Weapon License", -- The display name of the required license
                    type = "weapon",          -- The type of the required license (e.g., "weapon")
                    price = 1000,             -- The cost of the license
                },
            },

            Locales = { --? More locales including the currency symbol, button text and more can be found in "locales/"
                MainHeader = {
                    title = "Pharmacie",
                    tag = "Médicaments",
                    description =
                    "Bienvenue dans votre pharmacie locale, où nous sommes toujours là pour vous, jour et nuit !\nExplorez une sélection de produits de qualité, adaptés à tous vos besoins.",
                },
                CartHeader = {
                    title = "Panier",
                    tag = "Panier",
                    description =
                    "Vérifiez vos articles sélectionnés et procédez à un paiement sécurisé et facile avec plusieurs options.",
                },
            },

            Blip = {
                enabled = true,     -- If true, displays a map blip for the shop locations
                name = "Pharmacie", -- Name displayed on the map
                sprite = 51,        -- Blip icon type --? Reference: https://docs.fivem.net/docs/game-references/blips
                color = 30,         -- Blip color --? Reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors
                scale = 0.6,        -- Size of the blip
            },

            Indicator = {
                Ped = {
                    enabled = true,                    -- If true, spawns a ped (NPC) at the locations
                    model = `s_m_m_doctor_01`,         -- Ped model type --? Reference: https://docs.fivem.net/docs/game-references/ped-models
                    scenario = "WORLD_HUMAN_AA_SMOKE", -- Animation scenario for the ped --? Reference: https://github.com/DioneB/gtav-scenarios
                },
                Marker = {
                    enabled = false,               -- If true, displays a marker at the shop locations
                    type = 20,                     -- Marker type --? Reference: https://docs.fivem.net/docs/game-references/markers
                    size = vec3(0.7, 0.7, 0.7),    -- Size of the marker
                    color = { 65, 133, 235, 120 }, -- RGBA color of the marker
                    bobUpAndDown = false,          -- If true, marker moves up and down
                    faceCamera = false,            -- If true, marker faces the player's camera
                    rotate = true,                 -- If true, marker rotates
                },
            },

            Interaction = {
                OpenKey = 38,        -- Default: 38 (E key) --? Reference: https://docs.fivem.net/docs/game-references/controls
                HelpText = {
                    enabled = false, -- If true, displays floating help text near the interaction point
                    distance = 2.5,  -- Distance within which help text appears and is interactable
                },
                FloatingText = {
                    enabled = false,             -- If true, displays floating text above the shop NPC
                    distance = 2.5,              -- Distance within which floating text is visible and interactable
                },
                Target = {                       -- Uses ox_target by default --? (modifiable in config/functions.lua)
                    enabled = true,              -- If true, enables targeting system
                    boxZoneSize = vec3(4, 4, 4), -- Size of the target zone
                    drawSprite = true,           -- If true, displays a sprite for the target zone
                    distance = 2.5,              -- Interaction distance
                },
            },
        },

        ["weed"] = {
            PointRadius = 25.0, -- The radius within which markers, peds, and other game elements related to the shop are displayed

            Locations = {
                vec4(-1171.09, -1571.21, 4.66, 138.72),
            },

            --? For icons, use Iconify: https://icon-sets.iconify.design
            Categories = {
                { name = "Tous les produits", type = "all", icon = "ic:round-clear-all" }, --! Required for all shops
            },

            Items = {
                { label = 'Arrosoir', name = 'watering_can', category = "items", price = 5 },
                { label = 'Papier à Rouler', name = 'paper', category = "items", price = 3 },
                { label = 'Sac en plastique', name = 'baggie', category = "items", price = 2 },
            },

            Requirement = {
                Job = {
                    required = false, -- Whether a job is required to access the shop
                    jobs = {
                        {
                            label = "Police", -- The display name of the required job
                            name = "police",  -- The name of the required job
                            grade = 0,        -- Minimum job grade required to access the shop
                        },
                    },
                },
                License = {
                    required = false,         -- Whether a license is required to access the shop
                    buyDialog = true,         -- Displays a dialog prompting the player to purchase the required license
                    label = "Weapon License", -- The display name of the required license
                    type = "weapon",          -- The type of the required license (e.g., "weapon")
                    price = 1000,             -- The cost of the license
                },
            },

            Locales = { --? More locales including the currency symbol, button text and more can be found in "locales/"
                MainHeader = {
                    title = "Smoke on the water",
                    tag = "Weed",
                    description =
                    "Bienvenue dans le magasin de weed local, où nous sommes toujours là pour vous, jour et nuit !\nExplorez une sélection de produits de qualité, adaptés à tous vos besoins.",
                },
                CartHeader = {
                    title = "Panier",
                    tag = "Panier",
                    description =
                    "Vérifiez vos articles sélectionnés et procédez à un paiement sécurisé et facile avec plusieurs options.",
                },
            },

            Blip = {
                enabled = true,              -- If true, displays a map blip for the shop locations
                name = "Smoke on the water", -- Name displayed on the map
                sprite = 469,                -- Blip icon type --? Reference: https://docs.fivem.net/docs/game-references/blips
                color = 2,                   -- Blip color --? Reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors
                scale = 0.6,                 -- Size of the blip
            },

            Indicator = {
                Ped = {
                    enabled = true,                    -- If true, spawns a ped (NPC) at the locations
                    model = `cs_wade`,                 -- Ped model type --? Reference: https://docs.fivem.net/docs/game-references/ped-models
                    scenario = "WORLD_HUMAN_AA_SMOKE", -- Animation scenario for the ped --? Reference: https://github.com/DioneB/gtav-scenarios
                },
                Marker = {
                    enabled = false,               -- If true, displays a marker at the shop locations
                    type = 20,                     -- Marker type --? Reference: https://docs.fivem.net/docs/game-references/markers
                    size = vec3(0.7, 0.7, 0.7),    -- Size of the marker
                    color = { 65, 133, 235, 120 }, -- RGBA color of the marker
                    bobUpAndDown = false,          -- If true, marker moves up and down
                    faceCamera = false,            -- If true, marker faces the player's camera
                    rotate = true,                 -- If true, marker rotates
                },
            },

            Interaction = {
                OpenKey = 38,        -- Default: 38 (E key) --? Reference: https://docs.fivem.net/docs/game-references/controls
                HelpText = {
                    enabled = false, -- If true, displays floating help text near the interaction point
                    distance = 2.5,  -- Distance within which help text appears and is interactable
                },
                FloatingText = {
                    enabled = false,             -- If true, displays floating text above the shop NPC
                    distance = 2.5,              -- Distance within which floating text is visible and interactable
                },
                Target = {                       -- Uses ox_target by default --? (modifiable in config/functions.lua)
                    enabled = true,              -- If true, enables targeting system
                    boxZoneSize = vec3(4, 4, 4), -- Size of the target zone
                    drawSprite = true,           -- If true, displays a sprite for the target zone
                    distance = 2.5,              -- Interaction distance
                },
            },
        },

        ["weapon_shop"] = {
            PointRadius = 25.0, -- The radius within which markers, peds, and other game elements related to the shop are displayed

            Locations = {
                vector4(22.6509, -1105.4863, 29.7970, 161.7508),
                vector4(-662.2554, -933.3735, 21.8292, 183.0097),
                vector4(842.3751, -1035.5238, 28.1948, 356.2464),
                vector4(254.0491, -50.7247, 69.9410, 76.7617),
                vector4(2567.8792, 292.3385, 108.7348, 3.7121),
                vector4(-1303.8849, -394.7360, 36.6958, 76.3115),
                vector4(-3173.7952, 1088.4893, 20.8387, 250.4138),
            },

            --? For icons, use Iconify: https://icon-sets.iconify.design
            Categories = {
                { name = "Tous les produits", type = "all", icon = "ic:round-clear-all" },
                { name = "Armes", type = "weapons", icon = "mdi:pistol" },
                { name = "Chargeurs", type = "magazines", icon = "game-icons:machine-gun-magazine" },
                { name = "Munitions", type = "ammos", icon = "game-icons:silver-bullet" },
            },

            Items = {
                { name = "WEAPON_KNUCKLE", label = "Poing américain", category = "weapons", price = 500 },
                { name = "WEAPON_KNIFE", label = "Couteau", category = "weapons", price = 500 },
                { name = "WEAPON_SWITCHBLADE", label = "Couteau à cran d'arrêt", category = "weapons", price = 300 },
                { name = "WEAPON_BAT", label = "Batte", category = "weapons", price = 250 },
                { name = "WEAPON_GOLFCLUB", label = "Club de golf", category = "weapons", price = 350 },
                { name = "WEAPON_FLASHLIGHT", label = "Lampe torche", category = "weapons", price = 300 },

                -- Ammos
                { name = "box_ammo_airsoft", label = "Boîte de billes Airsoft (250)", category = "ammos", price = 100 },
                { name = "box_ammo_22", label = "Boîte de munitions .22 LR (120)", category = "ammos", price = 250 },
                { name = "box_ammo_38", label = "Boîte de munitions .38 LC (60)", category = "ammos", price = 400 },
                { name = "box_ammo_44", label = "Boîte de munitions .44 Magnum (50)", category = "ammos", price = 500 },
                { name = "box_ammo_45", label = "Boîte de munitions .45 ACP (100)", category = "ammos", price = 450 },
                { name = "box_ammo_50", label = "Boîte de munitions .50 AE (40)", category = "ammos", price = 650 },
                { name = "box_ammo_9", label = "Boîte de munitions 9mm (120)", category = "ammos", price = 350 },
                { name = "box_ammo_10", label = "Boîte de munitions 10mm (120)", category = "ammos", price = 400 },
                { name = "box_ammo_rifle", label = "Boîte de munitions 5.56x45 (180)", category = "ammos", price = 600 },
                { name = "box_ammo_rifle2", label = "Boîte de munitions 7.62x39 (150)", category = "ammos", price = 650 },
                { name = "box_ammo_sniper", label = "Boîte de munitions 7.62x51 (80)", category = "ammos", price = 800 },
                { name = "box_ammo_shotgun", label = "Boîte de cartouches 12 Gauge (50)", category = "ammos", price = 500 },


                -- Magazines
                {
                    name = "magazine",
                    label = "Chargeur .22 Long Rifle",
                    category = "magazines",
                    price = 80,
                    metadata = {
                        label = 'Chargeur .22 Long Rifle',
                        model = 'w_pi_pistolmk2_mag1',
                        magType = 'magazine-22',
                        ammoType = 'ammo-22',
                        magSize = 15,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .38 LC",
                    category = "magazines",
                    price = 150,
                    metadata = {
                        label = 'Chargeur .38 LC',
                        model = 'w_pi_revolver_mag',
                        magType = 'magazine-38',
                        ammoType = 'ammo-38',
                        magSize = 8,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .44 Magnum",
                    category = "magazines",
                    price = 200,
                    metadata = {
                        label = 'Chargeur .44 Magnum',
                        model = 'w_pi_revolver_mag',
                        magType = 'magazine-44',
                        ammoType = 'ammo-44',
                        magSize = 6,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .45 ACP",
                    category = "magazines",
                    price = 180,
                    metadata = {
                        label = 'Chargeur .45 ACP',
                        model = 'w_pi_pistolmk2_mag1',
                        magType = 'magazine-45',
                        ammoType = 'ammo-45',
                        magSize = 10,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .50 AE",
                    category = "magazines",
                    price = 300,
                    metadata = {
                        label = 'Chargeur .50 AE',
                        model = 'w_pi_heavypistol_mag',
                        magType = 'magazine-50',
                        ammoType = 'ammo-50',
                        magSize = 7,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 9mm",
                    category = "magazines",
                    price = 300,
                    metadata = {
                        label = 'Chargeur 9mm',
                        model = 'w_pi_pistolmk2_mag1',
                        magType = 'magazine-9',
                        ammoType = 'ammo-9',
                        magSize = 12,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 10mm",
                    category = "magazines",
                    price = 320,
                    metadata = {
                        label = 'Chargeur 10mm',
                        model = 'w_pi_pistolmk2_mag1',
                        magType = 'magazine-10',
                        ammoType = 'ammo-10',
                        magSize = 11,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .50 BMG",
                    category = "magazines",
                    price = 800,
                    metadata = {
                        label = 'Chargeur .50 BMG',
                        model = 'w_sr_heavysniper_mag',
                        magType = 'magazine-heavysniper',
                        ammoType = 'ammo-heavysniper',
                        magSize = 5,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .50 Ball",
                    category = "magazines",
                    price = 400,
                    metadata = {
                        label = 'Chargeur .50 Ball',
                        model = 'w_sr_musket_mag',
                        magType = 'magazine-musket',
                        ammoType = 'ammo-musket',
                        magSize = 1,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 5.56x45",
                    category = "magazines",
                    price = 400,
                    metadata = {
                        label = 'Chargeur 5.56x45',
                        model = 'w_ar_rifle_mag',
                        magType = 'magazine-rifle',
                        ammoType = 'ammo-rifle',
                        magSize = 30,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 7.62x39",
                    category = "magazines",
                    price = 450,
                    metadata = {
                        label = 'Chargeur 7.62x39',
                        model = 'w_ar_rifle_mag',
                        magType = 'magazine-rifle2',
                        ammoType = 'ammo-rifle2',
                        magSize = 30,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 7.62x51",
                    category = "magazines",
                    price = 600,
                    metadata = {
                        label = 'Chargeur 7.62x51',
                        model = 'w_sr_sniper_mag',
                        magType = 'magazine-sniper',
                        ammoType = 'ammo-sniper',
                        magSize = 5,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
            },

            Requirement = {
                Job = {
                    required = false, -- Whether a job is required to access the shop
                    jobs = {
                        {
                            label = "Police", -- The display name of the required job
                            name = "police",  -- The name of the required job
                            grade = 0,        -- Minimum job grade required to access the shop
                        },
                    },
                },
                License = {
                    required = false,         -- Whether a license is required to access the shop
                    buyDialog = true,         -- Displays a dialog prompting the player to purchase the required license
                    label = "Weapon License", -- The display name of the required license
                    type = "weapon",          -- The type of the required license (e.g., "weapon")
                    price = 1000,             -- The cost of the license
                },
            },

            Locales = { --? More locales including the currency symbol, button text and more can be found in "locales/"
                MainHeader = {
                    title = "Armurerie",
                    tag = "Armes",
                    description =
                    "Bienvenue dans votre armurerie locale, où nous sommes toujours là pour vous, jour et nuit !\nDécouvrez une sélection de produits de qualité, adaptés à tous vos besoins.",
                },
                CartHeader = {
                    title = "Panier",
                    tag = "Panier",
                    description =
                    "Vérifiez vos articles sélectionnés et procédez à un paiement sécurisé et facile avec plusieurs options.",
                },
            },

            Blip = {
                enabled = true,     -- If true, displays a map blip for the shop locations
                name = "Armurerie", -- Name displayed on the map
                sprite = 110,       -- Blip icon type --? Reference: https://docs.fivem.net/docs/game-references/blips
                color = 1,          -- Blip color --? Reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors
                scale = 0.7,        -- Size of the blip
            },

            Indicator = {
                Ped = {
                    enabled = true,                    -- If true, spawns a ped (NPC) at the locations
                    model = `mp_m_weapexp_01`,         -- Ped model type --? Reference: https://docs.fivem.net/docs/game-references/ped-models
                    scenario = "WORLD_HUMAN_AA_SMOKE", -- Animation scenario for the ped --? Reference: https://github.com/DioneB/gtav-scenarios
                },
                Marker = {
                    enabled = false,               -- If true, displays a marker at the shop locations
                    type = 20,                     -- Marker type --? Reference: https://docs.fivem.net/docs/game-references/markers
                    size = vec3(0.7, 0.7, 0.7),    -- Size of the marker
                    color = { 65, 133, 235, 120 }, -- RGBA color of the marker
                    bobUpAndDown = false,          -- If true, marker moves up and down
                    faceCamera = false,            -- If true, marker faces the player's camera
                    rotate = true,                 -- If true, marker rotates
                },
            },

            Interaction = {
                OpenKey = 38,        -- Default: 38 (E key) --? Reference: https://docs.fivem.net/docs/game-references/controls
                HelpText = {
                    enabled = false, -- If true, displays floating help text near the interaction point
                    distance = 2.5,  -- Distance within which help text appears and is interactable
                },
                FloatingText = {
                    enabled = false,             -- If true, displays floating text above the shop NPC
                    distance = 2.5,              -- Distance within which floating text is visible and interactable
                },
                Target = {                       -- Uses ox_target by default --? (modifiable in config/functions.lua)
                    enabled = true,              -- If true, enables targeting system
                    boxZoneSize = vec3(4, 4, 4), -- Size of the target zone
                    drawSprite = true,           -- If true, displays a sprite for the target zone
                    distance = 2.5,              -- Interaction distance
                },
            },
        },

        ["armoury"] = {
            PointRadius = 25.0, -- The radius within which markers, peds, and other game elements related to the shop are displayed

            Locations = {
                vector4(-601.42, -412.45, 35.17, 44.34),
                vector4(-662.2554, -933.3735, 22.8292, 183.0097),
            },

            --? For icons, use Iconify: https://icon-sets.iconify.design
            Categories = {
                { name = "Tous les produits", type = "all", icon = "ic:round-clear-all" },
                { name = "Armes", type = "weapons", icon = "mdi:pistol" },
                { name = "Chargeurs", type = "magazines", icon = "game-icons:machine-gun-magazine" },
                { name = "Munitions", type = "ammos", icon = "game-icons:silver-bullet" },
                { name = "Divers", type = "divers", icon = "ion:hammer" },
            },

            Items = {
                { name = "WEAPON_COMBATPISTOL", label = "Pistolet de combat", category = "weapons", price = 1 },
                { name = "WEAPON_KNIFE", label = "Couteau", category = "weapons", price = 1 },
                { name = "WEAPON_NIGHTSTICK", label = "Matraque", category = "weapons", price = 1 },
                { name = "WEAPON_STUNGUN", label = "Taser", category = "weapons", price = 1 },
                { name = "WEAPON_FLASHLIGHT", label = "Lampe torche", category = "weapons", price = 1 },
                { name = "WEAPON_TACTICALRIFLE", label = "Fusil tactique", category = "weapons", price = 1 },
                { name = "WEAPON_FN57", label = "FN57", category = "weapons", price = 1 },
                { name = "WEAPON_P30L", label = "P30L", category = "weapons", price = 1 },
                { name = "WEAPON_BRYSON", label = "Bryson 890", category = "weapons", price = 1 },
                { name = "WEAPON_AR15", label = "AR15", category = "weapons", price = 1 },
                { name = "WEAPON_BSCAR", label = "Black Scar", category = "weapons", price = 1 },
                { name = "WEAPON_XM4", label = "Colt XM4", category = "weapons", price = 1 },
                { name = "WEAPON_LVOCA", label = "lvoa-c", category = "weapons", price = 1 },
                { name = "WEAPON_G36K", label = "G36K", category = "weapons", price = 1 },
                { name = "WEAPON_MP5", label = "MP5", category = "weapons", price = 1 },
                { name = "WEAPON_G17", label = "G17", category = "weapons", price = 1 },
                { name = "WEAPON_BARRETT", label = "Barrett 50", category = "weapons", price = 1 },
                { name = "WEAPON_M870", label = "Remington M870", category = "weapons", price = 1 },
                { name = "WEAPON_MPX", label = "MPX", category = "weapons", price = 1 },
                { name = "WEAPON_M16", label = "M16", category = "weapons", price = 1 },
                { name = "WEAPON_GLOCK22", label = "Glock 22", category = "weapons", price = 1 },
                { name = "WEAPON_MINISHOTGUN", label = "Shortgun", category = "weapons", price = 1 },

                -- Ammos
                { name = "box_ammo_airsoft", label = "Boîte de billes Airsoft (250)", category = "ammos", price = 1 },
                { name = "box_ammo_22", label = "Boîte de munitions .22 LR (120)", category = "ammos", price = 1 },
                { name = "box_ammo_38", label = "Boîte de munitions .38 LC (60)", category = "ammos", price = 1 },
                { name = "box_ammo_44", label = "Boîte de munitions .44 Magnum (50)", category = "ammos", price = 1 },
                { name = "box_ammo_45", label = "Boîte de munitions .45 ACP (100)", category = "ammos", price = 1 },
                { name = "box_ammo_50", label = "Boîte de munitions .50 AE (40)", category = "ammos", price = 1 },
                { name = "box_ammo_9", label = "Boîte de munitions 9mm (120)", category = "ammos", price = 1 },
                { name = "box_ammo_10", label = "Boîte de munitions 10mm (120)", category = "ammos", price = 1 },
                { name = "box_ammo_rifle", label = "Boîte de munitions 5.56x45 (180)", category = "ammos", price = 1 },
                { name = "box_ammo_rifle2", label = "Boîte de munitions 7.62x39 (150)", category = "ammos", price = 1 },
                { name = "box_ammo_sniper", label = "Boîte de munitions 7.62x51 (80)", category = "ammos", price = 1 },
                { name = "box_ammo_shotgun", label = "Boîte de cartouches 12 Gauge (50)", category = "ammos", price = 1 },

                -- Divers
                { name = "radio", label = "Radio", category = "divers", price = 1 },
                { name = "handcuffs", label = "Menottes", category = "divers", price = 1 },
                { name = "tracking_bracelet", label = "Bracelet de suivi", category = "divers", price = 1 },
                { name = "bodycam", label = "Caméra corporelle", category = "divers", price = 1 },
                { name = "dashcam", label = "Caméra pour véhicule", category = "divers", price = 1 },

                -- Magazines
                {
                    name = "magazine",
                    label = "Chargeur .22 Long Rifle",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur .22 Long Rifle',
                        model = 'w_pi_pistolmk2_mag1',
                        magType = 'magazine-22',
                        ammoType = 'ammo-22',
                        magSize = 15,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .38 LC",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur .38 LC',
                        model = 'w_pi_revolver_mag',
                        magType = 'magazine-38',
                        ammoType = 'ammo-38',
                        magSize = 8,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .44 Magnum",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur .44 Magnum',
                        model = 'w_pi_revolver_mag',
                        magType = 'magazine-44',
                        ammoType = 'ammo-44',
                        magSize = 6,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .45 ACP",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur .45 ACP',
                        model = 'w_pi_pistolmk2_mag1',
                        magType = 'magazine-45',
                        ammoType = 'ammo-45',
                        magSize = 10,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .50 AE",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur .50 AE',
                        model = 'w_pi_heavypistol_mag',
                        magType = 'magazine-50',
                        ammoType = 'ammo-50',
                        magSize = 7,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 9mm",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur 9mm',
                        model = 'w_pi_pistolmk2_mag1',
                        magType = 'magazine-9',
                        ammoType = 'ammo-9',
                        magSize = 12,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 10mm",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur 10mm',
                        model = 'w_pi_pistolmk2_mag1',
                        magType = 'magazine-10',
                        ammoType = 'ammo-10',
                        magSize = 11,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .50 BMG",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur .50 BMG',
                        model = 'w_sr_heavysniper_mag',
                        magType = 'magazine-heavysniper',
                        ammoType = 'ammo-heavysniper',
                        magSize = 5,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur .50 Ball",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur .50 Ball',
                        model = 'w_sr_musket_mag',
                        magType = 'magazine-musket',
                        ammoType = 'ammo-musket',
                        magSize = 1,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 5.56x45",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur 5.56x45',
                        model = 'w_ar_rifle_mag',
                        magType = 'magazine-rifle',
                        ammoType = 'ammo-rifle',
                        magSize = 30,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 7.62x39",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur 7.62x39',
                        model = 'w_ar_rifle_mag',
                        magType = 'magazine-rifle2',
                        ammoType = 'ammo-rifle2',
                        magSize = 30,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
                {
                    name = "magazine",
                    label = "Chargeur 7.62x51",
                    category = "magazines",
                    price = 1,
                    metadata = {
                        label = 'Chargeur 7.62x51',
                        model = 'w_sr_sniper_mag',
                        magType = 'magazine-sniper',
                        ammoType = 'ammo-sniper',
                        magSize = 5,
                        ammo = 0,
                        image = 'at_clip',
                    }
                },
            },

            Requirement = {
                Job = {
                    required = true, -- Whether a job is required to access the shop
                    jobs = {
                        {
                            label = "Police", -- The display name of the required job
                            name = "police",  -- The name of the required job
                            grade = 0,        -- Minimum job grade required to access the shop
                        },
                        {
                            label = "USSS", -- The display name of the required job
                            name = "usss",  -- The name of the required job
                            grade = 0,        -- Minimum job grade required to access the shop
                        },
                    },
                },
                License = {
                    required = false,         -- Whether a license is required to access the shop
                    buyDialog = true,         -- Displays a dialog prompting the player to purchase the required license
                    label = "Weapon License", -- The display name of the required license
                    type = "weapon",          -- The type of the required license (e.g., "weapon")
                    price = 1000,             -- The cost of the license
                },
            },

            Locales = { --? More locales including the currency symbol, button text and more can be found in "locales/"
                MainHeader = {
                    title = "Armurerie",
                    tag = "Armes",
                    description =
                    "Bienvenue dans l'armurerie, où nous sommes toujours là pour vous armer, jour et nuit !\nDécouvrez une sélection de produits de qualité pour affronter la racaille !",
                },
                CartHeader = {
                    title = "Panier",
                    tag = "Panier",
                    description =
                    "Vérifiez vos articles sélectionnés avant de valider la commande",
                },
            },

            Blip = {
                enabled = false,     -- If true, displays a map blip for the shop locations
                name = "Armurerie", -- Name displayed on the map
                sprite = 110,       -- Blip icon type --? Reference: https://docs.fivem.net/docs/game-references/blips
                color = 1,          -- Blip color --? Reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors
                scale = 0.7,        -- Size of the blip
            },

            Indicator = {
                Ped = {
                    enabled = true,                    -- If true, spawns a ped (NPC) at the locations
                    model = `s_f_y_cop_01`,         -- Ped model type --? Reference: https://docs.fivem.net/docs/game-references/ped-models
                    scenario = "WORLD_HUMAN_AA_SMOKE", -- Animation scenario for the ped --? Reference: https://github.com/DioneB/gtav-scenarios
                },
                Marker = {
                    enabled = false,               -- If true, displays a marker at the shop locations
                    type = 20,                     -- Marker type --? Reference: https://docs.fivem.net/docs/game-references/markers
                    size = vec3(0.7, 0.7, 0.7),    -- Size of the marker
                    color = { 65, 133, 235, 120 }, -- RGBA color of the marker
                    bobUpAndDown = false,          -- If true, marker moves up and down
                    faceCamera = false,            -- If true, marker faces the player's camera
                    rotate = true,                 -- If true, marker rotates
                },
            },

            Interaction = {
                OpenKey = 38,        -- Default: 38 (E key) --? Reference: https://docs.fivem.net/docs/game-references/controls
                HelpText = {
                    enabled = false, -- If true, displays floating help text near the interaction point
                    distance = 2.5,  -- Distance within which help text appears and is interactable
                },
                FloatingText = {
                    enabled = false,             -- If true, displays floating text above the shop NPC
                    distance = 2.5,              -- Distance within which floating text is visible and interactable
                },
                Target = {                       -- Uses ox_target by default --? (modifiable in config/functions.lua)
                    enabled = true,              -- If true, enables targeting system
                    boxZoneSize = vec3(4, 4, 4), -- Size of the target zone
                    drawSprite = true,           -- If true, displays a sprite for the target zone
                    distance = 2.5,              -- Interaction distance
                },
            },
        },
        ["ambulance_shop"] = {
            PointRadius = 25.0, -- The radius within which markers, peds, and other game elements related to the shop are displayed

            Locations = {
                vec4(74.94, -364.29, 39.38, 248.84),
            },

            --? For icons, use Iconify: https://icon-sets.iconify.design
            Categories = {
                { name = "Tous les produits", type = "all", icon = "ic:round-clear-all" }, --! Required for all shops
            },

            Items = {
                { label = 'Sac médical', name = 'medbag', category = "items", price = 1 },
                { label = 'Kit de premiers secours', name = 'medikit', category = "items", price = 1 },
                { label = 'Morphine 30MG', name = 'morphine30', category = "items", price = 1 },
                { label = 'Percocet 30MG', name = 'perc30', category = "items", price = 1 },
            },

            Requirement = {
                Job = {
                    required = true, -- Whether a job is required to access the shop
                    jobs = {
                        {
                            label = "EMS", -- The display name of the required job
                            name = "ambulance",  -- The name of the required job
                            grade = 0,        -- Minimum job grade required to access the shop
                        },
                    },
                },
                License = {
                    required = false,         -- Whether a license is required to access the shop
                    buyDialog = true,         -- Displays a dialog prompting the player to purchase the required license
                    label = "Weapon License", -- The display name of the required license
                    type = "weapon",          -- The type of the required license (e.g., "weapon")
                    price = 1000,             -- The cost of the license
                },
            },

            Locales = { --? More locales including the currency symbol, button text and more can be found in "locales/"
                MainHeader = {
                    title = "Pharmacie",
                    tag = "Ambulance",
                    description =
                    "Bienvenue dans votre pharmacie, où nous sommes toujours là pour vous, jour et nuit !\nExplorez une sélection de produits de qualité, pour vous aider dans votre serment d'Hippocrate.",
                },
                CartHeader = {
                    title = "Panier",
                    tag = "Panier",
                    description =
                    "Vérifiez vos articles sélectionnés avant de valider la commande",
                },
            },

            Blip = {
                enabled = false,     -- If true, displays a map blip for the shop locations
                name = "Pharmacie", -- Name displayed on the map
                sprite = 51,        -- Blip icon type --? Reference: https://docs.fivem.net/docs/game-references/blips
                color = 30,         -- Blip color --? Reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors
                scale = 0.6,        -- Size of the blip
            },

            Indicator = {
                Ped = {
                    enabled = true,                    -- If true, spawns a ped (NPC) at the locations
                    model = `s_m_m_doctor_01`,                 -- Ped model type --? Reference: https://docs.fivem.net/docs/game-references/ped-models
                    scenario = "WORLD_HUMAN_AA_SMOKE", -- Animation scenario for the ped --? Reference: https://github.com/DioneB/gtav-scenarios
                },
                Marker = {
                    enabled = false,               -- If true, displays a marker at the shop locations
                    type = 20,                     -- Marker type --? Reference: https://docs.fivem.net/docs/game-references/markers
                    size = vec3(0.7, 0.7, 0.7),    -- Size of the marker
                    color = { 65, 133, 235, 120 }, -- RGBA color of the marker
                    bobUpAndDown = false,          -- If true, marker moves up and down
                    faceCamera = false,            -- If true, marker faces the player's camera
                    rotate = true,                 -- If true, marker rotates
                },
            },

            Interaction = {
                OpenKey = 38,        -- Default: 38 (E key) --? Reference: https://docs.fivem.net/docs/game-references/controls
                HelpText = {
                    enabled = false, -- If true, displays floating help text near the interaction point
                    distance = 2.5,  -- Distance within which help text appears and is interactable
                },
                FloatingText = {
                    enabled = false,             -- If true, displays floating text above the shop NPC
                    distance = 2.5,              -- Distance within which floating text is visible and interactable
                },
                Target = {                       -- Uses ox_target by default --? (modifiable in config/functions.lua)
                    enabled = true,              -- If true, enables targeting system
                    boxZoneSize = vec3(4, 4, 4), -- Size of the target zone
                    drawSprite = true,           -- If true, displays a sprite for the target zone
                    distance = 2.5,              -- Interaction distance
                },
            },
        },
    },
}
