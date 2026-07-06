SMODS.Joker {
    key = 'faithjoker',
    atlas = 'faithjoker',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            mult = 10
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}