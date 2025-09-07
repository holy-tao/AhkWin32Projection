#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk

/**
 * The PEER_ADDRESS structure specifies the information about the IP address.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_address
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_ADDRESS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the size of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the IP address of the node in the Peer Infrastructure.
     * @type {SOCKADDR_IN6}
     */
    sin6{
        get {
            if(!this.HasProp("__sin6"))
                this.__sin6 := SOCKADDR_IN6(this.ptr + 8)
            return this.__sin6
        }
    }
}
