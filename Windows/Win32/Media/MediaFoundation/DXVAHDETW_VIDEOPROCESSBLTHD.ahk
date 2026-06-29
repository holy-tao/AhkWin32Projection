#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHDETW_VIDEOPROCESSBLTHD {
    #StructPack 8

    pObject : Int64

    pOutputSurface : Int64

    TargetRect : RECT

    OutputFormat : D3DFORMAT

    ColorSpace : UInt32

    OutputFrame : UInt32

    StreamCount : UInt32

    Enter : BOOL

}
