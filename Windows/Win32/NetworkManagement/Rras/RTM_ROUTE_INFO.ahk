#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RTM_PREF_INFO.ahk
#Include .\RTM_NEXTHOP_LIST.ahk

/**
 * The RTM_ROUTE_INFO structure is used to exchange route information with the routing table manager. Do not change the read-only information.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_route_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_ROUTE_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Handle to the destination that owns the route.
     * @type {Pointer}
     */
    DestHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Handle to the client that owns this route.
     * @type {Pointer}
     */
    RouteOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Handle to the neighbor that informed the routing table manager of this route. This member is <b>NULL</b> for a link-state protocol.
     * @type {Pointer}
     */
    Neighbour {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Flags the specify the state of this route. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_STATE_CREATED"></a><a id="rtm_route_state_created"></a><dl>
     * <dt><b>RTM_ROUTE_STATE_CREATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Route has been created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_STATE_DELETING"></a><a id="rtm_route_state_deleting"></a><dl>
     * <dt><b>RTM_ROUTE_STATE_DELETING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Route is being deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_STATE_DELETED"></a><a id="rtm_route_state_deleted"></a><dl>
     * <dt><b>RTM_ROUTE_STATE_DELETED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Route has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    State {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * Flags used for compatibility with RTMv1.
     * @type {Integer}
     */
    Flags1 {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * Flags used to specify information about the route. The following flags are used. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_ANY_BCAST"></a><a id="rtm_route_flags_any_bcast"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_ANY_BCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The route is one of the following broadcast types: RTM_ROUTE_FLAGS_LIMITED_BC, RTM_ROUTE_FLAGS_ONES_NETBC, RTM_ROUTE_FLAGS_ONES_SUBNET_BC, RTM_ROUTE_FLAGS_ZEROS_NETBC, RTM_ROUTE_FLAGS_ZEROS_SUBNETBC
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_ANY_MCAST"></a><a id="rtm_route_flags_any_mcast"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_ANY_MCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The route is one of the following multicast types: RTM_ROUTE_FLAGS_MCAST, RTM_ROUTE_FLAGS_LOCAL_MCAST
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_ANY_UNICAST"></a><a id="rtm_route_flags_any_unicast"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_ANY_UNICAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The route is one of the following unicast types: RTM_ROUTE_FLAGS_LOCAL, RTM_ROUTE_FLAGS_REMOTE, RTM_ROUTE_FLAGS_MYSELF
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_LIMITED_BC"></a><a id="rtm_route_flags_limited_bc"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_LIMITED_BC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that this route is a limited broadcast address. Packets to this destination should not be forwarded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_LOCAL"></a><a id="rtm_route_flags_local"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_LOCAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a destination is on a directly reachable network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_LOCAL_MCAST"></a><a id="rtm_route_flags_local_mcast"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_LOCAL_MCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that this route is a route to a local multicast address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_MCAST"></a><a id="rtm_route_flags_mcast"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_MCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that this route is a route to a multicast address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_MYSELF"></a><a id="rtm_route_flags_myself"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_MYSELF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the destination is one of the router's addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_NET_BCAST"></a><a id="rtm_route_flags_net_bcast"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_NET_BCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Flag grouping that contains: RTM_ROUTE_FLAGS_ONES_NETBC, RTM_ROUTE_FLAGS_ZEROS_NETBC
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_ONES_NETBC"></a><a id="rtm_route_flags_ones_netbc"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_ONES_NETBC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the destination matches an interface's <i>all-ones</i> broadcast address. If broadcast forwarding is enabled, packets should be received and resent out all appropriate interfaces.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_ONES_SUBNETBC"></a><a id="rtm_route_flags_ones_subnetbc"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_ONES_SUBNETBC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the destination matches an interface's all-ones subnet broadcast address. If subnet broadcast forwarding is enabled, packets should be received and resent out all appropriate interfaces.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_REMOTE"></a><a id="rtm_route_flags_remote"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_REMOTE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the destination is not on a directly reachable network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_ZEROS_SUBNETBC"></a><a id="rtm_route_flags_zeros_subnetbc"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_ZEROS_SUBNETBC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the destination matches an interface's <i>all-zeros</i> subnet broadcast address. If subnet broadcast forwarding is enabled, packets should be received and resent out all appropriate interfaces.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTM_ROUTE_FLAGS_ZEROS_NETBC"></a><a id="rtm_route_flags_zeros_netbc"></a><dl>
     * <dt><b>RTM_ROUTE_FLAGS_ZEROS_NETBC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the destination matches an interface's all-zeros broadcast address. If broadcast forwarding is enabled, packets should be received and resent out all appropriate interfaces.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * Specifies the preference and metric information for this route.
     * @type {RTM_PREF_INFO}
     */
    PrefInfo{
        get {
            if(!this.HasProp("__PrefInfo"))
                this.__PrefInfo := RTM_PREF_INFO(32, this)
            return this.__PrefInfo
        }
    }

    /**
     * Specifies the views in which this route is included.
     * @type {Integer}
     */
    BelongsToViews {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Contains the client-specific information for the client that owns this route.
     * @type {Pointer<Void>}
     */
    EntitySpecificInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Specifies a list of equal-cost next hops.
     * @type {RTM_NEXTHOP_LIST}
     */
    NextHopsList{
        get {
            if(!this.HasProp("__NextHopsList"))
                this.__NextHopsList := RTM_NEXTHOP_LIST(56, this)
            return this.__NextHopsList
        }
    }
}
