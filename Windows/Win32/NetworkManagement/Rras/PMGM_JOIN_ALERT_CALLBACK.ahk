#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PMGM_JOIN_ALERT_CALLBACK callback is a call into a routing protocol to notify the protocol that new receivers are present for one or more groups on interfaces that are owned by other routing protocols.
 * @remarks
 * The multicast group manager sets the <i>bMemberUpdate</i> parameter to <b>TRUE</b> and invokes this callback if a client calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmaddgroupmembershipentry">MgmAddGroupMembershipEntry</a> function for a (s, g), (*, g), or (*, *) entry (that is, the group membership has changed).
 * 
 * The multicast group manager sets the <i>bMemberUpdate</i> parameter to <b>FALSE</b> if the outgoing interface list for an MFE changes. This change typically occurs for a change in membership for the group corresponding to the MFE.
 * 
 * A multicast routing protocol can use the <i>bMemberUpdate</i> parameter to distinguish between changes to group membership and changes to the MFE.
 * 
 * The action taken by the routing protocol when this callback is received is protocol-specific. The protocol may ignore the callback if the <i>bMemberUpdate</i> parameter is set to <b>FALSE</b>, if the protocol specification indicates that this is the correct behavior.
 * 
 * When 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/nf-mgm-mgmaddgroupmembershipentry">MgmAddGroupMembershipEntry</a> is called, the multicast group manager uses this callback to notify other multicast group manager clients that there are receivers for the specified source and group.
 * 
 * The multicast group manager uses the following rules to determine when to invoke this callback for wildcard (*, g) joins:
 * 
 * <ul>
 * <li>If this is the first client to inform the multicast group manager that there are receivers on an interface for a group, the multicast group manager invokes the 
 * <b>PMGM_JOIN_ALERT_CALLBACK</b> callback to all other registered clients.</li>
 * <li>If this is the second client to inform the multicast group manager that there are receivers on an interface for a group, the multicast group manager invokes this callback to the first client to join the group.</li>
 * </ul>
 * The multicast group manager does not invoke this callback for any subsequent joins to the group.
 * 
 * The multicast group manager uses the following rule to determine when to invoke this callback for source-specific (s, g) joins:
 * 
 * <ul>
 * <li>If this is the first client to inform the multicast group manager that there are receivers on an interface for a source and group, the multicast group manager invokes the 
 * <b>PMGM_JOIN_ALERT_CALLBACK</b> callback only for the client that owns the incoming interface towards the source "s".</li>
 * </ul>
 * This version of the Multicast Group Manager API supports only wildcard sources (*, g) or specific sources (s, g), not a range of sources. The same restriction applies to groups (that is, no group ranges are permitted).
 * @see https://learn.microsoft.com/windows/win32/api//content/mgm/nc-mgm-pmgm_join_alert_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PMGM_JOIN_ALERT_CALLBACK extends IUnknown {

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
     * @param {BOOL} bMemberUpdate 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, bMemberUpdate) {
        result := ComCall(3, this, "uint", dwSourceAddr, "uint", dwSourceMask, "uint", dwGroupAddr, "uint", dwGroupMask, "int", bMemberUpdate, "uint")
        return result
    }
}
