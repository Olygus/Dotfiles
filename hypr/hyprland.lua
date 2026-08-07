---@module 'hl'

-- Inspired by: https://github.com/NachoOsella/DotFiles-V4

local source = debug.getinfo(1, "S").source
local config_path = source:sub(1, 1) == "@" and source:sub(2) or source
local config_dir = config_path:match("^(.*)/[^/]+$") or "."
local module_dir = config_dir .. "/hyprland"

local shared = {}

local function load(module_name)
	local module = dofile(module_dir .. "/" .. module_name)
	if type(module) == "function" then
		module(shared)
	end
end

load("programs.lua")
load("monitors.lua")
load("environment.lua")
load("inputs.lua")
load("appearance.lua")
load("autostart.lua")
load("rules.lua")
load("binds.lua")
load("gtk.lua")
