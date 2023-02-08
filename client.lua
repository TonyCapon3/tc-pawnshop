local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    RequestModel(`u_m_y_proldriver_01`)
      while not HasModelLoaded(`u_m_y_proldriver_01`) do
      Wait(1)
    end
      tc = CreatePed(2, `u_m_y_proldriver_01`, Config.PedLocation['x'], Config.PedLocation['y'], Config.PedLocation['z'], Config.PedLocation['heading'], false, false) 
      SetPedFleeAttributes(tc, 0, 0)
      SetPedDiesWhenInjured(tc, false)
      TaskStartScenarioInPlace(tc, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(tc, true)
      SetBlockingOfNonTemporaryEvents(tc, true)
      SetEntityInvincible(tc, true)
      FreezeEntityPosition(tc, true)
end)
  

CreateThread(function()
    if Config.UseBlip then
        local pawnshop = AddBlipForCoord(vector3(Config.PedLocation['x'], Config.PedLocation['y'], Config.PedLocation['z']))
        SetBlipAsShortRange(pawnshop, true)
        SetBlipSprite(pawnshop, 605)
        SetBlipColour(pawnshop, 5)
        SetBlipScale(pawnshop, 0.7)
        SetBlipDisplay(pawnshop, 6)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(Config.BlipTitle)
        EndTextCommandSetBlipName(pawnshop)
    end
end)


local function shopMenu()
    local shop = {
        {
            header = '💰Pawnshop💰',
            isMenuHeader = true,
        },
        {
            header = 'Try To Sell Items',
            icon = 'fas fa-hand-holding',
            params = {
                event = 'tc-pawnshop-cl-sellItems'
            }
        },
        {
            header = 'Walk Away',
            icon = 'fas fa-xmark',

        }
    }
    exports['qb-menu']:openMenu(shop)
end



CreateThread(function()
    exports['qb-target']:AddTargetModel('u_m_y_proldriver_01', {
        options = {
            { 
                action = function()
			shopMenu()
		end,
                icon = "fas fa-circle-dollar-to-slot", 
                label = "What You Got For Me?",
            },
        },
        distance = 3.0 
    })
end)





RegisterNetEvent('tc-pawnshop-cl-sellItems', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('show_items', 'Checking If Items Have Value', Config.ProgBarSpeed, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@world_human_stand_impatient@male@no_sign@base',
        anim = 'base',
        flags = 16,
    }, {}, {}, function() 
        TriggerServerEvent('tc-pawnshop-sv-sellItems')
        ClearPedTasks(ped)
    end, function() 
        ClearPedTasks(ped)
    end)
end)

CreateThread(function()
	Citizen.Wait(1)
	local tablecoordsx = Config.TableLocation['x']
	local tablecoordsy = Config.TableLocation['y']
	local tablecoordsz = Config.TableLocation['z']
	local table = CreateObject(304964818, tablecoordsx, tablecoordsy, tablecoordsz, true, true, true)
	SetEntityHeading(table, Config.TableLocation['heading'])
	FreezeEntityPosition(table, true)
end)


