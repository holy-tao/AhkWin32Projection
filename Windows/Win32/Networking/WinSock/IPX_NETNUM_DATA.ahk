#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IPX_NETNUM_DATA structure provides information about a specified IPX network number. Used in conjunction with getsockopt function calls that specify IPX_GETNETINFO in the optname parameter.
 * @remarks
 * If information about the IPX network is in the computer's IPX cache, the call will return immediately. If not, RIP requests are used to resolve the information.
 * @see https://learn.microsoft.com/windows/win32/api/wsnwlink/ns-wsnwlink-ipx_netnum_data
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPX_NETNUM_DATA {
    #StructPack 4

    /**
     * IPX network number for which information is being requested.
     */
    netnum : Int8[4]

    /**
     * Number of hops to the IPX network being queried, in machine order.
     */
    hopcount : UInt16

    /**
     * Network delay tick count required to reach the IPX network, in machine order.
     */
    netdelay : UInt16

    /**
     * Adapter number used to reach the IPX network. The adapter number is zero based, such that if eight adapters are on a given computer, they are numbered 0-7.
     */
    cardnum : Int32

    /**
     * Media Access Control (MAC) address of the next-hop router in the path between the computer and the IPX network. This value is zero if the computer is directly attached to the IPX network.
     */
    router : Int8[6]

}
