-- WORLD EVENT ARRAY
    local WorldEventName = {}; local WorldEventDisplay = {}
    WorldEventName[0] = "BP_SkellyFort_RitualSkullCloud_C"; WorldEventDisplay[0] = "Fort of the Damned"
    WorldEventName[1] = "BP_LegendSkellyFort_SkullCloud_C"; WorldEventDisplay[1] = "Fort of Fortune"
    WorldEventName[2] = "BP_AshenLord_SkullCloud_C"; WorldEventDisplay[2] = "Ashen Winds"
    WorldEventName[3] = "BP_SkellyFort_SkullCloud_C"; WorldEventDisplay[3] = "Skeleton Fort"
    WorldEventName[4] = "BP_SkellyShip_ShipCloud_C"; WorldEventDisplay[4] = "Skeleton Fleet"
    WorldEventName[5] = "BP_GhostShip_TornadoCloud_C"; WorldEventDisplay[5] = "Ghost Fleet"

local AGameplayEventSignal = GetClass("Athena", "GameplayEventSignal")
local FVector2D = GetStruct("CoreUObject", "Vector2D")
local FColor = GetStruct("CoreUObject", "Color")

local function ParseName(name)
    local namelen = string.len(name)
    local index = 1
    local pindex = 1

    for e = 15, 1, -1 do
        if index == nil then
            local pminus = ((namelen - pindex) + 2) * -1
            local pname = name:sub(1, pminus)
            return pname
        else
            pindex = index
            index = string.find(name, "_", index + 1)
        end
    end
end

local function fHopperDisplay(Actor, Name)
    if Actor:IsA(AGameplayEventSignal) then
        if Name == WorldEventName[0] then
            DrawBoxedText("", FVector2D(30, 50), FColor(0, 0, 255, 255), 20.0, Align.LEFT, Font.BOLD, FVector2D(6, 4), 0.6, 4.0)
            DrawBoxedText("World Event: FotD", FVector2D(63, 50), FColor(255, 255, 255, 255), 20.0, Align.LEFT, Font.NORMAL, FVector2D(5, 3), 0.6, 4.0)
            return
        elseif Name == WorldEventName[1] then
            DrawBoxedText("", FVector2D(30, 50), FColor(0, 255, 0, 255), 20.0, Align.LEFT, Font.BOLD, FVector2D(6, 4), 0.6, 4.0)
            DrawBoxedText("World Event: FoF", FVector2D(63, 50), FColor(255, 255, 255, 255), 20.0, Align.LEFT, Font.NORMAL, FVector2D(5, 3), 0.6, 4.0)
            return
        elseif Name == WorldEventName[2] then
            DrawBoxedText("", FVector2D(30, 50), FColor(255, 0, 0, 255), 20.0, Align.LEFT, Font.BOLD, FVector2D(6, 4), 0.6, 4.0)
            DrawBoxedText("World Event: Ashen Winds", FVector2D(63, 50), FColor(255, 255, 255, 255), 20.0, Align.LEFT, Font.NORMAL, FVector2D(5, 3), 0.6, 4.0)
            return
        elseif Name == WorldEventName[3] then
            DrawBoxedText("", FVector2D(30, 50), FColor(0, 255, 255, 255), 20.0, Align.LEFT, Font.BOLD, FVector2D(6, 4), 0.6, 4.0)
            DrawBoxedText("World Event: Skelly Fort", FVector2D(63, 50), FColor(255, 255, 255, 255), 20.0, Align.LEFT, Font.NORMAL, FVector2D(5, 3), 0.6, 4.0)
            return
        elseif Name == WorldEventName[4] then
            DrawBoxedText("", FVector2D(30, 50), FColor(255, 0, 255, 255), 20.0, Align.LEFT, Font.BOLD, FVector2D(6, 4), 0.6, 4.0)
            DrawBoxedText("World Event: Skelly Fleet", FVector2D(63, 50), FColor(255, 255, 255, 255), 20.0, Align.LEFT, Font.NORMAL, FVector2D(5, 3), 0.6, 4.0)
            return
        elseif Name == WorldEventName[5] then
            DrawBoxedText("", FVector2D(30, 50), FColor(255, 255, 0, 255), 20.0, Align.LEFT, Font.BOLD, FVector2D(6, 4), 0.6, 4.0)
            DrawBoxedText("World Event: Ghost Fleet", FVector2D(63, 50), FColor(255, 255, 255, 255), 20.0, Align.LEFT, Font.NORMAL, FVector2D(5, 3), 0.6, 4.0)
            return
        end
    end
end

function onTickActor(actor)
    local Name = ParseName(actor:GetName())
    fHopperDisplay(actor, Name)
end

function onInitialize()
    SubscribeToTick(AGameplayEventSignal)
end