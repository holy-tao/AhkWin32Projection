#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintAsyncCookie extends IUnknown {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintAsyncCookie interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FinishAsyncCall : IntPtr
        CancelAsyncCall : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintAsyncCookie.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} param0 
     * @returns {HRESULT} 
     */
    FinishAsyncCall(param0) {
        result := ComCall(3, this, "int", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} param0 
     * @returns {HRESULT} 
     */
    CancelAsyncCall(param0) {
        result := ComCall(4, this, "int", param0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintAsyncCookie.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FinishAsyncCall := CallbackCreate(GetMethod(implObj, "FinishAsyncCall"), flags, 2)
        this.vtbl.CancelAsyncCall := CallbackCreate(GetMethod(implObj, "CancelAsyncCall"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FinishAsyncCall)
        CallbackFree(this.vtbl.CancelAsyncCall)
    }
}
