#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDSTEREOMODE {
    #StructPack 4

    dwSize : UInt32

    dwHeight : UInt32

    dwWidth : UInt32

    dwBpp : UInt32

    dwRefreshRate : UInt32

    bSupported : BOOL

}
