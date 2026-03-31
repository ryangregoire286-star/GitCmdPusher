RoutesClass = {}

RoutesClass.__index = RoutesClass

function RoutesClass:new(value)
    local ins = setmetatable({}, RoutesClass)
    ins.value = value
    return ins;
end

function RoutesClass:Print(value)
    print(PrintValue(value))
end

function PrintValue(value)
    return string.upper(value)
end
