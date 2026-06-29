#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Console\COORD.ahk" { COORD }
#Import ".\FSCNTL_SCREEN_INFO.ahk" { FSCNTL_SCREEN_INFO }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FSVIDEO_COPY_FRAME_BUFFER {
    #StructPack 4

    SrcScreen : FSCNTL_SCREEN_INFO

    DestScreen : FSCNTL_SCREEN_INFO

}
