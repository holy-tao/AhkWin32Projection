#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionResource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionResource
     * @type {Guid}
     */
    static IID => Guid("{ee5ff7b3-4572-11d0-9452-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareRequest", "CommitRequest", "AbortRequest", "TMDown"]

    /**
     * 
     * @param {BOOL} fRetaining 
     * @param {Integer} grfRM 
     * @param {BOOL} fWantMoniker 
     * @param {BOOL} fSinglePhase 
     * @returns {HRESULT} 
     */
    PrepareRequest(fRetaining, grfRM, fWantMoniker, fSinglePhase) {
        result := ComCall(3, this, "int", fRetaining, "uint", grfRM, "int", fWantMoniker, "int", fSinglePhase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfRM 
     * @param {Pointer<BOID>} pNewUOW 
     * @returns {HRESULT} 
     */
    CommitRequest(grfRM, pNewUOW) {
        result := ComCall(4, this, "uint", grfRM, "ptr", pNewUOW, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOID>} pboidReason 
     * @param {BOOL} fRetaining 
     * @param {Pointer<BOID>} pNewUOW 
     * @returns {HRESULT} 
     */
    AbortRequest(pboidReason, fRetaining, pNewUOW) {
        result := ComCall(5, this, "ptr", pboidReason, "int", fRetaining, "ptr", pNewUOW, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TMDown() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
