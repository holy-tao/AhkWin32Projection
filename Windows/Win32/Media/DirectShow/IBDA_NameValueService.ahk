#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves name/value pairs from a media transform device (MTD) through the device's General Purpose Name Value Service (GPNVS). Name/value pairs are used to get the capabilities of the device.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_NameValueService)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_namevalueservice
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_NameValueService extends IUnknown {
    /**
     * The interface identifier for IBDA_NameValueService
     * @type {Guid}
     */
    static IID := Guid("{7f0b3150-7b81-4ad4-98e3-7e9097094301}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_NameValueService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetValueNameByIndex : IntPtr
        GetValue            : IntPtr
        SetValue            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_NameValueService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a name, specified by index, from the device's list of name/value pairs.
     * @param {Integer} ulIndex The zero-based index of the name to get.
     * @returns {BSTR} Receives the name as a <b>BSTR</b>. The caller must free the <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_namevalueservice-getvaluenamebyindex
     */
    GetValueNameByIndex(ulIndex) {
        pbstrName := BSTR.Owned()
        result := ComCall(3, this, "uint", ulIndex, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets a value by name.
     * @param {BSTR} bstrName The name of the value to retrieve.
     * @param {BSTR} bstrLanguage The language for the value. If the value of the name/value pair is localizable, this string must contain an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code. Otherwise, this parameter may contain an empty string.
     * @returns {BSTR} Receives the value as a <b>BSTR</b>. The caller must free the <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_namevalueservice-getvalue
     */
    GetValue(bstrName, bstrLanguage) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        pbstrValue := BSTR.Owned()
        result := ComCall(4, this, BSTR, bstrName, BSTR, bstrLanguage, BSTR.Ptr, pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * Sets a name/value pair in device memory.
     * @param {Integer} ulDialogRequest Specifies a logical link with a user interface (MMI) dialog box that might be triggered by setting the value.
     * @param {BSTR} bstrLanguage The language of the dialog box. This string contains an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code.
     * @param {BSTR} bstrName The name of the name/value pair to set.
     * @param {BSTR} bstrValue The value to set.
     * @param {Integer} ulReserved Reserved. Set to zero.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_namevalueservice-setvalue
     */
    SetValue(ulDialogRequest, bstrLanguage, bstrName, bstrValue, ulReserved) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(5, this, "uint", ulDialogRequest, BSTR, bstrLanguage, BSTR, bstrName, BSTR, bstrValue, "uint", ulReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_NameValueService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValueNameByIndex := CallbackCreate(GetMethod(implObj, "GetValueNameByIndex"), flags, 3)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 4)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValueNameByIndex)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.SetValue)
    }
}
