local soundsConfig = function (pMaterial)
	if string.find(pMaterial, "Snow") then
		return default.node_sound_snow_defaults()
	elseif string.find(pMaterial, "Grass") then
		return default.node_sound_leaves_defaults()
	else
		return default.node_sound_stone_defaults()
	end
end

local colours = {
		{"cblack", "Black"},
		{"ccyan", "Cyan"},
		{"cbrown", "Brown"},
		{"cdark_blue", "Dark Blue"},
		{"cdark_green", "Dark Green"},
		{"cdark_grey", "Dark Grey"},
		{"cdark_pink", "Dark Pink"},
		{"cgrass", "Grass"},
		{"cgreen", "Green"},
		{"cgrey", "Grey"},
    	{"clogo", "Logo"},
		{"corange", "Orange"},
		{"cpink", "Pink"},
		{"cpurple", "Purple"},
		{"cred", "Red"},
		{"csnow", "Snow"},
		{"cwhite", "White"},
		{"cyellow", "Yellow"}
}

for _, row in ipairs(colours) do

	local name = row[1]
	local description = row[2]

	minetest.register_node("colouredstonebricks:"..name, {
		description = description.." Stone Brick",
		tiles = {"colouredstonebricks_"..name..".png"},
		groups = {cracky=3},
    	sounds = soundsConfig(description),
	})

	minetest.register_craft({
		type = "shapeless",
		output = 'colouredstonebricks:'..name,
		recipe = {
			'dye:'..name, 'default:stonebrick',
		}
	})

    -- Support for stairsplus mod
	if minetest.get_modpath("moreblocks") then
	    stairsplus:register_all("colouredstonebricks", name, "colouredstonebricks:"..name, {
	    description = description.." Stone Brick",
		tiles = {"colouredstonebricks_"..name..".png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = soundsConfig(description),
	    sunlight_propagates = true,
	    })
	end
end

-- We don't have blue, violet or magenta coloured stone bricks (yet)
--minetest.register_alias("dye:dark_blue","dye:blue")
--minetest.register_alias("dye:dark_pink","dye:magenta")
--minetest.register_alias("dye:purple","dye:violet")
