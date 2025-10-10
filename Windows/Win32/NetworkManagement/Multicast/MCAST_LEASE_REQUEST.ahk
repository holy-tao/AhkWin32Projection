#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPNG_ADDRESS.ahk

/**
 * The MCAST_LEASE_REQUEST structure defines the request, renew, or release parameters for a given multicast scope. In the MCAST_API_VERSION_1 implementation, only one IP address may be allocated at a time.
 * @remarks
 * 
  * In MCAST_API_VERSION_1 version, <b>MaxLeaseStartTime</b>, <b>MinLeaseDuration</b>, and <b>MinAddrCount</b> members are ignored. Clients should still set appropriate values for these members, however, to take advantage of their implementation in future updates.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//madcapcl/ns-madcapcl-mcast_lease_request
 * @namespace Windows.Win32.NetworkManagement.Multicast
 * @version v4.0.30319
 */
class MCAST_LEASE_REQUEST extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Requested start time, in seconds, for the multicast scope lease elapsed since midnight of January 1, 1970, coordinated universal time. To request the current time as the lease start time, set <b>LeaseStartTime</b> to zero.
     * @type {Integer}
     */
    LeaseStartTime {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Maximum start time, in seconds, elapsed since midnight of January 1, 1970, coordinated universal time, that the client is willing to accept.
     * @type {Integer}
     */
    MaxLeaseStartTime {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Duration of the lease request, in seconds. To request the default lease duration, set both <b>LeaseDuration</b> and <b>MinLeaseDuration</b> to zero.
     * @type {Integer}
     */
    LeaseDuration {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Minimum lease duration, in seconds, that the client is willing to accept.
     * @type {Integer}
     */
    MinLeaseDuration {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Internet Protocol (IP) address of the server on which the lease is to be requested or renewed, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure. If the IP address of the server is unknown, such as when using this structure in an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/madcapcl/nf-madcapcl-mcastrequestaddress">McastRequestAddress</a> function call, set <b>ServerAddress</b> to zero.
     * @type {IPNG_ADDRESS}
     */
    ServerAddress{
        get {
            if(!this.HasProp("__ServerAddress"))
                this.__ServerAddress := IPNG_ADDRESS(this.ptr + 16)
            return this.__ServerAddress
        }
    }

    /**
     * Minimum number of IP addresses the client is willing to accept.
     * @type {Integer}
     */
    MinAddrCount {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * Number of requested IP addresses. Note that the value of this member dictates the size of <b>pAddrBuf</b>.
     * @type {Integer}
     */
    AddrCount {
        get => NumGet(this, 38, "ushort")
        set => NumPut("ushort", value, this, 38)
    }

    /**
     * Pointer to a buffer containing the requested IP addresses. For IPv4 addresses, the <b>pAddrBuf</b> member points to 4-byte addresses; for IPv6 addresses, the <b>pAddrBuf</b> member points to 16-byte addresses. If no specific addresses are requested, set <b>pAddrBuf</b> to <b>NULL</b>.
     * @type {Pointer<Byte>}
     */
    pAddrBuf {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
