#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RTM_NEXTHOP_LIST structure contains a list of next hops used to determine equal-cost paths in a route.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_nexthop_list
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_NEXTHOP_LIST {
    #StructPack 8

    /**
     * Specifies the number of equal cost next hops in <b>NextHops</b>.
     */
    NumNextHops : UInt16

    /**
     * Array of next-hop handles.
     */
    NextHops : IntPtr[1]

}
