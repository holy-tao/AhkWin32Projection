#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BACKLIGHT_OPTIMIZATION_LEVEL.ahk" { BACKLIGHT_OPTIMIZATION_LEVEL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PANEL_SET_BACKLIGHT_OPTIMIZATION {
    #StructPack 4

    Level : BACKLIGHT_OPTIMIZATION_LEVEL

}
