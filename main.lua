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

--The below main.lua file produces an app that allows cycling through the different fonts using up, down, or crank.

import "testfont"
import "CoreLibs/graphics"

local gfx = playdate.graphics

local default_font = playdate.graphics.getSystemFont()

testFont.current_font_number = 1

--unrelated table dumping function someone wrote
--function dump(o)
--   if type(o) == 'table' then
--	  local s = '{ '
--	  for k,v in pairs(o) do
--		 if type(k) ~= 'number' then k = '"'..k..'"' end
--		 s = s .. '['..k..'] = ' .. dump(v) .. ','
--	  end
--	  return s .. '} '
--   else
--	  return tostring(o)
--   end
--end


function playdate.upButtonDown()
	
	if testFont.current_font_number < #testFont.font_list then
		testFont.current_font_number += 1
	else
		testFont.current_font_number = 1
	end
	--print(testFont.font())
end

function playdate.downButtonDown()
	
	if testFont.current_font_number > 1 then
		testFont.current_font_number -= 1
	else
		testFont.current_font_number = #testFont.font_list
	end
	
end

function playdate.update()
	
	testFont.current_font_number += math.floor(playdate.getCrankChange())
	
	while testFont.current_font_number > #testFont.font_list do
		testFont.current_font_number -= #testFont.font_list
	end
	
	while testFont.current_font_number < 1 do
		testFont.current_font_number += #testFont.font_list
	end
	
	
	
	
	gfx.clear()
	gfx.setFont(testFont())
	test_message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	gfx.drawTextInRect(test_message, 10, 10, 390, 230)
	playdate.graphics.setColor(playdate.graphics.kColorWhite)
	gfx.fillRect(0,219, 400, 21)
	playdate.graphics.setColor(playdate.graphics.kColorBlack)
	gfx.drawLine(0, 219, 400, 219)
	default_font:drawText("Current: "..testFont.getName(), 0, 220)
	
end
	

