#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include .\PEER_ADDRESS.ahk

/**
 * The PEER_ENDPOINT structure contains the address and friendly name of a peer endpoint.
 * @remarks
 * 
  * A peer "endpoint" describes a contact's presence location — the unique network address configuration that describes the currently available instance of the contact within the peer collaboration network. A single contact can be available at multiple endpoints within the peer collaboration network.
  * 
  * A peer watching a contact can query any of the endpoints associated with that contact for specific peer presence, application, or object updates.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_endpoint
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_ENDPOINT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structure that contains the IPv6 network address of the endpoint.
     * @deprecated
     * @type {PEER_ADDRESS}
     */
    address{
        get {
            if(!this.HasProp("__address"))
                this.__address := PEER_ADDRESS(0, this)
            return this.__address
        }
    }

    /**
     * Zero-terminated Unicode string that contains the specific displayable name of the endpoint.
     * @type {PWSTR}
     */
    pwzEndpointName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
