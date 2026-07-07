---@diagnostic disable: undefined-global


local function joker_to_left_is(card, target_key)
    if not G.jokers or not G.jokers.cards then
        return false
    end

    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            local left_joker = G.jokers.cards[i - 1]

            return left_joker
                and left_joker.config
                and left_joker.config.center
                and left_joker.config.center.key == target_key
        end
    end

    return false
end

SMODS.Joker {
    key = 'faithjoker',
    atlas = 'faithjoker',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            Xmult = 2,
            Xmultchange = 0.05
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.Xmultchange
            }
        }
    end,
    calculate = function(self, card, context)
        if context.pre_discard and not context.blueprint and not joker_to_left_is(card, 'j_MGRAYTST_masonjoker') and not context.hook then
            if card.ability.extra.Xmult - card.ability.extra.Xmultchange < 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_lonely_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.Xmultchange
                return {
                    message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.Xmultchange } },
                    colour = G.C.RED,
                    delay = 0.2
                }
            end
        end
        if context.joker_main then
            if context.scoring_name == "Pair" then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmultchange
                return {
                    message = localize('k_upgrade_ex'),
                    xmult = card.ability.extra.Xmult,
                    colour = G.C.MULT
                }
            end
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end
}

