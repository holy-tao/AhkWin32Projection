#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GdiplusStartupInput.ahk" { GdiplusStartupInput }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct GdiplusStartupInputEx {
    #StructPack 8

    Base : GdiplusStartupInput

    StartupParameters : Int32

}
