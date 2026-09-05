#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class EDIT_CONTROL_FEATURE extends Win32Enum {

    /**
     * Native name: EDIT_CONTROL_FEATURE_ENTERPRISE_DATA_PROTECTION_PASTE_SUPPORT
     * @type {Integer (Int32)}
     */
    static ENTERPRISE_DATA_PROTECTION_PASTE_SUPPORT => 0

    /**
     * Native name: EDIT_CONTROL_FEATURE_PASTE_NOTIFICATIONS
     * @type {Integer (Int32)}
     */
    static PASTE_NOTIFICATIONS => 1
}
