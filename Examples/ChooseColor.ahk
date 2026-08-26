#Requires AutoHotkey v2.1-alpha.30

#Import "..\Windows\Win32\UI\Controls\Dialogs\Apis" { ChooseColorW }
#Import "..\Windows\Win32\UI\Controls\Dialogs" { CHOOSECOLORW as ChooseColorOpts, CHOOSECOLOR_FLAGS }
#Import "..\Windows\Win32\Foundation\COLORREF" { COLORREF }

;Demonstrates a simple color picker using a struct some of the built-in UI functions

stdout := FileOpen("*", "w")

; Set up example Gui
mainGui := Gui("-Resize -MinimizeBox -MaximizeBox", "ChooseColor Example")
btn := mainGui.AddButton("w80 h80 Default", "Change`nBackground`nColor")
btn.Move(60, 60)
btn.OnEvent("Click", ChangeGuiColor)

;Set up the palette with some starting colors
palette := COLORREF[16]()

palette[1] := 0x000000FF    ;Red
palette[2] := 0x0000FF00    ;Green
palette[3] := 0x00FF0000    ;Blue

;Set up CHOOSECOLORW options
chooseColor := ChooseColorOpts()
chooseColor.lStructSize := ObjGetDataSize(chooseColor)
chooseColor.hwndOwner.value := mainGui.Hwnd
chooseColor.rgbResult := 0x00F9F9F9
chooseColor.lpCustColors := palette[1]
chooseColor.flags := CHOOSECOLOR_FLAGS.CC_RGBINIT | CHOOSECOLOR_FLAGS.CC_SOLIDCOLOR

mainGui.Show("w200 h200")

ChangeGuiColor(*){
    result := ChooseColorW(chooseColor)
    
    if(result != 0){
        colorStr := chooseColor.rgbResult.ToRGBString()

        mainGui.BackColor := colorStr
        btn.Opt("Background" . colorStr)
    }
}