local x,y = guiGetScreenSize()
local px,py = x/1920,y/1080
local s1,s2 = 500,325
loadstring(exports.dgs:dgsImportFunction())()

Fonts = {
    txt = dgsCreateFont ( 'fontf.ttf', 10*(px/py), false, 'antialiased' ),
    nano = dgsCreateFont ( 'fontf.ttf', 7*(px/py), false, 'antialiased' ),
    edit = dgsCreateFont ( 'fontf.ttf', 10*(px/py), false, 'antialiased' ),
    button = dgsCreateFont ( 'fontf.ttf', 10*(px/py), false, 'cleartype' ),
    AcText = dgsCreateFont ( 'fontf.ttf', 8*(px/py), false, 'cleartype' ),
}

Textures = {
    Background = dgsCreateRoundRect(12.5,false,tocolor(0,0,0,150)),
    Edit = dgsCreateRoundRect(10,false,tocolor(0,0,0,150)),



    AcList = dgsCreateRoundRect(10,false,tocolor(0,0,0,150))
}


main = function ()
    Mtitle     = dgsCreateImage(x/2-(s1/2), y/2-(s2/2), s1,s2/15, Textures.Background, false)
    Background = dgsCreateImage(x/2-(s1/2), y/2-(s2/2), s1,s2, Textures.Background, false)
    Lab        = dgsCreateLabel(0.4,0.0075,0,0,"Авторизация",true,Background)
    Lab2        = dgsCreateLabel(0.05,0.1,0,0,"Добро пожаловать на сервер\nЕсли у вас есть аккаунт,то введите свои данные в определенные поля",true,Background)

    edLabel1 = dgsCreateLabel(0.05,0.35,0,0,"Логин:",true,Background)
    edLabel2 = dgsCreateLabel(0.035,0.525,0,0,"Пароль:",true,Background)

    lEd = dgsCreateEdit(90,115,350,40, '', false, Background, tocolor(255,255,255,225)  , 1, 1, Textures.Edit,  0xFF3F3F3F)
    pEd = dgsCreateEdit(90,175,350,40, '', false, Background, 0xFFFFFFFF, 1, 1, Textures.Edit, 0xFF3F3F3F)

    enter     = dgsCreateButton (50,250,115,40, '✓ Войти', false, Background, 0xFFFFFFFF, 1, 1, Textures.Edit, Textures.Edit, Textures.Edit,  0xFFFFFFFF, 0xFFe1e1e1, 0xFFd2d2d2)
    register  = dgsCreateButton (300,250,150,40, '⏳ Регистрация', false, Background, 0xFFFFFFFF, 1, 1, Textures.Edit, Textures.Edit, Textures.Edit,  0xFFFFFFFF, 0xFFe1e1e1, 0xFFd2d2d2)





    dgsEditSetMaxLength ( lEd, MaxEditSimvol )
    dgsEditSetMaxLength ( pEd, MaxEditSimvol )

    dgsSetFont(Lab, Fonts.txt)
    dgsSetFont(Lab2, Fonts.nano)
    dgsSetFont(edLabel1, Fonts.edit)
    dgsSetFont(edLabel2, Fonts.edit)
    dgsSetFont(enter, Fonts.button)
    dgsSetFont(register, Fonts.button)
    dgsEditSetMasked ( pEd, true )
    dgsSetFont(lEd, Fonts.edit)
    dgsEditSetPlaceHolder(lEd, ' Введите логин...')
    dgsSetProperty(lEd, 'placeHolderFont', 'default-bold')

    dgsSetFont(pEd, Fonts.edit)
    dgsEditSetPlaceHolder(pEd, ' Введите пароль...')
    dgsSetProperty(pEd, 'placeHolderFont', 'default-bold')



end

local fullDestroy = function ()
    showCursor(false)
    if  isElement(Mtitle) then
        destroyElement(Mtitle)
        if  isElement(Background) then
            destroyElement(Background)
            if  isElement(Lab) then
                destroyElement(Lab)
                if  isElement(Lab2) then
                    destroyElement(Lab2)
                    if  isElement(edLabel1) then
                        destroyElement(edLabel1)
                        if  isElement(edLabel2) then
                            destroyElement(edLabel2)
                            if  isElement(lEd) then
                                destroyElement(lEd)
                                if  isElement(pEd) then
                                    destroyElement(pEd)
                                    if  isElement(enter) then
                                        destroyElement(enter)
                                        if  isElement(register) then
                                            destroyElement(register)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
addEvent( "destLoginPanel", true )
addEventHandler( "destLoginPanel", localPlayer, fullDestroy )



startLogInPanel = function ()
    if  isElement(Mtitle) then return end
    showCursor(true)
    main()
    setTimer ( function()
        setCameraMatrix(1093.5510253906, -2006.5544433594, 66.36270904541,1079.4116210938, -2000.298828125, 64.305473327637)
    end, 50, 1 )
end
addEvent( "startLogInPanel", true )
addEventHandler( "startLogInPanel", localPlayer, startLogInPanel )
startLogInPanel()














deleteLastCharacter = function (str)
    return(str:gsub("[%z\1-\127\194-\244][\128-\191]*$", ""))
end


if not isElement(enter) then return end

addEventHandler('onDgsTextChange', lEd,
    function()
        local text = dgsGetText(lEd)
        for i = 1, #zapret do
            if (string.find(tostring(text),tostring(zapret[i])) ) then

                dgsSetText(lEd, deleteLastCharacter(text))
            end
        end
    end)

addEventHandler('onDgsTextChange', pEd,
    function()
        local text = dgsGetText(pEd)
        for i = 1, #zapret do
            if (string.find(tostring(text),tostring(zapret[i])) ) then

                dgsSetText(pEd, deleteLastCharacter(text))
            end
        end
    end)




addEventHandler("onDgsMouseClickUp", getRootElement(), function(button)  -- кнопка закрыть
    if source == enter then
        if button == "left" then
            -----------------------------
            local login = dgsGetText(lEd)
            if tostring(login) == "" or tostring(login) == " " or login == nil then outputChatBox('Укажите логин!',255,0,0) return end
            local pass = dgsGetText(pEd)
            if tostring(pass) == "" or tostring(pass) == " " or pass == nil then outputChatBox('Укажите Пароль!',255,0,0) return end

            -- fullDestroy()
            triggerServerEvent ( "onRequestLogin", localPlayer, getLocalPlayer(),login,pass )
            ---------------------------
        end
end
end)
addEventHandler("onDgsMouseClickUp", getRootElement(), function(button)  -- кнопка закрыть
    if source == register then
        if button == "left" then
            -----------------------------
            showCursor(false)
            fullDestroy()
            startCreateAcccount()
            -----------------------------
        end
end
end)



addEventHandler( "onDgsMouseEnter", root, function(aX, aY,leftGUI)
    if leftGUI == enter then
        dgsSetAlpha ( enter, 1 )
    end
    if leftGUI == register then
        dgsSetAlpha ( register, 1 )
    end
end)

addEventHandler( "onDgsMouseLeave", root, function(aX, aY,leftGUI)
    if leftGUI == enter then
        dgsSetAlpha ( enter, 0.5 )
    end
    if leftGUI == register then
        dgsSetAlpha ( register, 0.5 )
    end
end)




