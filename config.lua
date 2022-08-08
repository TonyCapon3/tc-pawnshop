Config = {}


Config.UseBlip = true  --if you want a pawnshop logo on the map
Config.BlipTitle = 'Larrys Pawnshop' --title that shows up on the map if using blip

Config.ProgBarSpeed = 10000 --time to sell items

Config.PedLocation = {
    ['x'] = 295.46,
	['y'] = -1006.13,                --self explanatory 
	['z'] = 28.38,
	['heading'] = 3.07
}



Config.TableLocation = {
	['x'] = 295.46,
	['y'] = -1005.0,                    --wherever if you change ped location change the table too
	['z'] = 28.33,
	['heading'] = 357.81
}

Config.Items = {
    ['markedbills'] = {       --this
        itemName = 'markedbills', --and this must be the same
        MinSellPrice = 70,
        MaxSellPrice = 90,
    },

    ['rolex'] = {
        itemName = 'rolex',
        MinSellPrice = 20,
        MaxSellPrice = 50,
    },

    ['diamond_ring'] = {
        itemName = 'diamond_ring',
        MinSellPrice = 60,
        MaxSellPrice = 80,
    },

    ['diamond'] = {
        itemName = 'diamond',
        MinSellPrice = 90,
        MaxSellPrice = 120,
    },

    ['goldchain'] = {
        itemName = 'goldchain',
        MinSellPrice = 30,
        MaxSellPrice = 40,
    },

    ['10kgoldchain'] = {
        itemName = '10kgoldchain',
        MinSellPrice = 80,
        MaxSellPrice = 110,
    },

    ['goldbar'] = {
        itemName = 'goldbar',
        MinSellPrice = 220,
        MaxSellPrice = 260,
    },

    ['iphone'] = {
        itemName = 'iphone',
        MinSellPrice = 20,
        MaxSellPrice = 50,
    },

    ['samsungphone'] = {
        itemName = 'samsungphone',
        MinSellPrice = 15,
        MaxSellPrice = 35,
    },

    ['laptop'] = {
        itemName = 'laptop',
        MinSellPrice = 50,
        MaxSellPrice = 85,
    },

    ['cryptostick'] = {
        itemName = 'cryptostick',
        MinSellPrice = 50,
        MaxSellPrice = 60,
    },

    ['moneybag'] = {
        itemName = 'moneybag',
        MinSellPrice = 1250,
        MaxSellPrice = 1700,
    }
}