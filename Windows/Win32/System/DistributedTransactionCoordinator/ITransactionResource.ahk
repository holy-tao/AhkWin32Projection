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
export default struct ITransactionResource extends IUnknown {
    /**
     * The interface identifier for ITransactionResource
     * @type {Guid}
     */
    static IID := Guid("{ee5ff7b3-4572-11d0-9452-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionResource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PrepareRequest : IntPtr
        CommitRequest  : IntPtr
        AbortRequest   : IntPtr
        TMDown         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} fRetaining 
     * @param {Integer} grfRM 
     * @param {BOOL} fWantMoniker 
     * @param {BOOL} fSinglePhase 
     * @returns {HRESULT} 
     */
    PrepareRequest(fRetaining, grfRM, fWantMoniker, fSinglePhase) {
        result := ComCall(3, this, BOOL, fRetaining, "uint", grfRM, BOOL, fWantMoniker, BOOL, fSinglePhase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfRM 
     * @param {Pointer<BOID>} pNewUOW 
     * @returns {HRESULT} 
     */
    CommitRequest(grfRM, pNewUOW) {
        result := ComCall(4, this, "uint", grfRM, BOID.Ptr, pNewUOW, "HRESULT")
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
        result := ComCall(5, this, BOID.Ptr, pboidReason, BOOL, fRetaining, BOID.Ptr, pNewUOW, "HRESULT")
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

    Query(iid) {
        if (ITransactionResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PrepareRequest := CallbackCreate(GetMethod(implObj, "PrepareRequest"), flags, 5)
        this.vtbl.CommitRequest := CallbackCreate(GetMethod(implObj, "CommitRequest"), flags, 3)
        this.vtbl.AbortRequest := CallbackCreate(GetMethod(implObj, "AbortRequest"), flags, 4)
        this.vtbl.TMDown := CallbackCreate(GetMethod(implObj, "TMDown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PrepareRequest)
        CallbackFree(this.vtbl.CommitRequest)
        CallbackFree(this.vtbl.AbortRequest)
        CallbackFree(this.vtbl.TMDown)
    }
}
