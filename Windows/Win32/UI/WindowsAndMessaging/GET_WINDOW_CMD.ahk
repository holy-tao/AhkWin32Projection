#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class GET_WINDOW_CMD extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GW_CHILD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static GW_ENABLEDPOPUP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static GW_HWNDFIRST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GW_HWNDLAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GW_HWNDNEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GW_HWNDPREV => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GW_OWNER => 4
}
