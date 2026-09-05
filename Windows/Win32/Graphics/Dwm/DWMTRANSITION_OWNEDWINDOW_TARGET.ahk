#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the target.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwmtransition_ownedwindow_target
 * @namespace Windows.Win32.Graphics.Dwm
 */
class DWMTRANSITION_OWNEDWINDOW_TARGET extends Win32Enum {

    /**
     * Indicates no animation.
     * Native name: DWMTRANSITION_OWNEDWINDOW_NULL
     * @type {Integer (Int32)}
     */
    static NULL => -1

    /**
     * Indicates that the window is repositioned.
     * Native name: DWMTRANSITION_OWNEDWINDOW_REPOSITION
     * @type {Integer (Int32)}
     */
    static REPOSITION => 0
}
