#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\BOID.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class ITransactionOutcomeEvents extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionOutcomeEvents
     * @type {Guid}
     */
    static IID => Guid("{3a6ad9e2-23b9-11cf-ad60-00aa00a74ccd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Committed", "Aborted", "HeuristicDecision", "Indoubt"]

    /**
     * 
     * @param {BOOL} fRetaining 
     * @param {Pointer<BOID>} pNewUOW 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    Committed(fRetaining, pNewUOW, hr) {
        result := ComCall(3, this, "int", fRetaining, "ptr", pNewUOW, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOID>} pboidReason 
     * @param {BOOL} fRetaining 
     * @param {Pointer<BOID>} pNewUOW 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    Aborted(pboidReason, fRetaining, pNewUOW, hr) {
        result := ComCall(4, this, "ptr", pboidReason, "int", fRetaining, "ptr", pNewUOW, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDecision 
     * @param {Pointer<BOID>} pboidReason 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    HeuristicDecision(dwDecision, pboidReason, hr) {
        result := ComCall(5, this, "uint", dwDecision, "ptr", pboidReason, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Indoubt() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
