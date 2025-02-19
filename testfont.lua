-- This library is intended to allow quick swapping of fonts to see how they look within a program. 
-- It allows for a single line, "testFont()", to be used in place of a playdate.graphics.font object. 
-- Based on the value of testFont.current_font_number (valid for 1 - 54), testFont() returns a 
-- playdate.graphics.font object for one of the 54 fonts included in the PlaydateSDK's Resources directory.

-- Whenever testFont.getName() is used, the file path (within Playdate SDK/Resources/) is returned, AND
-- importantly, the number (out of 54) and file path of the font are printed for easy copy-pasting.

-- To use this library, copy the testfont.lua file, list_of_font.txt, and fonts/ folder into the build directory.
-- Import testfont.lua anywhere.

-- The fonts/ folder is just Resources/Fonts/ from the PlaydateSDK. Note the capitalization change!
-- Sorry to not just use "/Fonts/", but most apps seem to use "/fonts/" for their local fonts folder

--The attached main.lua file produces an app that allows cycling through the different fonts using up, down, or crank.



local gfx = playdate.graphics
local font_filename_list_text = playdate.file.open("list_of_fonts.txt", playdate.file.kFileRead)

local current_line = font_filename_list_text:readline()

local font_filename_list = {}

while not(current_line == nil) do
	--print(current_line)
	--print(current_line == nil)
	table.insert(font_filename_list, current_line)
	current_line = font_filename_list_text:readline()
end

local font_list = {}

for a, font_filename in ipairs(font_filename_list) do
	print(font_filename)
	print(gfx.font.new(font_filename))
	local current_font = gfx.font.new(font_filename)
	table.insert(font_list, current_font)
end

testFont = {}
testFont.font_list = font_list
testFont.font_filename_list = font_filename_list
local mt = {}

function testFont.getName()
	
	print("Current testFont is number "..testFont.current_font_number)
	print("Current font is "..testFont.font_filename_list[testFont.current_font_number])
	return testFont.font_filename_list[testFont.current_font_number]
	
	
end

function mt.__call(...)
	
	local font = testFont.font_list[testFont.current_font_number]
	
	return font
end

setmetatable(testFont, mt)
