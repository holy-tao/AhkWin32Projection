#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DOT11_RADIO_STATE enumeration specifies an 802.11 radio state.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-dot11_radio_state~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_RADIO_STATE extends Win32Enum{

    /**
     * The radio state is unknown.
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_unknown => 0

    /**
     * The radio is on.
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_on => 1

    /**
     * The radio is off.
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_off => 2
}
