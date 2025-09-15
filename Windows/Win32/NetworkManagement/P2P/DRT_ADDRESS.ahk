#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk

/**
 * DRT_ADDRESS structure contains endpoint information about a DRT node that participated in a search. This information is intended for use in debugging connectivity problems.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_address
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_ADDRESS extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * Contains the endpoint on which the DRT protocol is listening on the remote node.
     * @type {SOCKADDR_STORAGE}
     */
    socketAddress{
        get {
            if(!this.HasProp("__socketAddress"))
                this.__socketAddress := SOCKADDR_STORAGE(this.ptr + 0)
            return this.__socketAddress
        }
    }

    /**
     * Holds information explaining how this node behaved in the key lookup.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * Contains the number of bits that the key published by this node shares in common with the target key in the search.
     * @type {Integer}
     */
    nearness {
        get => NumGet(this, 252, "int")
        set => NumPut("int", value, this, 252)
    }

    /**
     * Round trip time to this node.
     * @type {Integer}
     */
    latency {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }
}
