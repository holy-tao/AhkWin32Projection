#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOW_DISPLAY_AFFINITY extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WDA_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WDA_MONITOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDA_EXCLUDEFROMCAPTURE => 17
}
