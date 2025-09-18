return {
  "yetone/avante.nvim",
  build = "make",     -- required build step; use BUILD_FROM_SOURCE=true if needed
  event = "VeryLazy", -- ⚠️ must keep this
  version = false,    -- Never set to "*"!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- project-specific instructions file
    instructions_file = "avante.md",

    -- actively use Copilot as the LLM backend
    provider = "copilot",

    providers = {
      -- ✅ Copilot provider (active)
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        -- pick any Copilot-available model you have access to
        model = "gpt-4o-2024-11-20",
        timeout = 30000,
        -- Avante will read this env var for the Copilot token
        --   export GITHUB_TOKEN="gho_xxx_with_copilot_access"
        api_key_name = "GITHUB_TOKEN",
        extra_request_body = {
          temperature = 0.3,
          max_tokens = 20480,
        },
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- optional quality-of-life deps you listed
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",

    -- needed if you also use Copilot’s regular completions
    "zbirenbaum/copilot.lua",

    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true, -- for Windows users
        },
      },
    },

    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "Avante" },
      opts = {
        file_types = { "markdown", "Avante" },
      },
    },
  },

  config = function(_, opts)
    -- Optional companion setups; safe if missing
    pcall(function() require("render-markdown").setup({}) end)
    pcall(function() require("copilot").setup({}) end)

    require("avante").setup(opts)
  end,
}
