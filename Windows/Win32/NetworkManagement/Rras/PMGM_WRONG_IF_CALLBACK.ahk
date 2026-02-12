#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PMGM_WRONG_IF_CALLBACK is a call into a routing protocol to notify the protocol that a packet has been received from the specified source and for the specified group on the wrong interface.
 * @remarks
 * This callback is not currently available.
 * @see https://learn.microsoft.com/windows/win32/api//content/mgm/nc-mgm-pmgm_wrong_if_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PMGM_WRONG_IF_CALLBACK extends IUnknown {

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
     * @param {Integer} dwGroupAddr 
     * @param {Integer} dwIfIndex 
     * @param {Integer} dwIfNextHopAddr 
     * @param {Integer} dwHdrSize 
     * @param {Pointer<Integer>} pbPacketHdr 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwSourceAddr, dwGroupAddr, dwIfIndex, dwIfNextHopAddr, dwHdrSize, pbPacketHdr) {
        pbPacketHdrMarshal := pbPacketHdr is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwSourceAddr, "uint", dwGroupAddr, "uint", dwIfIndex, "uint", dwIfNextHopAddr, "uint", dwHdrSize, pbPacketHdrMarshal, pbPacketHdr, "uint")
        return result
    }
}
