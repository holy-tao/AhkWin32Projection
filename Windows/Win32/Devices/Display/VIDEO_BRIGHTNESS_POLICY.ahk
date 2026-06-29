#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_BRIGHTNESS_POLICY {
    #StructPack 1

    DefaultToBiosPolicy : BOOLEAN

    LevelCount : Int8

    BatteryLevel : Int8

    Brightness : Int8

}
