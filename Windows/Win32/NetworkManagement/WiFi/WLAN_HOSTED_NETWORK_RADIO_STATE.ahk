#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the radio state on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_RADIO_STATE</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_radio_state
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_HOSTED_NETWORK_RADIO_STATE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The software radio state of the wireless Hosted Network.
     * @type {Integer}
     */
    dot11SoftwareRadioState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The hardware radio state of the wireless Hosted Network.
     * @type {Integer}
     */
    dot11HardwareRadioState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
