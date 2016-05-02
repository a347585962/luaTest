require("app.scenes.GameScene")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, World", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self)
    display.newSprite("image/main.jpg")
    	:pos(display.cx, display.cy)
    	:addTo(self)

    local title = display.newSprite("image/title.png")
    	:pos(display.cx/2*3, display.cy)
    	:addTo(self)

    -- local move1 = cc.moveBy:create(0.5,0,10)
    -- local move3 = cc.moveBy
    -- local move4 = cc.moveBy(0.5, 0, -10)
    -- -- local move2 = cc.moveBy:create(0.5,cc.p(0,-10))
    -- local sequenceAction = cc.setSequences(move3,move4)
    -- transition.execute(title,cc.RepeatForever:create(sequenceAction));
	-- local move1 = cc.MoveBy:create(0.5, cc.p(0, 10))
	-- local move2 = cc.MoveBy:create(0.5, cc.p(0, -10))
	-- local SequenceAction = cc.Sequence:create( move1, move2 )
	-- transition.execute(title, cc.RepeatForever:create( SequenceAction ))
	local move1 = cc.MoveBy:create(0.5,cc.p(0,-10))
	local move2 = cc.MoveBy:create(0.5,cc.p(0,10))
	local se = cc.Sequence:create(move1,move2)
	transition.execute(title,cc.RepeatForever:create(se))

	cc.ui.UIPushButton.new({ normal = "image/start1.png", pressed = "image/start2.png" })
	:onButtonClicked(function ()
		printf("start")
        app:enterScene("GameScene", nil, "SLIDEINT", 1.0)
	end)
	:pos(display.cx/2,display.cy)
	:addTo(self)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
