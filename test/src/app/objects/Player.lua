
local Player = class("Player", function ()
	-- body
	print("----class()")
	return display.newSprite("#flying1.png")
end)

function Player:ctor()
	-- body
	
	local body = cc.PhysicsBody:createBox(self:getContentSize(),cc.PHYSICSBODY_MATERAL_DEFAULT,cc.p(0,0))
	self:setPhysicsBody(body)

	self:addAnimationCache()
end
--添加帧动画缓存
function Player:addAnimationCache()
	-- body
	local animations={"flying","drop","die"}
	local animationFreamNum={4,2,4}
	--循环
	for i=1,#animations do
		local freams = display.newFrames(animations[i] .. "%d.png",1,animationFreamNum[i])

		local animation = display.newAnimation(freams,0.3/4)

		display.setAnimationCache(animations[i],animation)
	end
end

function Player:fiying()
	-- body
	transition.stopTarget(self)
	transition.playAnimationForever(self,display.getAnimationCache("flying"))
end

function Player:drop()
	-- body
	transition.stopTarget(self)
	transition.playAnimationForever(self,display.getAnimationCache("drop"))
end

function Player:die()
	-- body
	transition.stopTarget(self)
	transition.playAnimationForever(self,display.getAnimationCache("die"))
end
return Player