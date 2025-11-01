#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryInitiatedByDtcStatusWork extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByDtcStatusWork
     * @type {Guid}
     */
    static IID => Guid("{4131e766-1aea-11d0-944b-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleCheckLuStatus"]

    /**
     * 
     * @param {Integer} lRecoverySeqNum 
     * @returns {HRESULT} 
     */
    HandleCheckLuStatus(lRecoverySeqNum) {
        result := ComCall(3, this, "int", lRecoverySeqNum, "HRESULT")
        return result
    }
}
