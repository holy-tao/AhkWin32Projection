#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOW_PLACEMENT_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPS_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPS_MAXIMIZED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPS_MINIMIZED => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPS_ARRANGED => 3
}
