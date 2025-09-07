#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk

/**
 * Contains the IP addresses and data associated with a peer endpoint.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_pnrp_endpoint_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_PNRP_ENDPOINT_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The peer name associated with this peer endpoint.
     * @type {Pointer<Ptr>}
     */
    pwzPeerName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of SOCKADDR structures in <b>pAddresses</b>.
     * @type {Integer}
     */
    cAddresses {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to an array of pointers to SOCKADDR structures that contain the IP addresses for the peer endpoint's network interface.
     * @type {Pointer<SOCKADDR>}
     */
    ppAddresses {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a zero-terminated Unicode string that contains a comment for this peer endpoint.
     * @type {Pointer<Ptr>}
     */
    pwzComment {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains application-specific data for the peer endpoint (such as a message or an image).
     * @deprecated
     * @type {PEER_DATA}
     */
    payload{
        get {
            if(!this.HasProp("__payload"))
                this.__payload := PEER_DATA(this.ptr + 32)
            return this.__payload
        }
    }
}
