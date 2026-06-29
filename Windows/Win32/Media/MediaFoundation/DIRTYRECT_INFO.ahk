#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DIRTYRECT_INFO {
    #StructPack 4

    FrameNumber : UInt32

    NumDirtyRects : UInt32

    DirtyRects : RECT[1]

}
