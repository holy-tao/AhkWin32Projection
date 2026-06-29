#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct GdiplusStartupInput {
    #StructPack 8

    GdiplusVersion : UInt32

    DebugEventCallback : IntPtr

    SuppressBackgroundThread : BOOL

    SuppressExternalCodecs : BOOL

}
