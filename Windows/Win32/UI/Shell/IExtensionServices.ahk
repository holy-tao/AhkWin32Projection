#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExtensionServices extends IUnknown {
    /**
     * The interface identifier for IExtensionServices
     * @type {Guid}
     */
    static IID := Guid("{79eac9cb-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExtensionServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAdditionalHeaders : IntPtr
        SetAuthenticateData  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExtensionServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzAdditionalHeaders 
     * @returns {HRESULT} 
     */
    SetAdditionalHeaders(pwzAdditionalHeaders) {
        pwzAdditionalHeaders := pwzAdditionalHeaders is String ? StrPtr(pwzAdditionalHeaders) : pwzAdditionalHeaders

        result := ComCall(3, this, "ptr", pwzAdditionalHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} phwnd 
     * @param {PWSTR} pwzUsername 
     * @param {PWSTR} pwzPassword 
     * @returns {HRESULT} 
     */
    SetAuthenticateData(phwnd, pwzUsername, pwzPassword) {
        pwzUsername := pwzUsername is String ? StrPtr(pwzUsername) : pwzUsername
        pwzPassword := pwzPassword is String ? StrPtr(pwzPassword) : pwzPassword

        result := ComCall(4, this, HWND, phwnd, "ptr", pwzUsername, "ptr", pwzPassword, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExtensionServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAdditionalHeaders := CallbackCreate(GetMethod(implObj, "SetAdditionalHeaders"), flags, 2)
        this.vtbl.SetAuthenticateData := CallbackCreate(GetMethod(implObj, "SetAuthenticateData"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAdditionalHeaders)
        CallbackFree(this.vtbl.SetAuthenticateData)
    }
}
