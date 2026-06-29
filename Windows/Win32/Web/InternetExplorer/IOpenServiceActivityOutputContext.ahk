#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IOpenServiceActivityOutputContext extends IUnknown {
    /**
     * The interface identifier for IOpenServiceActivityOutputContext
     * @type {Guid}
     */
    static IID := Guid("{e289deab-f709-49a9-b99e-282364074571}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpenServiceActivityOutputContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Navigate    : IntPtr
        CanNavigate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpenServiceActivityOutputContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {PWSTR} pwzUri 
     * @param {PWSTR} pwzMethod 
     * @param {PWSTR} pwzHeaders 
     * @param {IStream} pPostData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/navigate-element
     */
    Navigate(pwzUri, pwzMethod, pwzHeaders, pPostData) {
        pwzUri := pwzUri is String ? StrPtr(pwzUri) : pwzUri
        pwzMethod := pwzMethod is String ? StrPtr(pwzMethod) : pwzMethod
        pwzHeaders := pwzHeaders is String ? StrPtr(pwzHeaders) : pwzHeaders

        result := ComCall(3, this, "ptr", pwzUri, "ptr", pwzMethod, "ptr", pwzHeaders, "ptr", pPostData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzUri 
     * @param {PWSTR} pwzMethod 
     * @param {PWSTR} pwzHeaders 
     * @param {IStream} pPostData 
     * @returns {BOOL} 
     */
    CanNavigate(pwzUri, pwzMethod, pwzHeaders, pPostData) {
        pwzUri := pwzUri is String ? StrPtr(pwzUri) : pwzUri
        pwzMethod := pwzMethod is String ? StrPtr(pwzMethod) : pwzMethod
        pwzHeaders := pwzHeaders is String ? StrPtr(pwzHeaders) : pwzHeaders

        result := ComCall(4, this, "ptr", pwzUri, "ptr", pwzMethod, "ptr", pwzHeaders, "ptr", pPostData, BOOL.Ptr, &pfCanNavigate := 0, "HRESULT")
        return pfCanNavigate
    }

    Query(iid) {
        if (IOpenServiceActivityOutputContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Navigate := CallbackCreate(GetMethod(implObj, "Navigate"), flags, 5)
        this.vtbl.CanNavigate := CallbackCreate(GetMethod(implObj, "CanNavigate"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Navigate)
        CallbackFree(this.vtbl.CanNavigate)
    }
}
