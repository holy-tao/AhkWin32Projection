#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDEO_CURSOR_POSITION.ahk" { VIDEO_CURSOR_POSITION }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FSVIDEO_CURSOR_POSITION {
    #StructPack 4

    Coord : VIDEO_CURSOR_POSITION

    dwType : UInt32

}
