#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPNG_ADDRESS.ahk

/**
 * The MCAST_LEASE_RESPONSE structure is used to respond to multicast lease requests.
 * @see https://docs.microsoft.com/windows/win32/api//madcapcl/ns-madcapcl-mcast_lease_response
 * @namespace Windows.Win32.NetworkManagement.Multicast
 * @version v4.0.30319
 */
class MCAST_LEASE_RESPONSE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Start time, in seconds, for the multicast scope lease elapsed since midnight of January 1, 1970, coordinated universal time.
     * @type {Integer}
     */
    LeaseStartTime {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Expiration time, in seconds of the multicast scope lease elapsed since midnight of January 1, 1970, coordinated universal time.
     * @type {Integer}
     */
    LeaseEndTime {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Internet Protocol (IP) address of the server on which the lease request has been granted or renewed, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     * @type {IPNG_ADDRESS}
     */
    ServerAddress{
        get {
            if(!this.HasProp("__ServerAddress"))
                this.__ServerAddress := IPNG_ADDRESS(8, this)
            return this.__ServerAddress
        }
    }

    /**
     * Number of IP addresses that are granted or renewed with the lease. Note that the value of this member dictates the size of <b>pAddrBuf</b>.
     * @type {Integer}
     */
    AddrCount {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * Pointer to a buffer containing the granted IP addresses. For IPv4 addresses, the <b>pAddrBuf</b> member points to 4-byte addresses; for IPv6 addresses, the <b>pAddrBuf</b> member points to 16-byte addresses.
     * @type {Pointer<Byte>}
     */
    pAddrBuf {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
