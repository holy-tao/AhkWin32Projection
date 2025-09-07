#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the target.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwmtransition_ownedwindow_target
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWMTRANSITION_OWNEDWINDOW_TARGET{

    /**
     * Indicates no animation.
     * @type {Integer (Int32)}
     */
    static DWMTRANSITION_OWNEDWINDOW_NULL => -1

    /**
     * Indicates that the window is repositioned.
     * @type {Integer (Int32)}
     */
    static DWMTRANSITION_OWNEDWINDOW_REPOSITION => 0
}
