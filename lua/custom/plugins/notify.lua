return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")

    notify.setup({
      stages = "fade_in_slide_out",  -- animation style
      timeout = 3000,                -- how long to show notifications (ms)
      fps = 60,                      -- animation speed
      background_colour = "#000000", -- background transparency
      render = "default",            -- display style: "default", "minimal", etc.
      minimum_width = 50,
      icons = {
        ERROR = "",
        WARN  = "",
        INFO  = "",
        DEBUG = "",
        TRACE = "✎",
      },
    })

    vim.notify = notify
  end,
}
