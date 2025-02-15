local unitName = Spring.I18N('units.names.corpun')

return {
	corpun = {
		acceleration = 0,
		activatewhenbuilt = false,
		brakerate = 0,
		buildangle = 8192,
		buildcostenergy = 13500,
		buildcostmetal = 1300,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 5.7,
		buildinggrounddecalsizey = 5.7,
		buildinggrounddecaltype = "decals/corpun_aoplane.dds",
		buildpic = "CORPUN.PNG",
		buildtime = 19268,
		canrepeat = false,
		category = "ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 -13 0",
		collisionvolumescales = "52 60 52",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = Spring.I18N('units.descriptions.corpun'),
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 2940,
		maxslope = 12,
		maxwaterdepth = 0,
		name = unitName,
		nochasecategory = "MOBILE",
		objectname = "Units/CORPUN.s3o",
		onoffable = true,
		script = "Units/armguard.cob",
		seismicsignature = 0,
		selfdestructas = "largeBuildingExplosionGenericSelfd",
		sightdistance = 455,
		usebuildinggrounddecal = true,
		yardmap = "oooooooooooooooo",
		customparams = {
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			onoffname = "trajectory",
			subfolder = "corbuildings/landdefenceoffence",
			techlevel = 1,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-0.184280395508 -6.88419337158 0.0344696044922",
				collisionvolumescales = "49.7204589844 16.4592132568 48.6775512695",
				collisionvolumetype = "Box",
				damage = 1764,
				description = Spring.I18N('units.dead', { name = unitName }),
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				height = 20,
				hitdensity = 100,
				metal = 936,
				object = "Units/corpun_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 882,
				description = Spring.I18N('units.heap', { name = unitName }),
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				height = 4,
				hitdensity = 100,
				metal = 373,
				object = "Units/cor4X4B.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-medium",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			cloak = "kloak2",
			uncloak = "kloak2un",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "twrturn3",
			},
			select = {
				[1] = "twrturn3",
			},
		},
		weapondefs = {
			plasma = {
				accuracy = 75,
				areaofeffect = 120,
				avoidfeature = false,
				cegtag = "arty-medium",
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.4,
				explosiongenerator = "custom:genericshellexplosion-medium-bomb",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.5,
				--model = "artshell-medium.s3o",
				name = "Long-range g2g plasma cannon",
				noselfdamage = true,
				range = 1245,
				reloadtime = 3.16667,
				soundhit = "xplomed2",
				soundhitwet = "splsmed",
				soundstart = "cannhvy5",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 450,
				damage = {
					bombers = 95,
					commanders = 350,
					default = 350,
					fighters = 95,
					hvyboats = 350,
					lboats = 350,
					subs = 90,
					vtol = 95,
				},
			},
			plasma_high = {
				accuracy = 75,
				areaofeffect = 208,
				avoidfeature = false,
				cegtag = "arty-medium",
				craterareaofeffect = 208,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.65,
				explosiongenerator = "custom:genericshellexplosion-large",
				gravityaffected = "true",
				hightrajectory = 1,
				impulseboost = 0.123,
				impulsefactor = 1.4,
				--model = "artshell-medium.s3o",
				name = "Long-range high-trajectory g2g AoE plasma cannon",
				noselfdamage = true,
				proximitypriority = -2,
				range = 1245,
				reloadtime = 7.5,
				soundhit = "xplomed2",
				soundhitwet = "splslrg",
				soundstart = "cannhvy5",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 440,
				damage = {
					bombers = 95,
					commanders = 650,
					default = 650,
					fighters = 95,
					hvyboats = 650,
					lboats = 650,
					subs = 95,
					vtol = 95,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "PLASMA",
				maindir = "0 1 0",
				maxangledif = 230,
				onlytargetcategory = "SURFACE",
			},
			[2] = {
				def = "PLASMA_HIGH",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
