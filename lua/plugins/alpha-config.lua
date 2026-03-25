return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require "alpha"
        local dashboard = require("alpha.themes.startify")

        dashboard.section.header.val = {
            -- [[                                                               ]],
            -- [[   ▄████████ ████████▄   ▄█  ████████▄     ▄████████  ▄█    █▄ ]],
            -- [[  ███    ███ ███   ▀███ ███  ███   ▀███   ███    ███ ███    ███]],
            -- [[  ███    ███ ███    ███ ███▌ ███    ███   ███    █▀  ███    ███]],
            -- [[  ███    ███ ███    ███ ███▌ ███    ███  ▄███▄▄▄     ███    ███]],
            -- [[▀███████████ ███    ███ ███▌ ███    ███ ▀▀███▀▀▀     ███    ███]],
            -- [[  ███    ███ ███    ███ ███  ███    ███   ███    █▄  ███    ███]],
            -- [[  ███    ███ ███   ▄███ ███  ███   ▄███   ███    ███ ███    ███]],
            -- [[  ███    █▀  ████████▀  █▀   ████████▀    ██████████  ▀██████▀ ]],
            -- [[                                                               ]],

[[                                                                      ]],
-- [[ ___________________  ___________________    . . . o o o o o o o       ]],
-- [[ |                 |  |                 |            _____      o      ]],
-- [[ |                 |  |                 |  _____====  ]CC|_n_n__][.    ]],
-- [[ |_________________|__|_________________|_[_________]_|__|________)<   ]],
-- [[ o!o            o!o    o!o          o!o`  ooo   ooo  'oo OOOOO oo\_      ]],
-- [[ -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- ]],
-- [[                                                             ]],
        }

--        local function footer()
--            return "Don't Stop Until You are Proud..."
--        end
--
--        dashboard.section.footer.val = footer()
--
--        dashboard.section.footer.opts.hl = "Type"
--        dashboard.section.header.opts.hl = "Include"
--        dashboard.section.buttons.opts.hl = "Keyword"
--
--        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end
}
