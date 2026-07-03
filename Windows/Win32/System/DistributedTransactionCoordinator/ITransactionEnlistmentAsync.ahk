#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IMoniker.ahk" { IMoniker }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\BOID.ahk" { BOID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionEnlistmentAsync extends IUnknown {
    /**
     * The interface identifier for ITransactionEnlistmentAsync
     * @type {Guid}
     */
    static IID := Guid("{0fb15081-af41-11ce-bd2b-204c4f4f5020}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionEnlistmentAsync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PrepareRequestDone : IntPtr
        CommitRequestDone  : IntPtr
        AbortRequestDone   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionEnlistmentAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {IMoniker} pmk 
     * @param {Pointer<BOID>} pboidReason 
     * @returns {HRESULT} 
     */
    PrepareRequestDone(hr, pmk, pboidReason) {
        result := ComCall(3, this, "int", hr, "ptr", pmk, BOID.Ptr, pboidReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    CommitRequestDone(hr) {
        result := ComCall(4, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    AbortRequestDone(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionEnlistmentAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PrepareRequestDone := CallbackCreate(GetMethod(implObj, "PrepareRequestDone"), flags, 4)
        this.vtbl.CommitRequestDone := CallbackCreate(GetMethod(implObj, "CommitRequestDone"), flags, 2)
        this.vtbl.AbortRequestDone := CallbackCreate(GetMethod(implObj, "AbortRequestDone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PrepareRequestDone)
        CallbackFree(this.vtbl.CommitRequestDone)
        CallbackFree(this.vtbl.AbortRequestDone)
    }
}
