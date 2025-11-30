#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags used by the DwmSetWindowAttribute function to specify the Flip3D window policy.
 * @remarks
 * 
 * To use a <b>DWMFLIP3DWINDOWPOLICY</b> value, set the <i>dwAttribute</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a> function to <b>DWMWA_FLIP3D_POLICY</b>. Set the <i>pvAttribute</i> parameter to the <b>DWMFLIP3DWINDOWPOLICY</b> value.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ne-dwmapi-dwmflip3dwindowpolicy
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWMFLIP3DWINDOWPOLICY extends Win32Enum{

    /**
     * Use the window's style and visibility settings to determine whether to hide or include the window in Flip3D rendering.
     * @type {Integer (Int32)}
     */
    static DWMFLIP3D_DEFAULT => 0

    /**
     * Exclude the window from Flip3D and display it below the Flip3D rendering.
     * @type {Integer (Int32)}
     */
    static DWMFLIP3D_EXCLUDEBELOW => 1

    /**
     * Exclude the window from Flip3D and display it above the Flip3D rendering.
     * @type {Integer (Int32)}
     */
    static DWMFLIP3D_EXCLUDEABOVE => 2

    /**
     * The maximum recognized <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ne-dwmapi-dwmflip3dwindowpolicy">DWMFLIP3DWINDOWPOLICY</a> value, used for validation purposes.
     * @type {Integer (Int32)}
     */
    static DWMFLIP3D_LAST => 3
}
