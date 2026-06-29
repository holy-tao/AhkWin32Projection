#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPNG_ADDRESS.ahk" { IPNG_ADDRESS }

/**
 * The MCAST_LEASE_REQUEST structure defines the request, renew, or release parameters for a given multicast scope. In the MCAST_API_VERSION_1 implementation, only one IP address may be allocated at a time.
 * @remarks
 * In MCAST_API_VERSION_1 version, <b>MaxLeaseStartTime</b>, <b>MinLeaseDuration</b>, and <b>MinAddrCount</b> members are ignored. Clients should still set appropriate values for these members, however, to take advantage of their implementation in future updates.
 * @see https://learn.microsoft.com/windows/win32/api/madcapcl/ns-madcapcl-mcast_lease_request
 * @namespace Windows.Win32.NetworkManagement.Multicast
 */
export default struct MCAST_LEASE_REQUEST {
    #StructPack 8

    /**
     * Requested start time, in seconds, for the multicast scope lease elapsed since midnight of January 1, 1970, coordinated universal time. To request the current time as the lease start time, set <b>LeaseStartTime</b> to zero.
     */
    LeaseStartTime : Int32

    /**
     * Maximum start time, in seconds, elapsed since midnight of January 1, 1970, coordinated universal time, that the client is willing to accept.
     */
    MaxLeaseStartTime : Int32

    /**
     * Duration of the lease request, in seconds. To request the default lease duration, set both <b>LeaseDuration</b> and <b>MinLeaseDuration</b> to zero.
     */
    LeaseDuration : UInt32

    /**
     * Minimum lease duration, in seconds, that the client is willing to accept.
     */
    MinLeaseDuration : UInt32

    /**
     * Internet Protocol (IP) address of the server on which the lease is to be requested or renewed, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure. If the IP address of the server is unknown, such as when using this structure in an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/madcapcl/nf-madcapcl-mcastrequestaddress">McastRequestAddress</a> function call, set <b>ServerAddress</b> to zero.
     */
    ServerAddress : IPNG_ADDRESS

    /**
     * Minimum number of IP addresses the client is willing to accept.
     */
    MinAddrCount : UInt16

    /**
     * Number of requested IP addresses. Note that the value of this member dictates the size of <b>pAddrBuf</b>.
     */
    AddrCount : UInt16

    /**
     * Pointer to a buffer containing the requested IP addresses. For IPv4 addresses, the <b>pAddrBuf</b> member points to 4-byte addresses; for IPv6 addresses, the <b>pAddrBuf</b> member points to 16-byte addresses. If no specific addresses are requested, set <b>pAddrBuf</b> to <b>NULL</b>.
     */
    pAddrBuf : IntPtr

}
