-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- create tap counter
local tapCount = 0

-- set background image
-- local background = display.newImageRect("background.png", 360, 570)
local background = display.newImageRect("totoro_tree.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

-- display tap counter
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
-- tapText:setFillColor( 0, 0, 0 )
tapText:setFillColor(255, 255, 255)


-- set platform image
-- local platform = display.newImageRect("platform.png", 300, 50)
local platform = display.newImageRect("tree_branch_cropped.png", 300, 50)
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

-- set balloon image
-- local balloon = display.newImageRect("balloon.png", 112, 112)
local balloon = display.newImageRect("totoro_transparent.png", 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
-- balloon.alpha = 0.8
balloon.alpha = 1

-- load physics engine
local physics = require("physics")
physics.start()

-- add body to platform
physics.addBody(platform, "static")

-- add body to balloon
physics.addBody(balloon, "dynamic", {radius = 50, bounce = .3})

-- create pushBalloon function
local function pushBalloon()
      balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
      tapCount = tapCount + 1
      tapText.text = tapCount
end

-- add listener for tap event on balloon
balloon:addEventListener( "tap", pushBalloon )











