-- Exemplo: seu_projeto/.lua/plugins/init.lua
-- Este arquivo DEVE RETORNAR uma tabela de especificações de plugins.
-- Não precisa existir em todos os projetos. Se não existir, nada acontece.
return {
  -- Plugin: nvim-java e suas dependências
  {
    "nvim-java/nvim-java",
       ft = { "java" }, -- Carrega o plugin apenas para arquivos .java
    -- Você pode adicionar opções de configuração do nvim-java aqui, se precisar
    -- opts = {
    --   jdk = {
    --     auto_install = true,
    --   },
    -- },
  },
  -- Outros plugins locais
  -- "nvim-tree/nvim-tree.lua",
}
