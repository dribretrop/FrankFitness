-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.HiddenStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"
local storyboard = require "storyboard"


-- event listeners for tab buttons:
local function onFirstView( event )
	currentScene = storyboard.getCurrentSceneName()
	composer.gotoScene( "view1" )
end

local function onSecondView( event )
	currentScene = storyboard.getCurrentSceneName()
	composer.gotoScene( "view2" )
end

local function onThirdView( event )
	currentScene = storyboard.getCurrentSceneName()
	composer.gotoScene( "view3" )
end

--create rectagle 
	rect_upperBackground = display.newRect(0, 0, 320, 175)
	rect_upperBackground:setFillColor(49, 49, 49)
	rect_upperBackground:toBack()
	
	rect_middleBackground = display.newRect(0, 175, 320, 2)
	rect_middleBackground:setFillColor ( 0, 0, 0 )
	rect_middleBackground:toBack()
	
	rect_background = display.newRect(0, 0, 320, 480)
	rect_background:toBack()
	
-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
	{ label="About Us", defaultFile="about.png", overFile="about_down.png", width = 32, height = 32, onPress=onFirstView, selected=true },
	{ label="Your BMI", defaultFile="bmi.png", overFile="bmi_down.png", width = 32, height = 32, onPress=onSecondView },
	{ label="Contact Us", defaultFile="contact.png", overFile="contact_down.png", width = 32, height =32, onPress=onThirdView}
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight - 50,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}


	

onFirstView()	-- invoke first tab button's onPress event manually