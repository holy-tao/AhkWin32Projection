#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RTM_NET_ADDRESS.ahk

/**
 * The RTM_NEXTHOP_INFO structure is used to exchange next-hop information with the routing table manager.
 * @see https://docs.microsoft.com/windows/win32/api//rtmv2/ns-rtmv2-rtm_nexthop_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_NEXTHOP_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies the network address for this next hop.
     * @type {RTM_NET_ADDRESS}
     */
    NextHopAddress{
        get {
            if(!this.HasProp("__NextHopAddress"))
                this.__NextHopAddress := RTM_NET_ADDRESS(this.ptr + 0)
            return this.__NextHopAddress
        }
    }

    /**
     * Handle to the client that owns this next hop.
     * @type {Pointer}
     */
    NextHopOwner {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the outgoing interface index.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

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
     * @type {Integer}
     */
    State {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 38, "ushort")
        set => NumPut("ushort", value, this, 38)
    }

    /**
     * Contains information specific to the client that owns this next hop.
     * @type {Pointer<Void>}
     */
    EntitySpecificInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Handle to the destination with the indirect next-hop address. This member is only valid when the <b>Flags</b> member is set to RTM_NEXTHOP_FLAGS_REMOTE. This cached handle can prevent multiple lookups for this indirect next hop.
     * @type {Pointer}
     */
    RemoteNextHop {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
