--// Trigonometric Graph Calculator \\--
--\\ Made specifically for Roblox Studio! (Uses Lua) //--
--// Any changes can be made for this script! \\--

--|| Based of the equation f(x) = a+b*(cx+d)

--[[ Possible Functions:

	cos
	sin
	tan
	log
	exp
	acos
	asin
	atan
	
]]

--// Models \\--

local axis_model = workspace.Axis -- X, Y lines and the background's Model
local xaxis = axis_model.X -- X line itself.
local yaxis = axis_model.Y -- Y line itself.
local graphs_folder = workspace.Graphs -- Folder for storing graphs

--// Changeable Variables \\--

local render_number = 10000 -- Changes how many dots/coordinates are going to be placed in the plane.
local y_value_dist = 25 -- Changes the Y value of the graph. (Letter A)
local amplify = 5 -- Amplifies the amplitude of the graph. (Letter B)
local frequency = -.5 -- (Letter C)
local x_value_dist = 15 -- Changes the X value of the graph. (Letter D)

--// Variable-Calculations \\--

local divide_convert = 2 -- Conversion value.
local divide_number = render_number/(xaxis.Size.X/divide_convert)
local scale = amplify/(amplify*divide_convert) -- Scales the dot/coordinate depending on the amplification.

--// Functions \\--

function make_a_graph(equation_type) -- Graph function.
	
	if equation_type then
		
		local graph = Instance.new("Model") -- Creates a graph model.
		graph.Name = "Graph"
		graph.Parent = graphs_folder
		
		for i = -render_number,render_number do -- Loop for representing all of the dots/coordinates in both negative and positive X values.
			
			-- (The "i" represents the Letter X in the equation.)
			
			local actual_number = i/divide_number -- Divides the dots/coordinates through the plane.
			local mathematical_function;
			local inside_equation = frequency*actual_number+x_value_dist -- Added here just so the code looks cleaner.
			
			if equation_type == "cos" then -- Verifies which type of function it is.
				mathematical_function = y_value_dist+amplify*math.cos(inside_equation) -- Sets the Y value for the dot/coordinate.
			elseif equation_type == "sin" then
				mathematical_function = y_value_dist+amplify*math.sin(inside_equation) -- Sets the Y value for the dot/coordinate.
			elseif equation_type == "tan" then
				mathematical_function = y_value_dist+amplify*math.tan(inside_equation) -- Sets the Y value for the dot/coordinate.
			elseif equation_type == "log" then
				mathematical_function = y_value_dist+amplify*math.log(inside_equation) -- Sets the Y value for the dot/coordinate.
			elseif equation_type == "exp" then
				mathematical_function = y_value_dist+amplify*math.exp(inside_equation) -- Sets the Y value for the dot/coordinate.
			elseif equation_type == "acos" then
				mathematical_function = y_value_dist+amplify*math.acos(inside_equation) -- Sets the Y value for the dot/coordinate.
			elseif equation_type == "asin" then
				mathematical_function = y_value_dist+amplify*math.asin(inside_equation) -- Sets the Y value for the dot/coordinate.
			elseif equation_type == "atan" then
				mathematical_function = y_value_dist+amplify*math.atan(inside_equation) -- Sets the Y value for the dot/coordinate.
			end
			
			if mathematical_function and tonumber(mathematical_function) and mathematical_function <= (yaxis.Size.X/divide_convert) and mathematical_function >= -(yaxis.Size.X/divide_convert) then -- Just making sure the function will work.

				local part = Instance.new("Part") -- Creates a part that's going to be used as the dot/coordinate to build our graph.
				part.Massless = true
				part.CanQuery = false
				part.CanTouch = false
				part.CanCollide = false
				part.CastShadow = false
				part.Anchored = true
				part.Locked = true
				part.Size = Vector3.new(scale,scale,1)
				part.Material = "Neon"
				part.Color = Color3.new(0, 0, 1)
				part.CFrame = CFrame.new(actual_number,mathematical_function,0) -- Sets the position where the dot/coordinate is going to be located at.
				part.Name = "Coordinate"
				part.Parent = graph
				
			end
			
		end
		
	end
	
end

--// Startup \\--

make_a_graph("cos") -- Calls the function, it's required to insert what type of function it's going to be.

--\\ End //--