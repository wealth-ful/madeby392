-- // Dependencies
local SignalBuilder = loadstring(game:HttpGet("https://raw.githubusercontent.com/wealth-ful/madeby392/main/module.lua"))()

-- // Manager Class
local Manager = {}
Manager.__index = Manager
do
    -- // Constructor
    function Manager.new()
        -- // Initialise class
        local self = setmetatable({}, Manager)

        -- // Initialise vars
        self.Signals = {}

        -- // Return class
        return self
    end

    -- // Find a signal
    function Manager.Get(self, SignalName)
        return self.Signals[SignalName]
    end

    -- // Add a signal
    function Manager.Add(self, Signal)
        -- // Create signal if string is passed
        if (typeof(Signal) == "string") then
            Signal = SignalBuilder.new(Signal)
        end

        -- // Add
        self.Signals[Signal.Name] = Signal
    end

    -- // Remove a signal
    function Manager.Remove(self, SignalName)
        -- // Remove
        self.Signals[SignalName] = nil
    end

    -- // Create a signal
    Manager.Create = Manager.Add

    -- // Fire a signal
    function Manager.Fire(self, SignalName, ...)
        -- // Get the signal
        local Signal = self:Get(SignalName)

        -- // Make sure signal exists
        assert(Signal, "signal does not exist")

        -- // Fire
        return Signal:Fire(...)
    end

    -- // Connect to a signal
    function Manager.Connect(self, SignalName, ...)
        -- // Get the signal
        local Signal = self:Get(SignalName)

        -- // Make sure signal exists
        assert(Signal, "signal does not exist")

        -- // Connect
        return Signal:Connect(...)
    end

    -- // Wait for a signal to fire
    function Manager.Wait(self, SignalName, Timeout)
        -- // Get the signal
        local Signal = self:Get(SignalName)

        -- // Make sure signal exists
        assert(Signal, "signal does not exist")

        -- // Connect
        return Signal:Wait(Timeout)
    end
end

-- // Return
return Manager
