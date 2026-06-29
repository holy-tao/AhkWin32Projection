#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\BOID.ahk" { BOID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionLastResourceAsync extends IUnknown {
    /**
     * The interface identifier for ITransactionLastResourceAsync
     * @type {Guid}
     */
    static IID := Guid("{c82bd532-5b30-11d3-8a91-00c04f79eb6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionLastResourceAsync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DelegateCommit : IntPtr
        ForgetRequest  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionLastResourceAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} grfRM 
     * @returns {HRESULT} 
     */
    DelegateCommit(grfRM) {
        result := ComCall(3, this, "uint", grfRM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOID>} pNewUOW 
     * @returns {HRESULT} 
     */
    ForgetRequest(pNewUOW) {
        result := ComCall(4, this, BOID.Ptr, pNewUOW, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionLastResourceAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DelegateCommit := CallbackCreate(GetMethod(implObj, "DelegateCommit"), flags, 2)
        this.vtbl.ForgetRequest := CallbackCreate(GetMethod(implObj, "ForgetRequest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DelegateCommit)
        CallbackFree(this.vtbl.ForgetRequest)
    }
}
