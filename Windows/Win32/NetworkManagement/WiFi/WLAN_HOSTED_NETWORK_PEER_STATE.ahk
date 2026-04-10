#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_HOSTED_NETWORK_PEER_AUTH_STATE.ahk

/**
 * Contains information about the peer state for a peer on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_PEER_STATE</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_peer_state
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_HOSTED_NETWORK_PEER_STATE extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * The MAC address of the peer being described.
     * @type {Array<Integer>}
     */
    PeerMacAddress {
        get {
            if(!this.HasProp("__PeerMacAddressProxyArray"))
                this.__PeerMacAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__PeerMacAddressProxyArray
        }
    }

    /**
     * The current authentication state of this peer.
     * @type {WLAN_HOSTED_NETWORK_PEER_AUTH_STATE}
     */
    PeerAuthState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
