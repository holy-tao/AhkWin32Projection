#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a network state change on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_STATE_CHANGE</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_state_change
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_HOSTED_NETWORK_STATE_CHANGE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The previous network state on the wireless Hosted Network.
     * @type {Integer}
     */
    OldState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The current network state on the wireless Hosted Network.
     * @type {Integer}
     */
    NewState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The reason for the network state change.
     * @type {Integer}
     */
    StateChangeReason {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
