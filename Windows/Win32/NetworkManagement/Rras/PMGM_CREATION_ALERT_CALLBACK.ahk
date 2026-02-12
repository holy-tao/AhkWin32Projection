#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PMGM_CREATION_ALERT_CALLBACK callback is a call into a routing protocol. This call determines the subset of interfaces owned by the routing protocol on which a multicast packet from a new source should be forwarded.
 * @see https://learn.microsoft.com/windows/win32/api//content/mgm/nc-mgm-pmgm_creation_alert_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PMGM_CREATION_ALERT_CALLBACK extends IUnknown {

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
     * @param {Integer} dwInIfIndex 
     * @param {Integer} dwInIfNextHopAddr 
     * @param {Integer} dwIfCount 
     * @param {Pointer<MGM_IF_ENTRY>} pmieOutIfList 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, dwInIfIndex, dwInIfNextHopAddr, dwIfCount, pmieOutIfList) {
        result := ComCall(3, this, "uint", dwSourceAddr, "uint", dwSourceMask, "uint", dwGroupAddr, "uint", dwGroupMask, "uint", dwInIfIndex, "uint", dwInIfNextHopAddr, "uint", dwIfCount, "ptr", pmieOutIfList, "uint")
        return result
    }
}
