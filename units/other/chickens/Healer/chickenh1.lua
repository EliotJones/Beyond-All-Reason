local unitName = Spring.I18N('units.names.chickenh1')

return {
	chickenh1 = {
		acceleration = 0.0575,
		activatewhenbuilt = true,
		autoheal = 32,
		bmcode = 1,
		brakerate = 0.23,
		buildcostenergy = 600,
		buildcostmetal = 40,
		builddistance = 200,
		builder = 1,
		buildpic = "chickens/chickenh1.PNG",
		buildtime = 750,
		canassist = 0,
		canbuild = 1,
		canguard = 1,
		canmove = 1,
		canpatrol = 1,
		canrepair = 1,
		canstop = 1,
		category = "BOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CHICKEN EMPABLE",
		collide = 0,
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "10 14 22",
		collisionvolumetype = "box",
		defaultmissiontype = "Standby",
		description = Spring.I18N('units.descriptions.chickenh1'),
		energymake = 25,
		explodeas = "WEAVER_DEATH",
		floater = false,
		footprintx = 1,
		footprintz = 1,
		hidedamage = 1,
		kamikaze = true,
		kamikazedistance = 60,
		leavetracks = true,
		maneuverleashlength = 640,
		mass = 50,
		maxdamage = 225,
		maxslope = 18,
		maxvelocity = 2.6,
		maxwaterdepth = 5000,
		metalstorage = 1000,
		mobilestandorders = 1,
		movementclass = "BOT2",
		name = unitName,
		noautofire = 0,
		objectname = "Chickens/chicken_drone.s3o",
		reclaimspeed = 400,
		script = "Chickens/chickenh1.cob",
		seismicsignature = 1,
		selfdestructas = "WEAVER_DEATH",
		side = "THUNDERBIRDS",
		sightdistance = 256,
		smoothanim = true,
		standingmoveorder = 1,
		stealth = 1,
		steeringmode = "2",
		tedclass = "BOT",
		trackoffset = 1,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "ChickenTrack",
		trackwidth = 10,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 1840,
		unitname = "chickenh1",
		upright = false,
		waterline = 8,
		workertime = 200,
		customparams = {
			subfolder = "other/chickens",
      model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_s_normals.png",
			--treeshader = "no",
		},
		featuredefs = {
			dead = {},
			heap = {},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
			pieceexplosiongenerators = {
				[1] = "blood_spray",
				[2] = "blood_spray",
				[3] = "blood_spray",
			},
		},
	},
}
