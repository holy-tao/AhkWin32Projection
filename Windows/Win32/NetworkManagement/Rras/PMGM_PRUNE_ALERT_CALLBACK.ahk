#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/mgm/nc-mgm-pmgm_prune_alert_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PMGM_PRUNE_ALERT_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} dwSourceAddr 
     * @param {Integer} dwSourceMask 
     * @param {Integer} dwGroupAddr 
     * @param {Integer} dwGroupMask 
     * @param {Integer} dwIfIndex 
     * @param {Integer} dwIfNextHopAddr 
     * @param {BOOL} bMemberDelete 
     * @param {Pointer<Integer>} pdwTimeout 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, dwIfIndex, dwIfNextHopAddr, bMemberDelete, pdwTimeout) {
        pdwTimeoutMarshal := pdwTimeout is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwSourceAddr, "uint", dwSourceMask, "uint", dwGroupAddr, "uint", dwGroupMask, "uint", dwIfIndex, "uint", dwIfNextHopAddr, "int", bMemberDelete, pdwTimeoutMarshal, pdwTimeout, "uint")
        return result
    }
}
