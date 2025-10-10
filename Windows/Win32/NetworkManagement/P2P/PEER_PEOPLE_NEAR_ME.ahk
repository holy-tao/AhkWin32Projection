#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include .\PEER_ADDRESS.ahk
#Include .\PEER_ENDPOINT.ahk

/**
 * Contains information about a peer in the same logical or virtual subnet.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_people_near_me
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_PEOPLE_NEAR_ME extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Zero-terminated Unicode string that contains the nickname of the contact.
     * @type {Pointer<Char>}
     */
    pwzNickName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the IPv6 network address of the peer whose endpoint shares the same subnet.
     * @deprecated
     * @type {PEER_ENDPOINT}
     */
    endpoint{
        get {
            if(!this.HasProp("__endpoint"))
                this.__endpoint := PEER_ENDPOINT(this.ptr + 8)
            return this.__endpoint
        }
    }

    /**
     * GUID value that contains the unique ID value for this peer.  Since this value uniquely identifies a peer endpoint, the display name and even the associated IPv6 address can be changed with deleting the rest of the peer information.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
