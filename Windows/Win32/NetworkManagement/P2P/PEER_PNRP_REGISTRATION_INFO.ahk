#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk

/**
 * Contains the information provided by a peer identity when it registers with a PNRP cloud.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_pnrp_registration_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_PNRP_REGISTRATION_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains the name of the PNRP cloud for which this peer identity is requesting registration. If <b>NULL</b>, the registration will be made in all clouds.  It is possible to use the special value PEER_PNRP_ALL_LINK_CLOUDS to register in all link local clouds.
     * @type {Pointer<Char>}
     */
    pwzCloudName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a Unicode string that contains the name of the peer identity requesting registration.
     * @type {Pointer<Char>}
     */
    pwzPublishingIdentity {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of SOCKADDR structures in <b>ppAddresses</b>. It is possible to use the special value PEER_PNRP_AUTO_ADDRESSES to have the infrastructure automatically choose addresses.
     * @type {Integer}
     */
    cAddresses {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to an array of pointers to SOCKADDR structures that contain the IP addresses bound to the network interface of the peer identity requesting registration.
     * @type {Pointer<SOCKADDR>}
     */
    ppAddresses {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The network interface port assigned to the address that the peer is publishing.
     * @type {Integer}
     */
    wPort {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * Pointer to a zero-terminated Unicode string that contains a comment for this peer endpoint.
     * @type {Pointer<Char>}
     */
    pwzComment {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains a pointer to an opaque byte buffer containing application-specific data for the peer endpoint (such as a message or an image).
     * @deprecated
     * @type {PEER_DATA}
     */
    payload{
        get {
            if(!this.HasProp("__payload"))
                this.__payload := PEER_DATA(this.ptr + 48)
            return this.__payload
        }
    }
}
