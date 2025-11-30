#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class EDIT_CONTROL_FEATURE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EDIT_CONTROL_FEATURE_ENTERPRISE_DATA_PROTECTION_PASTE_SUPPORT => 0

    /**
     * @type {Integer (Int32)}
     */
    static EDIT_CONTROL_FEATURE_PASTE_NOTIFICATIONS => 1
}
