local CraftingFramework = require("CraftingFramework")
if not CraftingFramework then return end

local materials = {
    {
        id = "mc_wood",
        name = "Wood",
        ids = {
            "mc_log_ash",
            "mc_log_cypress",
            "mc_log_hickory",
            "mc_log_oak",
            "mc_log_parasol",
            "mc_log_pine",
            "mc_log_scrap",
            "mc_log_swirlwood",
        }
    },
    {
        id = "metal",
        name = "Metal",
        ids = {
            "mc_dae_ebony_ingot",
            "mc_adamantium_ingot",
            "mc_dae_steel_ingot",
            "mc_dwemer_ingot",
            "mc_ebony_ingot",
            "mc_glass_ingot",
            "mc_iron_ingot",
            "mc_orichalcum_ingot",
            "mc_silver_ingot",
        }
    },
    {
        id = "thread",
        name = "Thread",
        ids = {
            "misc_spool_01",
            "TR_m1_Q50_GO2_FineThread",
        }
    },
    {
        id = "hide",
        name = "Animal Hide",
        ids = {
            "mc_dreugh_hide",

        }
    },
    {
        id = "fibre",
        name = "Fibre",
        ids = {
            "mc_coarsefiber",
            "mc_fiber",
        }
    },
    {
        id = "rope",
        name = "Rope",
        ids = {
            "mc_Rope",
        }
    },
    {
        id = "straw",
        name = "Straw",
        ids = {
            "mc_straw",
        }
    },
    {
        id = "straw",
        name = "Straw",
        ids = {
            "mc_straw",
        }
    },
    {
        id = "fabric",
        name = "Fabric",
        ids = {
            "mc_clothscraps",
            "mc_prepared_cloth",
        }
    },
    {
        id = "flint",
        name = "Flint",
        ids = {
            "mc_firestarter",
        },
    },
    {
        id = "pillow",
        name = "Pillow",
        ids = {
            "mc_rcushion01",
            "mc_rcushion02",
            "mc_rcushion03",
            "mc_rcushion04",
            "mc_rcushion05",
            "mc_rcushion06",
            "mc_rcushion07",
            "mc_scushion01",
            "mc_scushion02",
            "mc_scushion03",
            "mc_scushion04",
            "mc_scushion05",
            "mc_scushion06",
            "mc_scushion07",
            "mc_scushion08",
            "mc_scushion09",
        }
    },
    {
        id = "coal",
        name = "Coal",
        ids = {
            "ashfall_ingred_coal_01"
        }
    },
    {
        id = "netting",
        name = "Netting",
        ids = {
            "ashfall_netting"
        }
    },
    {
        id = "anyredmeat",
        name = "Red Meat",
        ids = {
            "T_IngFood_MeatMutton_01",
            "T_IngFood_MeatKwama_01",
            "T_IngFood_MeatBoar_01",
            "T_IngFood_MeatBoar_02",
            "T_IngFood_MeatAlit_01",
            "T_IngFood_MeatKagouti_01",
            "T_IngFood_MeatGuar_01",
            "ingred_hound_meat_01",
            "ingred_rat_meat_01",
        }
    },
    {
        id = "anymushroom",
        name = "Mushrooms",
        ids = {
            "T_IngFlor_Bluefoot_01",
            "T_IngFlor_TempleDome_01",
            "T_IngFlor_AnemicTwinstipe_01",
            "T_IngFlor_BlacksporeCap_01",
            "T_IngFlor_BogBeacon_01",
            "T_IngFlor_CairnBolete_01",
            "T_IngFlor_CinnabarPolypore_01",
            "T_IngFlor_CinnabarPolypore_02",
            "T_IngFlor_CloudedFunnel_01",
            "T_IngFlor_Cupling_01",
            "T_IngFlor_DryadSaddle_01",
            "T_IngFlor_Elfcup_01",
            "T_IngFlor_EmeticRussula_01",
            "T_IngFlor_Greenstain_01",
            "T_IngFlor_PyrousUracia",
            "T_IngFlor_RustRussula_01",
            "T_IngFlor_Steelblue_01",
            "T_IngFlor_SummerBolete_01",
            "T_IngFlor_TinderPolypore_01",
            "T_IngFlor_Stinkhorn_01",
            "T_IngFlor_UmberMorchella_01",
            "T_IngFlor_VileMorchella_01",
            "ingred_bc_bungler's_bane",
            "ingred_bc_hypha_facia",
            "ingred_coprinus_01",
            "ingred_russula_01",
        }
    },
    {
        id = "potato",
        name = "Potato",
        ids = {
            "mc_potato_raw",
            "T_IngFood_Potato_01"
        }
    },
    {
        id = "onion",
        name = "Onion",
        ids = {
            "mc_onion",
            "T_IngFood_Onion_01"
        }
    },
    {
        id = "garlic",
        name = "Garlic",
        ids = {
            "mc_garlic",
            "T_IngFood_Garlic_01"
        }
    },
    {
        id = "smallbowl",
        name = "Small Bowl",
        ids = {
            "misc_com_wood_bowl_01",
            "Misc_com_wood_bowl_02",
            "Misc_com_wood_bowl_03",
        }
    },
}
CraftingFramework.Material:registerMaterials(materials)