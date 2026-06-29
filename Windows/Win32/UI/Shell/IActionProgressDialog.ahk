#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that initialize and stop a progress dialog.
 * @remarks
 * To instantiate an object that implements this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> using the class identifier (CLSID) CLSID_ProgressDialog.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iactionprogressdialog
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IActionProgressDialog extends IUnknown {
    /**
     * The interface identifier for IActionProgressDialog
     * @type {Guid}
     */
    static IID := Guid("{49ff1172-eadc-446d-9285-156453a6431c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActionProgressDialog interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
        Stop       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActionProgressDialog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides details about the action progress dialog.
     * @param {Integer} flags Type: <b>SPINITF</b>
     * @param {PWSTR} pszTitle Type: <b>LPCWSTR</b>
     * 
     * The title of the progress dialog.
     * @param {PWSTR} pszCancel Type: <b>LPCWSTR</b>
     * 
     * The string displayed when a user closes the dialog before completion.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogressdialog-initialize
     */
    Initialize(flags, pszTitle, pszCancel) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszCancel := pszCancel is String ? StrPtr(pszCancel) : pszCancel

        result := ComCall(3, this, "uint", flags, "ptr", pszTitle, "ptr", pszCancel, "HRESULT")
        return result
    }

    /**
     * Stops a progress dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogressdialog-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActionProgressDialog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Stop)
    }
}
