#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow clients to reset or query the display state of the autocomplete drop-down list, which contains possible completions to a string entered by the user in an edit control.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iautocompletedropdown
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IAutoCompleteDropDown extends IUnknown {
    /**
     * The interface identifier for IAutoCompleteDropDown
     * @type {Guid}
     */
    static IID := Guid("{3cd141f4-3c6a-11d2-bcaa-00c04fd929db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAutoCompleteDropDown interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDropDownStatus : IntPtr
        ResetEnumerator   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAutoCompleteDropDown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the current display status of the autocomplete drop-down list.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * 
     * A pointer to a value indicating whether the autocomplete drop-down list is currently displayed. This parameter can be <b>NULL</b> on entry if this information is not needed. The following values are recognized as the target of this pointer.
     * @param {Pointer<PWSTR>} ppwszString Type: <b>LPWSTR*</b>
     * 
     * A pointer to a buffer containing the first select item in the drop-down list, if the value pointed to by <i>pdwFlags</i> is <b>ACDD_VISIBLE</b>. This value can be <b>NULL</b> on entry if this information is not needed.
     *             
     *                     
     * 
     * If <i>pdwFlags</i> is zero on exit, then this value will be <b>NULL</b>.
     * 
     * If this value is not <b>NULL</b> on exit, the buffer it points to must be freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when it is no longer needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iautocompletedropdown-getdropdownstatus
     */
    GetDropDownStatus(pdwFlags, ppwszString) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        ppwszStringMarshal := ppwszString is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, ppwszStringMarshal, ppwszString, "HRESULT")
        return result
    }

    /**
     * Forces the autocomplete object to refresh its list of suggestions when the list is visible.
     * @remarks
     * The drop-down list is always rebuilt before it is displayed, so there is no reason to use this method unless the drop-down list is currently visible.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iautocompletedropdown-resetenumerator
     */
    ResetEnumerator() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAutoCompleteDropDown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDropDownStatus := CallbackCreate(GetMethod(implObj, "GetDropDownStatus"), flags, 3)
        this.vtbl.ResetEnumerator := CallbackCreate(GetMethod(implObj, "ResetEnumerator"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDropDownStatus)
        CallbackFree(this.vtbl.ResetEnumerator)
    }
}
