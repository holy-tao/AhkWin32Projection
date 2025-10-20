#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuSubordinateDtcFactory extends IUnknown{
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
     * 
     * @param {Pointer<Byte>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @param {Pointer<IUnknown>} punkTransactionOuter 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {Pointer<ITransactionOptions>} pOptions 
     * @param {Pointer<ITransaction>} ppTransaction 
     * @param {Pointer<Byte>} pTransId 
     * @param {Integer} cbTransId 
     * @param {Pointer<IDtcLuSubordinateDtcSink>} pSubordinateDtcSink 
     * @param {Pointer<IDtcLuSubordinateDtc>} ppSubordinateDtc 
     * @returns {HRESULT} 
     */
    Create(pucLuPair, cbLuPair, punkTransactionOuter, isoLevel, isoFlags, pOptions, ppTransaction, pTransId, cbTransId, pSubordinateDtcSink, ppSubordinateDtc) {
        result := ComCall(3, this, "char*", pucLuPair, "uint", cbLuPair, "ptr", punkTransactionOuter, "int", isoLevel, "uint", isoFlags, "ptr", pOptions, "ptr", ppTransaction, "char*", pTransId, "uint", cbTransId, "ptr", pSubordinateDtcSink, "ptr", ppSubordinateDtc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
