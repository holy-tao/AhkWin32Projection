#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MOVE_RECT.ahk" { MOVE_RECT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MOVEREGION_INFO {
    #StructPack 4

    FrameNumber : UInt32

    NumMoveRegions : UInt32

    MoveRegions : MOVE_RECT[1]

}
