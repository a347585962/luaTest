BackGroundLayer = class("BackGroundLayer", function()
	-- body
	return display.newLayer()
end)

function BackGroundLayer:ctor()
	-- body
	self.distanceBg = {}

	self:createBg()

	
end

function BackGroundLayer:createBg()
	-- body
	local bg = display.newSprite("image/bj1.jpg")
		:pos(display.cx,display.cy)
		:addTo(self,-4)

	local bg1 = display.newSprite("image/b2.png")
		:align(display.BOTTOM_LEFT, display.left, display.bottom + 10)
		:addTo(self,-3)

	local bg2 = display.newSprite("image/b2.png")
		:align(display.BOTTOM_LEFT, display.left + bg1:getContentSize().width, display.bottom + 10)
		:addTo(self,-3)

	table.insert(self.distanceBg,bg1)
	table.insert(self.distanceBg,bg2)

	self.map = cc.TMXTiledMap:create("image/map.tmx")
		:align(display.BOTTOM_LEFT, display.left, display.bottom)
		:addTo(self,-1)
end

function BackGroundLayer:scrollBg(dt)
	if self.distanceBg[2]:getPositionX() <= 0 then
		--todo
		self.distanceBg[1]:setPositionX(0)
	end
	-- body
	local x1 = self.distanceBg[1]:getPositionX()-50*dt
	local x2 = x1 + self.distanceBg[1]:getContentSize().width

	self.distanceBg[1]:setPositionX(x1);
	self.distanceBg[2]:setPositionX(x2);

	if self.map:getPositionX() <= display.width-self.map:getContentSize().width then
		self:unscheduleUpdate()
		--todo
	end

	local x5 = self.map:getPositionX() - 130*dt
	self.map:setPositionX(x5)
end

function BackGroundLayer:startGame()
	-- body
	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, handler(self, self.scrollBg))
	self:scheduleUpdate();

end

return BackGroundLayer