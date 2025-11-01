#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryInitiatedByDtc extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWork"]

    /**
     * 
     * @param {Pointer<Integer>} pWork 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetWork(pWork, ppv) {
        pWorkMarshal := pWork is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pWorkMarshal, pWork, "ptr*", ppv, "HRESULT")
        return result
    }
}
