This library is intended to allow quick swapping of fonts to see how they look within a program. It allows for a single line, "testFont()", to be used in place of a playdate.graphics.font object. 

Based on the value of testFont.current_font_number (valid for 1 - 54), testFont() returns a playdate.graphics.font object for one of the 54 fonts included in the PlaydateSDK's Resources directory.

Whenever testFont.getName() is used, the file path (within Playdate SDK/Resources/) is returned, AND importantly, the number (out of 54) and file path of the font are printed for easy copy-pasting.

To use this library, 
(1) copy the testfont.lua file, list_of_font.txt, and fonts/ folder into the build directory.
(2) Import testfont.lua anywhere (probably main.lua).
(3) put "testFont()" in place of the font you want to replace.
(4) give yourself a way to change testFont.current_font_number (1-54) at runtime.

The attached main.lua file produces an app that allows cycling through the different fonts using up, down, or crank.

Note: The fonts/ folder is just Resources/Fonts/ from the PlaydateSDK. Note the capitalization change! Sorry to not just use "/Fonts/", but most apps seem to use "/fonts/" for their local fonts folder.

