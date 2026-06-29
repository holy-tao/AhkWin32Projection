#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Console\COORD.ahk" { COORD }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FSCNTL_SCREEN_INFO {
    #StructPack 4

    Position : COORD

    ScreenSize : COORD

    nNumberOfChars : UInt32

}
