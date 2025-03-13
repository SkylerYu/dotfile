vim.g.mapleader = " "

local keymap = vim.keymap

-----------视觉模式-----------
--单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-----------正常模式-----------
--窗口
keymap.set("n", "<leader>sh", "<C-w>v") --水平新增窗口
keymap.set("n", "<leader>sv", "<C-w>s") --垂直新增窗口
keymap.set('n', '<leader>h', '<C-w>h', { noremap = true, silent = true, desc = "Move to left window" })  -- 移动到左窗口
keymap.set('n', '<leader>l', '<C-w>l', { noremap = true, silent = true, desc = "Move to right window" })  -- 移动到右窗口

--取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

--切换buffer
keymap.set("n", "L", ":bnext<CR>")
keymap.set("n", "H", ":bprevious<CR>")

-----------插件-----------
--nvim-tree
local api = require('nvim-tree.api')
keymap.set('n', '<leader>e', api.tree.toggle, { noremap = true, silent = true, desc = "Toggle Nvim Tree" })  -- 打开/关闭 nvim-tree
keymap.set('n', '<leader>r', api.tree.change_root_to_node, { noremap = true, silent = true, desc = "Set current directory as root" })  -- 设置当前目录为根目录

