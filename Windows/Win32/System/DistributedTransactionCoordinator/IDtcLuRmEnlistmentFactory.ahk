#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRmEnlistmentFactory extends IUnknown{
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
     * 
     * @param {Pointer<Byte>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @param {Pointer<ITransaction>} pITransaction 
     * @param {Pointer<Byte>} pTransId 
     * @param {Integer} cbTransId 
     * @param {Pointer<IDtcLuRmEnlistmentSink>} pRmEnlistmentSink 
     * @param {Pointer<IDtcLuRmEnlistment>} ppRmEnlistment 
     * @returns {HRESULT} 
     */
    Create(pucLuPair, cbLuPair, pITransaction, pTransId, cbTransId, pRmEnlistmentSink, ppRmEnlistment) {
        result := ComCall(3, this, "char*", pucLuPair, "uint", cbLuPair, "ptr", pITransaction, "char*", pTransId, "uint", cbTransId, "ptr", pRmEnlistmentSink, "ptr", ppRmEnlistment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
