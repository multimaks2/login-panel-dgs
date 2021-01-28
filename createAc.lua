local x,y = guiGetScreenSize()
local px,py = x/1920,y/1080
local s1,s2 = 325,245
Genderas = nil

local AcMain0 = function()
    Tatle  = dgsCreateImage(15, y/2-(s2)-65, s1,s2/10, Textures.Background, false)
    AcMain = dgsCreateImage(15, y/2-(s2)-65, s1,s2, Textures.Background, false)
    Lab1   = dgsCreateLabel(0.3,0.0075,0,0,"Создание персонажа",true,AcMain)
    labAc  = dgsCreateLabel(0.2,0.1,0,0,"      Создание нового персонажа\nВведите все данные в поля ниже:",true,AcMain)
    AcId1 = dgsCreateEdit(25,75,275,40, '', false, AcMain, tocolor(255,255,255,225) , 1, 1, Textures.AcList,  0xFF3F3F3F)
    AcId2 = dgsCreateEdit(25,120    ,275,40, '', false, AcMain, tocolor(255,255,255,225)    , 1, 1, Textures.AcList,  0xFF3F3F3F)
    AcId3 = dgsCreateEdit(25,165,275,40, '', false, AcMain, tocolor(255,255,255,225)    , 1, 1, Textures.AcList,  0xFF3F3F3F)
    dgsSetFont(Lab1, Fonts.txt)
    dgsSetFont(labAc, Fonts.AcText)
    dgsSetFont(AcId1, Fonts.edit)
    dgsSetFont(AcId2, Fonts.edit)
    dgsSetFont(AcId3, Fonts.edit)
    dgsEditSetMasked ( AcId2, true )
    dgsEditSetMasked ( AcId3, true )
    dgsEditSetPlaceHolder(AcId1, ' Введите ваш логин:')
    dgsSetProperty(AcId1, 'placeHolderFont', 'default-bold')
    dgsEditSetPlaceHolder(AcId2, ' Введите ваш пароль:')
    dgsSetProperty(AcId2, 'placeHolderFont', 'default-bold')
    dgsEditSetPlaceHolder(AcId3, ' Подтвердите ваш пароль:')
    dgsSetProperty(AcId3, 'placeHolderFont', 'default-bold')

    dgss1 = function()
        local text = dgsGetText(AcId1)
        for i = 1, #zapret do
            if (string.find(tostring(text),tostring(zapret[i])) ) then
                dgsSetText(AcId1, deleteLastCharacter(text))
            end
        end
    end
    addEventHandler('onDgsTextChange', AcId1,dgss1)

    dgss2 = function()
        local text = dgsGetText(AcId2)
        for i = 1, #zapret do
            if (string.find(tostring(text),tostring(zapret[i])) ) then
                dgsSetText(AcId2, deleteLastCharacter(text))
            end
        end
    end
    addEventHandler('onDgsTextChange', AcId2,dgss2)

    dgss3 = function()
        local text = dgsGetText(AcId3)
        for i = 1, #zapret do
            if (string.find(tostring(text),tostring(zapret[i])) ) then
                dgsSetText(AcId3, deleteLastCharacter(text))
            end
        end
    end
    addEventHandler('onDgsTextChange', AcId3,dgss3)
end
local AcMain1 = function ()
    Tatle2 = dgsCreateImage(15, y/2-(s2)+185, s1,s2+135, Textures.Background, false)
    labAc2 = dgsCreateLabel(0.3,0.1,0,0,"Данные о персонаже\n    Пол персонажа:",true,Tatle2)
    Man     = dgsCreateButton (25,80,110,35, '♂ Мужской', false, Tatle2, 0xFFFFFFFF, 1, 1, Textures.Edit, Textures.Edit, Textures.Edit,  0xFFFFFFFF, 0xFFe1e1e1, 0xFFd2d2d2)
    Woman   = dgsCreateButton (175,80,110,35, '♀ Женский', false, Tatle2, 0xFFFFFFFF, 1, 1, Textures.Edit, Textures.Edit, Textures.Edit,  0xFFFFFFFF, 0xFFe1e1e1, 0xFFd2d2d2)
    AcId4 = dgsCreateEdit(25,125,275,40, '', false, Tatle2, tocolor(255,255,255,225)    , 1, 1, Textures.AcList,  0xFF3F3F3F)
    AcId5 = dgsCreateEdit(25,170,275,40, '', false, Tatle2, tocolor(255,255,255,225)    , 1, 1, Textures.AcList,  0xFF3F3F3F)
    AcId6 = dgsCreateEdit(25,215,275,40, '', false, Tatle2, tocolor(255,255,255,225)    , 1, 1, Textures.AcList,  0xFF3F3F3F)
    AcId7 = dgsCreateEdit(25,260,275,40, '', false, Tatle2, tocolor(255,255,255,225)    , 1, 1, Textures.AcList,  0xFF3F3F3F)
    Create     = dgsCreateButton (25,315,110,35, '✓ Создать', false, Tatle2, 0xFFFFFFFF, 1, 1, Textures.Edit, Textures.Edit, Textures.Edit,  0xFFFFFFFF, 0xFFe1e1e1, 0xFFd2d2d2)
    Otmena     = dgsCreateButton (190,315,110,35, '←  Назад', false, Tatle2, 0xFFFFFFFF, 1, 1, Textures.Edit, Textures.Edit, Textures.Edit,  0xFFFFFFFF, 0xFFe1e1e1, 0xFFd2d2d2)
    dgsSetFont(labAc2, Fonts.AcText)
    dgsSetFont(Man, Fonts.button)
    dgsSetFont(Woman, Fonts.button)
    dgsSetFont(AcId4, Fonts.edit)
    dgsSetFont(AcId5, Fonts.edit)
    dgsSetFont(AcId6, Fonts.edit)
    dgsSetFont(AcId7, Fonts.edit)
    dgsSetFont(Create, Fonts.button)
    dgsSetFont(Otmena, Fonts.button)
    dgsEditSetPlaceHolder(AcId4, ' Возраст персонажа:')
    dgsSetProperty(AcId4, 'placeHolderFont', 'default-bold')
    dgsEditSetPlaceHolder(AcId5, ' Имя персонажа:')
    dgsSetProperty(AcId5, 'placeHolderFont', 'default-bold')
    dgsEditSetPlaceHolder(AcId6, ' Фамилия персонажа:')
    dgsSetProperty(AcId6, 'placeHolderFont', 'default-bold')
    dgsEditSetPlaceHolder(AcId7, ' Введите ваш Email:')
    dgsSetProperty(AcId7, 'placeHolderFont', 'default-bold')
end

startCreateAcccount = function ()
    showCursor(true)
    AcMain0()
    AcMain1()
    theChuka = createPed(0,1773.211,-1945.022,13.559,180)
    setTimer ( function()
        setCameraMatrix(1773.7919921875, -1955.216796875, 15.088039398193,1773.7767333984, -1954.2268066406, 14.944811820984)
    end, 500, 1 )
end
addEvent( "startCreateAcccount", true )
addEventHandler( "startCreateAcccount", localPlayer, startCreateAcccount )
-- startCreateAcccount()

local AcfullDestroy = function ()
    if isElement(Tatle) then
        destroyElement(AcMain)
        destroyElement(Tatle)
    end
    if isElement(Tatle2) then
        destroyElement(Tatle2)
    end


    showCursor(false)
end
addEvent( "destLoginPanel", true )
addEventHandler( "destLoginPanel", localPlayer, AcfullDestroy )

addEventHandler("onDgsMouseClickUp", getRootElement(), function(button)  -- Нажатие на кнопки
    if source == Man then
        if button == "left" then
            -----------------------------
            setElementModel(theChuka, tonumber(SMan))
            dgsSetAlpha ( Man, 0.5 )
            dgsSetAlpha ( Woman, 1 )
            Genderas = "Man"
            -----------------------------
        end

elseif source == Woman then

    if button == "left" then
        -----------------------------
        setElementModel(theChuka, tonumber(SWoman))
        dgsSetAlpha ( Woman, 0.5 )
        dgsSetAlpha ( Man, 1 )
        Genderas = "Woman"
        -- createPed ( SWoman, 1771.7379150,-1973.568359,14.5558261)
        -----------------------------
    end
end
end)

addEventHandler( "onDgsMouseEnter", root, function(aX, aY,leftGUI)
    if leftGUI == Create then
        if not isElement(Create) then return end
        dgsSetAlpha ( Create, 1 )
    end
    if not isElement(Otmena) then return end
    if leftGUI == Otmena then
        dgsSetAlpha ( Otmena, 1 )
    end
end)

addEventHandler( "onDgsMouseLeave", root, function(aX, aY,leftGUI)
    if leftGUI == Create then
        if not isElement(Create) then return end
        dgsSetAlpha ( Create, 0.5 )
    end
    if not isElement(Otmena) then return end
    if leftGUI == Otmena then
        dgsSetAlpha ( Otmena, 0.5 )
    end
end)

addEventHandler("onDgsMouseClickUp", getRootElement(), function(button)  -- кнопка закрыть
    if source == Otmena then
        if button == "left" then
            -----------------------------
            AcfullDestroy()
            showCursor(false)
            startLogInPanel()
            -----------------------------
        end
end
end)





local checkMailAdress = function(dataText)
    for i,v in pairs(tablo) do
        local pos = utf8.find(tostring(dataText),v)
        if pos then
            return true -- отдаём положительное значение
        end
    end
end



addEventHandler("onDgsMouseClickUp", getRootElement(), function(button)  -- кнопка закрыть
    if source == Create then
        if button == "left" then
            -----------------------------
            local login = dgsGetText(AcId1)
            if tostring(login) == "" or tostring(login) == " " or login == nil then outputChatBox('Укажите логин!',255,0,0) return end
            local pass = dgsGetText(AcId2)
            if tostring(pass) == "" or tostring(pass) == " " or pass == nil then outputChatBox('Укажите Пароль!',255,0,0) return end
            local Okpass = dgsGetText(AcId3)
            if tostring(Okpass) == "" or tostring(Okpass) == " " or Okpass == nil then outputChatBox('Подтвертите Пароль!',255,0,0) return end
            if tostring(pass) ~= tostring(Okpass) then outputChatBox('Пароли не совпадают!',255,0,0) return end
            if Genderas == nil then outputChatBox('Укажите пол персонажа',255,0,0) return end
            local Age = dgsGetText(AcId4)
            if tonumber(Age) == nil or tonumber(Age) == "" or tonumber(Age) == " "  then outputChatBox('Укажите Возраст!',255,0,0) return end
            local Name = dgsGetText(AcId5)
            if tostring(Name) == "" or tostring(Name) == " " or Name == nil then outputChatBox('Укажите имя персонажа!',255,0,0) return end
            local SurName = dgsGetText(AcId6)
            if tostring(SurName) == "" or tostring(SurName) == " " or SurName == nil then outputChatBox('Укажите фамилию персонажа!',255,0,0) return end
            local Email = dgsGetText(AcId7)
            if tostring(Email) == "" or tostring(Email) == " " or Email == nil then outputChatBox('Укажите електроную почту!',255,0,0) return end


            local pos = checkMailAdress( dgsGetText(AcId7))
            if pos == nil then outputChatBox('Укажите електроную почту!!!',255,0,0) return end
            if pos == true then

                local Gender = Genderas
                if Genderas == nil then outputChatBox('Укажите пол персанажа!',255,0,0) return end
                local d1,d2,d3,d4,d5,d6,d7 = login,pass,Age,Name,SurName,Email,Gender
                triggerServerEvent ( "onRequestRegister", localPlayer,getLocalPlayer(),d1,d2,d3,d4,d5,d6,d7)
                showCursor(false)
                -- triggerServerEvent ( "onRequestRegister", resourceRoot,geLocalPlayer(),d1,d2,d3,d4,d5,d6,d7)
                -----------------------------
            end
        end
end
end)



