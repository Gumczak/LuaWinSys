CONTENT = "wfiles" --Resource name with files

EventList = {
	"onClientGUIClick",
	"onClientGUIMouseUp",
	"onClientGUIMouseDown",
	"onClientMouseEnter",
	"onClientMouseLeave",
	"onClientMouseWheel"
}

function fromHEXToRGB(color)
	--this function replace color from HEX, and return R, G and B parameters (from 0 to 255)
	--Example: fromHEXToRGB("6600FF"); returns 102, 0, 255
    if tostring(color):len() == 8 then return tonumber(color:sub(3, 4), 16), tonumber(color:sub(5, 6), 16), tonumber(color:sub(7, 8), 16), tonumber(color:sub(1, 2), 16)
    elseif tostring(color):len() == 6 then return tonumber(color:sub(1, 2), 16), tonumber(color:sub(3, 4), 16), tonumber(color:sub(5, 6), 16)
    end
end

local function proceedColor(main, red, green, dark)

	if not dark then dark = false end

	local MainColor = main --"5278e2"--"AA3C39"
	local RedColor = red --"4667d0" --"B13232"
	local GreenColor = green --"46c169" --"2D8633"

	local r, g, b = fromHEXToRGB(MainColor)
	r = r-16
	g = g-16
	b = b-16

	ar = r-64
	ag = g-64
	ab = b-64

	lr = r+64
	lg = g+64
	lb = b+64

	fr = lr+16
	fg = lg+16
	fb = lb+16

	if r < 0 then r = 0 end
	if g < 0 then g = 0 end
	if b < 0 then b = 0 end

	if r > 255 then r = 255 end
	if g > 255 then g = 255 end
	if b > 255 then b = 255 end

	if ar < 0 then ar = 0 end
	if ag < 0 then ag = 0 end
	if ab < 0 then ab = 0 end

	if ar > 255 then ar = 255 end
	if ag > 255 then ag = 255 end
	if ab > 255 then ab = 255 end

	if lb < 0 then lb = 0 end
	if lg < 0 then lg = 0 end
	if lb < 0 then lb = 0 end

	if lr > 255 then lr = 255 end
	if lg > 255 then lg = 255 end
	if lb > 255 then lb = 255 end

	if fb < 0 then fb = 0 end
	if fg < 0 then fg = 0 end
	if fb < 0 then fb = 0 end

	if fb > 255 then fb = 255 end
	if fg > 255 then fg = 255 end
	if fb > 255 then fb = 255 end

	--print(r, g, b, ar, ag, ab, lr, lg, lb, fr, fg, fb)

	local SubMainColor = string.format("%.2x%.2x%.2x", r, g, b)
	local DarkMainColor = string.format("%.2x%.2x%.2x", ar, ag, ab)
	local LightMainColor = string.format("%.2x%.2x%.2x", lr, lg, lb)
	local SuperLightMainColor = string.format("%.2x%.2x%.2x", fr, fg, fb)

	r, g, b = fromHEXToRGB(RedColor)
	r = r+32
	g = g+32
	b = b+32

	if r > 255 then r = 255 end
	if g > 255 then g = 255 end
	if b > 255 then b = 255 end

	local RedLightColor = string.format("%.2x%.2x%.2x", r, g, b)

	r, g, b = fromHEXToRGB(GreenColor)
	r = r+32
	g = g+32
	b = b+32

	if r > 255 then r = 255 end
	if g > 255 then g = 255 end
	if b > 255 then b = 255 end

	local GreenLightColor = string.format("%.2x%.2x%.2x", r, g, b)

	return {
		Main = MainColor,
		Red = RedColor,
		Green = GreenColor,
		SubMain = SubMainColor,
		DarkMain = DarkMainColor,
		LightMain = LightMainColor,
		SuperLightMain = SuperLightMainColor,
		RedLight = RedLightColor,
		GreenLight = GreenLightColor,
		DarkTheme = dark
	}
end

RedColorsDark = proceedColor("f94f4f", "ef2d2d", "46c169", true) --Red Theme
BlueColorsDark = proceedColor("5278e2", "4667d0", "46c169", true) --Blue Theme

RedColors = proceedColor("f94f4f", "ef2d2d", "46c169", false) --Red Theme
BlueColors = proceedColor("5278e2", "4667d0", "46c169", false) --Blue Theme

DefaultColors = BlueColors


--------------------------

pane = ":"..CONTENT.."/images/pane.png"
Width, Height = guiGetScreenSize() 

Images = {
	Cross = ":"..CONTENT.."/images/cross.png",
	Point = ":"..CONTENT.."/images/point.png",
	Check = ":"..CONTENT.."/images/check.png",
	Down = ":"..CONTENT.."/images/down.png",
	Next = ":"..CONTENT.."/images/next.png",
	Prev = ":"..CONTENT.."/images/prev.png",
	Round = ":"..CONTENT.."/images/round.png",
}

addEventHandler("onClientResourceStart", root, function()
	guiSetInputMode("no_binds_when_editing")
end)

--Fonts
Fonts = {

	OpenSansBold = ":"..CONTENT.."/fonts/OSB.ttf",
	OpenSansBoldItalic = ":"..CONTENT.."/fonts/OSBI.ttf",

	OpenSansSemiBold = ":"..CONTENT.."/fonts/OSSB.ttf",
	OpenSansSemiBoldItalic = ":"..CONTENT.."/fonts/OSSBI.ttf",

	OpenSansExtraBold = ":"..CONTENT.."/fonts/OSEB.ttf",
	OpenSansExtraBoldItalic = ":"..CONTENT.."/fonts/OSEBI.ttf",

	OpenSansItalic = ":"..CONTENT.."/fonts/OSI.ttf",

	OpenSansLight = ":"..CONTENT.."/fonts/OSL.ttf",
	OpenSansLightItalic = ":"..CONTENT.."/fonts/OSLI.ttf",
	OpenSansRegular = ":"..CONTENT.."/fonts/OSR.ttf",

	SeguiReg = ":"..CONTENT.."/fonts/SUIR.ttf",
	SeguiLig = ":"..CONTENT.."/fonts/SUIL.ttf",

	HelvetRegular = ":"..CONTENT.."/fonts/HR.ttf",
	HelvetThin = ":"..CONTENT.."/fonts/HT.ttf",

	RobotoThin = ":"..CONTENT.."/fonts/thin.ttf"
}


addEvent("onClientChangeStandartColor", true)

function guiGetOnScreenPosition(element)
	local x, y = guiGetPosition(element, false)
	local child = element
	for i = 0, 100 do
		if getElementParent(child).type ~= "guiroot" then
			local x1, y1 = guiGetPosition(getElementParent(child), false)
			--outputDebugString(tostring(x1).." "..tostring(x))
			x, y = x+x1, y+y1 
			child = getElementParent(child)
		else break end
	end
	return x, y
end

function fromPropertyToHEX(element)
    if getElementType(element) ~= "gui-staticimage" then return false end
    local str = guiGetProperty(element, "ImageColours"):sub(4, 11)
    local str2 = str:sub(3, 8)
    return str, str2
end

function fromRGBToHEX(r, g, b, a)
	if a then
		return string.format("%.2x%.2x%.2x%.2x", r, g, b, a)
	else
		return string.format("%.2x%.2x%.2x", r, g, b)
	end
end

local ScrollPaneSettings = {}
local ScrollPaneNumber = 0

--Element for onClientGUIMouseUp
local BackForMouse = GuiStaticImage.create(0, 0, 1, 1, pane, true)
BackForMouse:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
BackForMouse:setVisible(false)

local function createCustomScrollPane(xz, yz, wz, hz, rel, par)

	ScrollPaneNumber = ScrollPaneNumber+1 --Count of scroll panes
	local id = ScrollPaneNumber

	ScrollPaneSettings[id] = {} --Make a table of elements and parameters

	ScrollPaneSettings[id]["Back"] = GuiStaticImage.create( --Back of scroll pane, this item not changing :D
		xz, yz, wz, hz, pane, rel, par
	)
	ScrollPaneSettings[id]["Back"]:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0") 

	ScrollPaneSettings[id]["Scroll"] = GuiStaticImage.create( --Its scroll pane - here put elements, 
		0, 0, wz, hz, pane, rel, 
		ScrollPaneSettings[id]["Back"]
	)

	ScrollPaneSettings[id]["Scroll"]:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	ScrollPaneSettings[id]["Scroll"]:setProperty("AbsoluteMaxSize", "w:10000000 h:10000000")

	--Parameters - speed of scrolling, enabling cursor scrolling and positions for cursor scrolling
	ScrollPaneSettings[id].Speed = 12
	ScrollPaneSettings[id].SetScrollEnabled = false
	ScrollPaneSettings[id].ScrollPositions = {x=0, y=0}
	ScrollPaneSettings[id].ActialSize = {w=wz, h=hz}
	--print(id, ScrollPaneSettings[id].ActialSize.w, ScrollPaneSettings[id].ActialSize.h)

	--Wheel scrolling
	addEventHandler("onClientMouseWheel", root, function(up)
		
		if source == ScrollPaneSettings[id]["Scroll"] then

			local _, h1 = ScrollPaneSettings[id]["Back"]:getSize(false)
			local _, h2 = ScrollPaneSettings[id]["Scroll"]:getSize(false)

			if h1 >= h2 then return false end --If back size more than scroll size, stop scrolling

			local minpos = h1 - h2 --If previous condition not true, size of scroll more than back, and minpos is negative 
			--get position
			local x, y = ScrollPaneSettings[id]["Scroll"]:getPosition(false)

			if up == -1 then

				--Scrolling
				y = y - ScrollPaneSettings[id].Speed
				--If minpos more than y, y now is minpos (frames of scrolling)
				if y <= minpos then y = minpos end

				--Set positions
				ScrollPaneSettings[id]["Scroll"]:setPosition(x, y, false)

			else
				--Same
				y = y + ScrollPaneSettings[id].Speed
				if y >= 0 then y = 0 end

				ScrollPaneSettings[id]["Scroll"]:setPosition(x, y, false)

			end
		end
	end)

	--Cursor scrolling
	addEventHandler("onClientGUIMouseDown", root, function(_, CurX, CurY)
		if source ~= ScrollPaneSettings[id]["Scroll"] then return false end
		--Enabling scrolling and show back for stop mouse
		ScrollPaneSettings[id].SetScrollEnabled = true
		BackForMouse:setVisible(true)

		--Get positions of scroll
		local x, y = ScrollPaneSettings[id]["Scroll"]:getPosition(false)
		--and enter it in scroll positions (like CurAxis here minus CurAxis in moving)
		ScrollPaneSettings[id].ScrollPositions = {x=CurX-x, y=CurY-y}
	end)
	addEventHandler("onClientGUIMouseUp", root, function()
		--Stop scrolling
		ScrollPaneSettings[id].SetScrollEnabled = false
		BackForMouse:setVisible(false)
	end)

	addEventHandler("onClientCursorMove", root, function(_, _, CurX, CurY)
		if not ScrollPaneSettings[id].SetScrollEnabled then return false end

		--Update position to like a CurAxis-CurAxis
		local x, y = CurX-ScrollPaneSettings[id].ScrollPositions.x, CurY-ScrollPaneSettings[id].ScrollPositions.y

		
		local w1, h1 = ScrollPaneSettings[id]["Back"]:getSize(false)
		local w2, h2 = ScrollPaneSettings[id]["Scroll"]:getSize(false)

		--Check sizes
		if w1>=w2 then x = 0 end
		if h1>=h2 then y = 0 end

		--Check axis
		if x <= w1-w2 then x = w1-w2 end
		if x >= 0 then x = 0 end
		if y <= h1-h2 then y = h1-h2 end
		if y >= 0 then y = 0 end

		ScrollPaneSettings[id]["Scroll"]:setPosition(x, y, false)
	end)

	addEventHandler("onClientRender", root, function()
		if not isElement(ScrollPaneSettings[id]["Scroll"]) then 
			cancelEvent() 
			return false 
		end
		if not ScrollPaneSettings[id]["Scroll"]:getVisible() then return false end
		if ScrollPaneSettings[id]["Scroll"]:getVisible() then

			--If scroll out of back, to check this, we load coordinates
			local w1, h1 = ScrollPaneSettings[id]["Back"]:getSize(false)
			local w2, h2 = ScrollPaneSettings[id]["Scroll"]:getSize(false)
			local x, y = ScrollPaneSettings[id]["Scroll"]:getPosition(false)

			--Check axis
			if x < w1-w2 then 

				x = w1-w2 
				if x > 0 then x = 0 end

				ScrollPaneSettings[id]["Scroll"]:setPosition(x, y, false)
			end
			if y < h1-h2 then 

				y = h1-h2
				if y > 0 then y = 0 end

				ScrollPaneSettings[id]["Scroll"]:setPosition(x, y, false)
			end
		end
	end)

	return ScrollPaneSettings[id]["Scroll"], ScrollPaneSettings[id]["Back"] 
end

local function getScrollPaneID(element)
	local id = false
	for i in pairs(ScrollPaneSettings) do
		if element == ScrollPaneSettings[i]["Scroll"] then id = i end
	end
	return id
end

local function scrollPaneMenuSetSize(panez, w, h)
	local panes = getScrollPaneID(panez)

	--print(panes)
	local xw, xh = ScrollPaneSettings[panes].ActialSize.w, ScrollPaneSettings[panes].ActialSize.h

	if xw > w then w = xw end
	if xh > h then h = xh end
	panez:setSize(w, h, false)
end

local function addElementToScrollPane(panez, element)
	local panes = getScrollPaneID(panez)
	if panes == false then return false end

	local wd, hd = panez:getSize(false)
	local x, y = element:getPosition(false)
	local wn, hn = element:getSize(false)

	if x+wn > wd then wd = x+wn end
	if y+hn > hd then hd = y+hn end

	ScrollPaneSettings[panes].ActialSize = {w=wd, h=hd}
	panez:setSize(wd, hd, false)
end

local function scrollPaneSetScrollSpeed(panez, speed)
	local panes = getScrollPaneID(panez)
	if panes == false then return false end

	ScrollPaneSettings[panes].Speed = tonumber(speed) or 12
end

local function addScrollElement(panez, element, axises)
	local panes = getScrollPaneID(panez)
	if panes == false then return false end
	
	--check last argument
	if axises == "x" or axises == 1 then axises = 1
	elseif axises == "y" or axises == 2 then axises = 2
	else axises = 3 end

	--Wheel scrolling
	if axises == 2 or axises == 3 then
		addEventHandler("onClientMouseWheel", root, function(up)
			if source == element then
	
				local _, h1 = ScrollPaneSettings[panes]["Back"]:getSize(false)
				local _, h2 = ScrollPaneSettings[panes]["Scroll"]:getSize(false)
	
				if h1 >= h2 then return false end --If back size more than scroll size, stop scrolling
	
				local minpos = h1 - h2 --If previous condition not true, size of scroll more than back, and minpos is negative 
				--get position
				local x, y = ScrollPaneSettings[panes]["Scroll"]:getPosition(false)
	
				if up == -1 then
	
					--Scrolling
					y = y - ScrollPaneSettings[panes].Speed
					--If minpos more than y, y now is minpos (frames of scrolling)
					if y <= minpos then y = minpos end
	
					--Set positions
					ScrollPaneSettings[panes]["Scroll"]:setPosition(x, y, false)
	
				else
					--Same
					y = y + ScrollPaneSettings[panes].Speed
					if y >= 0 then y = 0 end
	
					ScrollPaneSettings[panes]["Scroll"]:setPosition(x, y, false)
	
				end
			end
		end)
	end

	if axises == 1 then
		addEventHandler("onClientMouseWheel", root, function(up)
			if source == element then
	
				local w1 = ScrollPaneSettings[panes]["Back"]:getSize(false)
				local w2 = ScrollPaneSettings[panes]["Scroll"]:getSize(false)
	
				if w1 >= w2 then return false end --If back size more than scroll size, stop scrolling
	
				local minpos = w1 - w2 --If previous condition not true, size of scroll more than back, and minpos is negative 
				--get position
				local x, y = ScrollPaneSettings[panes]["Scroll"]:getPosition(false)
	
				if up == -1 then
	
					--Scrolling
					x = x - ScrollPaneSettings[panes].Speed
					--If minpos more than x, x now is minpos (frames of scrolling)
					if x <= minpos then x = minpos end
	
					--Set positions
					ScrollPaneSettings[panes]["Scroll"]:setPosition(x, y, false)
	
				else
					--Same
					x = x + ScrollPaneSettings[panes].Speed
					if x >= 0 then x = 0 end
	
					ScrollPaneSettings[panes]["Scroll"]:setPosition(x, y, false)
	
				end
			end
		end)
	end

	--Cursor scrolling
	addEventHandler("onClientGUIMouseDown", root, function(_, CurX, CurY)
		if source ~= element then return false end
		--Enabling scrolling and show back for stop mouse
		ScrollPaneSettings[panes].SetScrollEnabled = true
		BackForMouse:setVisible(true)

		--Get positions of scroll
		local x, y = ScrollPaneSettings[panes]["Scroll"]:getPosition(false)

		--Check for axises
		local x1, y1 = CurX-x, CurY-y
		if axises == 1 then y1 = y 
		elseif axises == 2 then x1 = x end

		--and enter it in scroll positions (like CurAxis here minus CurAxis in moving)
		ScrollPaneSettings[panes].ScrollPositions = {x=x1, y=y1}
	end)

end
--[[
local scrol = createCustomScrollPane(0, 0, 100, 100, false)
local img = GuiStaticImage.create(50, 50, 90, 90, pane, false, scrol)
addElementToScrollPane(scrol, img)
local ig = GuiStaticImage.create(0, 0, 1, 1, pane, false, scrol)
addElementToScrollPane(scrol, ig)]]


ScrollMenu = {}
ScrollMenu.__index = ScrollMenu

function ScrollMenu.create(...)
	local self = setmetatable({}, ScrollMenu)
	self.Menu, self.Back = createCustomScrollPane(...)
	return self
end
function ScrollMenu.addElement(self, element) addElementToScrollPane(self.Menu, element) end

function ScrollMenu.setSize(self, w, h) 
	return self.Back:setSize(w, h, false), scrollPaneMenuSetSize(self.Menu, w, h) 
end
function ScrollMenu.getSize(self, rel) return self.Back:getSize(rel) end

function ScrollMenu.setPosition(self, x, y, rel) return self.Back:setPosition(x, y, rel) end
function ScrollMenu.getPosition(self, rel) return self.Back:getPosition(rel) end

function ScrollMenu.setSpeed(self, speed) return scrollPaneSetScrollSpeed(self.Menu, speed) end
function ScrollMenu.addScrollElement(self, element, axis) return addScrollElement(self.Menu, element, axis) end


--[[local menu = ScrollMenu.create(0, 0, 100, 100, false)
local img = GuiStaticImage.create(50, 50, 90, 90, pane, false, menu.Menu)
menu:addElement(img)]]

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------Windows----------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Windows = {}
local function guiCreateCustomWindow(x, y, w, h, title, relative)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Counting IDs and coordinates
	local id = #Windows+1

	if relative then

		x = math.floor(x*Width)
		y = math.floor(y*Height)
		w = math.floor(w*Width)
		h = math.floor(h*Height)

	else

		x = math.floor(x)
		y = math.floor(y)
		w = math.floor(w)
		h = math.floor(h)

	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Main part of window
	Windows[id] = {}
	Windows[id].SchemeElements = {}
	Windows[id].Canvas = GuiStaticImage.create(x-2, y-2, w+4, h+4, pane, false)
	Windows[id].ColorScheme = DefaultColors

	--Shadows
	Windows[id].Shadows = {}
	Windows[id].Shadows.Central = GuiStaticImage.create(1, 1, w+2, h+2, pane, false, Windows[id].Canvas)
	Windows[id].Shadows.Vertical = GuiStaticImage.create(2, 0, w, h+4, pane, false, Windows[id].Canvas)
	Windows[id].Shadows.Horizontal = GuiStaticImage.create(0, 2, w+4, h, pane, false, Windows[id].Canvas)

	--Frame
	Windows[id].Frame = GuiStaticImage.create(2, 2, w, h, pane, false, Windows[id].Canvas)
	
	--Title
	Windows[id].Top = GuiStaticImage.create(0, 0, w, 22, pane, false, Windows[id].Frame)
	--Windows[id].Divider = GuiStaticImage.create(0, 21, w, 1, pane, false, Windows[id].Top)
	Windows[id].Close = GuiStaticImage.create(0, 0, 21, 21, Images.Cross, false, Windows[id].Top)
	Windows[id].Cross = GuiStaticImage.create(0, 0, 21, 21, Images.Point, false, Windows[id].Close)
	Windows[id].Title = GuiLabel.create(0, 0, w, 19, title or "Window", false, Windows[id].Top)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Properties
	Windows[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	
	for _, Shadow in pairs(Windows[id].Shadows) do
		Shadow:setProperty("ImageColours", "tl:22000000 tr:22000000 bl:22000000 br:22000000")
		Shadow:setEnabled(false)
	end

	FrameColor = "EEEEEE"
	if Windows[id].ColorScheme.DarkTheme then FrameColor = "444444" end

	TextColor = "444444"
	if Windows[id].ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

	frmcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", FrameColor, FrameColor, FrameColor, FrameColor)
	frlcol = string.format("tl:AA%s tr:AA%s bl:AA%s br:AA%s", FrameColor, FrameColor, FrameColor, FrameColor)
	txtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TextColor, TextColor, TextColor, TextColor)

	Windows[id].Frame:setProperty("ImageColours", frmcol)
	--Windows[id].Divider:setProperty("ImageColours", "tl:FFAAAAAA tr:FFAAAAAA bl:FFAAAAAA br:FFAAAAAA")
	Windows[id].Top:setProperty("ImageColours", frlcol)
	Windows[id].Top:setProperty("AlwaysOnTop", "True")
	--Windows[id].Close:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", Windows[id].ColorScheme.Red, Windows[id].ColorScheme.Red, Windows[id].ColorScheme.Red, Windows[id].ColorScheme.Red))
	Windows[id].Close:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	Windows[id].Cross:setProperty("ImageColours", txtcol)
	Windows[id].Title:setEnabled(false)

	Windows[id].Title:setFont(GuiFont.create(Fonts.OpenSansRegular, 9))
	Windows[id].Title:setColor(fromHEXToRGB(TextColor))
	Windows[id].Title:setHorizontalAlign("center")
	Windows[id].Title:setVerticalAlign("center")

	Windows[id].Close:setVisible(false)
	Windows[id].Cross:setEnabled(false)

	Windows[id].Frame:bringToFront()
	Windows[id].Enabled = true

	------------------------------------------------------------------------------------------------------------------------------------------
	--Params
	Windows[id].Movable = true
	Windows[id].MoveCursorPositions = {X = 0, Y = 0}
	Windows[id].Animation = "none" --"open", "close", "move"

	Windows[id].Positions = {X = x, Y = y}

	------------------------------------------------------------------------------------------------------------------------------------------
	--Events

	--Animation Rendering
	addEventHandler("onClientRender", root, function()
		if Windows[id].Animation == "open" then
			
			Windows[id].Canvas:setEnabled(false)

			local _, y = Windows[id].Canvas:getPosition(false)
			local self_y = Windows[id].Positions.Y

			if y >= self_y+140 then y = y-35
			elseif y >= self_y+80 then y = y-20
			elseif y >= self_y+50 then y = y-12
			elseif y >= self_y+20 then y = y-8
			elseif y >= self_y+8 then y = y-4
			elseif y >= self_y+2 then y= y-2
			elseif y >= self_y-2 then y= y-1
			end

			if y <= self_y-2 then y = self_y-2 end

			Windows[id].Canvas:setPosition(Windows[id].Positions.X-2, y, false)
			if y == self_y-2 then			
				Windows[id].Animation = "none"
				Windows[id].Canvas:setEnabled(Windows[id].Enabled)
			end

		elseif Windows[id].Animation == "close" then
			
			Windows[id].Canvas:setEnabled(false)

			local _, y = Windows[id].Canvas:getPosition(false)
			local self_y = Windows[id].Positions.Y

			if y >= self_y+150 then y = y+35
			elseif y >= self_y+80 then y = y+20
			elseif y >= self_y+50 then y = y+12
			elseif y >= self_y+20 then y = y+8
			elseif y >= self_y+8 then y = y+4
			elseif y >= self_y+2 then y= y+2
			elseif y >= self_y-2 then y= y+1
			end

			if y >= Height then y = Height end

			Windows[id].Canvas:setPosition(Windows[id].Positions.X-2, y, false)
			if y == Height then
				Windows[id].Canvas:setVisible(false)
				Windows[id].Canvas:setEnabled(Windows[id].Enabled)
				Windows[id].Animation = "none"
			end

		end
	end)

	--Close button click
	addEventHandler("onClientGUIClick", root, function()
		if source == Windows[id].Close then
			Windows[id].Animation = "close"
		end
	end)

	--Close button hover
	addEventHandler("onClientMouseEnter", root, function()
		if source == Windows[id].Close then
			Windows[id].Close:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", Windows[id].ColorScheme.Red, Windows[id].ColorScheme.Red, Windows[id].ColorScheme.Red, Windows[id].ColorScheme.Red))
			--Windows[id].Cross:loadImage(Images.Cross)
		end
	end)

	--Close button leave
	addEventHandler("onClientMouseLeave", root, function()
		
		Windows[id].Close:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
		
		--[[if source == Windows[id].Close then
			Windows[id].Cross:loadImage(Images.Point)
		end]]
	end)

	--Window move - hold
	addEventHandler("onClientGUIMouseDown", root, function(button, x, y)
		if Windows[id].Movable and button == "left" and source == Windows[id].Top then
			
			Windows[id].Animation = "move"
			
			local ax, ay = Windows[id].Canvas:getPosition(false)
			Windows[id].MoveCursorPositions = {X = x-ax, Y = y-ay}
		end
	end)
	
	--Windows move - relax
	addEventHandler("onClientGUIMouseUp", root, function()
		if source == Windows[id].Top then
			Windows[id].Animation = "none"
			Windows[id].MoveCursorPositions = {X = 0, Y = 0}

			local x, y = Windows[id].Canvas:getPosition(false)
			Windows[id].Positions = {X = x+2, Y = y+2}
		end
	end)

	--Window move - moving
	addEventHandler("onClientCursorMove", root, function(_, _, x, y)
		if Windows[id].Animation == "move" then
			local ax, ay = Windows[id].MoveCursorPositions.X, Windows[id].MoveCursorPositions.Y
			Windows[id].Canvas:setPosition(x-ax, y-ay, false)
		end
	end)

	addEventHandler("onClientResourceStop", root, function(res)
		if res == getThisResource() then

			for i in pairs(Windows[id]) do
				if isElement(Windows[id][i]) then
					destroyElement(Windows[id][i])
				end
				Windows[id][i] = nil
			end
		end
	end)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Ending
	return Windows[id]
end


----------------------------------------------------------------------------------------------------------------------------------------------
--Set functions

local function cwSetCloseEnabled(window, boolean)
	return window.Close:setVisible(boolean or false)
end

local function cwSetEnabled(window, boolean)
	if boolean then
		window.Frame:bringToFront()
	else
		window.Frame:moveToBack()
	end
	window.Enabled = boolean or false
	return window.Canvas:setEnabled(boolean or false)
end

local function cwSetVisible(window, boolean)
	return window.Canvas:setVisible(boolean or false)
end

local function cwSetSize(window, w, h, relative)
	
	if relative then

		w = math.floor(w*Width)
		h = math.floor(h*Height)

	end

	window.Canvas:setSize(w+4, h+4, false)

	window.Shadows.Central:setSize(w+2, h+2, false)
	window.Shadows.Vertical:setSize(w, h+4, false)
	window.Shadows.Horizontal:setSize(w+2, h, false)

	window.Frame:setSize(w, h, false)
	window.Top:setSize(w, 22, false)
	--window.Divider:setSize(w, 1, false)
	window.Title:setSize(w, 19, false)

	window.Close:setPosition(w-21, 0, false)
end

local function cwSetPosition(window, x, y, rel, replace)
	if replace ~= true and replace ~= false then
		replace = true
	end

	if rel then

		x = math.floor(x*Width)
		y = math.floor(y*Height)

	end

	if replace then
		Windows[id].Positions.X = x
		Windows[id].Positions.Y = y
	end
	return window.Canvas:setPosition(x-2, y-2, false)

end

local function cwSetTitle(window, text)
	window.Title:setText(text)
end

local function cwSetMovable(window, bool)
	window.Movable = bool or false
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Layering functions

local function cwBringToFront(window)
	window.Canvas:bringToFront()
end

local function cwMoveToBack(window)
	window.Canvas:moveToBack()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Get functions

local function cwGetSize(window, rel)

	if rel then

		local w, h = window.Frame:getSize(false)
		return w/Width, h/Height

	else
		return window.Frame:getSize(false)
	end
end

local function cwGetPosition(window, rel)
	x, y = window.Canvas:getPosition(false)
	x, y = x+2, y+2

	if rel then
		x = x/Width
		y = y/Height
	end

	return x, y
end

local function cwGetTitle(window)
	return window.Title:getText()
end

local function cwGetVisible(window)
	return window.Canvas:getVisible()
end

local function cwGetEnabled(window)
	return window.Canvas:getEnabled()
end

local function cwGetCloseEnabled(window)
	return window.Close:getVisible()
end

local function cwGetMovable(window, bool)
	return window.Movable
end


----------------------------------------------------------------------------------------------------------------------------------------------
--Animated functions
local function cwOpen(window)

	local x = window.Positions.X
	cwSetPosition(window, x, Height, false, false)
	
	cwSetVisible(window, true)
	window.Animation = "open"
	window.Canvas:bringToFront()
	--window.Frame:bringToFront()
end

local function cwClose(window)
	if cwGetVisible(window) then
		window.Animation = "close"
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Theme Functions

local function cwSetColorScheme(window, scheme)

	window.ColorScheme = scheme

	FrameColor = "EEEEEE"
	if window.ColorScheme.DarkTheme then FrameColor = "444444" end

	TextColor = "444444"
	if window.ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

	frmcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", FrameColor, FrameColor, FrameColor, FrameColor)
	frlcol = string.format("tl:AA%s tr:AA%s bl:AA%s br:AA%s", FrameColor, FrameColor, FrameColor, FrameColor)
	txtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TextColor, TextColor, TextColor, TextColor)

	window.Frame:setProperty("ImageColours", frmcol)
	window.Top:setProperty("ImageColours", frlcol)
	window.Cross:setProperty("ImageColours", txtcol)
	window.Title:setColor(fromHEXToRGB(TextColor))

	for _, v in ipairs(window.SchemeElements) do

		v:setColorScheme(scheme)

	end

end

local function cwAddSchemeElement(window, element)

	cnt = #window.SchemeElements
	window.SchemeElements[cnt+1] = element

end

local function cwAddSchemeElements(window, elements)

	for _, v in ipairs(elements) do

		cnt = #window.SchemeElements
		window.SchemeElements[cnt+1] = v

	end
end


----------------------------------------------------------------------------------------------------------------------------------------------
--OOP functions

CustomWindow = {}
CustomWindow.__index = CustomWindow

function CustomWindow.create(...)
	local self = setmetatable({}, CustomWindow)
	self.Window = guiCreateCustomWindow(...)
	return self
end

function CustomWindow.setCloseEnabled(self, ...) return cwSetCloseEnabled(self.Window, ...) end
function CustomWindow.setEnabled(self, ...) return cwSetEnabled(self.Window, ...) end
function CustomWindow.setVisible(self, ...) return cwSetVisible(self.Window, ...) end
function CustomWindow.setSize(self, ...) return cwSetSize(self.Window, ...) end
function CustomWindow.setPosition(self, ...) return cwSetPosition(self.Window, ...) end
function CustomWindow.setText(self, ...) return cwSetTitle(self.Window, ...) end
function CustomWindow.setTitle(self, ...) return cwSetTitle(self.Window, ...) end
function CustomWindow.setMovable(self, ...) return cwSetMovable(self.Window, ...) end

function CustomWindow.bringToFront(self) return cwBringToFront(self.Window) end
function CustomWindow.moveToBack(self) return cwMoveToBack(self.Window) end

function CustomWindow.getCloseEnabled(self, ...) return cwGetCloseEnabled(self.Window, ...) end
function CustomWindow.getEnabled(self, ...) return cwGetEnabled(self.Window, ...) end
function CustomWindow.getVisible(self, ...) return cwGetVisible(self.Window, ...) end
function CustomWindow.getSize(self, ...) return cwGetSize(self.Window, ...) end
function CustomWindow.getPosition(self, ...) return cwGetPosition(self.Window, ...) end
function CustomWindow.getText(self, ...) return cwGetTitle(self.Window, ...) end
function CustomWindow.getTitle(self, ...) return cwGetTitle(self.Window, ...) end
function CustomWindow.getMovable(self, ...) return cwGetMovable(self.Window, ...) end

function CustomWindow.open(self) return cwOpen(self.Window) end
function CustomWindow.close(self) return cwClose(self.Window) end

function CustomWindow.setColorScheme(self, ...) return cwSetColorScheme(self.Window, ...) end
function CustomWindow.addElement(self, ...) return cwAddSchemeElement(self.Window, ...) end
function CustomWindow.addElements(self, ...) return cwAddSchemeElements(self.Window, ...) end

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------Buttons----------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Buttons = {}
local function guiCreateCustomButton(x, y, w, h, text, relative, parent)
	
	------------------------------------------------------------------------------------------------------------------------------------------
	--Counting IDs and coordinates
	local id = #Buttons+1

	if relative then

		local sw, sh = Width, Height
		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		else
			parent = nil
		end

		x = x*sw
		y = y*sh
		w = w*sw
		h = h*sh

	else

		x = math.floor(x)
		y = math.floor(y)
		w = math.floor(w)
		h = math.floor(h)

	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Main part of button
	Buttons[id] = {}

	Buttons[id].Canvas = GuiStaticImage.create(x-1, y-1, w+2, h+2, pane, false, parent)
	Buttons[id].ColorScheme = DefaultColors

	------------------------------------------------------------------------------------------------------------------------------------------
	--Button formal shadow
	Buttons[id].Vertical = GuiStaticImage.create(1, 0, w, h+2, pane, false, Buttons[id].Canvas)
	Buttons[id].Horizontal = GuiStaticImage.create(0, 1, w+2, h, pane, false, Buttons[id].Canvas)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Button main
	Buttons[id].Main = GuiStaticImage.create(1, 1, w, h, pane, false, Buttons[id].Canvas)
	Buttons[id].Image = GuiStaticImage.create(0, 0, 1, 1, pane, false, Buttons[id].Main)
	Buttons[id].ImageLocation = nil
	Buttons[id].Text = GuiLabel.create(0, 0, 1, 1, text or "", false, Buttons[id].Main)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Properties

	TopCol, BotCol, BackCol = "FFFFFF", "EEEEEE", "CCCCCC"
	if Buttons[id].ColorScheme.DarkTheme then TopCol, BotCol, BackCol = "555555", "444444", "333333" end

	TextColor = "444444"
	if Buttons[id].ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

	btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)
	fbtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)

	Buttons[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	Buttons[id].Main:setProperty("ImageColours", btncol)
	Buttons[id].Vertical:setProperty("ImageColours", fbtcol)
	Buttons[id].Horizontal:setProperty("ImageColours", fbtcol)

	Buttons[id].Vertical:setEnabled(false)
	Buttons[id].Horizontal:setEnabled(false)
	Buttons[id].Image:setEnabled(false)
	Buttons[id].Text:setEnabled(false)

	Buttons[id].Image:setVisible(false)
	Buttons[id].Text:setVisible(text and text ~= "")

	Buttons[id].Text:setFont(GuiFont.create(Fonts.OpenSansRegular, 9))
	Buttons[id].Text:setColor(fromHEXToRGB(TextColor))

	if text and text ~= "" then
		Buttons[id].Text:setPosition(0, 0, false)
		Buttons[id].Text:setSize(w, h-3, false)
		Buttons[id].Text:setHorizontalAlign("center")
		Buttons[id].Text:setVerticalAlign("center")
	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Events

	--Enter
	addEventHandler("onClientMouseEnter", root, function()
		if source == Buttons[id].Main then
			--source:setProperty("ImageColours", "tl:FFEEEEEE tr:FFEEEEEE bl:FFDDDDDD br:FFDDDDDD")
			--Buttons[id].Text:setColor(fromHEXToRGB(Buttons[id].ColorScheme.Main))
			
			source:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", Buttons[id].ColorScheme.Main, Buttons[id].ColorScheme.Main, Buttons[id].ColorScheme.SubMain, Buttons[id].ColorScheme.SubMain))
			
			Buttons[id].Vertical:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", Buttons[id].ColorScheme.Main, Buttons[id].ColorScheme.Main, Buttons[id].ColorScheme.Main, Buttons[id].ColorScheme.Main))
			Buttons[id].Horizontal:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", Buttons[id].ColorScheme.Main, Buttons[id].ColorScheme.Main, Buttons[id].ColorScheme.Main, Buttons[id].ColorScheme.Main))
			Buttons[id].Text:setColor(fromHEXToRGB("FFFFFF"))
		end
	end)

	--Leave
	addEventHandler("onClientMouseLeave", root, function()

		if Buttons[id].Canvas:getEnabled() then
	
			TopCol, BotCol, BackCol = "FFFFFF", "EEEEEE", "CCCCCC"
			if Buttons[id].ColorScheme.DarkTheme then TopCol, BotCol, BackCol = "555555", "444444", "333333" end

			TextColor = "444444"
			if Buttons[id].ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

			btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)
			fbtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)

			Buttons[id].Text:setColor(fromHEXToRGB(TextColor))
			Buttons[id].Main:setProperty("ImageColours", btncol)
			Buttons[id].Vertical:setProperty("ImageColours", fbtcol)
			Buttons[id].Horizontal:setProperty("ImageColours", fbtcol)
	
		end

	end)

	--Mouse Down
	addEventHandler("onClientGUIMouseDown", root, function()
		if source == Buttons[id].Main then

			source:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", Buttons[id].ColorScheme.SubMain, Buttons[id].ColorScheme.SubMain, Buttons[id].ColorScheme.SubMain, Buttons[id].ColorScheme.SubMain))
			Buttons[id].Text:setColor(fromHEXToRGB("EEEEEE"))

			Buttons[id].Vertical:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", Buttons[id].ColorScheme.DarkMain, Buttons[id].ColorScheme.DarkMain, Buttons[id].ColorScheme.DarkMain, Buttons[id].ColorScheme.DarkMain))
			Buttons[id].Horizontal:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", Buttons[id].ColorScheme.DarkMain, Buttons[id].ColorScheme.DarkMain, Buttons[id].ColorScheme.DarkMain, Buttons[id].ColorScheme.DarkMain))
		
		end
	end)

	--Mouse Up
	addEventHandler("onClientGUIMouseUp", root, function()
		if source == Buttons[id].Main then
	
			triggerEvent("onClientMouseEnter", source)

		end
	end)
	
	addEventHandler("onClientResourceStop", root, function(res)
		if res == getThisResource() then

			for i in pairs(Buttons[id]) do
				if isElement(Buttons[id][i]) then
					destroyElement(Buttons[id][i])
				end
				Buttons[id][i] = nil
			end
		end
	end)

	--[[addEventHandler("onClientChangeStandartColor", Buttons[id], function(colorscheme)
		Buttons[id].ColorScheme = colorscheme

	end)]]

	return Buttons[id]
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Set functions
local function cbSetImage(button, image)

	local w, h = button.Canvas:getSize(false)
	w, h = w-2, h-2

	if image == nil then

		button.Text:setPosition(0, 0, false)
		button.Text:setSize(w, h-3, false)
		button.Text:setHorizontalAlign("center")
		button.Image:setVisible(false)
		button.ImageLocation = nil

	else

		button.Image:loadImage(image)
		button.ImageLocation = image

		local img_w, img_h = guiStaticImageGetNativeSize(button.Image)
		button.Image:setSize(img_w, img_h, false)

		local x, y = math.floor(w/2-img_w/2), math.floor(h/2-img_h/2)
		
		if button.Text:getText() ~= "" then

			x = math.floor(h/2-img_w/2)

			button.Text:setPosition(x+img_w+2, 0, false)
			local ax = x+img_w
			button.Text:setSize(w-ax > 0 and w-ax or 10, h-3, false)
			button.Text:setHorizontalAlign("left")
		end

		button.Image:setPosition(x, y, false)
		button.Image:setVisible(true)

	end
end

local function cbSetText(button, text)

	button.Text:setText(text or "")
	button.Text:setVisible(text and text ~= "")
	cbSetImage(button, button.ImageLocation)

end

local function cbSetPosition(button, x, y, rel)
	
	if relative then

		local sw, sh = Width, Height
		local parent = button.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		x = x*sw
		y = y*sh

	end

	button.Canvas:setPosition(x-1, y-1, false)
end

local function cbSetSize(button, w, h, rel)

	if relative then

		local sw, sh = Width, Height
		local parent = button.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		w = w*sw
		h = h*sh

	end

	button.Canvas:setSize(w+2, h+2, false)
	button.Vertical:setSize(w, h+2, false)
	button.Horizontal:setSize(w+2, h, false)
	button.Main:setSize(w, h, false)
	cbSetImage(button, button.Image:getVisible() and button.Image:getText() or nil)
end

local function cbSetEnabled(button, bool)
	
	button.Canvas:setEnabled(bool)

	if not bool then

		button.Text:setColor(fromHEXToRGB("888888"))
		button.Main:setProperty("ImageColours", string.format("tl:AA%s tr:AA%s bl:AA%s br:AA%s", button.ColorScheme.DarkMain, button.ColorScheme.DarkMain, button.ColorScheme.DarkMain, button.ColorScheme.DarkMain))
		button.Vertical:setProperty("ImageColours", string.format("tl:AA%s tr:AA%s bl:AA%s br:AA%s", button.ColorScheme.DarkMain, button.ColorScheme.DarkMain, button.ColorScheme.DarkMain, button.ColorScheme.DarkMain))
		button.Horizontal:setProperty("ImageColours", string.format("tl:AA%s tr:AA%s bl:AA%s br:AA%s", button.ColorScheme.DarkMain, button.ColorScheme.DarkMain, button.ColorScheme.DarkMain, button.ColorScheme.DarkMain))

	else 

		TopCol, BotCol, BackCol = "FFFFFF", "EEEEEE", "CCCCCC"
		if button.ColorScheme.DarkTheme then TopCol, BotCol, BackCol = "555555", "444444", "333333" end

		TextColor = "444444"
		if button.ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

		btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)
		fbtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)

		button.Text:setColor(fromHEXToRGB(TextColor))
		button.Main:setProperty("ImageColours", btncol)
		button.Vertical:setProperty("ImageColours", fbtcol)
		button.Horizontal:setProperty("ImageColours", fbtcol)
	end

end

local function cbSetVisible(button, bool)
	button.Canvas:setVisible(bool)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Layering functions

local function cbBringToFront(button)
	button.Canvas:bringToFront()
end

local function cbMoveToBack(button)
	button.Canvas:moveToBack()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Get functions
local function cbGetText(button)
	return button.Text:getText()
end

local function cbGetPosition(button, rel)

	local x, y = button.Canvas:getPosition(false)
	if rel then

		local sw, sh = Width, Height
		local parent = button.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end
		

		return (x+1)/sw, (y+1)/sh
	
	else

		return x+1, y+1
	end
end

local function cbGetSize(button, rel)
	
	local w, h = button.Canvas:getSize(false)
	if rel then

		local sw, sh = Width, Height
		local parent = button.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		return (w-2)/sw, (h-2)/sh
	
	else

		return w-2, h-2
	end

end

local function cbGetEnabled(button)
	return button.Canvas:getEnabled()
end

local function cbGetVisible(button)
	return button.Canvas:getVisible()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Theme editor

local function cbSetColorScheme(button, scheme)

	button.ColorScheme = scheme

	enbld = cbGetEnabled(button)
	cbSetEnabled(button, enbld)

end

----------------------------------------------------------------------------------------------------------------------------------------------
--Event Functions

local function cbAddEvent(button, event, func)
	addEventHandler(event, root, function(...)
		if source == button.Main then
			func(...)
		end
	end)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--OOP functions
CustomButton = {}
CustomButton.__index = CustomButton

function CustomButton.create(...)
	local self = setmetatable({}, CustomButton)
	self.Button = guiCreateCustomButton(...)
	return self
end

function CustomButton.setEnabled(self, ...) return cbSetEnabled(self.Button, ...) end
function CustomButton.setVisible(self, ...) return cbSetVisible(self.Button, ...) end
function CustomButton.setSize(self, ...) return cbSetSize(self.Button, ...) end
function CustomButton.setPosition(self, ...) return cbSetPosition(self.Button, ...) end
function CustomButton.setText(self, ...) return cbSetText(self.Button, ...) end
function CustomButton.setImage(self, ...) return cbSetImage(self.Button, ...) end

function CustomButton.bringToFront(self) return cbBringToFront(self.Button) end
function CustomButton.moveToBack(self) return cbMoveToBack(self.Button) end

function CustomButton.getEnabled(self, ...) return cbGetEnabled(self.Button, ...) end
function CustomButton.getVisible(self, ...) return cbGetVisible(self.Button, ...) end
function CustomButton.getSize(self, ...) return cbGetSize(self.Button, ...) end
function CustomButton.getPosition(self, ...) return cbGetPosition(self.Button, ...) end
function CustomButton.getText(self, ...) return cbGetText(self.Button, ...) end

function CustomButton.setColorScheme(self, ...) return cbSetColorScheme(self.Button, ...) end

function CustomButton.addEvent(self, ...) return cbAddEvent(self.Button, ...) end

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------ProgressBars-----------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

ProgressBars = {}
local function guiCreateCustomProgressBar(x, y, w, h, relative, parent)
	
	------------------------------------------------------------------------------------------------------------------------------------------
	--Counting IDs and coordinates

	local id = #ProgressBars+1

	if relative then

		local sw, sh = Width, Height
		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		else
			parent = nil
		end

		x = x*sw
		y = y*sh
		w = w*sw
		h = h*sh

	else

		x = math.floor(x)
		y = math.floor(y)
		w = math.floor(w)
		h = math.floor(h)

	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Main

	ProgressBars[id] = {}
	ProgressBars[id].Canvas = GuiStaticImage.create(x-1, y-1, w+2, h+2, pane, false, parent)
	ProgressBars[id].ColorScheme = DefaultColors

	ProgressBars[id].Vertical = GuiStaticImage.create(1, 0, w, h+2, pane, false, ProgressBars[id].Canvas)
	ProgressBars[id].Horizontal = GuiStaticImage.create(0, 1, w+2, h, pane, false, ProgressBars[id].Canvas)

	ProgressBars[id].Main = GuiStaticImage.create(1, 1, w, h, pane, false, ProgressBars[id].Canvas)
	ProgressBars[id].Progress = GuiStaticImage.create(0, 0, 0, h, pane, false, ProgressBars[id].Main)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Properties

	BackCol, MainCol = "AAAAAA", "E7E7E7"
	if ProgressBars[id].ColorScheme.DarkTheme then BackCol, MainCol = "2F2F2F", "333333" end

	bckcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)
	cntcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", MainCol, MainCol, MainCol, MainCol)

	ProgressBars[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")

	ProgressBars[id].Vertical:setProperty("ImageColours", bckcol)
	ProgressBars[id].Horizontal:setProperty("ImageColours", bckcol)

	ProgressBars[id].Main:setProperty("ImageColours", cntcol)
	ProgressBars[id].Progress:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ProgressBars[id].ColorScheme.LightMain, ProgressBars[id].ColorScheme.LightMain, ProgressBars[id].ColorScheme.Main, ProgressBars[id].ColorScheme.Main))

	ProgressBars[id].Vertical:setEnabled(false)
	ProgressBars[id].Horizontal:setEnabled(false)
	ProgressBars[id].Progress:setEnabled(false)

	ProgressBars[id].IsVertical = w<h

	------------------------------------------------------------------------------------------------------------------------------------------
	--Events
		
	addEventHandler("onClientResourceStop", root, function(res)
		if res == getThisResource() then

			for i in pairs(ProgressBars[id]) do
				if isElement(ProgressBars[id][i]) then
					destroyElement(ProgressBars[id][i])
				end
				ProgressBars[id][i] = nil
			end
		end
	end)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Ending
	return ProgressBars[id]
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Set Functions

local function cpbSetProgress(bar, percentage)
	
	if not tonumber(percentage) or percentage < 0 then percentage = 0
	elseif percentage > 100 then percentage = 100 end

	w, h = percentage/100, 1
	if bar.IsVertical then
		w, h = h, w
		bar.Progress:setPosition(0, 1-h, true)
	else
		bar.Progress:setPosition(0, 0, true)
	end

	bar.Progress:setSize(w, h, true)
end

local function cpbSetPosition(bar, x, y, rel)
	
	if rel then

		local sw, sh = Width, Height
		local parent = bar.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		x = x*sw
		y = y*sh

	end

	bar.Canvas:setPosition(x, y, false)
end

local function cpbSetSize(bar, w, h, rel)
	
	if rel then

		local sw, sh = Width, Height
		local parent = bar.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		w = w*sw
		h = w*sh

	end

	local sw, sh = bar.Progress:getSize(true)
	
	bar.Canvas:setSize(w+2, h+2, false)
	bar.Vertical:setSize(w, h+2, false)
	bar.Horizontal:setSize(w+2, h, false)
	bar.Main:setSize(w, h, false)
	
	if bar.IsVertical ~= (w<h) then
		sw, sh = sh, sw
		bar.IsVertical = w<h
	end

	if bar.IsVertical then
		bar.Progress:setPosition(0, 1-sh, true)
	else
		bar.Progress:setPosition(0, 0, true)
	end
	bar.Progress:setSize(sw, sh, true)

end

local function cpbSetVisible(bar, bool)
	return bar.Canvas:setVisible(bool)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Layering functions

local function cpbBringToFront(bar)
	return bar.Canvas:bringToFront()
end

local function cpbMoveToBack(bar)
	return bar.Canvas:moveToBack()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Get Functions

local function cpbGetProgress(bar)
	local w = bar.Progress:getSize(true)
	return w*100
end

local function cpbGetPosition(bar, rel)
	
	local x, y = bar.Canvas:getPosition(false)
	if rel then

		local sw, sh = Width, Height
		local parent = bar.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end
		

		return (x+1)/sw, (y+1)/sh
	
	else

		return x+1, y+1
	end
end

local function cpbGetSize(bar, rel)
	
	local x, y = bar.Canvas:getPosition(false)
	if rel then

		local sw, sh = Width, Height
		local parent = bar.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end
		

		return (w-2)/sw, (h-2)/sh
	
	else

		return w-2, h-2
	end
end

local function cpbGetVisible(bar)
	return bar.Canvas:getVisible()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Theme Functions
local function cpbSetColorScheme(bar, scheme)

	bar.ColorScheme = scheme

	BackCol, MainCol = "AAAAAA", "E7E7E7"
	if bar.ColorScheme.DarkTheme then BackCol, MainCol = "2F2F2F", "333333" end

	bckcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)
	cntcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", MainCol, MainCol, MainCol, MainCol)

	bar.Vertical:setProperty("ImageColours", bckcol)
	bar.Horizontal:setProperty("ImageColours", bckcol)

	bar.Main:setProperty("ImageColours", cntcol)
	bar.Progress:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", bar.ColorScheme.LightMain, bar.ColorScheme.LightMain, bar.ColorScheme.Main, bar.ColorScheme.Main))
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Event Functions

local function cpbAddEvent(bar, event, func)
	addEventHandler(event, root, function(...)
		if source == bar.Main then
			func(...)
		end
	end)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--OOP Functions
CustomProgressBar = {}
CustomProgressBar.__index = CustomProgressBar

function CustomProgressBar.create(...)
	local self = setmetatable({}, CustomProgressBar)
	self.ProgressBar = guiCreateCustomProgressBar(...)
	return self
end

function CustomProgressBar.setProgress(self, ...) return cpbSetProgress(self.ProgressBar, ...) end
function CustomProgressBar.setPosition(self, ...) return cpbSetPosition(self.ProgressBar, ...) end
function CustomProgressBar.setSize(self, ...) return cpbSetSize(self.ProgressBar, ...) end
function CustomProgressBar.setVisible(self, ...) return cpbSetVisible(self.ProgressBar, ...) end

function CustomProgressBar.bringToFront(self) return cpbBringToFront(self.ProgressBar) end
function CustomProgressBar.moveToBack(self) return cpbMoveToBack(self.ProgressBar) end

function CustomProgressBar.getProgress(self, ...) return cpbGetProgress(self.ProgressBar, ...) end
function CustomProgressBar.getPosition(self, ...) return cpbGetPosition(self.ProgressBar, ...) end
function CustomProgressBar.getSize(self, ...) return cpbGetSize(self.ProgressBar, ...) end
function CustomProgressBar.getVisible(self, ...) return cpbGetVisible(self.ProgressBar, ...) end

function CustomProgressBar.setColorScheme(self, ...) return cpbSetColorScheme(self.ProgressBar, ...) end

function CustomProgressBar.addEvent(self, ...) return cpbAddEvent(self.ProgressBar, ...) end

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------ScrollBars-------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
ScrollBars = {}

local function guiCreateCustomScrollBar(x, y, w, h, rel, parent)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Counting IDs and coordinates

	local id = #ScrollBars+1

	if relative then

		local sw, sh = Width, Height
		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		else
			parent = nil
		end

		x = x*sw
		y = y*sh
		w = w*sw
		h = h*sh

	else

		x = math.floor(x)
		y = math.floor(y)
		w = math.floor(w)
		h = math.floor(h)

	end
	local high = w > h and w or h
	ScrollBars[id] = {}
	ScrollBars[id].ScrollLength = 0.2*high
	ScrollBars[id].ColorScheme = DefaultColors

	local sw, sh = ScrollBars[id].ScrollLength, h
	local xw, xh = ScrollBars[id].ScrollLength-2, h
	local sx, sy = 1, 0

	if w < h then
		sw, sh = w, ScrollBars[id].ScrollLength
		xw, xh = w, ScrollBars[id].ScrollLength-2
		sx, sy = 0, 1
	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Main

	ScrollBars[id].Canvas = GuiStaticImage.create(x-1, y-1, w+2, h+2, pane, false, parent)
	ScrollBars[id].Vertical = GuiStaticImage.create(1, 0, w, h+2, pane, false, ScrollBars[id].Canvas)
	ScrollBars[id].Horizontal = GuiStaticImage.create(0, 1, w+2, h, pane, false, ScrollBars[id].Canvas)
	ScrollBars[id].Main = GuiStaticImage.create(1, 1, w, h, pane, false, ScrollBars[id].Canvas)

	ScrollBars[id].Edges = GuiStaticImage.create(0, 0, sw, sh, pane, false, ScrollBars[id].Main)
	ScrollBars[id].Entrail = GuiStaticImage.create(sx, sy, xw, xh, pane, false, ScrollBars[id].Edges)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Properties

	TopCol, BotCol, BackCol, EdgesCol, MainCol = "F6F6F6", "EAEAEA", "AAAAAA", "BBBBBB", "E7E7E7"
	if ScrollBars[id].ColorScheme.DarkTheme then TopCol, BotCol, BackCol, EdgesCol, MainCol = "555555", "444444", "333333", "3F3F3F", "3A3A3A" end

	bckcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)
	maicol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", MainCol, MainCol, MainCol, MainCol)
	edgcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", EdgesCol, EdgesCol, EdgesCol, EdgesCol)
	btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)

	ScrollBars[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")

	ScrollBars[id].Vertical:setProperty("ImageColours", bckcol)
	ScrollBars[id].Horizontal:setProperty("ImageColours", bckcol)

	ScrollBars[id].Main:setProperty("ImageColours", maicol)

	ScrollBars[id].Edges:setProperty("ImageColours", edgcol)
	ScrollBars[id].Entrail:setProperty("ImageColours", btncol)

	ScrollBars[id].Vertical:setEnabled(false)
	ScrollBars[id].Horizontal:setEnabled(false)
	ScrollBars[id].Entrail:setEnabled(false)

	ScrollBars[id].IsVertical = w<h

	ScrollBars[id].LocalPosition = {X=0, Y=0, DX=0, DY=0} --X, Y - Start Positions, DX, DY - Cursor Differencial Position
	ScrollBars[id].PhysicalPosition = {X=0, Y=0}
	ScrollBars[id].ScrollEnabled = false
	ScrollBars[id].Scroll = 0
	ScrollBars[id].Entered = false
	ScrollBars[id].ScrollSpeed = 2

	------------------------------------------------------------------------------------------------------------------------------------------
	--Events

	addEventHandler("onClientMouseEnter", root, function()
		if source == ScrollBars[id].Edges then
			if not ScrollBars[id].ScrollEnabled then
				ScrollBars[id].Edges:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.LightMain))
				ScrollBars[id].Entrail:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.Main, ScrollBars[id].ColorScheme.Main))
			end
			ScrollBars[id].Entered = true
		end
	end)

	addEventHandler("onClientMouseLeave", root, function()
		if ScrollBars[id].Canvas:getEnabled() then
			if not ScrollBars[id].ScrollEnabled then
				
				TopCol, BotCol, EdgesCol = "F6F6F6", "EAEAEA", "BBBBBB"
				if ScrollBars[id].ColorScheme.DarkTheme then TopCol, BotCol, EdgesCol = "555555", "444444", "3F3F3F" end

				edgcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", EdgesCol, EdgesCol, EdgesCol, EdgesCol)
				btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)
			
				ScrollBars[id].Edges:setProperty("ImageColours", edgcol)
				ScrollBars[id].Entrail:setProperty("ImageColours", btncol)
			end

			ScrollBars[id].Entered = false
		end
	end)

	addEventHandler("onClientGUIMouseDown", root, function(button, ax, ay)
		if button == "left" and source == ScrollBars[id].Edges then

			ScrollBars[id].LocalPosition.DX = ax 
			ScrollBars[id].LocalPosition.DY = ay

			ScrollBars[id].PhysicalPosition.X, ScrollBars[id].PhysicalPosition.Y = ScrollBars[id].Edges:getPosition(false)
			ScrollBars[id].LocalPosition.X, ScrollBars[id].LocalPosition.Y = ScrollBars[id].Edges:getPosition(false)

			ScrollBars[id].Edges:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ScrollBars[id].ColorScheme.SubMain, ScrollBars[id].ColorScheme.SubMain, ScrollBars[id].ColorScheme.SubMain, ScrollBars[id].ColorScheme.SubMain))
			ScrollBars[id].Entrail:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ScrollBars[id].ColorScheme.Main, ScrollBars[id].ColorScheme.Main, ScrollBars[id].ColorScheme.SubMain, ScrollBars[id].ColorScheme.SubMain))
			
			ScrollBars[id].ScrollEnabled = true
			BackForMouse:setVisible(true)
		end
	end)

	addEventHandler("onClientGUIMouseUp", root, function()
		ScrollBars[id].LocalPosition.X, ScrollBars[id].LocalPosition.Y = ScrollBars[id].PhysicalPosition.X, ScrollBars[id].PhysicalPosition.Y
		
		if ScrollBars[id].Canvas:getEnabled() then
			if ScrollBars[id].Entered then
				ScrollBars[id].Edges:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.LightMain))
				ScrollBars[id].Entrail:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.LightMain, ScrollBars[id].ColorScheme.Main, ScrollBars[id].ColorScheme.Main))
			else
			
				TopCol, BotCol, EdgesCol = "F6F6F6", "EAEAEA", "BBBBBB"
				if ScrollBars[id].ColorScheme.DarkTheme then TopCol, BotCol, EdgesCol = "555555", "444444", "3F3F3F" end

				edgcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", EdgesCol, EdgesCol, EdgesCol, EdgesCol)
				btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)
			
				ScrollBars[id].Edges:setProperty("ImageColours", edgcol)
				ScrollBars[id].Entrail:setProperty("ImageColours", btncol)

			end
		end
		ScrollBars[id].ScrollEnabled = false
		BackForMouse:setVisible(false)
	end)

	addEventHandler("onClientCursorMove", root, function(_, _, x, y)

		if ScrollBars[id].ScrollEnabled then
				
			local difX = ScrollBars[id].LocalPosition.DX-x
			local difY = ScrollBars[id].LocalPosition.DY-y
			local sx, sy = ScrollBars[id].LocalPosition.X, ScrollBars[id].LocalPosition.Y
			local ax, ay = sx, sy
			local slen = ScrollBars[id].ScrollLength

			local swidth, sheight = ScrollBars[id].Main:getSize(false)
			if not ScrollBars[id].IsVertical then
				sx = sx-difX
				ax = sx

				if sx < 0 then sx = 0 end
				if sx > swidth-slen then sx = swidth-slen end

				ScrollBars[id].Scroll = 100*(sx/(swidth-slen))
			else
				sy = sy-difY
				ay = sy

				if sy < 0 then sy = 0 end
				if sy > sheight-slen then sy = sheight-slen end

				ScrollBars[id].Scroll = 100*(sy/(sheight-slen))
			end

			ScrollBars[id].LocalPosition.X = ax
			ScrollBars[id].LocalPosition.DX = x
			ScrollBars[id].PhysicalPosition.X = sx

			ScrollBars[id].LocalPosition.Y = ay
			ScrollBars[id].LocalPosition.DY = y
			ScrollBars[id].PhysicalPosition.Y = sy

			ScrollBars[id].Edges:setPosition(sx, sy, false)

			triggerEvent("onCustomScrollBarScrolled", localPlayer, ScrollBars[id].Canvas)

		end

	end)

	addEventHandler("onClientMouseWheel", root, function(upper)

		if source == ScrollBars[id].Edges or source == ScrollBars[id].Main then

			local x = 1
			if ScrollBars[id].IsVertical then
				x = -1
			end

			csbSetScrollPosition(ScrollBars[id], ScrollBars[id].Scroll + x*upper*ScrollBars[id].ScrollSpeed)
			triggerEvent("onCustomScrollBarScrolled", localPlayer, ScrollBars[id].Canvas)

		end

	end)
			
	addEventHandler("onClientResourceStop", root, function(res)
		if res == getThisResource() then

			for i in pairs(ScrollBars[id]) do
				if isElement(ScrollBars[id][i]) then
					destroyElement(ScrollBars[id][i])
				end
				ScrollBars[id][i] = nil
			end
		end
	end)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Ending
	return ScrollBars[id]
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Set functions

function csbSetScrollPosition(scroll, pos)

	if pos < 0 then pos = 0 end
	if pos > 100 then pos = 100 end

	scroll.Scroll = pos

	local swidth, sheight = scroll.Main:getSize(false)
	local slen = scroll.ScrollLength

	if not scroll.IsVertical then
		scroll.Edges:setPosition(pos * (swidth-slen) / 100, 0, false)
	else
		scroll.Edges:setPosition(0, pos * (sheight-slen) / 100, false)
	end

end

local function csbSetScrollSpeed(scroll, speed)

	if speed < -100 then speed = -100 end
	if speed > 100 then speed = 100 end

	scroll.ScrollSpeed = speed

end

local function csbSetScrollLength(scroll, len)
	local w, h = scroll.Main:getSize(false)
	scroll.ScrollLength = len
	local slen = len

	if not scroll.IsVertical then
		scroll.Edges:setPosition(scroll.Scroll * (w-slen) / 100, 0, false)
		scroll.Edges:setSize(slen, h, false)
		scroll.Entrail:setSize(slen-2, h, false)
	else
		scroll.Edges:setPosition(0, scroll.Scroll * (h-slen) / 100, false)
		scroll.Edges:setSize(w, slen, false)
		scroll.Entrail:setSize(w, slen-2, false)
	end
end

local function csbSetPosition(scroll, x, y, rel)
	
	if rel then

		local sw, sh = Width, Height
		local parent = scroll.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		x = x*sw
		y = y*sh

	end

	scroll.Canvas:setPosition(x, y, false)
end

local function csbSetSize(scroll, w, h, rel)
	
	if rel then

		local sw, sh = Width, Height
		local parent = scroll.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		w = w*sw
		h = h*sh

	end

	scroll.Canvas:setSize(w+2, h+2, false)
	scroll.Vertical:setSize(w, h+2, false)
	scroll.Horizontal:setSize(w+2, h, false)
	scroll.Main:setSize(w, h, false)
	local slen = scroll.ScrollLength

	if (w<h) ~= scroll.IsVertical then

		local sw, sh = slen, h
		local xw, xh = slen-2, h
		local sx, sy = 1, 0

		if w < h then
			sw, sh = w, slen
			xw, xh = w, slen-2
			sx, sy = 0, 1
		end

		scroll.Edges:setSize(sw, sh, false)
		scroll.Entrail:setSize(xw, xh, false)
		scroll.Entrail:setPosition(sx, sy, false)

	end

	scroll.IsVertical = w<h
	csbSetScrollLength(scroll, slen)

end

local function csbSetVisible(scroll, bool)
	return scroll.Canvas:setVisible(scroll)
end

local function csbSetEnabled(scroll, bool)
	scroll.Canvas:setEnabled(bool)
	
	TopCol, BotCol, BackCol, EdgesCol, MainCol = "F6F6F6", "EAEAEA", "AAAAAA", "BBBBBB", "E7E7E7"
	if scroll.ColorScheme.DarkTheme then TopCol, BotCol, BackCol, EdgesCol, MainCol = "555555", "444444", "333333", "3F3F3F", "3A3A3A" end
	
	bckcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)
	maicol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", MainCol, MainCol, MainCol, MainCol)
	edgcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", EdgesCol, EdgesCol, EdgesCol, EdgesCol)
	btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)

	scroll.Vertical:setProperty("ImageColours", bckcol)
	scroll.Horizontal:setProperty("ImageColours", bckcol)

	if bool then

		scroll.Main:setProperty("ImageColours", maicol)
		scroll.Edges:setProperty("ImageColours", edgcol)
		scroll.Entrail:setProperty("ImageColours", btncol)

	else

		TopCol, BotCol, EdgesCol, MainCol = "CCCCCC", "BBBBBB", "999999", "B7B7B7"
		if scroll.ColorScheme.DarkTheme then TopCol, BotCol, EdgesCol, MainCol = "3A3A3A", "333333", "222222", "2F2F2F" end

		maicol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", MainCol, MainCol, MainCol, MainCol)
		edgcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", EdgesCol, EdgesCol, EdgesCol, EdgesCol)
		btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)

		scroll.Main:setProperty("ImageColours", maicol)
		scroll.Edges:setProperty("ImageColours", edgcol)
		scroll.Entrail:setProperty("ImageColours", btncol)

		--scroll.Main:setProperty("ImageColours", "tl:FFB7B7B7 tr:FFB7B7B7 bl:FFB7B7B7 br:FFB7B7B7")
		--scroll.Edges:setProperty("ImageColours", "tl:FF999999 tr:FF999999 bl:FF999999 br:FF999999")
		--scroll.Entrail:setProperty("ImageColours", "tl:FFCCCCCC tr:FFCCCCCC bl:FFBBBBBB br:FFBBBBBB")
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Layering functions

local function csbBringToFront(scroll)
	return scroll.Canvas:bringToFront()
end

local function csbMoveToBack(scroll)
	return scroll.Canvas:moveToBack()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Get functions

local function csbGetPosition(scroll, rel)

	local x, y = scroll.Canvas:getPosition(false)
	if rel then

		local sw, sh = Width, Height
		local parent = scroll.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end
		

		return (x+1)/sw, (y+1)/sh
	
	else

		return x+1, y+1
	end
end

local function csbGetSize(scroll, rel)
	
	local w, h = scroll.Canvas:getSize(false)
	if rel then

		local sw, sh = Width, Height
		local parent = scroll.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		return (w-2)/sw, (h-2)/sh
	
	else

		return w-2, h-2
	end

end

local function csbGetScrollPosition(scroll)
	return scroll.Scroll
end

local function csbGetScrollLength(scroll)
	return scroll.ScrollLength
end

local function csbGetEnabled(scroll)
	return scroll.Canvas:getEnabled()
end

local function csbGetVisible(scroll)
	return scroll.Canvas:getVisible()
end

local function csbGetScrollSpeed(scroll)
	return scroll.ScrollSpeed
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Theme Functions

local function csbSetColorScheme(sbar, scheme)

	sbar.ColorScheme = scheme

	csbSetEnabled(sbar, csbGetEnabled(sbar))

end

----------------------------------------------------------------------------------------------------------------------------------------------
--Event Functions

local function csbAddEvent(sbar, event, func)
	addEventHandler(event, root, function(...)
		if source == sbar.Main or source == sbar.Edges then
			func(...)
		end
	end)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--OOP Functions
CustomScrollBar = {}
CustomScrollBar.__index = CustomScrollBar

function CustomScrollBar.create(...)
	local self = setmetatable({}, CustomScrollBar)
	self.ScrollBar = guiCreateCustomScrollBar(...)
	return self
end

function CustomScrollBar.setScrollPosition(self, ...) return csbSetScrollPosition(self.ScrollBar, ...) end
function CustomScrollBar.setScrollLength(self, ...) return csbSetScrollLength(self.ScrollBar, ...) end
function CustomScrollBar.setPosition(self, ...) return csbSetPosition(self.ScrollBar, ...) end
function CustomScrollBar.setSize(self, ...) return csbSetSize(self.ScrollBar, ...) end
function CustomScrollBar.setVisible(self, ...) return csbSetVisible(self.ScrollBar, ...) end
function CustomScrollBar.setEnabled(self, ...) return csbSetEnabled(self.ScrollBar, ...) end
function CustomScrollBar.setScrollSpeed(self, ...) return csbSetScrollSpeed(self.ScrollBar, ...) end

function CustomScrollBar.bringToFront(self) return csbBringToFront(self.ScrollBar) end
function CustomScrollBar.moveToBack(self) return csbMoveToBack(self.ScrollBar) end

function CustomScrollBar.getScrollPosition(self, ...) return csbGetScrollPosition(self.ScrollBar, ...) end
function CustomScrollBar.getScrollLength(self, ...) return csbGetScrollLength(self.ScrollBar, ...) end
function CustomScrollBar.getPosition(self, ...) return csbGetPosition(self.ScrollBar, ...) end
function CustomScrollBar.getSize(self, ...) return csbGetSize(self.ScrollBar, ...) end
function CustomScrollBar.getVisible(self, ...) return csbGetVisible(self.ScrollBar, ...) end
function CustomScrollBar.getEnabled(self, ...) return csbGetEnabled(self.ScrollBar, ...) end
function CustomScrollBar.getScrollSpeed(self, ...) return csbGetScrollSpeed(self.ScrollBar, ...) end

function CustomScrollBar.setColorScheme(self, ...) return csbSetColorScheme(self.ScrollBar, ...) end

function CustomScrollBar.addEvent(self, ...) return csbAddEvent(self.ScrollBar, ...) end


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------EditMemoNumberBoxes----------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
local EditBoxes = {}

local function guiCreateCustomEdit(x, y, w, h, text, relative, parent, objtype)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Counting IDs and coordinates

	local id = #EditBoxes+1

	if relative then

		local sw, sh = Width, Height
		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		else
			parent = nil
		end

		x = x*sw
		y = y*sh
		w = w*sw
		h = h*sh

	else

		x = math.floor(x)
		y = math.floor(y)
		w = math.floor(w)
		h = math.floor(h)

	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Main

	EditBoxes[id] = {}
	EditBoxes[id].ColorScheme = DefaultColors
	EditBoxes[id].Canvas = GuiStaticImage.create(x, y, w, h, pane, false, parent)

	if objtype == "memo" then
		EditBoxes[id].TextBox = GuiMemo.create(0, 0, w, h, text, false, EditBoxes[id].Canvas)
	else
		EditBoxes[id].TextBox = GuiEdit.create(0, 0, w, h, text, false, EditBoxes[id].Canvas)
	end

	EditBoxes[id].Sides = {}
	EditBoxes[id].Sides.Left = GuiStaticImage.create(0, 0, 3, h, pane, false, EditBoxes[id].TextBox)
	EditBoxes[id].Sides.Right = GuiStaticImage.create(w-3, 0, 3, h, pane, false, EditBoxes[id].TextBox)
	EditBoxes[id].Sides.Top = GuiStaticImage.create(0, 0, w, 5, pane, false, EditBoxes[id].TextBox)
	EditBoxes[id].Sides.Bottom = GuiStaticImage.create(0, h-3, w, 3, pane, false, EditBoxes[id].TextBox)

	EditBoxes[id].Edges = {}
	EditBoxes[id].Edges.Left = GuiStaticImage.create(2, 5, 1, h-8, pane, false, EditBoxes[id].Sides.Left)
	EditBoxes[id].Edges.Right = GuiStaticImage.create(0, 5, 1, h-8, pane, false, EditBoxes[id].Sides.Right)
	EditBoxes[id].Edges.Top = GuiStaticImage.create(3, 4, w-6, 1, pane, false, EditBoxes[id].Sides.Top)
	EditBoxes[id].Edges.Bottom = GuiStaticImage.create(3, 0, w-6, 1, pane, false, EditBoxes[id].Sides.Bottom)

	EditBoxes[id].Edge = GuiStaticImage.create(w-52, 5, 49, h-8, pane, false, EditBoxes[id].Canvas)

	EditBoxes[id].Up = GuiStaticImage.create(23, (h-8)/2 - 12.5, 23, 25, Images.Next, false, EditBoxes[id].Edge)
	EditBoxes[id].Down = GuiStaticImage.create(0, (h-8)/2 - 12.5, 23, 25, Images.Prev, false, EditBoxes[id].Edge)

	if objtype == "number" then
		EditBoxes[id].Edges.TopContinue = GuiStaticImage.create(w-52, 4, 51, 1, pane, false, EditBoxes[id].Canvas)
		EditBoxes[id].Edges.BottomContinue = GuiStaticImage.create(w-52, h-3, 51, 1, pane, false, EditBoxes[id].Canvas)
		EditBoxes[id].Edges.RightContinue = GuiStaticImage.create(w-1, 5, 1, h-8, pane, false, EditBoxes[id].Canvas)
	end
	------------------------------------------------------------------------------------------------------------------------------------------
	--Properties

	WinColor, EdgeCol, TextCol = "EEEEEE", "CCCCCC", "444444"
	if EditBoxes[id].ColorScheme.DarkTheme then WinColor, EdgeCol, TextCol = "444444", "333333", "EEEEEE" end

	frmcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", WinColor, WinColor, WinColor, WinColor)
	edgcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", EdgeCol, EdgeCol, EdgeCol, EdgeCol)
	txtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TextCol, TextCol, TextCol, TextCol)


	EditBoxes[id].Canvas:setProperty("ImageColours", frmcol)
	EditBoxes[id].Edge:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	for _, v in pairs(EditBoxes[id].Sides) do
		v:setProperty("ImageColours", frmcol)
		v:setEnabled(false)
	end

	for _, v in pairs(EditBoxes[id].Edges) do
		v:setProperty("ImageColours", edgcol)
		v:setEnabled(false)
	end

	EditBoxes[id].TextBox:setFont(GuiFont.create(Fonts.OpenSansRegular, 8))
	EditBoxes[id].TextBox:setProperty("ActiveSelectionColour", "FF"..EditBoxes[id].ColorScheme.Main)
	EditBoxes[id].TextBox:setProperty("NormalTextColour", "FF444444")
	EditBoxes[id].TextBox:setProperty("SelectedTextColour", "FFEEEEEE")
	EditBoxes[id].TextBox:setProperty("ReadOnlyBGColour", "FFFFFFFF")
	EditBoxes[id].TextBox:setProperty("ForceVertScrollbar", "True")


	EditBoxes[id].Up:setProperty("ImageColours", txtcol)
	EditBoxes[id].Down:setProperty("ImageColours", txtcol)

	EditBoxes[id].Edge:setEnabled(objtype == "number")
	EditBoxes[id].Edge:setVisible(objtype == "number")
	EditBoxes[id].IsNumeric = (objtype == "number")

	if objtype == "number" then
		EditBoxes[id].Edges.Top:setSize(w-55, 1, false)
		EditBoxes[id].Edges.Bottom:setSize(w-52, 1, false)
		EditBoxes[id].TextBox:setSize(w-52, h, false)
		EditBoxes[id].Sides.Right:setPosition(w-55, 0, false)
	end

	EditBoxes[id].Minimal = 0
	EditBoxes[id].Maximal = 100
	EditBoxes[id].Current = 0
	EditBoxes[id].ScrollSpeed = 1
	EditBoxes[id].IsMouseDowned = false

	EditBoxes[id].Type = objtype or "edit"
	EditBoxes[id].Timer = nil

	EditBoxes[id].IsReadOnly = false
	EditBoxes[id].Enabled = true

	------------------------------------------------------------------------------------------------------------------------------------------
	--Events

	local move_speed = 1
	local move_count = 0
	addEventHandler("onClientMouseEnter", root, function()
		if source == EditBoxes[id].Up or source == EditBoxes[id].Down then
			source:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", EditBoxes[id].ColorScheme.Main, EditBoxes[id].ColorScheme.Main, EditBoxes[id].ColorScheme.Main, EditBoxes[id].ColorScheme.Main))
		end
	end)

	addEventHandler("onClientMouseLeave", root, function()
		if EditBoxes[id].Edge:getEnabled() then

			TextCol = "444444"
	
			if EditBoxes[id].ColorScheme.DarkTheme then TextCol = "EEEEEE" end
			txtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TextCol, TextCol, TextCol, TextCol)
	
			EditBoxes[id].Up:setProperty("ImageColours", txtcol)
			EditBoxes[id].Down:setProperty("ImageColours", txtcol)
		end
	end)


	addEventHandler("onClientGUIMouseUp", root, function()
		EditBoxes[id].IsMouseDowned = false
	end)

	local function click(positive)
		if positive then
			
			if EditBoxes[id].Current+EditBoxes[id].ScrollSpeed <= EditBoxes[id].Maximal then
				EditBoxes[id].Current = EditBoxes[id].Current+EditBoxes[id].ScrollSpeed*move_speed
			else
				EditBoxes[id].Current = EditBoxes[id].Maximal
			end

			EditBoxes[id].TextBox:setText(EditBoxes[id].Current.."")
		
		else

			if EditBoxes[id].Current-EditBoxes[id].ScrollSpeed >= EditBoxes[id].Minimal then
				EditBoxes[id].Current = EditBoxes[id].Current-EditBoxes[id].ScrollSpeed*move_speed
			else
				EditBoxes[id].Current = EditBoxes[id].Minimal
			end

			EditBoxes[id].TextBox:setText(EditBoxes[id].Current.."")
		end
	end

	addEventHandler("onClientGUIClick", root, function()

		if source == EditBoxes[id].Up then

			if isTimer(EditBoxes[id].Timer) then killTimer(EditBoxes[id].Timer) end
			EditBoxes[id].IsMouseDowned = false
			click(true)

		elseif source == EditBoxes[id].Down then

			if isTimer(EditBoxes[id].Timer) then killTimer(EditBoxes[id].Timer) end
			EditBoxes[id].IsMouseDowned = false
			click(false)
		end
	end)

	addEventHandler("onClientGUIMouseDown", root, function()
	
		move_count = 0
		move_speed = 1

		if source == EditBoxes[id].Up then
			EditBoxes[id].IsMouseDowned = true
		
			EditBoxes[id].Timer = setTimer(function()

				move_count = move_count+1

				if move_count/5 == math.floor(move_count/5) then
					move_speed = move_speed+2
				end				
				
				if EditBoxes[id].IsMouseDowned then
					click(true)
				else
					if isTimer(EditBoxes[id].Timer) then killTimer(EditBoxes[id].Timer) end
				end

			end, 80, 0)

		elseif source == EditBoxes[id].Down then
			
			move_count = 0
			move_speed = 1
			EditBoxes[id].IsMouseDowned = true

			EditBoxes[id].Timer = setTimer(function()
				
				move_count = move_count+1

				if move_count/5 == math.floor(move_count/5) then
					move_speed = move_speed+2
				end
				
				if EditBoxes[id].IsMouseDowned then
					click(false)
				else
					killTimer(EditBoxes[id].Timer)
				end

			end, 80, 0)

		end
	end)

	addEventHandler("onClientGUIChanged", EditBoxes[id].TextBox, function()

		if EditBoxes[id].Type == "number" then
			local text = EditBoxes[id].TextBox:getText() or ""

			if text == "" then
				text = tostring(EditBoxes[id].Minimal)
			elseif not tonumber(text) then
				text = tostring(EditBoxes[id].Current)
			end

			if tonumber(text) > EditBoxes[id].Maximal then
				text = tostring(EditBoxes[id].Maximal)
			elseif tonumber(text) < EditBoxes[id].Minimal then
				text = tostring(EditBoxes[id].Minimal)
			end
			EditBoxes[id].TextBox:setText(text)
			EditBoxes[id].Current = tonumber(text)
		end
	end, false)

	addEventHandler("onClientMouseWheel", root, function(upper)

		if source == EditBoxes[id].TextBox or source == EditBoxes[id].Up or source == EditBoxes[id].Down or source == EditBoxes[id].Edge then

			move_count = 0
			move_speed = 1
			if EditBoxes[id].Edge:getEnabled() then
				click(upper > 0)
			end

		end

	end)

	addEventHandler("onClientResourceStop", root, function(res)
		if res == getThisResource() then

			for i in pairs(EditBoxes[id]) do
				if isElement(EditBoxes[id][i]) then
					destroyElement(EditBoxes[id][i])
				end
				EditBoxes[id][i] = nil
			end
		end
	end)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Ending
	return EditBoxes[id]

end

local function guiCreateCustomMemo(x, y, w, h, text, relative, parent)
	return guiCreateCustomEdit(x, y, w, h, text, relative, parent, "memo")
end

local function guiCreateCustomNumberScroller(x, y, w, h, relative, parent)
	return guiCreateCustomEdit(x, y, w, h, "0", relative, parent, "number")
end


----------------------------------------------------------------------------------------------------------------------------------------------
--Set functions
local function ctbSetSize(textbox, w, h, rel)
	
	if rel then

		local sw, sh = Width, Height
		local parent = textbox.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		w = w*sw
		h = w*sh

	end

	textbox.Canvas:setSize(w, h, false)
	textbox.TextBox:setSize(w, h, false)

	textbox.Sides.Top:setSize(w, 5, false)
	textbox.Sides.Bottom:setSize(w, 3, false)
	textbox.Sides.Bottom:setPosition(0, h-3, false)

	textbox.Sides.Left:setSize(3, h, false)
	textbox.Sides.Right:setSize(3, h, false)
	textbox.Sides.Right:setPosition(w-3, 0, false)

	textbox.Edges.Top:setSize(w-6, 1, false)
	textbox.Edges.Bottom:setSize(w-6, 1, false)

	textbox.Edges.Left:setSize(1, h-8, false)
	textbox.Edges.Right:setSize(1, h-8, false)

	textbox.Edge:setPosition(w-52, 5, false)
	textbox.Edge:setSize(49, h-8, false)

	textbox.Up:setPosition(23, (h-8)/2 - 12.5, false)
	textbox.Down:setPosition(0, (h-8)/2 - 12.5, false)

	if textbox.Type == "number" then
		textbox.Edges.Top:setSize(w-55, 1, false)
		textbox.Edges.Bottom:setSize(w-55, 1, false)
		textbox.TextBox:setSize(w-52, h, false)
		textbox.Sides.Right:setPosition(w-55, 0, false)
		textbox.Edges.TopContinue:setPosition(w-52, 4, false)
		textbox.Edges.BottomContinue:setPosition(w-52, h-3, false)
		textbox.Edges.RightContinue:setPosition(w-1, 5, false)
		textbox.Edges.RightContinue:setSize(1, h-8, false)
	end

end

local function ctbSetPosition(textbox, x, y, rel)
	textbox.Canvas:setPosition(x, y, rel or false)
end

local function ctbSetVisible(textbox, boolean)
	return textbox.Canvas:setVisible(boolean)
end

local function ctbSetReadOnly(textbox, boolean)

	if textbox.Enabled then

		if boolean then

			bgcolor = "FFEEEEEE"
			if textbox.ColorScheme.DarkTheme then bgcolor = "FF555555" end

			textcol = "FF666666"
			if textbox.ColorScheme.DarkTheme then textcol = "FFAAAAAA" end

			textbox.Up:setProperty("ImageColours", string.format("tl:%s tr:%s bl:%s br:%s", textcol, textcol, textcol, textcol))
			textbox.Down:setProperty("ImageColours", string.format("tl:%s tr:%s bl:%s br:%s", textcol, textcol, textcol, textcol))
			
			if textbox.Type == "number" then
				textbox.Edge:setEnabled(false)
			end

			textbox.TextBox:setProperty("NormalTextColour", "FF"..textbox.ColorScheme.Main)
			textbox.TextBox:setProperty("ReadOnlyBGColour", bgcolor)

			textbox.TextBox:setProperty("ReadOnly", "True")

		else

			TextCol = "444444"
			if textbox.ColorScheme.DarkTheme then TextCol = "EEEEEE" end

			txtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TextCol, TextCol, TextCol, TextCol)

			textbox.TextBox:setProperty("NormalTextColour", "FF444444")
			textbox.TextBox:setProperty("ReadOnlyBGColour", "FFFFFFFF")

			textbox.Up:setProperty("ImageColours", txtcol)
			textbox.Down:setProperty("ImageColours", txtcol)
			
			if textbox.Type == "number" then
				textbox.Edge:setEnabled(true)
			end

			textbox.TextBox:setProperty("ReadOnly", "False")

		end

	end

	textbox.IsReadOnly = boolean

end

local function ctbSetEnabled(textbox, boolean)
	
	if not boolean then

		bgcolor = "FFF7F7F7"
		if textbox.ColorScheme.DarkTheme then bgcolor = "FF444444" end

		textcol = "FF666666"
		if textbox.ColorScheme.DarkTheme then textcol = "FFAAAAAA" end

		textbox.Up:setProperty("ImageColours", string.format("tl:%s tr:%s bl:%s br:%s", textcol, textcol, textcol, textcol))
		textbox.Down:setProperty("ImageColours", string.format("tl:%s tr:%s bl:%s br:%s", textcol, textcol, textcol, textcol))

		if textbox.Type == "number" then
			textbox.Edge:setEnabled(false)
		end

		textbox.TextBox:setProperty("NormalTextColour", textcol)
		textbox.TextBox:setProperty("ReadOnlyBGColour", bgcolor)

		textbox.TextBox:setEnabled(false)

	else

		TextCol = "444444"
		if textbox.ColorScheme.DarkTheme then TextCol = "EEEEEE" end

		txtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TextCol, TextCol, TextCol, TextCol)

		textbox.TextBox:setProperty("NormalTextColour", "FF444444")
		textbox.TextBox:setProperty("ReadOnlyBGColour", "FFFFFFFF")

		textbox.Up:setProperty("ImageColours", txtcol)
		textbox.Down:setProperty("ImageColours", txtcol)
		
		if textbox.Type == "number" then
			textbox.Edge:setEnabled(true)
		end
		
		textbox.TextBox:setEnabled(true)

	end

	textbox.Enabled = boolean

	if textbox.IsReadOnly and textbox.Enabled then
		ctbSetReadOnly(textbox, true)
	end
end

local function ctbSetMaxLength(textbox, len)
	return textbox.TextBox:setProperty("MaxTextLength", len)
end

local function ctbSetText(textbox, text)
	if textbox.Type == "number" then
		if not tonumber(text) or tonumber(text) < textbox.Minimal then
			text = tostring(textbox.Minimal)
		elseif tonumber(text) > textbox.Maximal then
			text = tostring(textbox.Maximal)
		end
	end
	return textbox.TextBox:setText(text)
end

local function ctbSetCaretIndex(textbox, index)
	return textbox.TextBox:setCaretIndex(index)
end

local function ctbSetMasked(textbox, boolean)
	return textbox.TextBox:setMasked(boolean)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Layering functions

local function ctbBringToFront(textbox)
	return textbox.Canvas:bringToFront()
end

local function ctbMoveToBack(textbox)
	return textbox.Canvas:moveToBack()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Get Functions

local function ctbGetSize(textbox, rel)
	return textbox.Canvas:getSize(rel or false)
end

local function ctbGetPosition(textbox, rel)
	return textbox.Canvas:getPosition(rel or false)
end

local function ctbGetVisible(textbox)
	return textbox.Canvas:getVisible()
end

local function ctbGetEnabled(textbox)
	return textbox.Enabled
end

local function ctbGetReadOnly(textbox)
	return textbox.IsReadOnly
end

local function ctbGetMaxLength(textbox)
	return textbox.TextBox:getProperty("MaxTextLength")
end

local function ctbGetText(textbox)
	return textbox.TextBox:getText()
end

local function ctbGetCaretIndex(textbox)
	return textbox.TextBox:getCaretIndex()
end

local function ctbGetMasked(textbox)
	return textbox.TextBox:getMasked()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Theme Functions

local function ctbSetColorScheme(textbox, scheme)

	textbox.ColorScheme = scheme

	WinColor, EdgeCol, TextCol = "EEEEEE", "CCCCCC", "444444"
	if textbox.ColorScheme.DarkTheme then WinColor, EdgeCol, TextCol = "444444", "333333", "EEEEEE" end

	frmcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", WinColor, WinColor, WinColor, WinColor)
	edgcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", EdgeCol, EdgeCol, EdgeCol, EdgeCol)
	txtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TextCol, TextCol, TextCol, TextCol)

	textbox.Canvas:setProperty("ImageColours", frmcol)
	textbox.Up:setProperty("ImageColours", txtcol)
	textbox.Down:setProperty("ImageColours", txtcol)
	textbox.TextBox:setProperty("ActiveSelectionColour", "FF"..textbox.ColorScheme.Main)

	for _, v in pairs(textbox.Sides) do
		v:setProperty("ImageColours", frmcol)
		v:setEnabled(false)
	end

	for _, v in pairs(textbox.Edges) do
		v:setProperty("ImageColours", edgcol)
		v:setEnabled(false)
	end

	ctbSetReadOnly(textbox, ctbGetReadOnly(textbox))
	ctbSetEnabled(textbox, ctbGetEnabled(textbox))

end

----------------------------------------------------------------------------------------------------------------------------------------------
--Event Functions

local function ctbAddEvent(textbox, event, func)
	addEventHandler(event, root, function(...)
		if source == textbox.TextBox or source == textbox.Up or source == textbox.Down or source == textbox.Edges then
			func(...)
		end
	end)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--OOP Functions
CustomEdit = {}
CustomEdit.__index = CustomEdit

function CustomEdit.create(...)
	local self = setmetatable({}, CustomEdit)
	self.Box = guiCreateCustomEdit(...)
	return self
end

function CustomEdit.setPosition(self, ...) return ctbSetPosition(self.Box, ...) end
function CustomEdit.setSize(self, ...) return ctbSetSize(self.Box, ...) end
function CustomEdit.setVisible(self, ...) return ctbSetVisible(self.Box, ...) end
function CustomEdit.setEnabled(self, ...) return ctbSetEnabled(self.Box, ...) end
function CustomEdit.setReadOnly(self, ...) return ctbSetReadOnly(self.Box, ...) end
function CustomEdit.setMaxLength(self, ...) return ctbSetMaxLength(self.Box, ...) end
function CustomEdit.setText(self, ...) return ctbSetText(self.Box, ...) end
function CustomEdit.setCaretIndex(self, ...) return ctbSetCaretIndex(self.Box, ...) end
function CustomEdit.setMasked(self, ...) return ctbSetMasked(self.Box, ...) end

function CustomEdit.bringToFront(self) return ctbBringToFront(self.Box) end
function CustomEdit.moveToBack(self) return ctbMoveToBack(self.Box) end

function CustomEdit.getPosition(self, ...) return ctbGetPosition(self.Box, ...) end
function CustomEdit.getSize(self, ...) return ctbGetSize(self.Box, ...) end
function CustomEdit.getVisible(self, ...) return ctbGetVisible(self.Box, ...) end
function CustomEdit.getEnabled(self, ...) return ctbGetEnabled(self.Box, ...) end
function CustomEdit.getReadOnly(self, ...) return ctbGetReadOnly(self.Box, ...) end
function CustomEdit.getMaxLength(self, ...) return ctbGetMaxLength(self.Box, ...) end
function CustomEdit.getText(self, ...) return ctbGetText(self.Box, ...) end
function CustomEdit.getCaretIndex(self, ...) return ctbGetCaretIndex(self.Box, ...) end
function CustomEdit.getMasked(self, ...) return ctbGetMasked(self.Box, ...) end

function CustomEdit.setColorScheme(self, ...) return ctbSetColorScheme(self.Box, ...) end

function CustomEdit.addEvent(self, ...) return ctbAddEvent(self.Box, ...) end


CustomMemo = {}
CustomMemo.__index = CustomMemo

function CustomMemo.create(...)
	local self = setmetatable({}, CustomMemo)
	self.Box = guiCreateCustomMemo(...)
	return self
end

function CustomMemo.setPosition(self, ...) return ctbSetPosition(self.Box, ...) end
function CustomMemo.setSize(self, ...) return ctbSetSize(self.Box, ...) end
function CustomMemo.setVisible(self, ...) return ctbSetVisible(self.Box, ...) end
function CustomMemo.setEnabled(self, ...) return ctbSetEnabled(self.Box, ...) end
function CustomMemo.setReadOnly(self, ...) return ctbSetReadOnly(self.Box, ...) end
function CustomMemo.setText(self, ...) return ctbSetText(self.Box, ...) end
function CustomMemo.setCaretIndex(self, ...) return ctbSetCaretIndex(self.Box, ...) end

function CustomMemo.bringToFront(self) return ctbBringToFront(self.Box) end
function CustomMemo.moveToBack(self) return ctbMoveToBack(self.Box) end

function CustomMemo.getPosition(self, ...) return ctbGetPosition(self.Box, ...) end
function CustomMemo.getSize(self, ...) return ctbGetSize(self.Box, ...) end
function CustomMemo.getVisible(self, ...) return ctbGetVisible(self.Box, ...) end
function CustomMemo.getEnabled(self, ...) return ctbGetEnabled(self.Box, ...) end
function CustomMemo.getReadOnly(self, ...) return ctbGetReadOnly(self.Box, ...) end
function CustomMemo.getText(self, ...) return ctbGetText(self.Box, ...) end
function CustomMemo.getCaretIndex(self, ...) return ctbGetCaretIndex(self.Box, ...) end

function CustomMemo.setColorScheme(self, ...) return ctbSetColorScheme(self.Box, ...) end

function CustomMemo.addEvent(self, ...) return ctbAddEvent(self.Box, ...) end


CustomNumberScroller = {}
CustomNumberScroller.__index = CustomNumberScroller

function CustomNumberScroller.create(...)
	local self = setmetatable({}, CustomNumberScroller)
	self.Box = guiCreateCustomNumberScroller(...)
	return self
end

function CustomNumberScroller.setPosition(self, ...) return ctbSetPosition(self.Box, ...) end
function CustomNumberScroller.setSize(self, ...) return ctbSetSize(self.Box, ...) end
function CustomNumberScroller.setVisible(self, ...) return ctbSetVisible(self.Box, ...) end
function CustomNumberScroller.setEnabled(self, ...) return ctbSetEnabled(self.Box, ...) end
function CustomNumberScroller.setReadOnly(self, ...) return ctbSetReadOnly(self.Box, ...) end
function CustomNumberScroller.setText(self, ...) return ctbSetText(self.Box, ...) end
function CustomNumberScroller.setCaretIndex(self, ...) return ctbSetCaretIndex(self.Box, ...) end

function CustomNumberScroller.bringToFront(self) return ctbBringToFront(self.Box) end
function CustomNumberScroller.moveToBack(self) return ctbMoveToBack(self.Box) end

function CustomNumberScroller.getPosition(self, ...) return ctbGetPosition(self.Box, ...) end
function CustomNumberScroller.getSize(self, ...) return ctbGetSize(self.Box, ...) end
function CustomNumberScroller.getVisible(self, ...) return ctbGetVisible(self.Box, ...) end
function CustomNumberScroller.getEnabled(self, ...) return ctbGetEnabled(self.Box, ...) end
function CustomNumberScroller.getReadOnly(self, ...) return ctbGetReadOnly(self.Box, ...) end
function CustomNumberScroller.getText(self, ...) return ctbGetText(self.Box, ...) end
function CustomNumberScroller.getCaretIndex(self, ...) return ctbGetCaretIndex(self.Box, ...) end

function CustomNumberScroller.setColorScheme(self, ...) return ctbSetColorScheme(self.Box, ...) end

function CustomNumberScroller.addEvent(self, ...) return ctbAddEvent(self.Box, ...) end

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------CheckBoxes-------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

local CheckBoxes = {}

local function guiCreateCustomCheckBox(x, y, w, h, text, rel, parent)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Counting IDs and coordinates

	local id = #CheckBoxes+1

	if relative then

		local sw, sh = Width, Height
		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		else
			parent = nil
		end

		x = x*sw
		y = y*sh
		w = w*sw
		h = h*sh

	else

		x = math.floor(x)
		y = math.floor(y)
		w = math.floor(w)
		h = math.floor(h)

	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Main

	CheckBoxes[id] = {}
	CheckBoxes[id].ColorScheme = DefaultColors
	CheckBoxes[id].Canvas = GuiStaticImage.create(x, y, w, h, pane, false, parent)
	CheckBoxes[id].Label = GuiLabel.create(0, 0, w-44, h, text, false, CheckBoxes[id].Canvas)

	CheckBoxes[id].Main = GuiStaticImage.create(w-42, (h/2)-10, 40, 20, Images.Check, false, CheckBoxes[id].Canvas)

	CheckBoxes[id].Entrail = GuiStaticImage.create(0, 0, 20, 20, Images.Round, false, CheckBoxes[id].Main)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Properties
	CheckBoxes[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	--CheckBoxes[id].Main:setProperty("ImageColours", "tl:FFF3F3F3 tr:FFF3F3F3 bl:FFF3F3F3 br:FFF3F3F3")
	CheckBoxes[id].Entrail:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", CheckBoxes[id].ColorScheme.RedLight, CheckBoxes[id].ColorScheme.RedLight, CheckBoxes[id].ColorScheme.Red, CheckBoxes[id].ColorScheme.Red))

	BackColor = "FFFFFF"
	if CheckBoxes[id].ColorScheme.DarkTheme then BackColor = "666666" end

	TextColor = "555555"
	if CheckBoxes[id].ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

	CheckBoxes[id].Main:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackColor, BackColor, BackColor, BackColor))

	CheckBoxes[id].Label:setFont(GuiFont.create(Fonts.OpenSansRegular, 9))
	CheckBoxes[id].Label:setColor(fromHEXToRGB(TextColor))
	CheckBoxes[id].Label:setVerticalAlign("center")

	CheckBoxes[id].State = false
	CheckBoxes[id].Moving = false
	CheckBoxes[id].LocalPosition = {X=0, DX=0}
	CheckBoxes[id].PhysicalPosition = {X=0}
	CheckBoxes[id].Animation = 0 -- 1 - open, 2 - close

	------------------------------------------------------------------------------------------------------------------------------------------
	--Events

	CheckBoxes[id].moveRight = function()
		CheckBoxes[id].State = true
		CheckBoxes[id].Animation = 1
	end
	CheckBoxes[id].moveLeft = function()
		CheckBoxes[id].State = false
		CheckBoxes[id].Animation = 2
	end

	addEventHandler("onClientMouseEnter", root, function()
		if source == CheckBoxes[id].Entrail or source == CheckBoxes[id].Main or source == CheckBoxes[id].Label then
			CheckBoxes[id].Label:setColor(fromHEXToRGB(CheckBoxes[id].ColorScheme.Main))
		end
	end)

	addEventHandler("onClientMouseLeave", root, function()
		if CheckBoxes[id].Canvas:getEnabled() then

			TextColor = "555555"
			if CheckBoxes[id].ColorScheme.DarkTheme then TextColor = "EEEEEE" end 
			
			CheckBoxes[id].Label:setColor(fromHEXToRGB(TextColor))
		end
	end)

	addEventHandler("onClientGUIClick", root, function()
		if source == CheckBoxes[id].Entrail or source == CheckBoxes[id].Main or source == CheckBoxes[id].Label then
			local x = CheckBoxes[id].Entrail:getPosition(false)
			if x >= 15 then CheckBoxes[id].moveLeft()
			else CheckBoxes[id].moveRight() end
		end
	end)

	addEventHandler("onClientRender", root, function()
		if CheckBoxes[id].Animation == 1 then
			local x = CheckBoxes[id].Entrail:getPosition(false)

			x = x+8
			if x > 20 then x = 20 end
			CheckBoxes[id].Entrail:setPosition(x, 0, false)

			CheckBoxes[id].LocalPosition.X = x
			CheckBoxes[id].LocalPosition.DX = x
			CheckBoxes[id].PhysicalPosition.X = x

			local sx = CheckBoxes[id].Entrail:getPosition(false)
			local swidth, sheight, slen = 40, 25, 20
			local max_dif = swidth-slen

			if CheckBoxes[id].Canvas:getEnabled() then
				local r, g, b = fromHEXToRGB(CheckBoxes[id].ColorScheme.RedLight)
				local ar, ag, ab = fromHEXToRGB(CheckBoxes[id].ColorScheme.GreenLight)

				local onePercR = sx*math.abs(r-ar)/max_dif
				if r > ar then r = r-onePercR else r = r+onePercR end

				local onePercG = sx*math.abs(g-ag)/max_dif
				if g > ag then g = g-onePercG else g = g+onePercG end

				local onePercB = sx*math.abs(b-ab)/max_dif
				if b > ab then b = b-onePercB else b = b+onePercB end

				local topCol = fromRGBToHEX(r, g, b)

				r, g, b = fromHEXToRGB(CheckBoxes[id].ColorScheme.Red)
				ar, ag, ab = fromHEXToRGB(CheckBoxes[id].ColorScheme.Green)

				onePercR = sx*math.abs(r-ar)/max_dif
				if r > ar then r = r-onePercR else r = r+onePercR end

				onePercG = sx*math.abs(g-ag)/max_dif
				if g > ag then g = g-onePercG else g = g+onePercG end

				onePercB = sx*math.abs(b-ab)/max_dif
				if b > ab then b = b-onePercB else b = b+onePercB end

				local botCol = fromRGBToHEX(r, g, b)

				CheckBoxes[id].Entrail:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", topCol, topCol, botCol, botCol))
			end

			if x == 30 then
				CheckBoxes[id].Animation = 0
			end

		elseif CheckBoxes[id].Animation == 2 then
			
			local x = CheckBoxes[id].Entrail:getPosition(false)

			x = x-8
			if x < 0 then x = 0 end
			CheckBoxes[id].Entrail:setPosition(x, 0, false)

			CheckBoxes[id].LocalPosition.X = x
			CheckBoxes[id].LocalPosition.DX = x
			CheckBoxes[id].PhysicalPosition.X = x

			local sx = CheckBoxes[id].Entrail:getPosition(false)
			local swidth, sheight, slen = 40, 25, 20
			local max_dif = swidth-slen

			if CheckBoxes[id].Canvas:getEnabled() then
				local r, g, b = fromHEXToRGB(CheckBoxes[id].ColorScheme.RedLight)
				local ar, ag, ab = fromHEXToRGB(CheckBoxes[id].ColorScheme.GreenLight)

				local onePercR = sx*math.abs(r-ar)/max_dif
				if r > ar then r = r-onePercR else r = r+onePercR end

				local onePercG = sx*math.abs(g-ag)/max_dif
				if g > ag then g = g-onePercG else g = g+onePercG end

				local onePercB = sx*math.abs(b-ab)/max_dif
				if b > ab then b = b-onePercB else b = b+onePercB end

				local topCol = fromRGBToHEX(r, g, b)

				r, g, b = fromHEXToRGB(CheckBoxes[id].ColorScheme.Red)
				ar, ag, ab = fromHEXToRGB(CheckBoxes[id].ColorScheme.Green)

				onePercR = sx*math.abs(r-ar)/max_dif
				if r > ar then r = r-onePercR else r = r+onePercR end

				onePercG = sx*math.abs(g-ag)/max_dif
				if g > ag then g = g-onePercG else g = g+onePercG end

				onePercB = sx*math.abs(b-ab)/max_dif
				if b > ab then b = b-onePercB else b = b+onePercB end

				local botCol = fromRGBToHEX(r, g, b)

				CheckBoxes[id].Entrail:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", topCol, topCol, botCol, botCol))
			end

			if x == 0 then
				CheckBoxes[id].Animation = 0
			end
		end

	end)

	addEventHandler("onClientGUIMouseDown", root, function(button, ax, ay)
		if button == "left" and source == CheckBoxes[id].Entrail then

			CheckBoxes[id].LocalPosition.DX = ax 

			CheckBoxes[id].PhysicalPosition.X = CheckBoxes[id].Entrail:getPosition(false)
			CheckBoxes[id].LocalPosition.X = CheckBoxes[id].Entrail:getPosition(false)
			
			CheckBoxes[id].Moving = true
			CheckBoxes[id].Animation = 0
			BackForMouse:setVisible(true)
		end
	end)

	addEventHandler("onClientGUIMouseUp", root, function()
		
		if CheckBoxes[id].Moving then
			local x = CheckBoxes[id].Entrail:getPosition(false)
			if x <= 15 then CheckBoxes[id].moveLeft()
			else CheckBoxes[id].moveRight() end
		end

		CheckBoxes[id].LocalPosition.X = CheckBoxes[id].PhysicalPosition.X
		CheckBoxes[id].Moving = false
		BackForMouse:setVisible(false)

	end)

	addEventHandler("onClientCursorMove", root, function(_, _, x, y)

		if CheckBoxes[id].Moving then
				
			local difX = CheckBoxes[id].LocalPosition.DX-x
			local sx = CheckBoxes[id].LocalPosition.X
			local ax = sx

			local swidth, sheight, slen = 40, 25, 20
			local max_dif = swidth-slen
			sx = sx-difX
			ax = sx

			if sx < 0 then sx = 0 end
			if sx > max_dif then sx = max_dif end


			if CheckBoxes[id].Canvas:getEnabled() then
				local r, g, b = fromHEXToRGB(CheckBoxes[id].ColorScheme.RedLight)
				local ar, ag, ab = fromHEXToRGB(CheckBoxes[id].ColorScheme.GreenLight)

				local onePercR = sx*math.abs(r-ar)/max_dif
				if r > ar then r = r-onePercR else r = r+onePercR end

				local onePercG = sx*math.abs(g-ag)/max_dif
				if g > ag then g = g-onePercG else g = g+onePercG end

				local onePercB = sx*math.abs(b-ab)/max_dif
				if b > ab then b = b-onePercB else b = b+onePercB end

				local topCol = fromRGBToHEX(r, g, b)

				r, g, b = fromHEXToRGB(CheckBoxes[id].ColorScheme.Red)
				ar, ag, ab = fromHEXToRGB(CheckBoxes[id].ColorScheme.Green)

				onePercR = sx*math.abs(r-ar)/max_dif
				if r > ar then r = r-onePercR else r = r+onePercR end

				onePercG = sx*math.abs(g-ag)/max_dif
				if g > ag then g = g-onePercG else g = g+onePercG end

				onePercB = sx*math.abs(b-ab)/max_dif
				if b > ab then b = b-onePercB else b = b+onePercB end

				local botCol = fromRGBToHEX(r, g, b)

				CheckBoxes[id].Entrail:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", topCol, topCol, botCol, botCol))
			end

			CheckBoxes[id].LocalPosition.X = ax
			CheckBoxes[id].LocalPosition.DX = x
			CheckBoxes[id].PhysicalPosition.X = sx

			CheckBoxes[id].Entrail:setPosition(sx, 0, false)

		end

	end)

	addEventHandler("onClientResourceStop", root, function(res)
		if res == getThisResource() then

			for i in pairs(CheckBoxes[id]) do
				if isElement(CheckBoxes[id][i]) then
					destroyElement(CheckBoxes[id][i])
				end
				CheckBoxes[id][i] = nil
			end
		end
	end)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Ending
	return CheckBoxes[id]
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Set functions

local function ccbSetText(checkbox, text)
	checkbox.Label:setText(text)
end

local function ccbSetPosition(checkbox, x, y, rel)
	checkbox.Canvas:setPosition(x, y, rel or false)
end

local function ccbSetSize(checkbox, w, h, rel)
		
	if rel then

		local sw, sh = Width, Height
		local parent = checkbox.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		w = w*sw
		h = h*sh

	end

	checkbox.Canvas:setSize(w, h, false)
	checkbox.Label:setSize(w-44, h, false)
	checkbox.Main:setPosition(w-42, (h/2)-10, false)

end

local function ccbSetVisible(checkbox, bool)
	checkbox.Canvas:setVisible(bool or false)
end

local function ccbSetEnabled(checkbox, bool)
	checkbox.Canvas:setEnabled(bool or false)

	if bool then
		local color = checkbox.State and checkbox.ColorScheme.GreenLight or checkbox.ColorScheme.RedLight
		local color2 = checkbox.State and checkbox.ColorScheme.Green or checkbox.ColorScheme.Red

		BackColor = "FFFFFF"
		if checkbox.ColorScheme.DarkTheme then BackColor = "666666" end
		
		TextColor = "555555"
		if checkbox.ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

		checkbox.Entrail:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", color, color, color2, color2))
		checkbox.Main:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackColor, BackColor, BackColor, BackColor))
		checkbox.Label:setColor(fromHEXToRGB(TextColor))

	else
		checkbox.Entrail:setProperty("ImageColours", "tl:FFBBBBBB tr:FFBBBBBB bl:FFAAAAAA br:FFAAAAAA")
		checkbox.Main:setProperty("ImageColours", "tl:FFDDDDDD tr:FFDDDDDD bl:FFDDDDDD br:FFDDDDDD")
		checkbox.Label:setColor(fromHEXToRGB("999999"))		
	end
end

local function ccbSetChecked(checkbox, bool)
	if not bool then checkbox.moveLeft()
	else checkbox.moveRight() end
end
----------------------------------------------------------------------------------------------------------------------------------------------
--Layering functions

local function ccbBringToFront(checkbox)
	return checkbox.Canvas:bringToFront()
end

local function ccbMoveToBack(checkbox)
	return checkbox.Canvas:moveToBack()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Get functions

local function ccbGetText(checkbox)
	return checkbox.Label:getText()
end

local function ccbGetPosition(checkbox, rel)
	return checkbox.Canvas:getPosition(rel or false)
end

local function ccbGetSize(checkbox, rel)
	return checkbox.Canvas:getSize(rel or false)
end

local function ccbGetVisible(checkbox)
	return checkbox.Canvas:getVisible()
end

local function ccbGetEnabled(checkbox)
	return checkbox.Canvas:getEnabled()
end

local function ccbGetChecked(checkbox)
	return checkbox.State
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Theme function

local function ccbSetColorScheme(checkbox, scheme)

	checkbox.ColorScheme = scheme

	ccbSetEnabled(checkbox, ccbGetEnabled(checkbox))

end

----------------------------------------------------------------------------------------------------------------------------------------------
--Event Functions

local function ccbAddEvent(checkbox, event, func)
	addEventHandler(event, root, function(...)
		if source == checkbox.Entrail or source == checkbox.Main or source == checkbox.Label then
			func(...)
		end
	end)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--OOP functions

CustomCheckBox = {}
CustomCheckBox.__index = CustomCheckBox

function CustomCheckBox.create(...)
	local self = setmetatable({}, CustomCheckBox)
	self.CheckBox = guiCreateCustomCheckBox(...)
	return self
end

function CustomCheckBox.setText(self, ...) return ccbSetText(self.CheckBox, ...) end
function CustomCheckBox.setPosition(self, ...) return ccbSetPosition(self.CheckBox, ...) end
function CustomCheckBox.setSize(self, ...) return ccbSetSize(self.CheckBox, ...) end
function CustomCheckBox.setVisible(self, ...) return ccbSetVisible(self.CheckBox, ...) end
function CustomCheckBox.setEnabled(self, ...) return ccbSetEnabled(self.CheckBox, ...) end
function CustomCheckBox.setChecked(self, ...) return ccbSetChecked(self.CheckBox, ...) end

function CustomCheckBox.bringToFront(self) return ccbBringToFront(self.CheckBox) end
function CustomCheckBox.moveToBack(self) return ccbMoveToBack(self.CheckBox) end

function CustomCheckBox.getText(self, ...) return ccbGetText(self.CheckBox, ...) end
function CustomCheckBox.getPosition(self, ...) return ccbGetPosition(self.CheckBox, ...) end
function CustomCheckBox.getSize(self, ...) return ccbGetSize(self.CheckBox, ...) end
function CustomCheckBox.getVisible(self, ...) return ccbGetVisible(self.CheckBox, ...) end
function CustomCheckBox.getEnabled(self, ...) return ccbGetEnabled(self.CheckBox, ...) end
function CustomCheckBox.getChecked(self, ...) return ccbGetChecked(self.CheckBox, ...) end

function CustomCheckBox.setColorScheme(self, ...) return ccbSetColorScheme(self.CheckBox, ...) end

function CustomCheckBox.addEvent(self, ...) return ccbAddEvent(self.CheckBox, ...) end

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------ComboBoxes-------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

ComboBoxes = {}
local function guiCreateCustomComboBox(x, y, w, h, text, relative, parent)
	
	------------------------------------------------------------------------------------------------------------------------------------------
	--Counting IDs and coordinates
	local id = #ComboBoxes+1

	if relative then

		local sw, sh = Width, Height
		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		else
			parent = nil
		end

		x = x*sw
		y = y*sh
		w = w*sw
		h = h*sh

	else

		x = math.floor(x)
		y = math.floor(y)
		w = math.floor(w)
		h = math.floor(h)

	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Main

	ComboBoxes[id] = {}
	ComboBoxes[id].Canvas = GuiStaticImage.create(x-1, y-1, w+2, h+2, pane, false, parent)
	ComboBoxes[id].ColorScheme = DefaultColors

	ComboBoxes[id].Vertical = GuiStaticImage.create(1, 0, w, h+2, pane, false, ComboBoxes[id].Canvas)
	ComboBoxes[id].Horizontal = GuiStaticImage.create(0, 1, w+2, h, pane, false, ComboBoxes[id].Canvas)

	ComboBoxes[id].Main = GuiStaticImage.create(1, 1, w, h, pane, false, ComboBoxes[id].Canvas)
	ComboBoxes[id].Label = GuiLabel.create(0, 0, w-25, h-2, text, false, ComboBoxes[id].Main)
	ComboBoxes[id].Arrow = GuiStaticImage.create(w-25, (h/2)-12, 25, 25, Images.Down, false, ComboBoxes[id].Main)

	ComboBoxes[id].List = {}

	ComboBoxes[id].List.Canvas = GuiStaticImage.create(0, 0, w+2, h+2, pane, false)
	ComboBoxes[id].List.Vertical = GuiStaticImage.create(1, 0, w, h+2, pane, false, ComboBoxes[id].List.Canvas)
	ComboBoxes[id].List.Horizontal = GuiStaticImage.create(0, 1, w+2, h, pane, false, ComboBoxes[id].List.Canvas)

	ComboBoxes[id].List.Main = GuiStaticImage.create(1, 1, w, h, pane, false, ComboBoxes[id].List.Canvas)

	ComboBoxes[id].Entrail = ScrollMenu.create(0, 0, w, h, false, ComboBoxes[id].List.Main)
	
	ComboBoxes[id].List.Items = {}

	------------------------------------------------------------------------------------------------------------------------------------------
	--Properties

	TopCol, BotCol, BackCol = "FFFFFF", "EEEEEE", "CCCCCC"
	if ComboBoxes[id].ColorScheme.DarkTheme then TopCol, BotCol, BackCol = "555555", "444444", "333333" end

	TextColor = "444444"
	if ComboBoxes[id].ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

	ButCol = "555555"
	if ComboBoxes[id].ColorScheme.DarkTheme then ButCol = "EEEEEE" end 

	LMainCol = "F7F7F7"
	if ComboBoxes[id].ColorScheme.DarkTheme then LMainCol = "505050" end 

	btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)
	fbtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)
	arrcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ButCol, ButCol, ButCol, ButCol)
	lmncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", LMainCol, LMainCol, LMainCol, LMainCol)

	ComboBoxes[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	ComboBoxes[id].List.Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")

	ComboBoxes[id].Main:setProperty("ImageColours", btncol)
	ComboBoxes[id].List.Main:setProperty("ImageColours", lmncol)

	ComboBoxes[id].Vertical:setProperty("ImageColours", fbtcol)
	ComboBoxes[id].Horizontal:setProperty("ImageColours", fbtcol)
	ComboBoxes[id].List.Vertical:setProperty("ImageColours", "tl:44000000 tr:44000000 bl:44000000 br:44000000")
	ComboBoxes[id].List.Horizontal:setProperty("ImageColours", "tl:44000000 tr:44000000 bl:44000000 br:44000000")

	ComboBoxes[id].Label:setFont(GuiFont.create(Fonts.OpenSansRegular, 9))
	ComboBoxes[id].Label:setHorizontalAlign("center")
	ComboBoxes[id].Label:setVerticalAlign("center")
	ComboBoxes[id].Label:setColor(fromHEXToRGB(TextColor))

	ComboBoxes[id].Arrow:setProperty("ImageColours", arrcol)

	ComboBoxes[id].Vertical:setEnabled(false)
	ComboBoxes[id].Horizontal:setEnabled(false)

	ComboBoxes[id].Label:setEnabled(false)
	ComboBoxes[id].Arrow:setEnabled(false)

	ComboBoxes[id].List.Canvas:setVisible(false)
	ComboBoxes[id].List.Vertical:setEnabled(false)
	ComboBoxes[id].List.Horizontal:setEnabled(false)

	ComboBoxes[id].List.Canvas:setProperty("AlwaysOnTop", "True")

	ComboBoxes[id].Height = h*3.5
	ComboBoxes[id].Elements = 0
	ComboBoxes[id].ButtonHeight = h
	ComboBoxes[id].Animation = 0 --1 -- open, 2 -- close
	ComboBoxes[id].DefaultText = text

	ComboBoxes[id].setComboSize = function(h)
		local w = ComboBoxes[id].Main:getSize(false)
		ComboBoxes[id].List.Canvas:setSize(w+2, h+2, false)
		ComboBoxes[id].List.Vertical:setSize(w, h+2, false)
		ComboBoxes[id].List.Horizontal:setSize(w+2, h, false)
		ComboBoxes[id].List.Main:setSize(w, h, false)
	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Events
	ComboBoxes[id].Opened = false

	addEventHandler("onClientMouseEnter", root, function()

		if source == ComboBoxes[id].Main then
			ComboBoxes[id].Label:setColor(fromHEXToRGB(ComboBoxes[id].ColorScheme.Main))
			ComboBoxes[id].Arrow:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main))
		end

		TextColor = "444444"
		if ComboBoxes[id].ColorScheme.DarkTheme then TextColor = "EEEEEE" end

		for _, v in pairs(ComboBoxes[id].List.Items) do
			if source == v.Canvas then
				v.Label:setColor(fromHEXToRGB("FFFFFF"))
				v.Canvas:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main))
			else
				v.Label:setColor(fromHEXToRGB(TextColor))
				v.Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
			
			end
		end
	end)
	
	addEventHandler("onClientMouseLeave", root, function()

		if ComboBoxes[id].Canvas:getEnabled() then

			ButCol = "555555"
			if ComboBoxes[id].ColorScheme.DarkTheme then ButCol = "EEEEEE" end 
			
			TextColor = "444444"
			if ComboBoxes[id].ColorScheme.DarkTheme then TextColor = "EEEEEE" end
			
			arrcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ButCol, ButCol, ButCol, ButCol)
		
			ComboBoxes[id].Label:setColor(fromHEXToRGB(TextColor))
			ComboBoxes[id].Arrow:setProperty("ImageColours", arrcol)
		end
	end)

	addEventHandler("onClientGUIClick", root, function()

		if ComboBoxes[id].Canvas:getEnabled() then
			for _, v in pairs(ComboBoxes[id].List.Items) do

				if source == v.Canvas then
					ComboBoxes[id].Label:setText(v.Text)

					for _, val in pairs(ComboBoxes[id].List.Items) do
						val.Selected = false
						val.Mark:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
					end

					v.Selected = true
					v.Mark:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main, ComboBoxes[id].ColorScheme.Main)) 
				end
			end
		end

	end)

	addEventHandler("onClientGUIClick", root, function()
		if source == ComboBoxes[id].Main and not ComboBoxes[id].Opened then
		
			local x, y = guiGetOnScreenPosition(ComboBoxes[id].Canvas)
			ComboBoxes[id].List.Canvas:setPosition(x, y, false)
			ComboBoxes[id].List.Canvas:setVisible(true)
			ComboBoxes[id].setComboSize(1)
			ComboBoxes[id].Animation = 1	
			ComboBoxes[id].Opened = true	
		
		else
			local mheight = math.min(ComboBoxes[id].Elements*30 + 1, ComboBoxes[id].Height)
			ComboBoxes[id].Opened = false
			ComboBoxes[id].setComboSize(mheight)
			ComboBoxes[id].Animation = 2
		end
	end)

	addEventHandler("onClientRender", root, function()
		if ComboBoxes[id].Animation == 1 then

			local mheight = math.min(ComboBoxes[id].Elements*30 + 1, ComboBoxes[id].Height)
			local w, h = ComboBoxes[id].List.Main:getSize(false)
			h = h+(mheight/8)
			
			if h >= mheight then h = mheight end
			ComboBoxes[id].setComboSize(h)
			
			if h == mheight then
				ComboBoxes[id].Animation = 0
			end
		
		elseif ComboBoxes[id].Animation == 2 then

			local mheight = math.min(ComboBoxes[id].Elements*30 + 1, ComboBoxes[id].Height)
			local w, h = ComboBoxes[id].List.Main:getSize(false)
			h = h-(mheight/8)
		
			if h <= 1 then h = 1 end
			ComboBoxes[id].setComboSize(h)
		
			if h == 1 then
				ComboBoxes[id].Animation = 0
				ComboBoxes[id].List.Canvas:setVisible(false)
			end
		
		end
	end)

	addEventHandler("onClientResourceStop", root, function(res)
		if res == getThisResource() then

			for i in pairs(ComboBoxes[id]) do
				if isElement(ComboBoxes[id][i]) then
					destroyElement(ComboBoxes[id][i])
				end
				ComboBoxes[id][i] = nil
			end
		end
	end)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Ending
	return ComboBoxes[id]
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Set functions

local function clbSetMaxHeight(combo, h)
	combo.Height = h
	local w = combo.Main:getSize(false)

	combo.Entrail:setSize(w, combo.Height)
end

local function clbAddItem(combo, text)

	local w = combo.Main:getSize(false)

	combo.Elements = combo.Elements+1
	combo.Entrail:setSize(w, combo.Height)

	local id = #combo.List.Items+1
	combo.List.Items[id] = {}

	combo.List.Items[id].Text = text
	combo.List.Items[id].Selected = false

	combo.List.Items[id].Canvas = GuiStaticImage.create(0, (id-1)*30, w, 30, pane, false, combo.Entrail.Menu)
	combo.List.Items[id].Label = GuiLabel.create(8, 0, w-8, 28, text, false, combo.List.Items[id].Canvas)
	combo.List.Items[id].Mark = GuiStaticImage.create(0, 0, 5, 30, pane, false, combo.List.Items[id].Canvas)

	combo.List.Items[id].Label:setEnabled(false)
	combo.List.Items[id].Mark:setEnabled(false)

	TextColor = "444444"
	if combo.ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

	combo.List.Items[id].Label:setFont(GuiFont.create(Fonts.OpenSansRegular, 9))
	combo.List.Items[id].Label:setVerticalAlign("center")
	combo.List.Items[id].Label:setColor(fromHEXToRGB(TextColor))

	combo.List.Items[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	combo.List.Items[id].Mark:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")

	combo.Entrail:addElement(combo.List.Items[id].Canvas)
	combo.Entrail:addScrollElement(combo.List.Items[id].Canvas, "y")

	return combo.List.Items[id]
end

local function clbRemoveItem(combo, item)

	local visited = false
	for i = #combo.List.Items, 1, -1 do
	--for i, v in ipairs(combo.List.Items) do
		local v = combo.List.Items[i]
		if item == v or item == v.Text then
			destroyElement(v.Label)
			destroyElement(v.Mark)
			destroyElement(v.Canvas)
			table.remove(combo.List.Items, i)
		end
	end
	local w = combo.Entrail.Menu:getSize(false)
	combo.Entrail.Menu:setSize(w, 1, false)

	for i, v in pairs(combo.List.Items) do
		v.Canvas:setPosition(0, 30*(i-1), false)
		combo.Entrail:addElement(v.Canvas)
		--combo.Entrail:addScrollElement(v.Canvas, "y")
	end
end

local function clbSetSelectedItem(combo, item)

	local visited = false
	for _, v in pairs(combo.List.Items) do

		if item == v or item == v.Text then

			local text = (item == v) and item.Text or item
			combo.Label:setText(text)
			v.Selected = true
			visited = true

		else
			v.Selected = false
		end
	
		if v.Selected then
			v.Mark:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", combo.ColorScheme.Main, combo.ColorScheme.Main, combo.ColorScheme.Main, combo.ColorScheme.Main)) 
		else
			v.Mark:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
		end
	end
	if not visited then
		combo.Label:setText(combo.DefaultText)
	end
end

local function clbSetPosition(combo, x, y, rel)
	return combo.Canvas:setPosition(x, y, rel)
end

local function clbSetSize(combo, w, h, rel)
		
	if rel then

		local sw, sh = Width, Height
		local parent = combo.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		w = w*sw
		h = h*sh

	end

	combo.Canvas:setSize(w+2, h+2, false)
	combo.Vertical:setSize(w, h+2, false)
	combo.Horizontal:setSize(w+2, h, false)
	combo.Main:setSize(w, h, false)
	combo.Label:setSize(w-25, h-2, false)
	combo.Arrow:setPosition(w-25, (h/2)-12, false)

	local sh = combo.Height
	combo.List.Canvas:setSize(w+2, sh+2, false)
	combo.List.Vertical:setSize(w, sh+2, false)
	combo.List.Horizontal:setSize(w+2, sh, false)
	combo.List.Main:setSize(w, sh, false)
	combo.Entrail:setSize(w, sh, false)

	for _, v in pairs(combo.List.Items) do
		v.Canvas:setSize(w, 30, false)
		v.Label:setSize(w-8, 28, false)
		combo.Entrail:addElement(v.Canvas)
		--combo.Entrail:addScrollElement(v.Canvas, "y")
	end
end

local function clbSetVisible(combo, bool)
	combo.Canvas:setVisible(bool or false)
end

local function clbSetEnabled(combo, bool)
	combo.Canvas:setEnabled(bool or false)
	combo.Animation = 2

	TopCol, BotCol, BackCol = "FFFFFF", "EEEEEE", "CCCCCC"
	if combo.ColorScheme.DarkTheme then TopCol, BotCol, BackCol = "555555", "444444", "333333" end

	TextColor = "444444"
	if combo.ColorScheme.DarkTheme then TextColor = "EEEEEE" end 

	ButCol = "555555"
	if combo.ColorScheme.DarkTheme then ButCol = "EEEEEE" end 

	btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)
	arrcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", ButCol, ButCol, ButCol, ButCol)

	if bool then
		combo.Main:setProperty("ImageColours", btncol)
		combo.Label:setColor(fromHEXToRGB(TextColor))
		combo.Arrow:setProperty("ImageColours", arrcol)
	else
		combo.Main:setProperty("ImageColours", "tl:FFCCCCCC tr:FFCCCCCC bl:FFBBBBBB br:FFBBBBBB")
		combo.Label:setColor(fromHEXToRGB("888888"))
		combo.Arrow:setProperty("ImageColours", "tl:FF888888 tr:FF888888 bl:FF888888 br:FF888888")
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Layering functions

local function clbBringToFront(combo)
	return combo.Canvas:bringToFront()
end

local function clbMoveToBack(combo)
	return combo.Canvas:moveToBack()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Get functions

local function clbGetMaxHeight(combo)
	return combo.Height
end

local function clbGetSelectedItem(combo)
	local result = nil
	for _, v in pairs(combo.List.Items) do
		if v.Selected then
			result = v.Text
			break
		end
	end
	return result
end

local function clbGetPosition(combo, rel)
	return combo.Canvas:getPosition(rel or false)
end

local function clbGetSize(combo, rel)
	if rel then
		return combo.Canvas:getSize(true)
	else
		return combo.Menu:getSize(false)
	end
end

local function clbGetVisible(combo)
	return combo.Canvas:getVisible()
end

local function clbGetEnabled(combo)
	return combo.Canvas:getEnabled()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Theme Functions

local function clbSetColorScheme(combo, scheme)

	combo.ColorScheme = scheme

	clbSetEnabled(combo, clbGetEnabled(combo))

	TopCol, BotCol, BackCol = "FFFFFF", "EEEEEE", "CCCCCC"
	if combo.ColorScheme.DarkTheme then TopCol, BotCol, BackCol = "555555", "444444", "333333" end

	LMainCol = "F7F7F7"
	if combo.ColorScheme.DarkTheme then LMainCol = "505050" end 

	btncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TopCol, TopCol, BotCol, BotCol)
	fbtcol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", BackCol, BackCol, BackCol, BackCol)
	lmncol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", LMainCol, LMainCol, LMainCol, LMainCol)

	combo.List.Main:setProperty("ImageColours", lmncol)

	combo.Vertical:setProperty("ImageColours", fbtcol)
	combo.Horizontal:setProperty("ImageColours", fbtcol)

	for _, v in pairs(combo.List.Items) do
		if v.Selected then
			v.Mark:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", combo.ColorScheme.Main, combo.ColorScheme.Main, combo.ColorScheme.Main, combo.ColorScheme.Main)) 
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Event Functions

local function clbAddEvent(combo, event, func)
	addEventHandler(event, root, function(...)

		local visited = false
		
		for _, v in ipairs(combo.List.Items) do
			if source == v.Canvas then
				visited = true
				break
			end
		end
		if source == combo.Main or source == combo.List.Main or visited then
			func(...)
		end
	end)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--OOP Functions

CustomComboBox = {}
CustomComboBox.__index = CustomComboBox

function CustomComboBox.create(...)
	local self = setmetatable({}, CustomComboBox)
	self.ComboBox = guiCreateCustomComboBox(...)
	return self
end

function CustomComboBox.setPosition(self, ...) return clbSetPosition(self.ComboBox, ...) end
function CustomComboBox.setSize(self, ...) return clbSetSize(self.ComboBox, ...) end
function CustomComboBox.setVisible(self, ...) return clbSetVisible(self.ComboBox, ...) end
function CustomComboBox.setEnabled(self, ...) return clbSetEnabled(self.ComboBox, ...) end
function CustomComboBox.setSelectedItem(self, ...) return clbSetSelectedItem(self.ComboBox, ...) end
function CustomComboBox.addItem(self, ...) return clbAddItem(self.ComboBox, ...) end
function CustomComboBox.removeItem(self, ...) return clbRemoveItem(self.ComboBox, ...) end
function CustomComboBox.setMaxHeight(self, ...) return clbSetMaxHeight(self.ComboBox, ...) end

function CustomComboBox.bringToFront(self) return clbBringToFront(self.ComboBox) end
function CustomComboBox.moveToBack(self) return clbMoveToBack(self.ComboBox) end

function CustomComboBox.getPosition(self, ...) return clbGetPosition(self.ComboBox, ...) end
function CustomComboBox.getSize(self, ...) return clbGetSize(self.ComboBox, ...) end
function CustomComboBox.getVisible(self, ...) return clbGetVisible(self.ComboBox, ...) end
function CustomComboBox.getEnabled(self, ...) return clbGetEnabled(self.ComboBox, ...) end
function CustomComboBox.getSelectedItem(self, ...) return clbGetSelectedItem(self.ComboBox, ...) end
function CustomComboBox.getMaxHeight(self, ...) return clbGetMaxHeight(self.ComboBox, ...) end

function CustomComboBox.setColorScheme(self, ...) return clbSetColorScheme(self.ComboBox, ...) end

function CustomComboBox.addEvent(self, ...) return clbAddEvent(self.ComboBox, ...) end

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
---------------------------TabPabels--------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

TabPanels = {}

local function guiCreateCustomTabPanel(x, y, w, h, relative, parent)	

	------------------------------------------------------------------------------------------------------------------------------------------
	--Counting IDs and coordinates
	local id = #TabPanels+1

	if relative then

		local sw, sh = Width, Height
		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		else
			parent = nil
		end

		x = x*sw
		y = y*sh
		w = w*sw
		h = h*sh

	else

		x = math.floor(x)
		y = math.floor(y)
		w = math.floor(w)
		h = math.floor(h)
		
	end

	------------------------------------------------------------------------------------------------------------------------------------------
	--Main

	TabPanels[id] = {}
	TabPanels[id].ColorScheme = DefaultColors
	TabPanels[id].Canvas = GuiStaticImage.create(x-1, y-1, w+2, h+2, pane, false, parent)

	TabPanels[id].Vertical = GuiStaticImage.create(1, 0, w, h+2, pane, false, TabPanels[id].Canvas)
	TabPanels[id].Horizontal = GuiStaticImage.create(0, 1, w+2, h, pane, false, TabPanels[id].Canvas)

	TabPanels[id].Main = GuiStaticImage.create(1, 1, w, h, pane, false, TabPanels[id].Canvas)

	TabPanels[id].TitleBlock = GuiStaticImage.create(0, 0, w, 23, pane, false, TabPanels[id].Main)
	TabPanels[id].TitleDivider = GuiStaticImage.create(0, 22, w, 1, pane, false, TabPanels[id].TitleBlock)

	TabPanels[id].TabScroller = ScrollMenu.create(0, 0, w, 22, false, TabPanels[id].TitleBlock)

	TabPanels[id].Tabs = {}

	------------------------------------------------------------------------------------------------------------------------------------------
	--Properties

	MainCol = "F6F6F6"
	if TabPanels[id].ColorScheme.DarkTheme then MainCol = "393939" end 

	SameCol = "BBBBBB"
	if TabPanels[id].ColorScheme.DarkTheme then SameCol = "222222" end 

	maincol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", MainCol, MainCol, MainCol, MainCol)
	samecol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", SameCol, SameCol, SameCol, SameCol)

	TabPanels[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")

	TabPanels[id].Vertical:setProperty("ImageColours", "tl:22000000 tr:22000000 bl:22000000 br:22000000")
	TabPanels[id].Horizontal:setProperty("ImageColours", "tl:22000000 tr:22000000 bl:22000000 br:22000000")

	TabPanels[id].Main:setProperty("ImageColours", maincol)
	TabPanels[id].TitleBlock:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	TabPanels[id].TitleDivider:setProperty("ImageColours", samecol)

	TabPanels[id].CurrentTab = nil
	TabPanels[id].Animation = 0 -- 1 - swipe left, 2 - swipe right
	TabPanels[id].AnimObjects = {from=nil, to=nil}
	TabPanels[id].MinLen = 100

	TabPanels[id].Vertical:setEnabled(false)
	TabPanels[id].Horizontal:setEnabled(false)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Events

	local function animate()
		local ax = -1
		if TabPanels[id].AnimObjects.from ~= nil then
			ax = TabPanels[id].AnimObjects.from.Canvas:getPosition(false)
		end

		local bx = TabPanels[id].AnimObjects.to.Canvas:getPosition(false)
		local w = TabPanels[id].Main:getSize(false)

		if ax < bx then
			TabPanels[id].AnimObjects.to.Entrail:setPosition(w, 23, false)
			TabPanels[id].Animation = 1
		else
			TabPanels[id].AnimObjects.to.Entrail:setPosition(-w, 23, false)
			TabPanels[id].Animation = 2
		end
	end

	addEventHandler("onClientRender", root, function()
		if TabPanels[id].Animation == 1 then

			local w = TabPanels[id].Main:getSize(false)
			local x = TabPanels[id].AnimObjects.to.Entrail:getPosition(false)
			x = x-(w/8)

			if x < 0 then x = 0 end
			TabPanels[id].AnimObjects.to.Entrail:setPosition(x, 23, false)
			if TabPanels[id].AnimObjects.from ~= nil then
				TabPanels[id].AnimObjects.from.Entrail:setPosition(x-w, 23, false)
			end

			if x == 0 then
				TabPanels[id].Animation = 0
				if TabPanels[id].AnimObjects.from ~= nil then
					TabPanels[id].AnimObjects.from.Entrail:setVisible(false)
				end
			end

		elseif TabPanels[id].Animation == 2 then

			local w = TabPanels[id].Main:getSize(false)
			local x = TabPanels[id].AnimObjects.from.Entrail:getPosition(false)
			x = x+(w/8)

			if x > w then x = w end
			TabPanels[id].AnimObjects.to.Entrail:setPosition(x-w, 23, false)
			TabPanels[id].AnimObjects.from.Entrail:setPosition(x, 23, false)

			if x == w then
				TabPanels[id].Animation = 0
				TabPanels[id].AnimObjects.from.Entrail:setVisible(false)
			end
		end
	end)

	addEventHandler("onClientGUIClick", root, function()
		for _, v in pairs(TabPanels[id].Tabs) do
			if source == v.Canvas and v ~= TabPanels[id].CurrentTab and v.Enabled then
				for _, val in pairs(TabPanels[id].Tabs) do
					val.Entrail:setVisible(false)
				end
				if TabPanels[id].CurrentTab ~= nil then
					
					TextCol = "444444"
					if TabPanels[id].ColorScheme.DarkTheme then TextCol = "EEEEEE" end
					
					TabPanels[id].CurrentTab.Entrail:setVisible(true)
					TabPanels[id].CurrentTab.Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
					TabPanels[id].CurrentTab.Label:setColor(fromHEXToRGB(TextCol))

				end

				TabPanels[id].AnimObjects.from = TabPanels[id].CurrentTab
				TabPanels[id].AnimObjects.to = v
				animate()

				TabPanels[id].CurrentTab = v

				v.Entrail:setVisible(true) -- make animated
				v.Label:setColor(fromHEXToRGB("FFFFFF"))
				v.Canvas:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", TabPanels[id].ColorScheme.Main, TabPanels[id].ColorScheme.Main, TabPanels[id].ColorScheme.Main, TabPanels[id].ColorScheme.Main)) 
			end
		end
	end)

	addEventHandler("onClientMouseEnter", root, function()

		TextCol = "444444"
		if TabPanels[id].ColorScheme.DarkTheme then TextCol = "EEEEEE" end

		for _, v in pairs(TabPanels[id].Tabs) do
			if TabPanels[id].CurrentTab ~= v and v.Enabled then
				v.Label:setColor(fromHEXToRGB(TextCol))
				if source == v.Canvas then
					v.Label:setColor(fromHEXToRGB(TabPanels[id].ColorScheme.Main))
				end
			end
		end
	end)
	
	addEventHandler("onClientResourceStop", root, function(res)
		if res == getThisResource() then

			for i in pairs(TabPanels[id]) do
				if isElement(TabPanels[id][i]) then
					destroyElement(TabPanels[id][i])
				end
				TabPanels[id][i] = nil
			end
		end
	end)

	------------------------------------------------------------------------------------------------------------------------------------------
	--Ending
	return TabPanels[id]
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Set functions
local function compareTabs(tabpan)
	local count = 0
	for _, v in pairs(tabpan.Tabs) do
		if v.Visible then
			count = count+1
		end
	end
	local w = tabpan.Main:getSize(false)
	local width = math.floor(w/count) > tabpan.MinLen and math.floor(w/count) or tabpan.MinLen

	tabpan.TabScroller.Menu:setSize(w, 22, false)
	
	TextCol = "444444"
	if tabpan.ColorScheme.DarkTheme then TextCol = "EEEEEE" end

	DisCol = "DDDDDD"
	if tabpan.ColorScheme.DarkTheme then DisCol = "222222" end 

	SameCol = "BBBBBB"
	if tabpan.ColorScheme.DarkTheme then SameCol = "222222" end 

	discol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", DisCol, DisCol, DisCol, DisCol)
	samecol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", SameCol, SameCol, SameCol, SameCol)

	local id = 0
	for _, v in pairs(tabpan.Tabs) do
		if v.Visible then

			v.Canvas:setSize(width, 22, false)
			v.Canvas:setPosition(width*id, 0, false)
			v.Divider:setProperty("ImageColours", samecol)

			if not v.Enabled then
				v.Canvas:setProperty("ImageColours", discol)
				v.Label:setColor(fromHEXToRGB("888888"))
			else 
				if v == tabpan.CurrentTab then
					v.Canvas:setProperty("ImageColours", string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", tabpan.ColorScheme.Main, tabpan.ColorScheme.Main, tabpan.ColorScheme.Main, tabpan.ColorScheme.Main)) 
					v.Label:setColor(fromHEXToRGB("FFFFFF"))
				else
					v.Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
					v.Label:setColor(fromHEXToRGB(TextCol))
				end
			end

			v.Label:setSize(width, 20, false)
			tabpan.TabScroller:addElement(v.Canvas)

			v.Divider:setVisible(id > 0)

			id = id+1

			if id == count and count%2 == 1 then
				v.Canvas:setSize(width+1, 22, false)
			end
		else
			v.Canvas:setVisible(false)
		end
	end

end

local function ctpAddTab(tabpan, text)

	local id = #tabpan.Tabs+1

	SameCol = "BBBBBB"
	if tabpan.ColorScheme.DarkTheme then SameCol = "222222" end 

	samecol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", SameCol, SameCol, SameCol, SameCol)

	tabpan.Tabs[id] = {}
	tabpan.Tabs[id].Visible = true
	tabpan.Tabs[id].Enabled = true
	tabpan.Tabs[id].Text = text

	local w, h = tabpan.Main:getSize(false)
	tabpan.Tabs[id].Canvas = GuiStaticImage.create(0, 0, 100, 22, pane, false, tabpan.TabScroller.Menu)
	tabpan.Tabs[id].Divider = GuiStaticImage.create(0, 0, 1, 22, pane, false, tabpan.Tabs[id].Canvas)
	tabpan.Tabs[id].Label = GuiLabel.create(0, 0, 100, 20, text, false, tabpan.Tabs[id].Canvas)
	tabpan.Tabs[id].Entrail = GuiStaticImage.create(0, 23, w, h-23, pane, false, tabpan.Main)
	tabpan.TabScroller:addScrollElement(tabpan.Tabs[id].Canvas, "x")

	tabpan.Tabs[id].Canvas:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	tabpan.Tabs[id].Entrail:setProperty("ImageColours", "tl:0 tr:0 bl:0 br:0")
	tabpan.Tabs[id].Divider:setProperty("ImageColours", samecol)

	tabpan.Tabs[id].Label:setFont(GuiFont.create(Fonts.OpenSansRegular, 9))
	tabpan.Tabs[id].Label:setColor(fromHEXToRGB("444444"))
	tabpan.Tabs[id].Label:setVerticalAlign("center")
	tabpan.Tabs[id].Label:setHorizontalAlign("center")

	tabpan.Tabs[id].Divider:setVisible(false)
	tabpan.Tabs[id].Divider:setEnabled(false)
	tabpan.Tabs[id].Label:setEnabled(false)
	tabpan.Tabs[id].Entrail:setVisible(false)

	compareTabs(tabpan)
	return tabpan.Tabs[id].Entrail

end

local function ctpSetTabEnabled(tabpan, tab, bool)

	for _, v in pairs(tabpan.Tabs) do
		if v.Text == tab or v.Entrail == tab then
			v.Enabled = bool or false
		end
	end

	compareTabs(tabpan)
end

local function ctpSetTabVisible(tabpan, tab, bool)

	for _, v in pairs(tabpan.Tabs) do
		if v.Text == tab or v.Entrail == tab then
			v.Visible = bool or false
		end
	end

	compareTabs(tabpan)
end

local function ctpSetTabText(tabpan, tab, text)

	for _, v in pairs(tabpan.Tabs) do
		if v.Text == tab or v.Entrail == tab then
			v.Label:setText(text)
		end
	end

	compareTabs(tabpan)
end

local function ctpSetEnabled(tabpan, bool)
	tabpan.Canvas:setEnabled(bool or false)

	if bool then
		tabpan.Main:bringToFront()
	else
		tabpan.Vertical:bringToFront()
		tabpan.Horizontal:bringToFront()
	end
end

local function ctpSetVisible(tabpan, bool)
	return tabpan.Canvas:setVisible(bool or false)
end

local function ctpSetPosition(tabpan, x, y, rel)
	tabpan.Canvas:setPosition(x, y, rel or false)
end

local function ctpSetSize(tabpan, w, h, rel)
		
	if rel then

		local sw, sh = Width, Height
		local parent = combo.Canvas.parent or nil

		if parent and parent.type:find("gui") then
			sw, sh = parent:getSize(false)
		end

		w = w*sw
		h = h*sh

	end

	tabpan.Canvas:setSize(w+2, h+2, false)
	tabpan.Vertical:setSize(w, h+2, false)
	tabpan.Horizontal:setSize(w+2, h, false)

	tabpan.Main:setSize(w, h, false)
	tabpan.TitleBlock:setSize(w, 23, false)
	tabpan.TitleDivider:setSize(w, 1, false)

	tabpan.TabScroller:setSize(w, 22, false)

	for _, v in pairs(tabpan.Tabs) do
		v.Entrail:setSize(w, h-23, false)
	end

	compareTabs(tabpan)
end

local function ctpSetTabsMinLength(tabpan, len)
	tabpan.MinLen = tonumber(len) or 100
	compareTabs(tabpan)
end

local function ctpSetSelectedTab(tabpan, tab)
	for _, v in pairs(tabpan.Tabs) do
		if v.Text == tab or v.Entrail == tab then
			triggerEvent("onClientGUIClick", v.Canvas)
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Layering functions

local function ctpBringToFront(tabpan)
	return tabpan.Canvas:bringToFront()
end

local function ctpMoveToBack(tabpan)
	return tabpan.Canvas:moveToBack()
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Get functions

local function ctpGetTabEnabled(tabpan, tab)

	for _, v in pairs(tabpan.Tabs) do
		if v.Text == tab or v.Entrail == tab then
			return v.Enabled
		end
	end

	return nil
end

local function ctpGetTabVisible(tabpan, tab)

	for _, v in pairs(tabpan.Tabs) do
		if v.Text == tab or v.Entrail == tab then
			return v.Visible
		end
	end

	return nil
end

local function ctpGetTabText(tabpan, tab)

	for _, v in pairs(tabpan.Tabs) do
		if v.Entrail == tab then
			return v.Text
		end
	end

	return nil
end

local function ctpGetEnabled(tabpan)
	return tabpan.Canvas:getEnabled()
end

local function ctpGetVisible(tabpan)
	return tabpan.Canvas:getVisible()
end

local function ctpGetPosition(tabpan, rel)
	return tabpan.Canvas:getPosition(rel or false)
end

local function ctpGetSize(tabpan, rel)
	if rel then
		return tabpan.Canvas:getSize(true)
	else
		return tabpan.Menu:getSize(false)
	end
end

local function ctpGetTabsMinLength(tabpan)
	return tabpan.MinLen
end

local function ctpGetSelectedTab(tabpan)
	return tabpan.CurrentTab
end

local function ctpGetTabFromText(tabpan, text)
	for _, v in pairs(tabpan.Tabs) do
		if v.Text == text then
			return v.Entrail
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------
--Theme Functions

local function ctpSetColorScheme(tabpan, scheme)

	tabpan.ColorScheme = scheme
	compareTabs(tabpan)

	MainCol = "F6F6F6"
	if tabpan.ColorScheme.DarkTheme then MainCol = "393939" end 

	SameCol = "BBBBBB"
	if tabpan.ColorScheme.DarkTheme then SameCol = "222222" end 

	maincol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", MainCol, MainCol, MainCol, MainCol)
	samecol = string.format("tl:FF%s tr:FF%s bl:FF%s br:FF%s", SameCol, SameCol, SameCol, SameCol)

	tabpan.Main:setProperty("ImageColours", maincol)
	tabpan.TitleDivider:setProperty("ImageColours", samecol)

end

----------------------------------------------------------------------------------------------------------------------------------------------
--Event Functions

local function ctpAddEvent(tabpan, event, func)
	addEventHandler(event, root, function(...)
		if source == tabpan.Main then
			func(...)
		end
	end)
end

----------------------------------------------------------------------------------------------------------------------------------------------
--OOP Functions

CustomTabPanel = {}
CustomTabPanel.__index = CustomTabPanel

function CustomTabPanel.create(...)
	local self = setmetatable({}, CustomTabPanel)
	self.TabPanel = guiCreateCustomTabPanel(...)
	return self
end

function CustomTabPanel.setPosition(self, ...) return ctpSetPosition(self.TabPanel, ...) end
function CustomTabPanel.setSize(self, ...) return ctpSetSize(self.TabPanel, ...) end
function CustomTabPanel.setVisible(self, ...) return ctpSetVisible(self.TabPanel, ...) end
function CustomTabPanel.setEnabled(self, ...) return ctpSetEnabled(self.TabPanel, ...) end
function CustomTabPanel.addTab(self, ...) return ctpAddTab(self.TabPanel, ...) end
function CustomTabPanel.setTabEnabled(self, ...) return ctpSetTabEnabled(self.TabPanel, ...) end
function CustomTabPanel.setTabVisible(self, ...) return ctpSetTabVisible(self.TabPanel, ...) end
function CustomTabPanel.setTabText(self, ...) return ctpSetTabText(self.TabPanel, ...) end
function CustomTabPanel.setSelectedTab(self, ...) return ctpSetSelectedTab(self.TabPanel, ...) end
function CustomTabPanel.setTabsMinLength(self, ...) return ctpSetTabsMinLength(self.TabPanel, ...) end

function CustomTabPanel.bringToFront(self) return ctpBringToFront(self.TabPanel) end
function CustomTabPanel.moveToBack(self) return ctpMoveToBack(self.TabPanel) end

function CustomTabPanel.getPosition(self, ...) return ctpGetPosition(self.TabPanel, ...) end
function CustomTabPanel.getSize(self, ...) return ctpGetSize(self.TabPanel, ...) end
function CustomTabPanel.getVisible(self, ...) return ctpGetVisible(self.TabPanel, ...) end
function CustomTabPanel.getEnabled(self, ...) return ctpGetEnabled(self.TabPanel, ...) end
function CustomTabPanel.getTabEnabled(self, ...) return ctpGetTabEnabled(self.TabPanel, ...) end
function CustomTabPanel.getTabVisible(self, ...) return ctpGetTabVisible(self.TabPanel, ...) end
function CustomTabPanel.getTabText(self, ...) return ctpGetTabText(self.TabPanel, ...) end
function CustomTabPanel.getTabFromText(self, ...) return ctpGetTabFromText(self.TabPanel, ...) end
function CustomTabPanel.getSelectedTab(self, ...) return ctpGetSelectedTab(self.TabPanel, ...) end
function CustomTabPanel.getTabsMinLength(self, ...) return ctpGetTabsMinLength(self.TabPanel, ...) end

function CustomTabPanel.setColorScheme(self, ...) return ctpSetColorScheme(self.TabPanel, ...) end

function CustomTabPanel.addEvent(self, ...) return ctpAddEvent(self.TabPanel, ...) end