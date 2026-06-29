#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISecureUrlHost extends IUnknown {
    /**
     * The interface identifier for ISecureUrlHost
     * @type {Guid}
     */
    static IID := Guid("{c81984c4-74c8-11d2-baa9-00c04fc2040e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISecureUrlHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ValidateSecureUrl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISecureUrlHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pchUrlInQuestion 
     * @param {Integer} dwFlags 
     * @returns {BOOL} 
     */
    ValidateSecureUrl(pchUrlInQuestion, dwFlags) {
        pchUrlInQuestion := pchUrlInQuestion is String ? StrPtr(pchUrlInQuestion) : pchUrlInQuestion

        result := ComCall(3, this, BOOL.Ptr, &pfAllow := 0, "ptr", pchUrlInQuestion, "uint", dwFlags, "HRESULT")
        return pfAllow
    }

    Query(iid) {
        if (ISecureUrlHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ValidateSecureUrl := CallbackCreate(GetMethod(implObj, "ValidateSecureUrl"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ValidateSecureUrl)
    }
}
