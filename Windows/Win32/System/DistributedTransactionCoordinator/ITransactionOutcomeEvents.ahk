#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\BOID.ahk" { BOID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionOutcomeEvents extends IUnknown {
    /**
     * The interface identifier for ITransactionOutcomeEvents
     * @type {Guid}
     */
    static IID := Guid("{3a6ad9e2-23b9-11cf-ad60-00aa00a74ccd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionOutcomeEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Committed         : IntPtr
        Aborted           : IntPtr
        HeuristicDecision : IntPtr
        Indoubt           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionOutcomeEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} fRetaining 
     * @param {Pointer<BOID>} pNewUOW 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    Committed(fRetaining, pNewUOW, hr) {
        result := ComCall(3, this, BOOL, fRetaining, BOID.Ptr, pNewUOW, "int", hr, "HRESULT")
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
        result := ComCall(4, this, BOID.Ptr, pboidReason, BOOL, fRetaining, BOID.Ptr, pNewUOW, "int", hr, "HRESULT")
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
        result := ComCall(5, this, "uint", dwDecision, BOID.Ptr, pboidReason, "int", hr, "HRESULT")
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

    Query(iid) {
        if (ITransactionOutcomeEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Committed := CallbackCreate(GetMethod(implObj, "Committed"), flags, 4)
        this.vtbl.Aborted := CallbackCreate(GetMethod(implObj, "Aborted"), flags, 5)
        this.vtbl.HeuristicDecision := CallbackCreate(GetMethod(implObj, "HeuristicDecision"), flags, 4)
        this.vtbl.Indoubt := CallbackCreate(GetMethod(implObj, "Indoubt"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Committed)
        CallbackFree(this.vtbl.Aborted)
        CallbackFree(this.vtbl.HeuristicDecision)
        CallbackFree(this.vtbl.Indoubt)
    }
}
