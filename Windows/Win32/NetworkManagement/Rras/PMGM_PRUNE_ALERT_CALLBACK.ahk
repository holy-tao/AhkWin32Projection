#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The PMGM_PRUNE_ALERT_CALLBACK callback is a call into a routing protocol to notify the protocol that receivers are no longer present on interfaces owned by other routing protocols.
 * @remarks
 * The multicast group manager sets the <i>bMemberDelete</i> parameter to <b>TRUE</b> and invokes this callback if a client calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmdeletegroupmembershipentry">MgmDeleteGroupMembershipEntry</a> function for a (s, g), (*, g), or (*, *) entry (that is, the group membership changes).
 * 
 * The multicast group manager sets the <i>bMemberDelete</i> parameter to <b>FALSE</b> if the outgoing interface list for an MFE changes. This change typically occurs for a change in membership for the group corresponding to the MFE.
 * 
 * A multicast routing protocol can use the <i>bMemberDelete</i> parameter to distinguish between changes to group membership and changes to the MFE.
 * 
 * The action taken by the routing protocol when this callback is received is protocol-specific. The protocol may ignore the callback if the <i>bMemberDelete</i> parameter is set to <b>FALSE</b>, if the protocol specification indicates that this is the correct behavior.
 * 
 * When 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmdeletegroupmembershipentry">MgmDeleteGroupMembershipEntry</a> is called, the multicast group manager uses this callback to notify other multicast group manager clients that there are no more receivers for the specified source and group.
 * 
 * The multicast group manager uses the following rules to determine when to invoke this callback for wildcard (*, g) joins:
 * 
 * <ul>
 * <li>If the final interface is being removed for the second-to-last client (that is, when interfaces for only a single client remain), the multicast group manager invokes the 
 * <b>PMGM_PRUNE_ALERT_CALLBACK</b> callback to that remaining client.</li>
 * <li>If the final interface is being removed for the last client (that is, when no other interfaces remain), then this callback is invoked for all the other clients that are registered with the multicast group manager.</li>
 * </ul>
 * The multicast group manager uses the following rule to determine when to invoke this callback for source-specific (s, g) joins:
 * 
 * <ul>
 * <li>When a source-specific prune for a group (s, g) is received, the multicast group manager invokes the 
 * <b>PMGM_PRUNE_ALERT_CALLBACK</b> callback only for the client that owns the incoming interface towards the source "s".</li>
 * </ul>
 * This version of the Multicast Group Manager API supports only wildcard sources (*, g) or specific sources (s, g), not a range of sources. The same restriction applies to groups (that is, no group ranges are permitted).
 * @see https://learn.microsoft.com/windows/win32/api/mgm/nc-mgm-pmgm_prune_alert_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMGM_PRUNE_ALERT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PMGM_PRUNE_ALERT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwSourceAddr Specifies the source address from which to stop receiving multicast data. Zero indicates to stop receiving data from all sources (a wildcard receiver for a group); otherwise, the value of <i>dwSourceAddr</i> is the IP address of the source or source network. 
     * 
     * 
     * 
     * 
     * To specify a range of source addresses, the multicast group manager specifies the source network using <i>dwSourceAddr</i>, and specifies a subnet mask using <i>dwSourceMask</i>.
     * @param {Integer} dwSourceMask Specifies the subnet mask that corresponds to <i>dwSourceAddr</i>. The <i>dwSourceAddr</i> and <i>dwSourceMask</i> parameters are used together to define a range of sources from which to stop receiving receive multicast data. 
     * 
     * 
     * 
     * 
     * The multicast group manager specifies zero for this parameter if it also specified zero for <i>dwSourceAddr</i> (a wildcard receiver).
     * @param {Integer} dwGroupAddr Specifies the multicast group for which to stop receiving data. Zero indicates to stop receiving data for all groups (a wildcard receiver); otherwise, the value of <i>dwGroupAddr</i> is the IP address of the group. 
     * 
     * 
     * 
     * 
     * To specify a range of group addresses, the multicast group manager specifies the group address using <i>dwGroupAddr</i>, and specifies a subnet mask using <i>dwGroupMask</i>.
     * @param {Integer} dwGroupMask Specifies the subnet mask that corresponds to <i>dwGroupAddr</i>. The <i>dwGroupAddr</i> and <i>dwGroupMask</i> parameters are used together to define a range of multicast groups. 
     * 
     * 
     * 
     * 
     * The multicast group manager specifies zero for this parameter if it also specified zero for <i>dwGroupAddr</i> (a wildcard receiver).
     * @param {Integer} dwIfIndex Specifies the interface on which to stop receiving multicast data.
     * @param {Integer} dwIfNextHopAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @param {BOOL} bMemberDelete Specifies whether the callback was invoked because the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmaddgroupmembershipentry">MgmAddGroupMembershipEntry</a> was called by a client (the multicast group manager sets this parameter to <b>TRUE</b>), or because an MFE was created or updated (the multicast group manager sets this parameter to <b>FALSE</b>).
     * @param {Pointer<Integer>} pdwTimeout On input, <i>pdwTimeout</i> points to a <b>DWORD</b>-sized memory location. 
     * 
     * 
     * 
     * 
     * If <i>bMemberDelete</i> is <b>FALSE</b>, this parameter can be used to specify how long the corresponding MFE should remain in the multicast forwarding cache. If the client does not specify a value, the default value is 900 seconds.
     * 
     * On output, <i>pdwTimeout</i> receives the time-out value, in seconds, for this MFE.
     * @returns {Integer} RRAS does not expect the application to return any specific value; any value returned is ignored by RRAS.
     */
    Call(dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, dwIfIndex, dwIfNextHopAddr, bMemberDelete, pdwTimeout) {
        pdwTimeoutMarshal := pdwTimeout is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, dwSourceAddr, UInt32, dwSourceMask, UInt32, dwGroupAddr, UInt32, dwGroupMask, UInt32, dwIfIndex, UInt32, dwIfNextHopAddr, BOOL, bMemberDelete, pdwTimeoutMarshal, pdwTimeout, UInt32)
        return result
    }

    /**
     * A PMGM_PRUNE_ALERT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMGM_PRUNE_ALERT_CALLBACK {
        /**
         * Creates a PMGM_PRUNE_ALERT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, BOOL, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, BOOL, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
