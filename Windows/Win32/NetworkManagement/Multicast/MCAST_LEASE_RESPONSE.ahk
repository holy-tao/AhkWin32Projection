#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPNG_ADDRESS.ahk" { IPNG_ADDRESS }

/**
 * The MCAST_LEASE_RESPONSE structure is used to respond to multicast lease requests.
 * @see https://learn.microsoft.com/windows/win32/api/madcapcl/ns-madcapcl-mcast_lease_response
 * @namespace Windows.Win32.NetworkManagement.Multicast
 */
export default struct MCAST_LEASE_RESPONSE {
    #StructPack 8

    /**
     * Start time, in seconds, for the multicast scope lease elapsed since midnight of January 1, 1970, coordinated universal time.
     */
    LeaseStartTime : Int32

    /**
     * Expiration time, in seconds of the multicast scope lease elapsed since midnight of January 1, 1970, coordinated universal time.
     */
    LeaseEndTime : Int32

    /**
     * Internet Protocol (IP) address of the server on which the lease request has been granted or renewed, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     */
    ServerAddress : IPNG_ADDRESS

    /**
     * Number of IP addresses that are granted or renewed with the lease. Note that the value of this member dictates the size of <b>pAddrBuf</b>.
     */
    AddrCount : UInt16

    /**
     * Pointer to a buffer containing the granted IP addresses. For IPv4 addresses, the <b>pAddrBuf</b> member points to 4-byte addresses; for IPv6 addresses, the <b>pAddrBuf</b> member points to 16-byte addresses.
     */
    pAddrBuf : IntPtr

}
