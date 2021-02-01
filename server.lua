db = dbConnect("sqlite", "UserDataLg.db")
if db then
    outputDebugString("База данных загружена")
else
    outputDebugString("Ошибка! Базы данных не существует,создаем новую)")
end

local outPutWarnMsg = function(err)
    outputDebugString('Атака читеров: получение от триггера неверных значений <<Login Panel>>')
end

local funCr = function ()
    if db then
        local tabela = dbExec(db,"CREATE TABLE IF NOT EXISTS UserData (login TEXT,pass TEXT,Age TEXT,Name TEXT,SurName TEXT,Email TEXT,Gender TEXT)")
    else
        return
    end
end
addEventHandler("onResourceStart",resourceRoot,funCr)

teaDecodeBinary = function ( data, key ) -- Временно недоступно
    return base64Decode( teaDecode( data, key ) )
end


local funCreateAcc = function(theUser,username,password,Age,Name,SurName,Email,Gender)
    if not theUser  then outPutWarnMsg() end
    if not username then outPutWarnMsg() end
    if not password then outPutWarnMsg() end
    if not Age      then outPutWarnMsg() end
    if not Name     then outPutWarnMsg() end
    if not SurName  then outPutWarnMsg() end
    if not Email    then outPutWarnMsg() end
    if not Gender   then outPutWarnMsg() return false end
    dbExec(db, "INSERT INTO UserData (login,pass,Age,Name,SurName,Email,Gender) VALUES (?,?,?,?,?,?,?)",username,password,Age,Name,SurName,Email,Gender)
end

local checkAccountTable = function(data)
    local q = dbQuery(conn, "SELECT * FROM UserData WHERE login=?",data)  -- поиск Аккаунта по логину true/false
    local result = dbPoll(q,-1)
    if #result == 0 then
        return false
    else
        return true
    end
end

-----------------------Рег\Логин--------------------------------------
local prinSetData = function(theUser)
    local login = getAccountName(getPlayerAccount(theUser))
    local q = dbQuery(db, "SELECT * FROM UserData WHERE login=?",login)
    local result = dbPoll(q,-1)
    if result then
        for _,row in ipairs(result) do
            setElementData(theUser,"Name",row["Name"])
            setElementData(theUser,"SurName",row["SurName"])
            setElementData(theUser,"Age",row["Age"])
            setElementData(theUser,"Gender",row["Gender"])
        end
    end
end

registerPlayer = function (theUser,username,password,Age,Name,SurName,Email,Gender)
    if username == "" then return end
    if password == "" then return end
    local account = getAccount (username,password);

    if checkAccountTable(username) == false then outputChatBox ( 'Логином, уже зарезервирован/занят', theUser, 255, 0, 0) return end
    if account then
        outputChatBox ( 'Данный логин уже используется', theUser, 255, 0, 0);
    end
    if ( #getAccountsBySerial( getPlayerSerial( theUser ) ) > acLimit ) then
        outputChatBox ( 'Превышен лимит регистрации (Max Account - '..acLimit..')', theUser, 255, 0, 0);
    end
    local accountAdded = addAccount(tostring(username),tostring(password));
    if not accountAdded then
        outputChatBox ( 'Логин или пароль введёт не верно', theUser, 255, 0, 0);
    end
    logIn(theUser,accountAdded,password);
    setElementFrozen ( theUser, false )
    setCameraTarget(theUser, theUser)
    local ss = funCreateAcc(theUser,username,password,Age,Name,SurName,Email,Gender)
    if ss == false then
        outputChatBox ( 'Ошибка при создании записи в sqlite', theUser, 0xFFFFFFFF);
    end
    prinSetData(theUser)
    outputChatBox ( 'Вы успешно зарегестрировались на проекте '..servName..' ', theUser, 0xFFFFFFFF);
    outputChatBox ( 'Добро пожаловать на '..servName..', Желаем вам - приятной игры! ', theUser, 0xFFFFFFFF);
    triggerClientEvent( theUser, "destLoginPanel", theUser);
end
addEvent("onRequestRegister",true)
addEventHandler("onRequestRegister",getRootElement(),registerPlayer)

PlayerLogin = function (theUs, username, password)
    if username == "" then
        return outputChatBox ( 'Введите ваши данные точнее [ЛОГИН]', theUs, 255, 0, 0);
    end
    if password == "" then
        return outputChatBox ( 'Введите ваши данные точнее [ПАРОЛЬ]', theUs, 255, 0, 0);
    end
    local account = getAccount ( username, password )
    if account == false then
        return outputChatBox ( 'Логин или пароль не верный', theUs, 255, 0, 0);
    end
    logIn(theUs, account, password)
    setElementFrozen ( theUs, false )
    setCameraTarget(theUs, theUs)
    triggerClientEvent ( theUs, "destLoginPanel", theUs)
    prinSetData(theUs)
    outputChatBox ( 'Добро пожаловать на сервер - '..servName..' ', theUs, 0xFFFFFFFF);
    triggerClientEvent( theUs, "destLoginPanel", theUs);
end

addEvent("onRequestLogin",true)
addEventHandler("onRequestLogin",getRootElement(),PlayerLogin)

local onPlayerLogin = function()
    for i,player in ipairs(getElementsByType('player')) do
        local login = getAccountName(getPlayerAccount(player))
        local q = dbQuery(db, "SELECT * FROM UserData WHERE login=?",login)
        local result = dbPoll(q,-1)
        if result then
            for _,row in ipairs(result) do
                if not(getElementData(player,"Name")) then
                    setElementData(player,"Name",row["Name"])
                end
                if not(getElementData(player,"SurName")) then
                    setElementData(player,"SurName",row["SurName"])
                end
                if not(getElementData(player,"Age")) then
                    setElementData(player,"Age",row["Age"])
                end
                if not(getElementData(player,"Gender")) then
                    setElementData(player,"Gender",row["Gender"])
                end
                if row["Gender"] == "Man" then
                    setElementModel(player, SMan)
                elseif row["Gender"] == "Woman" then
                    setElementModel(player, SWoman)
                end
            end
        end
    end
end
setTimer (onPlayerLogin, 2000, 0 )

addEventHandler ("onPlayerLogin" , root, function()
    onPlayerLogin()
end)

addEventHandler ( "onPlayerCommand", root,
    function(cmd)
        if cmd == "logout"  then
            -- cancelEvent()
            triggerClientEvent( source, "startLogInPanel", source);
        end
        if cmd == "login" then
            cancelEvent()
        end
    end
)
