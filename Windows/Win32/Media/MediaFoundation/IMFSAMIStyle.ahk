#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets and retrieves Synchronized Accessible Media Interchange (SAMI) styles on the SAMI Media Source.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a>. The service identifier is <b>MF_SAMI_SERVICE</b>. Call <b>GetService</b> either directly on the SAMI media source, or on the Media Session (if you are using the SAMI source with the Media Session).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsamistyle
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSAMIStyle extends IUnknown {
    /**
     * The interface identifier for IMFSAMIStyle
     * @type {Guid}
     */
    static IID := Guid("{a7e025dd-5303-4a62-89d6-e747e1efac73}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSAMIStyle interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStyleCount    : IntPtr
        GetStyles        : IntPtr
        SetSelectedStyle : IntPtr
        GetSelectedStyle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSAMIStyle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of styles defined in the SAMI file.
     * @returns {Integer} Receives the number of SAMI styles in the file.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamistyle-getstylecount
     */
    GetStyleCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets a list of the style names defined in the SAMI file.
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives an array of null-terminated wide-character strings. The <b>PROPVARIANT</b> type is VT_VECTOR | VT_LPWSTR. The caller must clear the <b>PROPVARIANT</b> by calling <b>PropVariantClear</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamistyle-getstyles
     */
    GetStyles() {
        pPropVarStyleArray := PROPVARIANT()
        result := ComCall(4, this, PROPVARIANT.Ptr, pPropVarStyleArray, "HRESULT")
        return pPropVarStyleArray
    }

    /**
     * Sets the current style on the SAMI media source.
     * @param {PWSTR} pwszStyle Pointer to a null-terminated string containing the name of the style. To clear the current style, pass an empty string ("").  To get the list of style names, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsamistyle-getstyles">IMFSAMIStyle::GetStyles</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamistyle-setselectedstyle
     */
    SetSelectedStyle(pwszStyle) {
        pwszStyle := pwszStyle is String ? StrPtr(pwszStyle) : pwszStyle

        result := ComCall(5, this, "ptr", pwszStyle, "HRESULT")
        return result
    }

    /**
     * Gets the current style from the SAMI media source.
     * @returns {PWSTR} Receives a pointer to a null-terminated string that contains the name of the style. If no style is currently set, the method returns an empty string. The caller must free the memory for the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsamistyle-getselectedstyle
     */
    GetSelectedStyle() {
        result := ComCall(6, this, PWSTR.Ptr, &ppwszStyle := 0, "HRESULT")
        return ppwszStyle
    }

    Query(iid) {
        if (IMFSAMIStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStyleCount := CallbackCreate(GetMethod(implObj, "GetStyleCount"), flags, 2)
        this.vtbl.GetStyles := CallbackCreate(GetMethod(implObj, "GetStyles"), flags, 2)
        this.vtbl.SetSelectedStyle := CallbackCreate(GetMethod(implObj, "SetSelectedStyle"), flags, 2)
        this.vtbl.GetSelectedStyle := CallbackCreate(GetMethod(implObj, "GetSelectedStyle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStyleCount)
        CallbackFree(this.vtbl.GetStyles)
        CallbackFree(this.vtbl.SetSelectedStyle)
        CallbackFree(this.vtbl.GetSelectedStyle)
    }
}
