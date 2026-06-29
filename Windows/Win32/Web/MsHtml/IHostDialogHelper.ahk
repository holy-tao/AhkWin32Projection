#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHostDialogHelper extends IUnknown {
    /**
     * The interface identifier for IHostDialogHelper
     * @type {Guid}
     */
    static IID := Guid("{53dec138-a51e-11d2-861e-00c04fa35c89}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostDialogHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShowHTMLDialog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostDialogHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {IMoniker} pMk 
     * @param {Pointer<VARIANT>} pvarArgIn 
     * @param {PWSTR} pchOptions 
     * @param {Pointer<VARIANT>} pvarArgOut 
     * @param {IUnknown} punkHost 
     * @returns {HRESULT} 
     */
    ShowHTMLDialog(hwndParent, pMk, pvarArgIn, pchOptions, pvarArgOut, punkHost) {
        pchOptions := pchOptions is String ? StrPtr(pchOptions) : pchOptions

        result := ComCall(3, this, HWND, hwndParent, "ptr", pMk, VARIANT.Ptr, pvarArgIn, "ptr", pchOptions, VARIANT.Ptr, pvarArgOut, "ptr", punkHost, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostDialogHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowHTMLDialog := CallbackCreate(GetMethod(implObj, "ShowHTMLDialog"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowHTMLDialog)
    }
}
