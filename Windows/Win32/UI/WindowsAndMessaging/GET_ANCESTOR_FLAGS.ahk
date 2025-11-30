#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class GET_ANCESTOR_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GA_PARENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GA_ROOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GA_ROOTOWNER => 3
}
