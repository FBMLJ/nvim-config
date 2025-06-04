local home = os.getenv("HOME")
local jdtls = require("jdtls")

local root_markers = {".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}
local root_dir = require("jdtls.setup").find_root(root_markers)
if not root_dir then
  return
end

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar", -- caminho do lombok.jar do Maven
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
    "-data",
    workspace_folder,
  },
  root_dir = root_dir,
  init_options = {
    settings = {
      java = {
        imports = {
          gradle = {
            wrapper = {
              checksums = {
                {
                  sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172", -- substitua pelo hash correto do seu gradle-wrapper.jar
                  allowed = true,
                }
              }
            }
          }
        }
      }
    }
  }
}

jdtls.start_or_attach(config)
