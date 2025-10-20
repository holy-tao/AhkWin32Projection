#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryInitiatedByLu extends IUnknown{
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByLu
     * @type {Guid}
     */
    static IID => Guid("{4131e768-1aea-11d0-944b-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDtcLuRecoveryInitiatedByLuWork>} ppWork 
     * @returns {HRESULT} 
     */
    GetObjectToHandleWorkFromLu(ppWork) {
        result := ComCall(3, this, "ptr", ppWork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
