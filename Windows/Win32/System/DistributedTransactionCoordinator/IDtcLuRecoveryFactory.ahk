#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDtcLuRecovery.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRecoveryFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcLuRecoveryFactory
     * @type {Guid}
     */
    static IID => Guid("{4131e762-1aea-11d0-944b-00a0c905416e}")

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
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {Pointer<Integer>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @returns {IDtcLuRecovery} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(pucLuPair, cbLuPair) {
        pucLuPairMarshal := pucLuPair is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pucLuPairMarshal, pucLuPair, "uint", cbLuPair, "ptr*", &ppRecovery := 0, "HRESULT")
        return IDtcLuRecovery(ppRecovery)
    }
}
