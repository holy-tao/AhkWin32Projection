#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_KEY_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_key_direction_both => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_key_direction_inbound => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_key_direction_outbound => 3
}
