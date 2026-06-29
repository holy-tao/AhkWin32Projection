#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\HRGN.ahk" { HRGN }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies Desktop Window Manager (DWM) blur-behind properties. Used by the DwmEnableBlurBehindWindow function.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_blurbehind
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWM_BLURBEHIND {
    #StructPack 8

    /**
     * A bitwise combination of <a href="https://docs.microsoft.com/windows/desktop/dwm/dwm-bb-constants">DWM Blur Behind</a> constant values that indicates which of the members of this structure have been set.
     */
    dwFlags : UInt32

    /**
     * <b>TRUE</b> to register the window handle to DWM blur behind; <b>FALSE</b> to unregister the window handle from DWM blur behind.
     */
    fEnable : BOOL

    /**
     * The region within the client area where the blur behind will be applied. A <b>NULL</b> value will apply the blur behind the entire client area.
     */
    hRgnBlur : HRGN

    /**
     * <b>TRUE</b> if the window's colorization should transition to match the maximized windows; otherwise, <b>FALSE</b>.
     */
    fTransitionOnMaximized : BOOL

}
