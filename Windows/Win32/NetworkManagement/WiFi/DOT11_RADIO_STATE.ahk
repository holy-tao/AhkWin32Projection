#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-dot11_radio_state~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_RADIO_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_on => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_off => 2
}
