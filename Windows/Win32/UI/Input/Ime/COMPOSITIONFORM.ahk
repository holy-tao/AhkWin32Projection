#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }

/**
 * The COMPOSITIONFORM structure (immdev.h) contains style and position information for a composition window.
 * @remarks
 * Some IME windows adjust the composition window position specified by the system or the application. The CFS_FORCE_POSITION directs the IME window to skip this adjustment.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-compositionform
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct COMPOSITIONFORM {
    #StructPack 4

    dwStyle : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure containing the coordinates of the upper left corner of the composition window.
     */
    ptCurrentPos : POINT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the upper left and lower right corners of the composition window.
     */
    rcArea : RECT

}
