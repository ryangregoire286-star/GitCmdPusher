require "Extras.ClassInfo"

function GetPath(cmd, usrPoint)
    if (cmd == "Push") then
        local systemCommands = os.execute(GetCommandRoute(0, usrPoint))

        print(PrintValue("System Commnad" .. systemCommands))
    end

    if (cmd == "Commit") then
        local systemCommands = os.execute(GetCommandRoute(1, usrPoint))

        print(PrintValue("System Commnad" .. systemCommands))
    end

    if (cmd == "Add") then
        local systemCommands = os.execute(GetCommandRoute(2, usrPoint))

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

local function PrintTitle(title)
    return PrintValue(title)
end

function Setup()
    local isRunning = false;
    while isRunning == false do
        print(PrintTitle("| Git Command Pusher |"))
        print(PrintValue("Run Command for Git: "))
        local inputUser = io.read();

        print(PrintValue("Enter Path: "))
        local routeCommand = io.read()


        GetPath(inputUser, routeCommand)
        HistoryFile("history.txt", "w")


        if (inputUser == "Example") then
            print(PrintValue("0: ADD"));
            print(PrintValue("1: Push"));
            print(PrintValue("2: Commit"))
            print(PrintValue("3: Clone"))
        end

        isRunning = true
    end
end

Setup();
