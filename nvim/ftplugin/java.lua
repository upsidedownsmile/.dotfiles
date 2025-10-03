local jdtls = require("jdtls")

local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")
local home = os.getenv("HOME")
local eclipse_workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local ws_folders_jdtls = {}
if root_dir then
    local file = io.open(root_dir .. "/.bemol/ws_root_folders")
    if file then
        for line in file:lines() do
            table.insert(ws_folders_jdtls, "file://" .. line)
        end
        file:close()
    end
end

local config = {
    cmd = {
        "jdtls",                                                        -- need to be on your PATH
        "--jvm-arg=-javaagent:" .. home .. "/.scripts/java/lombok.jar", -- need for lombok magic
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=ALL",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-Xmx=8G",
        "-Xms8g",
        "-data",
        eclipse_workspace,
    },
    root_dir = root_dir,
    init_options = {
        workspaceFolders = ws_folders_jdtls,
        -- extendedClientCapabilities = {
        --   classFileContentsSupport = true
        -- }
    },
    -- check inlays, codelens, configuration runtime,
    settings = {
        java = {
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            referencesCodeLens = {
                enabled = false,
            },
            references = {
                includeDecompiledSources = false,
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all", -- literals, all, none
                },
            },
            saveActions = {
                organizeImports = false,
            },
            -- extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
            signatureHelp = {
                enabled = true,
                description = {
                    enabled = true
                }
            },
            autobuild = {
                enabled = false
            },
            completion = {
                guessMethodArguments = false,
                favoriteStaticMembers = {
                    "org.junit.Assert.*",
                    "org.junit.Assume.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "org.junit.jupiter.api.Assumptions.*",
                    "org.junit.jupiter.api.DynamicContainer.*",
                    "org.junit.jupiter.api.DynamicTest.*",
                    "org.mockito.Matchers.*",
                    "org.mockito.Mockito.*",
                },
                overwrite = false,
            },
            contentProvider = {
                preferred = 'fernflower'
            },
            format = {
                settings = {
                    url = home .. "/.config/nvim/java-style/eclipse-tdm-code-style.xml",
                    profile = "tdm",
                },
            },
        },
    }
}

jdtls.start_or_attach(config)
