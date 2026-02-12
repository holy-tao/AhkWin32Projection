#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PMGM_LOCAL_LEAVE_CALLBACK callback is a call into a routing protocol to notify the routing protocol that the IGMP has detected that it no longer has receivers for a group on an interface that is currently owned by the routing protocol.
 * @remarks
 * This version of the Multicast Group Manager API supports only wildcard sources (*, g) or specific sources (s, g), not a range of sources. The same restriction applies to groups (that is, no group ranges are permitted).
 * @see https://learn.microsoft.com/windows/win32/api//content/mgm/nc-mgm-pmgm_local_leave_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PMGM_LOCAL_LEAVE_CALLBACK extends IUnknown {

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
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, dwIfIndex, dwIfNextHopAddr) {
        result := ComCall(3, this, "uint", dwSourceAddr, "uint", dwSourceMask, "uint", dwGroupAddr, "uint", dwGroupMask, "uint", dwIfIndex, "uint", dwIfNextHopAddr, "uint")
        return result
    }
}
