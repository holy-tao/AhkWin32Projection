#Requires AutoHotkey v2.0

#Include  ..\CStyleArray.ahk
#Include ..\Windows\Win32\UI\Controls\Dialogs\Apis.ahk
#Include ..\Windows\Win32\UI\Controls\Dialogs\CHOOSECOLORW.ahk
#Include ..\Windows\Win32\UI\Controls\Dialogs\CHOOSECOLOR_FLAGS.ahk

;Demonstrates a color picker as well as the use of CStyleArrayList

stdout := FileOpen("*", "w")

; Set up example Gui
mainGui := Gui("-Resize -MinimizeBox -MaximizeBox", "ChooseColor Example")
btn := mainGui.AddButton("w80 h80 Default", "Change`nBackground`nColor")
btn.Move(60, 60)
btn.OnEvent("Click", ChangeGuiColor)

;Set up the palette with some starting colors
palette := CStyleArrayList(Primitive, "UInt", 16)

palette[1] := 0x000000FF    ;Red
palette[2] := 0x0000FF00    ;Green
palette[3] := 0x00FF0000    ;Blue

;Set up CHOOSECOLORW options
chooseColor := CHOOSECOLORW()
chooseColor.lStructSize := CHOOSECOLORW.sizeof
chooseColor.hwndOwner := mainGui.Hwnd
chooseColor.rgbResult := 0x00F9F9F9
chooseColor.lpCustColors := palette.ptr
chooseColor.flags := CHOOSECOLOR_FLAGS.CC_RGBINIT | CHOOSECOLOR_FLAGS.CC_SOLIDCOLOR

mainGui.Show("w200 h200")

ChangeGuiColor(*){
    result := Dialogs.ChooseColorW(chooseColor)
    
    if(result != 0){
        colorStr := DecodeColorRef(chooseColor.rgbResult)

        mainGui.BackColor := colorStr
        btn.Opt("Background" . colorStr)
    }
}

;Ahk has colors in the order RRGGBB, Win32 is the opposite, BBGGRR
DecodeColorRef(color){
    red := color & 0xFF
    green := (color >> 8) & 0xFF
    blue := (color >> 16) & 0xFF

    return Format("0x{1:02X}{2:02X}{3:02X}", red, green, blue)
}