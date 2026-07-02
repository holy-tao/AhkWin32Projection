#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MOVE_RECT {
    #StructPack 4

    SourcePoint : POINT

    DestRect : RECT

}
