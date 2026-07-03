#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FSCNTL_SCREEN_INFO.ahk" { FSCNTL_SCREEN_INFO }
#Import "..\..\System\Console\COORD.ahk" { COORD }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FSVIDEO_REVERSE_MOUSE_POINTER {
    #StructPack 4

    Screen : FSCNTL_SCREEN_INFO

    dwType : UInt32

}
