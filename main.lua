---@diagnostic disable: undefined-global

--assert(SMODS.load_file("src/editions.lua"))()

-- local function patch_foil()
--     if G and G.P_CENTERS and G.P_CENTERS.e_foil and G.P_CENTERS.e_foil.config then
--         G.P_CENTERS.e_foil.config.chips = 500
--     end
-- end
-- G.P_Centers.

-- SMODS.current_mod.reset_game_globals = function(run_start)
--     patch_foil()
-- end

-- patch_foil()

-- local function ten_jokers()
--     G.jokers.config.card_limit = 10
-- end

-- local function polychromex100()
--     G.P_CENTERS.e_polychrome.config.extra = 100000
-- end


-- SMODS.current_mod.reset_game_globals = function(run_start)
--     ten_jokers()
--     polychromex100()
-- end

--#region Atlases

SMODS.Atlas {
    key = 'masonjoker',
    path = 'masonjoker.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'faithjoker',
    path = 'faithjoker.png',
    px = 71,
    py = 95
}

--#endregion

--#region File Loading

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end

--#endregion