#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_HOSTED_NETWORK_PEER_STATE.ahk

/**
 * Contains information about a network state change for a data peer on the wireless Hosted Network.
 * @remarks
 * 
  * The <b>WLAN_HOSTED_NETWORK_DATA_PEER_STATE_CHANGE</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_hosted_network_data_peer_state_change
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_HOSTED_NETWORK_DATA_PEER_STATE_CHANGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The previous network state for a data peer on the wireless Hosted Network.
     * @type {WLAN_HOSTED_NETWORK_PEER_STATE}
     */
    OldState{
        get {
            if(!this.HasProp("__OldState"))
                this.__OldState := WLAN_HOSTED_NETWORK_PEER_STATE(0, this)
            return this.__OldState
        }
    }

    /**
     * The current network state for a data peer on the wireless Hosted Network.
     * @type {WLAN_HOSTED_NETWORK_PEER_STATE}
     */
    NewState{
        get {
            if(!this.HasProp("__NewState"))
                this.__NewState := WLAN_HOSTED_NETWORK_PEER_STATE(16, this)
            return this.__NewState
        }
    }

    /**
     * The reason for the network state change for the data peer.
     * @type {Integer}
     */
    PeerStateChangeReason {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
