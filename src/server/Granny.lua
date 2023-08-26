local Grannys = workspace.Grannys
local Properties = workspace.Properties

local Granny = {}

Granny.__index = Granny

function Granny.new()
	local self = setmetatable({}, Granny)

	self.Character = self:GetModel()
	self.Properties = self:GetProperties()
	self.Actions = {}
	self.MainMethods = {}

	return self
end

function Granny:GetProperties()
	return Properties
end

function Granny:GetModel()
	local granny = Grannys:GetChildren() -- create module for generating granny models
	return granny[math.random(#granny)]
end

function Granny:SetupGranny()
	local actionCount = math.random(1, math.random(3, 10))
	for propName, prop in pairs(self.Properties) do
		if propName == "Name" then
			self.Name = prop[math.random(#prop)]
		elseif propName == "Action" then
			
			for j = 1, actionCount do
				local action = prop[math.random(#prop)]
				for _, i in pairs(self.Actions) do
					if action == i then
						continue
					end
					if action then
						table.insert(self.Actions, action)
					end
				end
			end
		elseif propName == 'MainMethods' then
			for _, action in pairs(prop) do
				table.insert(self.MainMethods, action)
			end
		end
	end
end

function Granny:Spawn()
    self.Character.Parent = workspace
    self.Character:MoveTo()

    if self.Actions then
        for _, action in pairs(self.Actions) do
			
		end
    end
	if self.MainMethods then
		for _, action in pairs(self.MainMethods) do
			
		end 
	end

end

function Granny:Init()
	self:SetupGranny()
end

return Granny
