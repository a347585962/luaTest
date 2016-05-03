require("app.layer.BackGroundLayer")
require("app.objects.Player")

local GameScene = class("GameSecne", function ()
	return display.newPhysicsScene("GameSecne")
end)

function GameScene:ctor()
	-- 加载背景层
	self.backGroundLayer = BackGroundLayer.new()
		:addTo(self)

	--引入物理引擎
	self.worldGame = self:getPhysicsWorld()
	self.worldGame:setGravity(cc.p(0,-98.0))
	self.worldGame:setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)

	self.player = Player.new()
	self.player:setPosition(-20,display.height * 2/3)
	self:addChild(self.player)
	self:playerFlyToScene()

end

function GameScene:playerFlyToScene()
	-- body
	local function startDrop()
		-- body
		self.player:getPhysicsBody():setGravityEnable(true)
		self.player:drop()
		--开始游戏
	end

	local animation = display.getAnimationCache("flying")
	transition.playAnimationForever(self.player, animation)

	local action = transition.sequence({
		cc.MoveTo:create(4,cc.p(display.cx,display.height * 2/3)),
		cc.CallFunc:create(startDrop)

		})
	self.player:runAction(action)
end
function GameScene:onEnter()
	-- body
end

function GameScene:onExit()
	-- body
end

return GameScene