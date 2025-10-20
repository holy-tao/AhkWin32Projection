#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryInitiatedByDtc extends IUnknown{
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByDtc
     * @type {Guid}
     */
    static IID => Guid("{4131e764-1aea-11d0-944b-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pWork 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetWork(pWork, ppv) {
        result := ComCall(3, this, "int*", pWork, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
