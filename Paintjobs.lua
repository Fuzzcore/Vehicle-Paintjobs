local SCRIPT_NAME = "Paintjobs"
local SCRIPT_PREFIX = "VPJ_"

local presetPath = FileMgr.GetMenuRootPath() .. "\\Vehicles\\Paintjobs\\"

FileMgr.CreateDir(presetPath)

-- GTA 5 Natives for Cherax Mod Menu. Generated with NativeGenerator on 06-01-2026 12:40:31.
-- https://raw.githubusercontent.com/alloc8or/gta5-nativedb-data/master/natives.json
local InvokeInt, InvokeVoid = Natives.InvokeInt, Natives.InvokeVoid
PLAYER_PED_ID = function(...) return InvokeInt(0xD80958FC74E988A6, ...) end;
GET_VEHICLE_PED_IS_IN = function(...) InvokeInt(0x9A9112A0FE9A4713, ...) end;
SET_VEHICLE_MOD_KIT = function(...) return InvokeVoid(0x1F2AA07F00B3217A, ...) end;
SET_VEHICLE_COLOURS = function(...) return InvokeVoid(0x4F1D4BE3A7F24601, ...) end;
SET_VEHICLE_EXTRA_COLOURS = function(...) return InvokeVoid(0x2036F561ADD12E33, ...) end;
GET_VEHICLE_EXTRA_COLOURS = function(...) return InvokeVoid(0x3BC4245933A166F7, ...) end;
SET_VEHICLE_MOD_COLOR_1 = function(...) return InvokeVoid(0x43FEB945EE7F85B8, ...) end;
SET_VEHICLE_MOD_COLOR_2 = function(...) return InvokeVoid(0x816562BADFDEC83E, ...) end;
SET_VEHICLE_CUSTOM_PRIMARY_COLOUR = function(...) return InvokeVoid(0x7141766F91D15BEA, ...) end;
GET_VEHICLE_CUSTOM_PRIMARY_COLOUR = function(...) return InvokeVoid(0xB64CF2CCA9D95F52, ...) end;
SET_VEHICLE_CUSTOM_SECONDARY_COLOUR = function(...) return InvokeVoid(0x36CED73BFED89754, ...) end;
GET_VEHICLE_CUSTOM_SECONDARY_COLOUR = function(...) return InvokeVoid(0x8389CD56CA8072DC, ...) end;
CLEAR_VEHICLE_CUSTOM_PRIMARY_COLOUR = function(...) return InvokeVoid(0x55E1D2758F34E437, ...) end;
CLEAR_VEHICLE_CUSTOM_SECONDARY_COLOUR = function(...) return InvokeVoid(0x5FFBDEEC3E8E2009, ...) end;
TOGGLE_VEHICLE_MOD = function(...) return InvokeVoid(0x2A1F4F37F95BAD08, ...) end;
SET_VEHICLE_TYRE_SMOKE_COLOR = function(...) return InvokeVoid(0xB5BA80F839791C0F, ...) end;
SET_VEHICLE_DIRT_LEVEL = function(...) return InvokeVoid(0x79D3B596FE44EE8B, ...) end;
_SET_VEHICLE_XENON_LIGHT_COLOR = function(...) return InvokeVoid(0xE41033B25D003A07, ...) end;
_SET_VEHICLE_NEON_LIGHT_ENABLED = function(...) return InvokeVoid(0x2AA720E4287BF269, ...) end;
_SET_VEHICLE_NEON_LIGHTS_COLOUR = function(...) return InvokeVoid(0x8E0A582209A62695, ...) end;

local F = {
   Material = Utils.Joaat(SCRIPT_PREFIX .. "Material"),
   PresetColorCombo = Utils.Joaat(SCRIPT_PREFIX .. "PresetColorCombo"),
   Chameleon = Utils.Joaat(SCRIPT_PREFIX .. "Chameleon"),
   SyncMode = Utils.Joaat(SCRIPT_PREFIX .. "ColorSync"),
   PrimaryColor = Utils.Joaat(SCRIPT_PREFIX .. "PrimaryColor"),
   SecondaryColor = Utils.Joaat(SCRIPT_PREFIX .. "SecondaryColor"),
   LinkPearl = Utils.Joaat(SCRIPT_PREFIX .. "LinkPearl"),
   PearlAggression = Utils.Joaat(SCRIPT_PREFIX .. "PearlAggression"),
   PrimaryPearl = Utils.Joaat(SCRIPT_PREFIX .. "PrimaryPearl"),
   Brightness = Utils.Joaat(SCRIPT_PREFIX .. "Brightness"),
   Saturation = Utils.Joaat(SCRIPT_PREFIX .. "Saturation"),
   HueShift = Utils.Joaat(SCRIPT_PREFIX .. "HueShift"),
   InvertColors = Utils.Joaat(SCRIPT_PREFIX .. "InvertColors"),
   RandomNormal = Utils.Joaat(SCRIPT_PREFIX .. "RandomNormal"),
   RandomChameleon = Utils.Joaat(SCRIPT_PREFIX .. "RandomChameleon"),
   CustomChameleon = Utils.Joaat(SCRIPT_PREFIX .. "CustomChameleon"),
   RandomMixer = Utils.Joaat(SCRIPT_PREFIX .. "RandomMixer"),
   NeonColor = Utils.Joaat(SCRIPT_PREFIX .. "NeonColor"),
   XenonColor = Utils.Joaat(SCRIPT_PREFIX .. "XenonColor"),
   TyreSmokeColor = Utils.Joaat(SCRIPT_PREFIX .. "TyreSmokeColor"),
   PresetList = Utils.Joaat(SCRIPT_PREFIX .. "PresetList"),
   PresetName = Utils.Joaat(SCRIPT_PREFIX .. "PresetName"),
   LoadButton = Utils.Joaat(SCRIPT_PREFIX .. "Load"),
   SaveButton = Utils.Joaat(SCRIPT_PREFIX .. "Save"),
   DeleteButton = Utils.Joaat(SCRIPT_PREFIX .. "Delete"),
   EnablePearl = Utils.Joaat(SCRIPT_PREFIX .. "EnablePearl"),
   DirtLevel = Utils.Joaat(SCRIPT_PREFIX .. "DirtLevel")
}

local Materials = {
   { name = "Metallic", type = 1, id = { 0,1,2,3,4,5,6,7,8,9,10,11,27,28,29,30,31,32,33,34,35,36,37,38,49,50,51,52,53,54,61,62,63,64,65,66,67,68,69,70,71,72,73,74,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,111,112,125,137,142,143,145,150 } },
   { name = "Matte", type = 3, id = { 12,13,14,39,40,41,42,55,82,83,84,128,129,131,148,149,151,152,153,154,155 } },
   { name = "Util", type = 0, id = { 15,16,17,18,19,20,43,44,45,56,57,75,76,77,78,79,80,81,108,109,110,122} },
   { name = "Worn", type = 0, id = { 21,22,23,24,25,26,46,47,48,58,59,60,85,86,87,113,114,115,116,121,123,124,126,130,132,133 } },
   { name = "Pure", type = 4, id = { 134,158 } },
   { name = "Epsilon", type = 0, id = 157 },
   { name = "Brushed", type = 4, id = { 117,118,119,159 } },
   { name = "Chrome", type = 5, id = 120 },
   { name = "Chameleon", type = 1, id = -1 }
}

local HeadlightColors = {
   "White", "Blue", "Electric Blue", "Mint Green", "Lime Green", 
   "Yellow", "Golden Shower", "Orange", "Red", "Pony Pink", 
   "Hot Pink", "Purple", "Blacklight"
}

local presetColors = {
   { id = 134, type = 4, name = "Pure White", r = 255, g = 255, b = 255 }, 
   { id = 158, type = 4, name = "Pure Gold", r = 122, g = 100, b = 64 }, 
   { id = 117, type = 4, name = "Brushed Steel", r = 106, g = 116, b = 124 },
   { id = 118, type = 4, name = "Brushed Black steel", r = 53, g = 65, b = 88 },
   { id = 119, type = 4, name = "Brushed Aluminium", r = 155, g = 160, b = 168 },
   { id = 159, type = 4, name = "Brushed Gold", r = 127, g = 106, b = 72 },
   { id = 15, type = 0, name = "Util Black", r = 21, g = 25, b = 33 },
   { id = 16, type = 0, name = "Util Black Poly", r = 30, g = 36, b = 41 },
   { id = 17, type = 0, name = "Util Dark silver", r = 51, g = 58, b = 60 },
   { id = 18, type = 0, name = "Util Silver", r = 140, g = 144, b = 149 },
   { id = 19, type = 0, name = "Util Gun Metal", r = 57, g = 67, b = 77 },
   { id = 20, type = 0, name = "Util Shadow Silver", r = 80, g = 98, b = 114 },
   { id = 43, type = 0, name = "Util Red", r = 156, g = 16, b = 22 },
   { id = 44, type = 0, name = "Util Bright Red", r = 222, g = 15, b = 24 },
   { id = 45, type = 0, name = "Util Garnet Red", r = 143, g = 30, b = 23 },
   { id = 56, type = 0, name = "Util Dark Green", r = 34, g = 56, b = 62 },
   { id = 57, type = 0, name = "Util Green", r = 29, g = 90, b = 63 },
   { id = 75, type = 0, name = "Util Dark Blue", r = 17, g = 37, b = 82 },
   { id = 76, type = 0, name = "Util Midnight Blue", r = 27, g = 32, b = 62 },
   { id = 77, type = 0, name = "Util Blue", r = 39, g = 81, b = 144 },
   { id = 78, type = 0, name = "Util Sea Foam Blue", r = 96, g = 133, b = 146 },
   { id = 79, type = 0, name = "Util Lightning blue", r = 36, g = 70, b = 168 },
   { id = 80, type = 0, name = "Util Maui Blue Poly", r = 66, g = 113, b = 225 },
   { id = 81, type = 0, name = "Util Bright Blue", r = 59, g = 57, b = 224 },
   { id = 108, type = 0, name = "Util Brown", r = 58, g = 42, b = 27 },
   { id = 109, type = 0, name = "Util Medium Brown", r = 120, g = 95, b = 51 },
   { id = 110, type = 0, name = "Util Light Brown", r = 181, g = 160, b = 121 },
   { id = 122, type = 0, name = "Util Off White", r = 223, g = 221, b = 208 },
   { id = 157, type = 0, name = "Epsilon Blue", r = 175, g = 214, b = 228 },
   { id = 21, type = 0, name = "Worn Black", r = 30, g = 35, b = 47 },
   { id = 22, type = 0, name = "Worn Graphite", r = 54, g = 58, b = 63 },
   { id = 23, type = 0, name = "Worn Silver Grey", r = 160, g = 161, b = 153 },
   { id = 24, type = 0, name = "Worn Silver", r = 211, g = 211, b = 211 },
   { id = 25, type = 0, name = "Worn Blue Silver", r = 183, g = 191, b = 202 },
   { id = 26, type = 0, name = "Worn Shadow Silver", r = 119, g = 135, b = 148 },
   { id = 46, type = 0, name = "Worn Red", r = 169, g = 71, b = 68 },
   { id = 47, type = 0, name = "Worn Golden Red", r = 177, g = 108, b = 81 },
   { id = 48, type = 0, name = "Worn Dark Red", r = 55, g = 28, b = 37 },
   { id = 58, type = 0, name = "Worn Dark Green", r = 45, g = 66, b = 63 },
   { id = 59, type = 0, name = "Worn Green", r = 69, g = 89, b = 75 },
   { id = 60, type = 0, name = "Worn Sea Wash", r = 101, g = 134, b = 127 },
   { id = 85, type = 0, name = "Worn Dark blue", r = 76, g = 95, b = 129 },
   { id = 86, type = 0, name = "Worn Blue", r = 88, g = 104, b = 142 },
   { id = 87, type = 0, name = "Worn Light blue", r = 116, g = 181, b = 216 },
   { id = 113, type = 0, name = "Worn Honey Beige", r = 176, g = 171, b = 148 },
   { id = 114, type = 0, name = "Worn Brown", r = 69, g = 56, b = 49 },
   { id = 115, type = 0, name = "Worn Dark Brown", r = 42, g = 40, b = 43 },
   { id = 116, type = 0, name = "Worn straw beige", r = 114, g = 108, b = 87 },
   { id = 121, type = 0, name = "Worn Off White", r = 234, g = 230, b = 222 },
   { id = 123, type = 0, name = "Worn Orange", r = 242, g = 173, b = 46 },
   { id = 124, type = 0, name = "Worn Light Orange", r = 249, g = 164, b = 88 },
   { id = 126, type = 0, name = "Worn Taxi Yellow", r = 241, g = 204, b = 64 },
   { id = 130, type = 0, name = "Worn Orange", r = 248, g = 182, b = 88 },
   { id = 132, type = 0, name = "Worn White", r = 255, g = 255, b = 251 },
   { id = 133, type = 0, name = "Worn Olive Army Green", r = 129, g = 132, b = 76 },
   { id = 0, type = 1, name = "Metallic Black", r = 13, g = 17, b = 22 },
   { id = 1, type = 1, name = "Metallic Graphite Black", r = 28, g = 29, b = 33 },
   { id = 2, type = 1, name = "Metallic Black Steal", r = 50, g = 56, b = 61 },
   { id = 3, type = 1, name = "Metallic Dark Silver", r = 69, g = 75, b = 79 },
   { id = 4, type = 1, name = "Metallic Silver", r = 153, g = 157, b = 160 },
   { id = 5, type = 1, name = "Metallic Blue Silver", r = 194, g = 196, b = 198 },
   { id = 6, type = 1, name = "Metallic Steel Gray", r = 151, g = 154, b = 151 },
   { id = 7, type = 1, name = "Metallic Shadow Silver", r = 99, g = 115, b = 128 },
   { id = 8, type = 1, name = "Metallic Stone Silver", r = 99, g = 98, b = 92 },
   { id = 9, type = 1, name = "Metallic Midnight Silver", r = 60, g = 63, b = 71 },
   { id = 10, type = 1, name = "Metallic Gun Metal", r = 68, g = 78, b = 84 },
   { id = 11, type = 1, name = "Metallic Anthracite Grey", r = 29, g = 33, b = 41 },
   { id = 27, type = 1, name = "Metallic Red", r = 192, g = 14, b = 26 },
   { id = 28, type = 1, name = "Metallic Torino Red", r = 218, g = 25, b = 24 },
   { id = 29, type = 1, name = "Metallic Formula Red", r = 182, g = 17, b = 27 },
   { id = 30, type = 1, name = "Metallic Blaze Red", r = 165, g = 30, b = 35 },
   { id = 31, type = 1, name = "Metallic Graceful Red", r = 123, g = 26, b = 34 },
   { id = 32, type = 1, name = "Metallic Garnet Red", r = 142, g = 27, b = 31 },
   { id = 33, type = 1, name = "Metallic Desert Red", r = 111, g = 24, b = 24 },
   { id = 34, type = 1, name = "Metallic Cabernet Red", r = 73, g = 17, b = 29 },
   { id = 35, type = 1, name = "Metallic Candy Red", r = 182, g = 15, b = 37 },
   { id = 36, type = 1, name = "Metallic Sunrise Orange", r = 212, g = 74, b = 23 },
   { id = 37, type = 1, name = "Metallic Classic Gold", r = 194, g = 148, b = 79 },
   { id = 38, type = 1, name = "Metallic Orange", r = 247, g = 134, b = 22 },
   { id = 49, type = 1, name = "Metallic Dark Green", r = 19, g = 36, b = 40 },
   { id = 50, type = 1, name = "Metallic Racing Green", r = 18, g = 46, b = 43 },
   { id = 51, type = 1, name = "Metallic Sea Green", r = 18, g = 56, b = 60 },
   { id = 52, type = 1, name = "Metallic Olive Green", r = 49, g = 66, b = 63 },
   { id = 53, type = 1, name = "Metallic Green", r = 21, g = 92, b = 45 },
   { id = 54, type = 1, name = "Metallic Gasoline Blue Green", r = 27, g = 103, b = 112 },
   { id = 61, type = 1, name = "Metallic Midnight Blue", r = 34, g = 46, b = 70 },
   { id = 62, type = 1, name = "Metallic Dark Blue", r = 35, g = 49, b = 85 },
   { id = 63, type = 1, name = "Metallic Saxony Blue", r = 48, g = 76, b = 126 },
   { id = 64, type = 1, name = "Metallic Blue", r = 71, g = 87, b = 143 },
   { id = 65, type = 1, name = "Metallic Mariner Blue", r = 99, g = 123, b = 167 },
   { id = 66, type = 1, name = "Metallic Harbor Blue", r = 57, g = 71, b = 98 },
   { id = 67, type = 1, name = "Metallic Diamond Blue", r = 214, g = 231, b = 241 },
   { id = 68, type = 1, name = "Metallic Surf Blue", r = 118, g = 175, b = 190 },
   { id = 69, type = 1, name = "Metallic Nautical Blue", r = 52, g = 94, b = 114 },
   { id = 70, type = 1, name = "Metallic Bright Blue", r = 11, g = 156, b = 241 },
   { id = 71, type = 1, name = "Metallic Purple Blue", r = 47, g = 45, b = 82 },
   { id = 72, type = 1, name = "Metallic Spinnaker Blue", r = 40, g = 44, b = 77 },
   { id = 73, type = 1, name = "Metallic Ultra Blue", r = 35, g = 84, b = 161 },
   { id = 74, type = 1, name = "Metallic Bright Blue", r = 110, g = 163, b = 198 },
   { id = 88, type = 1, name = "Metallic Taxi Yellow", r = 255, g = 207, b = 32 },
   { id = 89, type = 1, name = "Metallic Race Yellow", r = 251, g = 226, b = 18 },
   { id = 90, type = 1, name = "Metallic Bronze", r = 145, g = 101, b = 50 },
   { id = 91, type = 1, name = "Metallic Yellow Bird", r = 224, g = 225, b = 61 },
   { id = 92, type = 1, name = "Metallic Lime", r = 152, g = 210, b = 35 },
   { id = 93, type = 1, name = "Metallic Champagne", r = 155, g = 140, b = 120 },
   { id = 94, type = 1, name = "Metallic Pueblo Beige", r = 80, g = 50, b = 24 },
   { id = 95, type = 1, name = "Metallic Dark Ivory", r = 71, g = 63, b = 43 },
   { id = 96, type = 1, name = "Metallic Choco Brown", r = 34, g = 27, b = 25 },
   { id = 97, type = 1, name = "Metallic Golden Brown", r = 101, g = 63, b = 35 },
   { id = 98, type = 1, name = "Metallic Light Brown", r = 119, g = 92, b = 62 },
   { id = 99, type = 1, name = "Metallic Straw Beige", r = 172, g = 153, b = 117 },
   { id = 100, type = 1, name = "Metallic Moss Brown", r = 108, g = 107, b = 75 },
   { id = 101, type = 1, name = "Metallic Biston Brown", r = 64, g = 46, b = 43 },
   { id = 102, type = 1, name = "Metallic Beechwood", r = 164, g = 150, b = 95 },
   { id = 103, type = 1, name = "Metallic Dark Beechwood", r = 70, g = 35, b = 26 },
   { id = 104, type = 1, name = "Metallic Choco Orange", r = 117, g = 43, b = 25 },
   { id = 105, type = 1, name = "Metallic Beach Sand", r = 191, g = 174, b = 123 },
   { id = 106, type = 1, name = "Metallic Sun Bleeched Sand", r = 223, g = 213, b = 178 },
   { id = 107, type = 1, name = "Metallic Cream", r = 247, g = 237, b = 213 },
   { id = 111, type = 1, name = "Metallic White", r = 255, g = 255, b = 246 },
   { id = 112, type = 1, name = "Metallic Frost White", r = 234, g = 234, b = 234 },
   { id = 125, type = 1, name = "Metallic Securicor Green", r = 131, g = 197, b = 102 },
   { id = 137, type = 1, name = "Metallic Vermillion Pink", r = 223, g = 88, b = 145 },
   { id = 142, type = 1, name = "Metallic Black Purple", r = 12, g = 13, b = 24 },
   { id = 143, type = 1, name = "Metallic Black Red", r = 14, g = 13, b = 20 },
   { id = 145, type = 1, name = "Metallic Purple", r = 98, g = 18, b = 118 },
   { id = 150, type = 1, name = "Metallic Lava Red", r = 188, g = 25, b = 23 },
   { id = 12, type = 3, name = "Matte Black", r = 19, g = 24, b = 31 },
   { id = 13, type = 3, name = "Matte Gray", r = 38, g = 40, b = 42 },
   { id = 14, type = 3, name = "Matte Light Grey", r = 81, g = 85, b = 84 },
   { id = 39, type = 3, name = "Matte Red", r = 207, g = 31, b = 33 },
   { id = 40, type = 3, name = "Matte Dark Red", r = 115, g = 32, b = 33 },
   { id = 41, type = 3, name = "Matte Orange", r = 242, g = 125, b = 32 },
   { id = 42, type = 3, name = "Matte Yellow", r = 255, g = 201, b = 31 },
   { id = 55, type = 3, name = "Matte Lime Green", r = 102, g = 184, b = 31 },
   { id = 82, type = 3, name = "Matte Dark Blue", r = 31, g = 40, b = 82 },
   { id = 83, type = 3, name = "Matte Blue", r = 37, g = 58, b = 167 },
   { id = 84, type = 3, name = "Matte Midnight Blue", r = 28, g = 53, b = 81 },
   { id = 128, type = 3, name = "Matte Green", r = 78, g = 100, b = 67 },
   { id = 129, type = 3, name = "Matte Brown", r = 188, g = 172, b = 143 },
   { id = 131, type = 3, name = "Matte White", r = 252, g = 249, b = 241 },
   { id = 148, type = 3, name = "Matte Purple", r = 107, g = 31, b = 123 },
   { id = 149, type = 3, name = "Matte Dark Purple", r = 30, g = 29, b = 34 },
   { id = 151, type = 3, name = "Matte Forest Green", r = 45, g = 54, b = 42 },
   { id = 152, type = 3, name = "Matte Olive Drab", r = 105, g = 103, b = 72 },
   { id = 153, type = 3, name = "Matte Desert Brown", r = 122, g = 108, b = 85 },
   { id = 154, type = 3, name = "Matte Desert Tan", r = 195, g = 180, b = 146 },
   { id = 155, type = 3, name = "Matte Foilage Green", r = 90, g = 99, b = 82 },
   { id = 120, type = 5, name = "Chrome", r = 200, g = 200, b = 200 },
}

local materialNames = {}
for i, m in ipairs(Materials) do materialNames[i] = m.name end

local Chameleons = {}
local chameleonNames = {}
for i = 1, 32 do
   Chameleons[i] = { id = 160 + i }
   chameleonNames[i] = "Chameleon Paint #" .. i
end

local presetFiles = {"No Presets Found"}
local currentFilteredColors = {}

local function RgbToHsl(r, g, b)
   r, g, b = r / 255, g / 255, b / 255
   local max, min = math.max(r, g, b), math.min(r, g, b)
   local h, s, l = 0, 0, (max + min) / 2
   if max ~= min then
      local d = max - min
      s = l > 0.5 and d / (2 - max - min) or d / (max + min)
      if max == r then h = (g - b) / d + (g < b and 6 or 0)
      elseif max == g then h = (b - r) / d + 2
      elseif max == b then h = (r - g) / d + 4 end
      h = h / 6
   end
   return h, s, l
end

local function HslToRgb(h, s, l)
   local function hue2rgb(p, q, t)
      if t < 0 then t = t + 1 end
      if t > 1 then t = t - 1 end
      if t < 1/6 then return p + (q - p) * 6 * t end
      if t < 1/2 then return q end
      if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
      return p
   end
   local r, g, b
   if s == 0 then r, g, b = l, l, l
   else
      local q = l < 0.5 and l * (1 + s) or l + s - l * s
      local p = 2 * l - q
      r, g, b = hue2rgb(p, q, h + 1/3), hue2rgb(p, q, h), hue2rgb(p, q, h - 1/3)
   end
   return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
end

local function RgbToHue(r,g,b)
   r,g,b = r/255,g/255,b/255
   local max,min = math.max(r,g,b),math.min(r,g,b)
   local d = max-min
   if d==0 then return 0 end
   if max==r then return (60*((g-b)/d))%360 end
   if max==g then return 60*((b-r)/d+2) end
   return 60*((r-g)/d+4)
end

local function HueToPearl(h)
   h = h % 360
   if h < 20 then return 28 elseif h < 45 then return 38
   elseif h < 75 then return 89 elseif h < 110 then return 92
   elseif h < 160 then return 139 elseif h < 210 then return 70
   elseif h < 270 then return 64 elseif h < 310 then return 145
   elseif h < 340 then return 148 else return 35 end
end

local function HueToHeadlight(h)
   h = h % 360
   if h < 15 or h > 345 then return 8 
   elseif h < 45 then return 7 
   elseif h < 65 then return 5 
   elseif h < 100 then return 4 
   elseif h < 150 then return 3 
   elseif h < 190 then return 2 
   elseif h < 245 then return 1 
   elseif h < 280 then return 11 
   elseif h < 310 then return 12 
   elseif h < 345 then return 10 
   else return 0 end
end

local function GetVehicleHandle()
   local ped = GTA.GetLocalPed()
   if not ped or not ped:IsInVehicle() then return nil end
   return GTA.PointerToHandle(ped.CurVehicle)
end

local function ProcessColorModifiers(r, g, b)
   local h, s, l = RgbToHsl(r, g, b)
   local hueShiftVal = FeatureMgr.GetFeatureInt(F.HueShift) / 360
   local satMult = FeatureMgr.GetFeatureInt(F.Saturation) / 100
   local brMult = FeatureMgr.GetFeatureInt(F.Brightness) / 100
   h = (h + hueShiftVal) % 1.0
   s = math.max(0, math.min(1.0, s * satMult))
   l = math.max(0, math.min(1.0, l * brMult))
   local fr, fg, fb = HslToRgb(h, s, l)
   if FeatureMgr.IsFeatureEnabled(F.InvertColors) then return 255-fr, 255-fg, 255-fb end
   return fr, fg, fb
end

local function ApplyPaint()
   local handle = GetVehicleHandle()
   if not handle then return end

   local matIdx = FeatureMgr.GetFeatureListIndex(F.Material)
   local mat = Materials[matIdx + 1]
   local pPearl = FeatureMgr.GetFeatureInt(F.PrimaryPearl)
   
   SET_VEHICLE_MOD_KIT(handle, 0)

   local baseColorId = type(mat.id) == "table" and mat.id[1] or mat.id

   if mat.name == "Chameleon" then
      local cIdx = FeatureMgr.GetFeatureListIndex(F.Chameleon)
      local cID = Chameleons[cIdx + 1].id
      SET_VEHICLE_COLOURS(handle, cID, cID)
      if FeatureMgr.IsFeatureEnabled(F.EnablePearl) then
         SET_VEHICLE_EXTRA_COLOURS(handle, pPearl, 0)
      else
         SET_VEHICLE_EXTRA_COLOURS(handle, 0, 0)
      end
      CLEAR_VEHICLE_CUSTOM_PRIMARY_COLOUR(handle)
      CLEAR_VEHICLE_CUSTOM_SECONDARY_COLOUR(handle)
   else
      local pr_raw, pg_raw, pb_raw = FeatureMgr.GetFeatureColor(F.PrimaryColor)
      local pr, pg, pb = ProcessColorModifiers(pr_raw, pg_raw, pb_raw)
      local dirtLevel = FeatureMgr.GetFeatureFloat(F.DirtLevel)

      local sr, sg, sb
      local nr, ng, nb
      local tr, tg, tb
      local xenonID

      if FeatureMgr.IsFeatureEnabled(F.SyncMode) then
         sr, sg, sb = pr, pg, pb
         nr, ng, nb = pr, pg, pb
         tr, tg, tb = pr, pg, pb
         xenonID = HueToHeadlight(RgbToHue(pr, pg, pb))
         
         FeatureMgr.SetFeatureColor(F.SecondaryColor, pr_raw, pg_raw, pb_raw, 255)
         FeatureMgr.SetFeatureColor(F.NeonColor, pr_raw, pg_raw, pb_raw, 255)
         FeatureMgr.SetFeatureColor(F.TyreSmokeColor, pr_raw, pg_raw, pb_raw, 255)
         FeatureMgr.SetFeatureListIndex(F.XenonColor, xenonID)
      else
         local sr_raw, sg_raw, sb_raw = FeatureMgr.GetFeatureColor(F.SecondaryColor)
         sr, sg, sb = ProcessColorModifiers(sr_raw, sg_raw, sb_raw)
         nr, ng, nb = FeatureMgr.GetFeatureColor(F.NeonColor)
         tr, tg, tb = FeatureMgr.GetFeatureColor(F.TyreSmokeColor)
         xenonID = FeatureMgr.GetFeatureListIndex(F.XenonColor)
      end

      SET_VEHICLE_COLOURS(handle, baseColorId, baseColorId)
      SET_VEHICLE_MOD_COLOR_1(handle, mat.type, baseColorId, pPearl)
      SET_VEHICLE_MOD_COLOR_2(handle, mat.type, baseColorId)
      
      if FeatureMgr.IsFeatureEnabled(F.EnablePearl) then
         SET_VEHICLE_EXTRA_COLOURS(handle, pPearl, 0)
      else
         SET_VEHICLE_EXTRA_COLOURS(handle, 0, 0)
      end
      
      SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(handle, math.floor(pr), math.floor(pg), math.floor(pb))
      SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(handle, math.floor(sr), math.floor(sg), math.floor(sb))

      for i = 0, 3 do _SET_VEHICLE_NEON_LIGHT_ENABLED(handle, i, true) end
      _SET_VEHICLE_NEON_LIGHTS_COLOUR(handle, nr, ng, nb)

      TOGGLE_VEHICLE_MOD(handle, 22, true)
      _SET_VEHICLE_XENON_LIGHT_COLOR(handle, xenonID)

      TOGGLE_VEHICLE_MOD(handle, 20, true)
      SET_VEHICLE_TYRE_SMOKE_COLOR(handle, tr, tg, tb)
   end

   SET_VEHICLE_DIRT_LEVEL(handle, dirtLevel)
end

local function AutoCalculatePearl()
   if FeatureMgr.IsFeatureEnabled(F.LinkPearl) then
      local r, g, b = FeatureMgr.GetFeatureColor(F.PrimaryColor)
      if r then
         local hue = RgbToHue(r, g, b)
         local aggression = FeatureMgr.GetFeatureInt(F.PearlAggression)
         local shift = (aggression / 100) * 160
         FeatureMgr.SetFeatureInt(F.PrimaryPearl, HueToPearl((hue + shift) % 360))
      end
   end
   ApplyPaint()
end

local function UpdatePresetColorList()
   local matIdx = FeatureMgr.GetFeatureListIndex(F.Material)
   local mat = Materials[matIdx + 1]
   
   local filteredNames = {}
   currentFilteredColors = {}
   
   if mat.name ~= "Chameleon" then
      local matSearchName = mat.name:lower()
      for _, col in ipairs(presetColors) do
         if col.name:lower():find(matSearchName) then
            table.insert(filteredNames, col.name)
            table.insert(currentFilteredColors, col)
         end
      end
   end
   
   if #filteredNames == 0 then table.insert(filteredNames, "No presets for material") end
   
   local feat = FeatureMgr.GetFeature(F.PresetColorCombo)
   if feat then 
      feat:SetList(filteredNames) 
      feat:SetListIndex(0)
   end
end

local function RandomizeMixer()
   FeatureMgr.SetFeatureInt(F.Brightness, math.random(25, 100))
   FeatureMgr.SetFeatureInt(F.Saturation, math.random(25, 100))
   ApplyPaint()
end

local function RefreshPresetList()
   local files = FileMgr.FindFiles(presetPath, ".json", false)
   local newList = {}
   if files and #files > 0 then
      for _, f in ipairs(files) do
         newList[#newList+1] = f:match("([^\\/]+)%.json$") or f
      end
      presetFiles = newList
   else
      presetFiles = {"No Presets Found"}
   end
   
   local feat = FeatureMgr.GetFeature(F.PresetList)
   if feat then feat:SetList(presetFiles) end
end

local function SavePresetFile()
   local name = FeatureMgr.GetFeatureString(F.PresetName)
   if name == "" or name == nil then 
      GUI.AddToast("Error", "Please enter a valid name.", 3000) 
      return 
   end
   
   local data = {
      material = FeatureMgr.GetFeatureListIndex(F.Material),
      chameleon = FeatureMgr.GetFeatureListIndex(F.Chameleon),
      sync_mode = FeatureMgr.IsFeatureEnabled(F.SyncMode),
      primary_color = { FeatureMgr.GetFeatureColor(F.PrimaryColor) },
      secondary_color = { FeatureMgr.GetFeatureColor(F.SecondaryColor) },
      neon_color = { FeatureMgr.GetFeatureColor(F.NeonColor) },
      smoke_color = { FeatureMgr.GetFeatureColor(F.TyreSmokeColor) },
      headlight_color = FeatureMgr.GetFeatureListIndex(F.XenonColor),
      pearl_id = FeatureMgr.GetFeatureInt(F.PrimaryPearl),
      pearl_aggression = FeatureMgr.GetFeatureInt(F.PearlAggression),
      dirt_level = FeatureMgr.GetFeatureFloat(F.DirtLevel),
      modifiers = {
         brightness = FeatureMgr.GetFeatureInt(F.Brightness),
         saturation = FeatureMgr.GetFeatureInt(F.Saturation),
         hue_shift = FeatureMgr.GetFeatureInt(F.HueShift),
         invert = FeatureMgr.IsFeatureEnabled(F.InvertColors)
      }
   }
   
   FileMgr.WriteFileContent(presetPath .. name .. ".json", json.encode(data))
   GUI.AddToast("Success", "Preset '" .. name .. "' saved.", 3000)
   RefreshPresetList()
end

local function LoadPresetFile()
   local idx = FeatureMgr.GetFeatureListIndex(F.PresetList)
   local name = presetFiles[idx+1]
   
   if not name or name == "No Presets Found" then 
      GUI.AddToast("Error", "No valid preset selected.", 3000)
      return 
   end
   
   local content = FileMgr.ReadFileContent(presetPath .. name .. ".json")
   if not content or content == "" then return end
   
   local d = json.decode(content)
   if not d then return end

   FeatureMgr.SetFeatureListIndex(F.Material, math.floor(tonumber(d.material) or 0))
   UpdatePresetColorList() 
   
   FeatureMgr.SetFeatureListIndex(F.Chameleon, math.floor(tonumber(d.chameleon) or 0))
   
   local syncFeat = FeatureMgr.GetFeature(F.SyncMode)
   if syncFeat then syncFeat:SetBoolValue(d.sync_mode == true) end
   
   local function SetCol(featId, colData)
      if colData and #colData >= 3 then
         FeatureMgr.SetFeatureColor(featId, math.floor(colData[1]), math.floor(colData[2]), math.floor(colData[3]), math.floor(colData[4] or 255))
      end
   end

   SetCol(F.PrimaryColor, d.primary_color)
   SetCol(F.SecondaryColor, d.secondary_color)
   SetCol(F.NeonColor, d.neon_color)
   SetCol(F.TyreSmokeColor, d.smoke_color)
   
   FeatureMgr.SetFeatureListIndex(F.XenonColor, math.floor(tonumber(d.headlight_color) or 0))
   FeatureMgr.SetFeatureInt(F.PrimaryPearl, math.floor(tonumber(d.pearl_id) or 0))
   FeatureMgr.SetFeatureInt(F.PearlAggression, math.floor(tonumber(d.pearl_aggression) or 20))
   FeatureMgr.SetFeatureFloat(F.DirtLevel, tonumber(d.dirt_level) or 0.0)
   
   if d.modifiers then
      FeatureMgr.SetFeatureInt(F.Brightness, math.floor(tonumber(d.modifiers.brightness) or 100))
      FeatureMgr.SetFeatureInt(F.Saturation, math.floor(tonumber(d.modifiers.saturation) or 100))
      FeatureMgr.SetFeatureInt(F.HueShift, math.floor(tonumber(d.modifiers.hue_shift) or 0))
      local invFeat = FeatureMgr.GetFeature(F.InvertColors)
      if invFeat then invFeat:SetBoolValue(d.modifiers.invert == true) end
   end
   
   GUI.AddToast("Loaded Paintjob: " .. name, 2000)
   ApplyPaint()
end

local function DeletePresetFile()
   local idx = FeatureMgr.GetFeatureListIndex(F.PresetList)
   local name = presetFiles[idx+1]
   if not name or name == "No Presets Found" then return end

   FileMgr.DeleteFile(presetPath .. name .. ".json")
   GUI.AddToast("Deleted: " .. name, 3000)
   RefreshPresetList()
end

FeatureMgr.AddFeature(F.Material, "Base Material", eFeatureType.Combo, "Select surface texture.", function()
   UpdatePresetColorList()
   ApplyPaint()
end):SetList(materialNames)

FeatureMgr.AddFeature(F.PresetColorCombo, "Color", eFeatureType.Combo, "Predefined GTA colors matching the material.", function()
   local idx = FeatureMgr.GetFeatureListIndex(F.PresetColorCombo)
   local colorData = currentFilteredColors[idx + 1]
   if colorData then
      local pearlFeat = FeatureMgr.GetFeature(F.EnablePearl)
      if pearlFeat then pearlFeat:SetBoolValue(false) end
      FeatureMgr.SetFeatureColor(F.PrimaryColor, colorData.r, colorData.g, colorData.b, 255)
      AutoCalculatePearl()
   end
end):SetList({"Select material first"})

FeatureMgr.AddFeature(F.Chameleon, "Chameleon Color", eFeatureType.Combo, "Select iridescent shader effects.", ApplyPaint):SetList(chameleonNames)
FeatureMgr.AddFeature(F.SyncMode, "Sync Mode", eFeatureType.Toggle, "Synchronizes everything to Primary.", ApplyPaint):SetBoolValue(false)
FeatureMgr.AddFeature(F.PrimaryColor, "Primary Color", eFeatureType.InputColor3, "Base RGB color.", AutoCalculatePearl):SetColor(255, 255, 255, 255)
FeatureMgr.AddFeature(F.SecondaryColor, "Secondary Color", eFeatureType.InputColor3, "Accent RGB color.", ApplyPaint):SetColor(255, 255, 255, 255)
FeatureMgr.AddFeature(F.NeonColor, "Neon Color", eFeatureType.InputColor3, "Underglow color.", ApplyPaint):SetColor(255, 255, 255, 255)
FeatureMgr.AddFeature(F.TyreSmokeColor, "Tyre Smoke Color", eFeatureType.InputColor3, "Tire smoke.", ApplyPaint):SetColor(255, 255, 255, 255)
FeatureMgr.AddFeature(F.XenonColor, "Headlight Color", eFeatureType.Combo, "Headlight color.", ApplyPaint):SetList(HeadlightColors)
FeatureMgr.AddFeature(F.LinkPearl, "Link Pearl", eFeatureType.Toggle, "Auto-calculate Pearl ID."):SetBoolValue(true)
FeatureMgr.AddFeature(F.PearlAggression, "Pearl Intensity (%)", eFeatureType.SliderInt, "Color blending intensity.", AutoCalculatePearl):SetLimitValues(0, 100):SetIntValue(20)
FeatureMgr.AddFeature(F.PrimaryPearl, "Pearl ID", eFeatureType.SliderInt, "Manual Pearl ID.", ApplyPaint):SetLimitValues(0, 160)
FeatureMgr.AddFeature(F.Brightness, "Brightness (%)", eFeatureType.SliderInt, "Scale brightness.", ApplyPaint):SetLimitValues(0, 100):SetDefaultValue(100):SetIntValue(100)
FeatureMgr.AddFeature(F.Saturation, "Saturation (%)", eFeatureType.SliderInt, "Scale saturation.", ApplyPaint):SetLimitValues(0, 100):SetDefaultValue(100):SetIntValue(100)
FeatureMgr.AddFeature(F.HueShift, "Hue Shift (Deg)", eFeatureType.SliderInt, "Rotate colors.", ApplyPaint):SetLimitValues(0, 360)
FeatureMgr.AddFeature(F.InvertColors, "Invert Colors", eFeatureType.Toggle, "Negative effect.", ApplyPaint)
FeatureMgr.AddFeature(F.RandomMixer, "Randomize Mixer", eFeatureType.Button, "Randomize only the color modifiers.", RandomizeMixer)
FeatureMgr.AddFeature(F.EnablePearl, "Enable Pearl", eFeatureType.Toggle, "Enable Pearl Effect.", ApplyPaint):SetBoolValue(true)
FeatureMgr.AddFeature(F.DirtLevel, "Dirt Level", eFeatureType.SliderFloat, "Set dirt level.", ApplyPaint):SetLimitValues(0.0, 15.0)

FeatureMgr.AddFeature(F.RandomNormal, "Random Paint", eFeatureType.Button, "Generate random colors.", function()
   FeatureMgr.SetFeatureListIndex(F.Material, math.random(0, 3))
   UpdatePresetColorList()
   FeatureMgr.SetFeatureColor(F.PrimaryColor, math.random(0,255), math.random(0,255), math.random(0,255), 255)
   if not FeatureMgr.IsFeatureEnabled(F.SyncMode) then
      FeatureMgr.SetFeatureColor(F.SecondaryColor, math.random(0,255), math.random(0,255), math.random(0,255), 255)
      FeatureMgr.SetFeatureColor(F.NeonColor, math.random(0,255), math.random(0,255), math.random(0,255), 255)
      FeatureMgr.SetFeatureColor(F.TyreSmokeColor, math.random(0,255), math.random(0,255), math.random(0,255), 255)
   end
   FeatureMgr.SetFeatureInt(F.PearlAggression, math.random(0, 100))
   FeatureMgr.SetFeatureInt(F.Brightness, math.random(0, 100))
   FeatureMgr.SetFeatureInt(F.Saturation, math.random(0, 100))
   AutoCalculatePearl()
end)

FeatureMgr.AddFeature(F.RandomChameleon, "Random Chameleon", eFeatureType.Button, "Randomized chameleon.", function()
   FeatureMgr.SetFeatureListIndex(F.Material, 8)
   UpdatePresetColorList()
   FeatureMgr.SetFeatureListIndex(F.Chameleon, math.random(0, 31))
   ApplyPaint()
end)

FeatureMgr.AddFeature(F.CustomChameleon, "Custom Chameleon", eFeatureType.Button, "Randomized chameleon.", function()
   FeatureMgr.TriggerFeatureCallback(F.RandomNormal)
   FeatureMgr.TriggerFeatureCallback(F.RandomChameleon)
end)

FeatureMgr.AddFeature(F.PresetList, "Saved Presets", eFeatureType.Combo, "Select a preset.", nil):SetList(presetFiles)
FeatureMgr.AddFeature(F.PresetName, "Preset Name", eFeatureType.InputText, "Name to save.")
FeatureMgr.AddFeature(F.SaveButton, "Save Preset", eFeatureType.Button, "Save current settings.", SavePresetFile)
FeatureMgr.AddFeature(F.LoadButton, "Load Preset", eFeatureType.Button, "Apply selected preset.", LoadPresetFile)
FeatureMgr.AddFeature(F.DeleteButton, "Delete Preset", eFeatureType.Button, "Delete selected file.", DeletePresetFile)

ClickGUI.AddTab(SCRIPT_NAME, function()
   local ped = GTA.GetLocalPed()
   if not ped or not ped:IsInVehicle() then
      ImGui.TextColored(1, 0, 0, 1, "You are not in a vehicle.")
      return
   end

   local isCham = (FeatureMgr.GetFeatureListIndex(F.Material) == 8)
   local isSync = FeatureMgr.IsFeatureEnabled(F.SyncMode)
   
   if ImGui.BeginTable("Table", 2, ImGuiTableFlags.SizingStretchSame) then
      ImGui.TableNextRow()
      ImGui.TableSetColumnIndex(0)
      
      if ClickGUI.BeginCustomChildWindow("Colors", -1) then
         FeatureMgr.GetFeature(F.Material):Render()
         if isCham then 
               FeatureMgr.GetFeature(F.Chameleon):Render() 
         else
               FeatureMgr.GetFeature(F.PresetColorCombo):Render() 
               FeatureMgr.GetFeature(F.SyncMode):Render()
               FeatureMgr.GetFeature(F.PrimaryColor):Render()
               if not isSync then
                  FeatureMgr.GetFeature(F.SecondaryColor):Render()
                  FeatureMgr.GetFeature(F.NeonColor):Render()
                  FeatureMgr.GetFeature(F.XenonColor):Render()
                  FeatureMgr.GetFeature(F.TyreSmokeColor):Render()
               end
               FeatureMgr.GetFeature(F.DirtLevel):Render()
         end
         ClickGUI.EndCustomChildWindow()
      end

      if ClickGUI.BeginCustomChildWindow("Pearl", -1) then
         FeatureMgr.GetFeature(F.EnablePearl):Render()
         FeatureMgr.GetFeature(F.LinkPearl):Render()
         FeatureMgr.GetFeature(F.PearlAggression):Render()
         FeatureMgr.GetFeature(F.PrimaryPearl):Render()
         ImGui.Spacing()
         ClickGUI.EndCustomChildWindow()
      end

      if ClickGUI.BeginCustomChildWindow("Randomizer", -1) then
         FeatureMgr.GetFeature(F.RandomNormal):Render()
         FeatureMgr.GetFeature(F.RandomChameleon):Render()
         FeatureMgr.GetFeature(F.CustomChameleon):Render()
         ClickGUI.EndCustomChildWindow()
      end   
   
      ImGui.TableSetColumnIndex(1)
      if not isCham then
         if ClickGUI.BeginCustomChildWindow("Color Mixer", -1) then
            FeatureMgr.GetFeature(F.Brightness):Render()
            FeatureMgr.GetFeature(F.Saturation):Render()
            FeatureMgr.GetFeature(F.HueShift):Render()
            FeatureMgr.GetFeature(F.InvertColors):Render()   
            FeatureMgr.GetFeature(F.RandomMixer):Render()
            ClickGUI.EndCustomChildWindow()
         end
      end

      if ClickGUI.BeginCustomChildWindow("Preset Manager", -1) then      
         FeatureMgr.GetFeature(F.PresetList):Render()
         if ImGui.Button("Load Preset") then LoadPresetFile() end
         ImGui.SameLine()
         if ImGui.Button("Delete Preset") then DeletePresetFile() end
         ImGui.Spacing()
         FeatureMgr.GetFeature(F.PresetName):Render()
         FeatureMgr.GetFeature(F.SaveButton):Render()
         ClickGUI.EndCustomChildWindow()
      end
      ImGui.EndTable()
   end
end)

UpdatePresetColorList()
RefreshPresetList()

EventMgr.RegisterHandler(eLuaEvent.ON_UNLOAD, function()
   ClickGUI.RemoveTab(SCRIPT_NAME)
end)

Script.RegisterLooped(function()
   local vehicle = GetVehicleHandle()
   if vehicle then
      local dirtLevel = FeatureMgr.GetFeatureFloat(F.DirtLevel)
      if dirtLevel > 0.0 then SET_VEHICLE_DIRT_LEVEL(vehicle, dirtLevel) end
   end
end)

-- Copyright (c) 2020 rxi
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.


local json = {}
local esc = {['\\']='\\',['"']='"',['\b']='b',['\f']='f',['\n']='n',['\r']='r',['\t']='t'}
local rev = {b='\b',f='\f',n='\n',r='\r',t='\t'}

local function encode(v)
   local t = type(v)
   if t == "string" then return '"'..v:gsub('[%z\1-\31\\"]', function(c) return "\\"..(esc[c] or string.format("u%04x", c:byte())) end)..'"' end
   if t == "number" or t == "boolean" then return tostring(v) end
   if t == "table" then
      local res, is_arr = {}, #v > 0
      for k, vv in pairs(v) do
         if is_arr then table.insert(res, encode(vv))
         else table.insert(res, encode(tostring(k))..":"..encode(vv)) end
      end
      return is_arr and "["..table.concat(res, ",").."]" or "{"..table.concat(res, ",").."}"
   end
   return "null"
end

local function parse(s, i)
   i = s:find("%S", i) or i
   local c = s:sub(i, i)
   if c == '{' or c == '[' then
      local res, term, close = {}, c == '{' and ':' or nil, c == '{' and '}' or ']'
      i = i + 1
      if s:sub((s:find("%S", i)), s:find("%S", i)) == close then return res, (s:find(close, i)) + 1 end
      repeat
         local k, v
         if term then k, i = parse(s, i); i = s:find(":", i) + 1 end
         v, i = parse(s, i)
         if term then res[k] = v else table.insert(res, v) end
         i = s:find("%S", i); c = s:sub(i, i); i = i + 1
      until c == close
      return res, i
   elseif c == '"' then
      local res, j = "", i + 1
      while true do
         local x, e = s:find('[\\"]', j)
         res = res .. s:sub(j, x - 1)
         if s:sub(x, x) == '"' then return res, x + 1 end
         local esc_c = s:sub(x+1, x+1)
         res, j = res .. (rev[esc_c] or esc_c), x + 2
      end
   else
      local x = s:find("[^%w%.%-]", i) or #s + 1
      local item = s:sub(i, x - 1)
      local val = item == "true" and true or item == "false" and false or item == "null" and nil or tonumber(item)
      return val, x
   end
end

function json.encode(v) return encode(v) end
function json.decode(s) return (parse(s, 1)) end

_G.json = json

