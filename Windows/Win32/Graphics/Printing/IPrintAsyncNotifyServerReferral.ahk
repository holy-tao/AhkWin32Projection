#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAsyncGetSrvReferralCookie.ahk" { IAsyncGetSrvReferralCookie }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintAsyncNotifyServerReferral extends IUnknown {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintAsyncNotifyServerReferral interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetServerReferral      : IntPtr
        AsyncGetServerReferral : IntPtr
        SetServerReferral      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintAsyncNotifyServerReferral.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetServerReferral() {
        result := ComCall(3, this, PWSTR.Ptr, &param0 := 0, "HRESULT")
        return param0
    }

    /**
     * 
     * @param {IAsyncGetSrvReferralCookie} param0 
     * @returns {HRESULT} 
     */
    AsyncGetServerReferral(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pRmtServerReferral 
     * @returns {HRESULT} 
     */
    SetServerReferral(pRmtServerReferral) {
        pRmtServerReferral := pRmtServerReferral is String ? StrPtr(pRmtServerReferral) : pRmtServerReferral

        result := ComCall(5, this, "ptr", pRmtServerReferral, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintAsyncNotifyServerReferral.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetServerReferral := CallbackCreate(GetMethod(implObj, "GetServerReferral"), flags, 2)
        this.vtbl.AsyncGetServerReferral := CallbackCreate(GetMethod(implObj, "AsyncGetServerReferral"), flags, 2)
        this.vtbl.SetServerReferral := CallbackCreate(GetMethod(implObj, "SetServerReferral"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetServerReferral)
        CallbackFree(this.vtbl.AsyncGetServerReferral)
        CallbackFree(this.vtbl.SetServerReferral)
    }
}
