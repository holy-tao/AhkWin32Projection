#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IBindCallbackRedirect extends IUnknown {
    /**
     * The interface identifier for IBindCallbackRedirect
     * @type {Guid}
     */
    static IID := Guid("{11c81bc2-121e-4ed5-b9c4-b430bd54f2c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBindCallbackRedirect interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Redirect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBindCallbackRedirect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} lpcUrl 
     * @returns {VARIANT_BOOL} 
     */
    Redirect(lpcUrl) {
        lpcUrl := lpcUrl is String ? StrPtr(lpcUrl) : lpcUrl

        result := ComCall(3, this, "ptr", lpcUrl, VARIANT_BOOL.Ptr, &vbCancel := 0, "HRESULT")
        return vbCancel
    }

    Query(iid) {
        if (IBindCallbackRedirect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Redirect := CallbackCreate(GetMethod(implObj, "Redirect"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Redirect)
    }
}
