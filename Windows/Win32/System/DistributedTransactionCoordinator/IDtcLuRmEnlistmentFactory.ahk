#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDtcLuRmEnlistment.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRmEnlistmentFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcLuRmEnlistmentFactory
     * @type {Guid}
     */
    static IID => Guid("{4131e771-1aea-11d0-944b-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * 
     * @param {Pointer<Integer>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @param {ITransaction} pITransaction 
     * @param {Pointer<Integer>} pTransId 
     * @param {Integer} cbTransId 
     * @param {IDtcLuRmEnlistmentSink} pRmEnlistmentSink 
     * @returns {IDtcLuRmEnlistment} 
     */
    Create(pucLuPair, cbLuPair, pITransaction, pTransId, cbTransId, pRmEnlistmentSink) {
        pucLuPairMarshal := pucLuPair is VarRef ? "char*" : "ptr"
        pTransIdMarshal := pTransId is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pucLuPairMarshal, pucLuPair, "uint", cbLuPair, "ptr", pITransaction, pTransIdMarshal, pTransId, "uint", cbTransId, "ptr", pRmEnlistmentSink, "ptr*", &ppRmEnlistment := 0, "HRESULT")
        return IDtcLuRmEnlistment(ppRmEnlistment)
    }
}
