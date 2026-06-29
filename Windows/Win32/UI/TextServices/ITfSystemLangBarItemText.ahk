#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfSystemLangBarItemText interface is implemented by a system language bar and is used by a system language bar extension to modify the description displayed for the menu.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itfsystemlangbaritemtext
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfSystemLangBarItemText extends IUnknown {
    /**
     * The interface identifier for ITfSystemLangBarItemText
     * @type {Guid}
     */
    static IID := Guid("{5c4ce0e5-ba49-4b52-ac6b-3b397b4f701f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfSystemLangBarItemText interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetItemText : IntPtr
        GetItemText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfSystemLangBarItemText.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITfSystemLangBarItemText::SetItemText method modifies the text displayed for the system language bar menu.
     * @param {PWSTR} pch [in] A string that appears as a description.
     * @param {Integer} cch [in] Size, in characters, of the string.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritemtext-setitemtext
     */
    SetItemText(pch, cch) {
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(3, this, "ptr", pch, "uint", cch, "HRESULT")
        return result
    }

    /**
     * The ITfSystemLangBarItemText::GetItemText method obtains the text displayed for the system language bar menu.
     * @returns {BSTR} [out] A pointer to BSTR that contains the current description.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritemtext-getitemtext
     */
    GetItemText() {
        pbstrText := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrText, "HRESULT")
        return pbstrText
    }

    Query(iid) {
        if (ITfSystemLangBarItemText.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetItemText := CallbackCreate(GetMethod(implObj, "SetItemText"), flags, 3)
        this.vtbl.GetItemText := CallbackCreate(GetMethod(implObj, "GetItemText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetItemText)
        CallbackFree(this.vtbl.GetItemText)
    }
}
