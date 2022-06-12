--> Script made by @SuperCoolNinja. (Thanks to Antasurris for helping me to find this prop.)



RegisterCommand('faggio', function(source, args, rawCommand)
    local player = PlayerPedId();
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(player, 0.0, 8.0, 0.5));
    local vehiclehash <const> = GetHashKey("faggio");
    local propHash <const> = "h4_prop_h4_box_delivery_01a";

    RequestModel(vehiclehash)
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 3000 then
                print("Vehicle not found")
                break
            end
        end

        local vehicule = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(player)+90, 1, 0)
        local prop = CreateObject(GetHashKey(propHash), x, y, z, true, true, true)

        SetVehicleNumberPlateText(vehicule, "XXXXX")
        SetPedIntoVehicle(player, vehicule, -1)
        AttachEntityToEntity(prop, vehicule,  21, 0.0, 0.4, -0.2, 0, 0, -89.9999924, false, false, false, false, 2, true)
    end)
end)
