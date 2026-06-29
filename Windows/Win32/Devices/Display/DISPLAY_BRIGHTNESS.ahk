#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAY_BRIGHTNESS {
    #StructPack 1

    ucDisplayPolicy : Int8

    ucACBrightness : Int8

    ucDCBrightness : Int8

}
