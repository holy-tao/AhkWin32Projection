#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWebWizardHost.ahk" { IWebWizardHost }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INewWDEvents extends IWebWizardHost {
    /**
     * The interface identifier for INewWDEvents
     * @type {Guid}
     */
    static IID := Guid("{0751c551-7568-41c9-8e5b-e22e38919236}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INewWDEvents interfaces
    */
    struct Vtbl extends IWebWizardHost.Vtbl {
        PassportAuthenticate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INewWDEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrSignInUrl 
     * @returns {VARIANT_BOOL} 
     */
    PassportAuthenticate(bstrSignInUrl) {
        bstrSignInUrl := bstrSignInUrl is String ? BSTR.Alloc(bstrSignInUrl).Value : bstrSignInUrl

        result := ComCall(16, this, BSTR, bstrSignInUrl, VARIANT_BOOL.Ptr, &pvfAuthenitcated := 0, "HRESULT")
        return pvfAuthenitcated
    }

    Query(iid) {
        if (INewWDEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PassportAuthenticate := CallbackCreate(GetMethod(implObj, "PassportAuthenticate"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PassportAuthenticate)
    }
}
