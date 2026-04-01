require "Extras.ClassInfo"
require "Elements.Elements"

function Push(command)
    return "git push -u origin " .. command
end

function Commit(command)
    return "git commit " .. command
end

function Add(command)
    return "git Add -A"
end

function Clone(command)
    return "git clone " .. command
end

function GetPath(cmd, usrPoint)
    if (cmd == "Push") then
        os.execute(Push(usrPoint))
    end

    if (cmd == "Commit") then
        local systemCommands = os.execute(Clone(usrPoint))
        -- print("System Commnad" .. systemCommands)
    end

    if (cmd == "Add") then
        local systemCommands = os.execute(Add(usrPoint))
        -- print("System Commnad" .. systemCommands)
    end


    if (cmd == "Clone") then
        local systemCommands = os.execute(Clone(usrPoint))
        -- print("System Commnad" .. systemCommands)
    end

    RoutesClass:new("You Chose " .. cmd .. "Route");
    RoutesClass:Print();
end

function HistoryFile(fileName, option)
    return io.open(fileName, option)
end

local function PrintTitle(title)
    return title
end

function Uppertext(text)
    return string.upper(text)
end

function GetName(title)
    return "Title | " .. Uppertext(title)
end

function Setup()
    local BoolCode = {

        isMainLoop = (false),
        endingSystem = (true)
    }

    local isMainThread = BoolCode.isMainLoop;
    local Booleans = BoolCode;

    while Booleans.isMainLoop == false do
        print(PrintTitle(GetName("| Git Command Pusher |")))
        print("Run Command for Git: ")
        local inputUser = io.read();

        if (IsEmpty(inputUser)) then
            print(IsEmpty(inputUser))
        end

        print("Enter Path: ")
        local routeCommand = io.read()


        GetPath(inputUser, routeCommand)
        HistoryFile("history.txt", "w")

        LoopKeys(inputUser)

        isRunning = true
    end
end

function IsBlank(msg)
    local msgs = msg == "";
    return msgs;
end

function IsEmpty(message)
    local isBlank = IsBlank(message);
    if (isBlank) then
        return "User Entered Something Blank"
    end
end

function LoopKeys(inputUser)
    if (inputUser == "Example") then
        print("0: ADD");
        print("1: Push");
        print("2: Commit")
        print("3: Clone")
    end
end

Setup();
