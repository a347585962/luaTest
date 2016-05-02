
require("config")
require("cocos.init")
require("framework.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    -- cc.Director:getInstance():setContentScaleFactor(640)
    --添加缓存精灵

	display.addSpriteFrames("image/player.plist","image/player.png")
    self:enterScene("MainScene")
end

return MyApp
