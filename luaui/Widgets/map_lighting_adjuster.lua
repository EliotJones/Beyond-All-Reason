
local currentMapname = Game.mapName:lower()

local mapSunLighting = {
	['eye of horus v13'] = {
		groundDiffuseColor = { 0.7, 0.56, 0.54 },
		unitAmbientColor = {0.86, 0.7, 0.5},
		unitSpecularColor = {1.1, 0.88, 0.77},
		modelShadowDensity = 0.33,
	},
	['tabula-v4'] = {
		groundDiffuseColor = { 0.9, 0.51, 0.39 },
		unitAmbientColor = {0.68, 0.55, 0.55},
		unitDiffuseColor = {0.77, 0.55, 0.5},
		unitSpecularColor = {0.75, 0.6, 0.5},
		modelShadowDensity = 0.6,
		groundShadowDensity = 0.8,
	},
	['tumult'] = {
		groundDiffuseColor = { 0.77, 0.6, 0.44 },
	},
	['valles_marineris_v2'] = {
		groundAmbientColor = { 0.4, 0.55, 0.55 },
		groundDiffuseColor = { 0.92, 0.58, 0.45 },
		unitAmbientColor = {0.66, 0.5, 0.43},
		unitDiffuseColor = {1.1, 0.82, 0.7},
		modelShadowDensity = 0.9,
		groundShadowDensity = 0.9,
	},
	['titan v3.1'] = {
		groundAmbientColor = { 0.52, 0.48, 0.48 },
		groundDiffuseColor = { 0.65, 0.58, 0.55 },
		modelShadowDensity = 0.5,
		unitAmbientColor = {0.83, 0.73, 0.63},
	},
	['tempest'] = {
		groundDiffuseColor = { 0.32, 0.28, 0.34 },
		unitAmbientColor = {0.8, 0.77, 0.77},
		unitDiffuseColor = {0.66, 0.65, 0.63},
		unitSpecularColor = {0.5, 0.5, 0.5},
		modelShadowDensity = 0.65,
	},
	['tempest dry'] = {
		groundDiffuseColor = { 0.32, 0.28, 0.34 },
		unitAmbientColor = {0.8, 0.77, 0.77},
		unitDiffuseColor = {0.66, 0.65, 0.63},
		unitSpecularColor = {0.5, 0.5, 0.5},
		modelShadowDensity = 0.65,
	},
	['seths_ravine_v4'] = {
		unitAmbientColor = {0.36, 0.36, 0.36},
		unitDiffuseColor = {0.88, 0.78, 0.68},
		unitSpecularColor = {0.88, 0.78, 0.68},
		modelShadowDensity = 0.66,
	},
	['kolmogorov'] = {
		groundDiffuseColor = { 0.95, 0.75, 0.4 },
		unitAmbientColor = {0.6, 0.5, 0.45},
		unitDiffuseColor = {1.2, 0.75, 0.35},
		modelShadowDensity = 0.6,
	},
	['sapphireshores_v2.2'] = {
		unitAmbientColor = {0.5, 0.5, 0.6},
		unitDiffuseColor = {1, 1, 1.2},
		unitSpecularColor = {1, 1, 1.2},
		modelShadowDensity = 0.4,
		groundShadowDensity = 0.66,
	},
	['otago 1.4'] = {
		unitAmbientColor = {0.85, 0.6, 0.66},
		modelShadowDensity = 0.75,
		groundShadowDensity = 0.85,
	},
	['tropical-v2'] = {
		groundDiffuseColor = { 0.77, 0.5, 0.26 },
		unitDiffuseColor = {1, 0.8, 0.65},
		unitSpecularColor = {1, 0.77, 0.7},
		modelShadowDensity = 0.45,
		groundShadowDensity = 0.8,
	},
	['mescaline_v2'] = {
		modelShadowDensity = 0.88,
		groundShadowDensity = 0.88,
	},
}

local mapSun = {
	['eye of horus v13'] = {0.23, 0.62, 0.6},
	['tabula-v4'] = {0.45, 0.65, 0.25},
	['titan v3.1'] = { 0.6, 0.82, -0.33 },
	['tempest'] = { -0.35, 0.83, 0.47 },
	['tempest dry'] = { -0.35, 0.83, 0.47 },
	['seths_ravine_v4'] = { -0.6, 0.63, 0.43 },
	['kolmogorov'] = { 0.4, 0.75, -0.43},
	['otago 1.4'] = { -0.55, 0.5, 0.55},
	['tropical-v2'] = { 0.6, 0.33, 0.27},
}

if not mapSunLighting[currentMapname] and not mapSun[currentMapname] then return end

function widget:GetInfo()
	return {
		name      = "Map Lighting Adjuster",
		desc      = "Adjusts map lighting on various maps (pre game-start)",
		author    = "Floris",
		date      = "August 2021",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true
	}
end

function widget:Initialize()
	if Spring.GetGameFrame() == 0 then
		if mapSun[currentMapname] then
			Spring.SetSunDirection(mapSun[currentMapname][1], mapSun[currentMapname][2], mapSun[currentMapname][3])
			Spring.SetSunLighting({ groundShadowDensity = gl.GetSun("shadowDensity"), modelShadowDensity = gl.GetSun("shadowDensity") })
			--Spring.SendCommands("luarules updatesun")
		end
		if mapSunLighting[currentMapname] then
			Spring.SetSunLighting(mapSunLighting[currentMapname])
			Spring.SendCommands("luarules updatesun")
		end
	end
	widgetHandler:RemoveWidget()
end
