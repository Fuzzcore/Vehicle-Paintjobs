local SCRIPT_NAME = "Paintjobs"
local SCRIPT_PREFIX = "VPJ_"

local presetPath = FileMgr.GetMenuRootPath() .. "\\Vehicles\\Paintjobs\\"

FileMgr.CreateDir(presetPath)

-- GTA 5 Natives for Cherax Mod Menu. Generated with NativeGenerator on 06-01-2026 12:40:31.
-- https://raw.githubusercontent.com/alloc8or/gta5-nativedb-data/master/natives.json
local InvokeBool,InvokeFloat,InvokeInt,InvokeString,InvokeVoid=Natives.InvokeBool,Natives.InvokeFloat,Natives.InvokeInt,Natives.InvokeString,Natives.InvokeVoid
local function InvokeV3(Hash,...)return V3.New(Natives.InvokeV3(Hash,...))end

SET_VEHICLE_MOD_KIT=function(...)return InvokeVoid(0x1F2AA07F00B3217A,...)end;
SET_VEHICLE_COLOURS=function(...)return InvokeVoid(0x4F1D4BE3A7F24601,...)end;
SET_VEHICLE_EXTRA_COLOURS=function(...)return InvokeVoid(0x2036F561ADD12E33,...)end;
GET_VEHICLE_EXTRA_COLOURS=function(...)return InvokeVoid(0x3BC4245933A166F7,...)end;
SET_VEHICLE_MOD_COLOR_1=function(...)return InvokeVoid(0x43FEB945EE7F85B8,...)end;
SET_VEHICLE_MOD_COLOR_2=function(...)return InvokeVoid(0x816562BADFDEC83E,...)end;
SET_VEHICLE_CUSTOM_PRIMARY_COLOUR=function(...)return InvokeVoid(0x7141766F91D15BEA,...)end;
GET_VEHICLE_CUSTOM_PRIMARY_COLOUR=function(...)return InvokeVoid(0xB64CF2CCA9D95F52,...)end;
SET_VEHICLE_CUSTOM_SECONDARY_COLOUR=function(...)return InvokeVoid(0x36CED73BFED89754,...)end;
GET_VEHICLE_CUSTOM_SECONDARY_COLOUR=function(...)return InvokeVoid(0x8389CD56CA8072DC,...)end;
CLEAR_VEHICLE_CUSTOM_PRIMARY_COLOUR=function(...)return InvokeVoid(0x55E1D2758F34E437,...)end;
CLEAR_VEHICLE_CUSTOM_SECONDARY_COLOUR=function(...)return InvokeVoid(0x5FFBDEEC3E8E2009,...)end;
TOGGLE_VEHICLE_MOD=function(...)return InvokeVoid(0x2A1F4F37F95BAD08,...)end;
SET_VEHICLE_TYRE_SMOKE_COLOR=function(...)return InvokeVoid(0xB5BA80F839791C0F,...)end;
SET_VEHICLE_DIRT_LEVEL=function(...)return InvokeVoid(0x79D3B596FE44EE8B,...)end;
_SET_VEHICLE_XENON_LIGHTS_COLOR=function(...)return InvokeVoid(0xE41033B25D003A07, ...)end;
_SET_VEHICLE_NEON_LIGHT_ENABLED=function(...)return InvokeVoid(0x2AA720E4287BF269, ...)end;
_SET_VEHICLE_NEON_LIGHTS_COLOUR=function(...)return InvokeVoid(0x8E0A582209A62695, ...)end;

local F = {
    Material = Utils.Joaat(SCRIPT_PREFIX .. "Material"),
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
}

local Materials = {
    { name = "Metallic", type = 1, id = 0 },
    { name = "Matte", type = 3, id = 12 },
    { name = "Pure", type = 4, id = 158 },
    { name = "Brushed", type = 4, id = 159 },
    { name = "Chrome", type = 5, id = 120 },
    { name = "Chameleon", type = 0, id = -1 }
}

local HeadlightColors = {
    "White", "Blue", "Electric Blue", "Mint Green", "Lime Green", 
    "Yellow", "Golden Shower", "Orange", "Red", "Pony Pink", 
    "Hot Pink", "Purple", "Blacklight"
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
    l = brMult > 1.0 and (l + (1.0 - l) * (brMult - 1.0)) or (l * brMult)
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

    if mat.name == "Chameleon" then
        local cIdx = FeatureMgr.GetFeatureListIndex(F.Chameleon)
        local cID = Chameleons[cIdx + 1].id
        SET_VEHICLE_COLOURS(handle, cID, cID)
        SET_VEHICLE_EXTRA_COLOURS(handle, pPearl, 0)
        CLEAR_VEHICLE_CUSTOM_PRIMARY_COLOUR(handle)
        CLEAR_VEHICLE_CUSTOM_SECONDARY_COLOUR(handle)
    else
        local pr_raw, pg_raw, pb_raw = FeatureMgr.GetFeatureColor(F.PrimaryColor)
        local pr, pg, fb = ProcessColorModifiers(pr_raw, pg_raw, pb_raw)
        
        local sr, sg, sb
        local nr, ng, nb
        local tr, tg, tb
        local xenonID

        if FeatureMgr.IsFeatureEnabled(F.SyncMode) then
            sr, sg, sb = pr, pg, fb
            nr, ng, nb = pr, pg, fb
            tr, tg, tb = pr, pg, fb
            xenonID = HueToHeadlight(RgbToHue(pr, pg, fb))
            
            FeatureMgr.SetFeatureColor(F.SecondaryColor, pr_raw, pg_raw, pb_raw, 255)
            FeatureMgr.SetFeatureColor(F.NeonColor, pr_raw, pg_raw, pb_raw, 255)
            FeatureMgr.SetFeatureColor(F.TyreSmokeColor, pr_raw, pg_raw, pb_raw, 255)
            FeatureMgr.SetFeatureListIndex(F.XenonColor, xenonID)
        else
            sr, sg, sb = ProcessColorModifiers(FeatureMgr.GetFeatureColor(F.SecondaryColor))
            nr, ng, nb = FeatureMgr.GetFeatureColor(F.NeonColor)
            tr, tg, tb = FeatureMgr.GetFeatureColor(F.TyreSmokeColor)
            xenonID = FeatureMgr.GetFeatureListIndex(F.XenonColor)
        end

        SET_VEHICLE_COLOURS(handle, mat.id, mat.id)
        SET_VEHICLE_MOD_COLOR_1(handle, mat.type, mat.id, pPearl)
        SET_VEHICLE_MOD_COLOR_2(handle, mat.type, mat.id)
        SET_VEHICLE_EXTRA_COLOURS(handle, pPearl, 0)
        SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(handle, pr, pg, fb)
        SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(handle, sr, sg, sb)

        for i = 0, 3 do _SET_VEHICLE_NEON_LIGHT_ENABLED(handle, i, true) end
        _SET_VEHICLE_NEON_LIGHTS_COLOUR(handle, nr, ng, nb)

        TOGGLE_VEHICLE_MOD(handle, 22, true)
        _SET_VEHICLE_XENON_LIGHTS_COLOR(handle, xenonID)

        TOGGLE_VEHICLE_MOD(handle, 20, true)
        SET_VEHICLE_TYRE_SMOKE_COLOR(handle, tr, tg, tb)
    end
    SET_VEHICLE_DIRT_LEVEL(handle, 0.0)
end

local function AutoCalculatePearl()
    if FeatureMgr.IsFeatureEnabled(F.LinkPearl) then
        local r, g, b = FeatureMgr.GetFeatureColor(F.PrimaryColor)
        local aggression = FeatureMgr.GetFeatureInt(F.PearlAggression)
        local hue = RgbToHue(r, g, b)
        local shift = (aggression / 100) * 160
        FeatureMgr.SetFeatureInt(F.PrimaryPearl, HueToPearl((hue + shift) % 360))
    end
    ApplyPaint()
end

local function RandomizeMixer()
    FeatureMgr.SetFeatureInt(F.Brightness, math.random(25, 100))
    FeatureMgr.SetFeatureInt(F.Saturation, math.random(25, 100))
    -- FeatureMgr.SetFeatureInt(F.HueShift, math.random(0, 360))
    -- local invFeat = FeatureMgr.GetFeature(F.InvertColors)
    -- if invFeat then invFeat:SetBoolValue(math.random(0, 1) == 1) end
    
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
    
    if FileMgr.DeleteFile then
        FileMgr.DeleteFile(presetPath .. name .. ".json")
    else
        FileMgr.WriteFileContent(presetPath .. name .. ".json", "")
    end
    
    GUI.AddToast("Deleted: " .. name, 3000)
    RefreshPresetList()
end

FeatureMgr.AddFeature(F.Material, "Base Material", eFeatureType.Combo, "Select surface texture.", ApplyPaint):SetList(materialNames)
FeatureMgr.AddFeature(F.Chameleon, "Chameleon Color", eFeatureType.Combo, "Select iridescent shader effects.", ApplyPaint):SetList(chameleonNames)
FeatureMgr.AddFeature(F.SyncMode, "Sync Mode", eFeatureType.Toggle, "Synchronizes everything to Primary.", ApplyPaint):SetBoolValue(false)
FeatureMgr.AddFeature(F.PrimaryColor, "Primary Color", eFeatureType.InputColor3, "Base RGB color.", AutoCalculatePearl):SetColor(255, 0, 0, 255)
FeatureMgr.AddFeature(F.SecondaryColor, "Secondary Color", eFeatureType.InputColor3, "Accent RGB color.", ApplyPaint):SetColor(255, 0, 0, 255)
FeatureMgr.AddFeature(F.NeonColor, "Neon Color", eFeatureType.InputColor3, "Underglow color.", ApplyPaint):SetColor(255, 0, 0, 255)
FeatureMgr.AddFeature(F.TyreSmokeColor, "Tyre Smoke Color", eFeatureType.InputColor3, "Tire smoke.", ApplyPaint):SetColor(255, 0, 0, 255)
FeatureMgr.AddFeature(F.XenonColor, "Headlight Color", eFeatureType.Combo, "Headlight color.", ApplyPaint):SetList(HeadlightColors)
FeatureMgr.AddFeature(F.LinkPearl, "Link Pearl Effect", eFeatureType.Toggle, "Auto-calculate Pearl ID."):SetBoolValue(true)
FeatureMgr.AddFeature(F.PearlAggression, "Pearl Intensity (%)", eFeatureType.SliderInt, "Color blending intensity.", AutoCalculatePearl):SetLimitValues(0, 100):SetIntValue(20)
FeatureMgr.AddFeature(F.PrimaryPearl, "Pearl ID", eFeatureType.SliderInt, "Manual Pearl ID.", ApplyPaint):SetLimitValues(0, 160)
FeatureMgr.AddFeature(F.Brightness, "Brightness (%)", eFeatureType.SliderInt, "Scale brightness.", ApplyPaint):SetLimitValues(0, 100):SetDefaultValue(100):SetIntValue(100)
FeatureMgr.AddFeature(F.Saturation, "Saturation (%)", eFeatureType.SliderInt, "Scale saturation.", ApplyPaint):SetLimitValues(0, 100):SetDefaultValue(100):SetIntValue(100)
FeatureMgr.AddFeature(F.HueShift, "Hue Shift (Deg)", eFeatureType.SliderInt, "Rotate colors.", ApplyPaint):SetLimitValues(0, 360)
FeatureMgr.AddFeature(F.InvertColors, "Invert Colors", eFeatureType.Toggle, "Negative effect.", ApplyPaint)
FeatureMgr.AddFeature(F.RandomMixer, "Randomize Mixer", eFeatureType.Button, "Randomize only the color modifiers.", RandomizeMixer)

FeatureMgr.AddFeature(F.RandomNormal, "Random Paint", eFeatureType.Button, "Generate random colors.", function()
    FeatureMgr.SetFeatureListIndex(F.Material, math.random(0, 3))
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
    FeatureMgr.SetFeatureListIndex(F.Material, 5)
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

    local isCham = (FeatureMgr.GetFeatureListIndex(F.Material) == 5)
    local isSync = FeatureMgr.IsFeatureEnabled(F.SyncMode)
    
    if ImGui.BeginTable("Table", 2, ImGuiTableFlags.SizingStretchSame) then
        ImGui.TableNextRow()
        ImGui.TableSetColumnIndex(0)
        
        if ClickGUI.BeginCustomChildWindow("Colors", -1) then
            FeatureMgr.GetFeature(F.Material):Render()
            if isCham then 
                FeatureMgr.GetFeature(F.Chameleon):Render() 
            else
                FeatureMgr.GetFeature(F.SyncMode):Render()
                FeatureMgr.GetFeature(F.PrimaryColor):Render()
                if not isSync then
                    FeatureMgr.GetFeature(F.SecondaryColor):Render()
                    FeatureMgr.GetFeature(F.NeonColor):Render()
                    FeatureMgr.GetFeature(F.XenonColor):Render()
                    FeatureMgr.GetFeature(F.TyreSmokeColor):Render()
                end
            end
            ClickGUI.EndCustomChildWindow()
        end

        if ClickGUI.BeginCustomChildWindow("Pearl", -1) then
          FeatureMgr.GetFeature(F.PearlAggression):Render()
          FeatureMgr.GetFeature(F.PrimaryPearl):Render()
          ImGui.Spacing()
          FeatureMgr.GetFeature(F.LinkPearl):Render()
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
            end
            ClickGUI.EndCustomChildWindow()
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

RefreshPresetList()

EventMgr.RegisterHandler(eLuaEvent.ON_UNLOAD, function()
    ClickGUI.RemoveTab(SCRIPT_NAME)
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
