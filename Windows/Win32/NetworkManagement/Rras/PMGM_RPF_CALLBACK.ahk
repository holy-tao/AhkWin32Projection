#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PMGM_RPF_CALLBACK callback is a call into a routing protocol to determine if a given packet was received on the correct interface.
 * @remarks
 * This callback is invoked when an MFE is created. MFEs are created when data from a new multicast source, or destined to a new group, is received.
 * 
 * The multicast group manager invokes this callback to the routing protocol that owns the incoming interface towards the source. The multicast group manager determines the interface by looking up the source of the multicast data in the multicast view of the routing table. This interface is not always the same as the interface on which the data was actually received; this condition occurs if multicast data was received on the wrong interface.
 * 
 * When this callback is invoked, the routing protocol can change the incoming interface if the routing protocol behavior requires it to receive the data for the group from another interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/mgm/nc-mgm-pmgm_rpf_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PMGM_RPF_CALLBACK extends IUnknown {

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
     * @param {Pointer<Integer>} pdwInIfIndex 
     * @param {Pointer<Integer>} pdwInIfNextHopAddr 
     * @param {Pointer<Integer>} pdwUpStreamNbr 
     * @param {Integer} dwHdrSize 
     * @param {Pointer<Integer>} pbPacketHdr 
     * @param {Pointer<Integer>} pbRoute 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, pdwInIfIndex, pdwInIfNextHopAddr, pdwUpStreamNbr, dwHdrSize, pbPacketHdr, pbRoute) {
        pdwInIfIndexMarshal := pdwInIfIndex is VarRef ? "uint*" : "ptr"
        pdwInIfNextHopAddrMarshal := pdwInIfNextHopAddr is VarRef ? "uint*" : "ptr"
        pdwUpStreamNbrMarshal := pdwUpStreamNbr is VarRef ? "uint*" : "ptr"
        pbPacketHdrMarshal := pbPacketHdr is VarRef ? "char*" : "ptr"
        pbRouteMarshal := pbRoute is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwSourceAddr, "uint", dwSourceMask, "uint", dwGroupAddr, "uint", dwGroupMask, pdwInIfIndexMarshal, pdwInIfIndex, pdwInIfNextHopAddrMarshal, pdwInIfNextHopAddr, pdwUpStreamNbrMarshal, pdwUpStreamNbr, "uint", dwHdrSize, pbPacketHdrMarshal, pbPacketHdr, pbRouteMarshal, pbRoute, "uint")
        return result
    }
}
