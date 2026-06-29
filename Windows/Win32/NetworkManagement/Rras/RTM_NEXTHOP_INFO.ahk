#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTM_NET_ADDRESS.ahk" { RTM_NET_ADDRESS }

/**
 * The RTM_NEXTHOP_INFO structure is used to exchange next-hop information with the routing table manager.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_nexthop_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_NEXTHOP_INFO {
    #StructPack 8

    /**
     * Specifies the network address for this next hop.
     */
    NextHopAddress : RTM_NET_ADDRESS

    /**
     * Handle to the client that owns this next hop.
     */
    NextHopOwner : IntPtr

    /**
     * Specifies the outgoing interface index.
     */
    InterfaceIndex : UInt32

    /**
     * Flags that indicates the state of this next hop. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_NEXTHOP_STATE_CREATED"></a><a id="rtm_nexthop_state_created"></a><dl>
     * <dt><b>RTM_NEXTHOP_STATE_CREATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The next hop has been created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_NEXTHOP_STATE_DELETED"></a><a id="rtm_nexthop_state_deleted"></a><dl>
     * <dt><b>RTM_NEXTHOP_STATE_DELETED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The next hop has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     */
    State : UInt16

    /**
     * Flags that convey status information for the next hop. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_NEXTHOP_FLAGS_REMOTE"></a><a id="rtm_nexthop_flags_remote"></a><dl>
     * <dt><b>RTM_NEXTHOP_FLAGS_REMOTE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This next hop points to a remote destination that is not directly reachable. To obtain the complete path, the client must perform a recursive lookup.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_NEXTHOP_FLAGS_DOWN"></a><a id="rtm_nexthop_flags_down"></a><dl>
     * <dt><b>RTM_NEXTHOP_FLAGS_DOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is reserved for future use.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt16

    /**
     * Contains information specific to the client that owns this next hop.
     */
    EntitySpecificInfo : IntPtr

    /**
     * Handle to the destination with the indirect next-hop address. This member is only valid when the <b>Flags</b> member is set to RTM_NEXTHOP_FLAGS_REMOTE. This cached handle can prevent multiple lookups for this indirect next hop.
     */
    RemoteNextHop : IntPtr

}
