#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_UPDATE_IE_OP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_update_ie_op_create_replace => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_update_ie_op_delete => 2
}
