#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CHAR_IMAGE_INFO.ahk" { CHAR_IMAGE_INFO }
#Import "..\..\System\Console\COORD.ahk" { COORD }
#Import ".\FSCNTL_SCREEN_INFO.ahk" { FSCNTL_SCREEN_INFO }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FSVIDEO_WRITE_TO_FRAME_BUFFER {
    #StructPack 8

    SrcBuffer : CHAR_IMAGE_INFO.Ptr

    DestScreen : FSCNTL_SCREEN_INFO

}
