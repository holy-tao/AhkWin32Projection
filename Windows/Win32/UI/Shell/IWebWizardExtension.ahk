#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWizardExtension.ahk" { IWizardExtension }

/**
 * Extends the IWizardExtension interface by exposing methods to set the wizard extension's initial URL, and a specific URL in case of an error.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iwebwizardextension
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IWebWizardExtension extends IWizardExtension {
    /**
     * The interface identifier for IWebWizardExtension
     * @type {Guid}
     */
    static IID := Guid("{0e6b3f66-98d1-48c0-a222-fbde74e2fbc5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebWizardExtension interfaces
    */
    struct Vtbl extends IWizardExtension.Vtbl {
        SetInitialURL : IntPtr
        SetErrorURL   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebWizardExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the URL of the initial server-provided HTML page in a hosted wizard.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * The URL of the initial server-provided HTML page.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwebwizardextension-setinitialurl
     */
    SetInitialURL(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(6, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Specifies the URL of a page that displays when a user experiences an error while navigating through the wizard extension pages.
     * @param {PWSTR} pszErrorURL Type: <b>LPCWSTR</b>
     * 
     * The URL of the page to display.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iwebwizardextension-seterrorurl
     */
    SetErrorURL(pszErrorURL) {
        pszErrorURL := pszErrorURL is String ? StrPtr(pszErrorURL) : pszErrorURL

        result := ComCall(7, this, "ptr", pszErrorURL, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebWizardExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInitialURL := CallbackCreate(GetMethod(implObj, "SetInitialURL"), flags, 2)
        this.vtbl.SetErrorURL := CallbackCreate(GetMethod(implObj, "SetErrorURL"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInitialURL)
        CallbackFree(this.vtbl.SetErrorURL)
    }
}
