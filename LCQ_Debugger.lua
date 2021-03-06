----------
-- LCQ_Debugger
----------

--debugger version 1.4

LCQ_DBG_QUIET       = 0
LCQ_DBG_NORMAL      = 1
LCQ_DBG_INFO        = 2
LCQ_DBG_VERBOSE     = 3
LCQ_DBG_ERROR       = 4
LCQ_DBG_CRITICAL    = 5
LCQ_DBG_ALWAYS_SHOW = 6
LCQ_DBG_DEBUG       = 7


LCQ_Debugger = ZO_Object:Subclass()

function LCQ_Debugger:New()
    local debugger = ZO_Object.New(self)
    debugger:Initialize()
    return debugger
end

function LCQ_Debugger:Initialize()
    self.logLevel = LCQ_DBG_NORMAL
    self.showDebug = false
end

function LCQ_Debugger:SetLogLevel(level)
    if level < LCQ_DBG_QUIET then
        self.logLevel = LCQ_DBG_QUIET
    elseif level >= LCQ_DBG_DEBUG then
        self.logLevel = LCQ_DBG_DEBUG
        self.showDebug = true
    else
        self.logLevel = level
    end
end

function LCQ_Debugger:SetDebugOutputEnabled(enabled)
    self.showDebug = enabled
end

function LCQ_Debugger:GetLogLevel()
    return self.logLevel
end

function LCQ_Debugger:Log(message, debugLevel, ...)
    if not message then return end
    local level = debugLevel or 1
    if level >= self.logLevel or level == LCQ_DBG_ALWAYS_SHOW then
        local lvlstr = "|cffffff"
        if level == LCQ_DBG_INFO then
            lvlstr = "|c0fb800[Info] "
        elseif level == LCQ_DBG_VERBOSE then
            lvlstr = "|cff9d00[Warning] "
        elseif level == LCQ_DBG_ERROR then
            lvlstr = "|cc40000[Error] "
        elseif level == LCQ_DBG_CRITICAL then
            lvlstr = "|cff0000[Critical] "
        elseif level == LCQ_DBG_DEBUG then
            lvlstr = "|c0081b8[Debug] "
        end
        
        if level == LCQ_DBG_DEBUG and not self.showDebug then return end
        d("[LCQ Debug] " .. lvlstr .. zo_strformat(message, ...) .. "|r")
    end
end

function LCQ_Debugger:Warn(message, ...)
    if not message then return end
    self:Log(message, LCQ_DBG_VERBOSE, ...)
end

function LCQ_Debugger:Info(message, ...)
    if not message then return end
    self:Log(message, LCQ_DBG_INFO, ...)
end

function LCQ_Debugger:Verbose(message, ...)
    if not message then return end
    self:Log(message, LCQ_DBG_VERBOSE, ...)
end

function LCQ_Debugger:Error(message, ...)
    if not message then return end
    self:Log(message, LCQ_DBG_ERROR, ...)
end

function LCQ_Debugger:Critical(message, ...)
    if not message then return end
    self:Log(message, LCQ_DBG_CRITICAL, ...)
end

function LCQ_Debugger:Debug(message, ...)
    if not message then return end
    self:Log(message, LCQ_DBG_DEBUG, ...)
end

LCQ_DBG = LCQ_Debugger:New()