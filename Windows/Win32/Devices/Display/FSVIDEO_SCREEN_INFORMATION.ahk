#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Console\COORD.ahk" { COORD }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FSVIDEO_SCREEN_INFORMATION {
    #StructPack 2

    ScreenSize : COORD

    FontSize : COORD

}
