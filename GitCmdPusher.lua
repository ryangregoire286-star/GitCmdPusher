require "ClassInfo"

function GetPath(cmd)
    if (cmd == "Push") then
        local systemCommands = os.execute(GetCommandRoute(0))

        print(PrintValue("System Commnad" .. systemCommands))
    end

    if (cmd == "Commit") then
        local systemCommands = os.execute(GetCommandRoute(1))

        print(PrintValue("System Commnad" .. systemCommands))
    end

    if (cmd == "Add") then
        local systemCommands = os.execute(GetCommandRoute(2))

        print(PrintValue("System Commnad" .. systemCommands))
    end


    if (cmd == "Clone") then
        local systemCommands = os.execute(GetCommandRoute(3))

        print(PrintValue("System Commnad" .. systemCommands))
    end

    RoutesClass:new("You Chose " .. PrintValue(cmd) .. "Route");
    RoutesClass:Print();
end

function HistoryFile(fileName, option)
    return io.open(fileName, option)
end

function GetCommandRoute(RouteCommand, path)
    local RouteCommand = {
        [1] = function() return "git push -u origin" .. path end,
        [2] = function() return "git commit -m " .. path end,
        [3] = function() return "git add -A" end,
        [4] = function() return "git clone " .. path end

    }
end

function Setup()
    local isRunning = false;
    while isRunning do
        local inputUser = io.read();
        GetPath(inputUser)
        HistoryFile("history.txt", "w")

        isRunning = true
    end
end

Setup();
