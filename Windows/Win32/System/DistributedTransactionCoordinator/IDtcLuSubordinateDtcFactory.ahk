#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuSubordinateDtcFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcLuSubordinateDtcFactory
     * @type {Guid}
     */
    static IID => Guid("{4131e775-1aea-11d0-944b-00a0c905416e}")

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
     * @param {IUnknown} punkTransactionOuter 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {ITransactionOptions} pOptions 
     * @param {Pointer<ITransaction>} ppTransaction 
     * @param {Pointer<Integer>} pTransId 
     * @param {Integer} cbTransId 
     * @param {IDtcLuSubordinateDtcSink} pSubordinateDtcSink 
     * @param {Pointer<IDtcLuSubordinateDtc>} ppSubordinateDtc 
     * @returns {HRESULT} 
     */
    Create(pucLuPair, cbLuPair, punkTransactionOuter, isoLevel, isoFlags, pOptions, ppTransaction, pTransId, cbTransId, pSubordinateDtcSink, ppSubordinateDtc) {
        pucLuPairMarshal := pucLuPair is VarRef ? "char*" : "ptr"
        pTransIdMarshal := pTransId is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pucLuPairMarshal, pucLuPair, "uint", cbLuPair, "ptr", punkTransactionOuter, "int", isoLevel, "uint", isoFlags, "ptr", pOptions, "ptr*", ppTransaction, pTransIdMarshal, pTransId, "uint", cbTransId, "ptr", pSubordinateDtcSink, "ptr*", ppSubordinateDtc, "HRESULT")
        return result
    }
}
