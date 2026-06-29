#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Manages metadata for an object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfmetadata
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMetadata extends IUnknown {
    /**
     * The interface identifier for IMFMetadata
     * @type {Guid}
     */
    static IID := Guid("{f88cfb8c-ef16-4991-b450-cb8c69e51704}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMetadata interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetLanguage         : IntPtr
        GetLanguage         : IntPtr
        GetAllLanguages     : IntPtr
        SetProperty         : IntPtr
        GetProperty         : IntPtr
        DeleteProperty      : IntPtr
        GetAllPropertyNames : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMetadata.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the language for setting and retrieving metadata.
     * @remarks
     * For more information about language tags, see RFC 1766, "Tags for the Identification of Languages".
     * @param {PWSTR} pwszRFC1766 Pointer to a null-terminated string containing an RFC 1766-compliant language tag.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-setlanguage
     */
    SetLanguage(pwszRFC1766) {
        pwszRFC1766 := pwszRFC1766 is String ? StrPtr(pwszRFC1766) : pwszRFC1766

        result := ComCall(3, this, "ptr", pwszRFC1766, "HRESULT")
        return result
    }

    /**
     * Gets the current language setting.
     * @remarks
     * For more information about language tags, see RFC 1766, "Tags for the Identification of Languages."
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmetadata-setlanguage">IMFMetadata::SetLanguage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmetadata-getproperty">IMFMetadata::GetProperty</a> methods set and get metadata for the current language setting.
     * @returns {PWSTR} Receives a pointer to a null-terminated string containing an RFC 1766-compliant language tag. The caller must release the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-getlanguage
     */
    GetLanguage() {
        result := ComCall(4, this, PWSTR.Ptr, &ppwszRFC1766 := 0, "HRESULT")
        return ppwszRFC1766
    }

    /**
     * Gets a list of the languages in which metadata is available.
     * @remarks
     * For more information about language tags, see RFC 1766, "Tags for the Identification of Languages".
     *       
     * 
     * To set the current language, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmetadata-setlanguage">IMFMetadata::SetLanguage</a>.
     * @returns {PROPVARIANT} A pointer to a <b>PROPVARIANT</b> that receives the list of languages. The list is returned as an array of null-terminated wide-character strings. Each string in the array is an RFC 1766-compliant language tag. 
     * 
     * The returned <b>PROPVARIANT</b> type is VT_VECTOR | VT_LPWSTR. The list might be empty, if no language tags are present. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-getalllanguages
     */
    GetAllLanguages() {
        ppvLanguages := PROPVARIANT()
        result := ComCall(5, this, PROPVARIANT.Ptr, ppvLanguages, "HRESULT")
        return ppvLanguages
    }

    /**
     * Sets the value of a metadata property.
     * @param {PWSTR} pwszName Pointer to a null-terminated string containing the name of the property.
     * @param {Pointer<PROPVARIANT>} ppvValue Pointer to a <b>PROPVARIANT</b> that contains the value of the property. For multivalued properties, use a <b>PROPVARIANT</b> with a VT_VECTOR type.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-setproperty
     */
    SetProperty(pwszName, ppvValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, PROPVARIANT.Ptr, ppvValue, "HRESULT")
        return result
    }

    /**
     * Gets the value of a metadata property.
     * @param {PWSTR} pwszName A pointer to a null-terminated string that contains the name of the property.
     *           To get the list of property names, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmetadata-getallpropertynames">IMFMetadata::GetAllPropertyNames</a>.
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives the value of the property. The <b>PROPVARIANT</b> type depends on the property. For multivalued properties, the <b>PROPVARIANT</b> is a <b>VT_VECTOR</b> type. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-getproperty
     */
    GetProperty(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        ppvValue := PROPVARIANT()
        result := ComCall(7, this, "ptr", pwszName, PROPVARIANT.Ptr, ppvValue, "HRESULT")
        return ppvValue
    }

    /**
     * Deletes a metadata property.
     * @remarks
     * For a media source, deleting a property from the metadata collection does not change the original content.
     * @param {PWSTR} pwszName Pointer to a null-terminated string containing the name of the property.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_PROPERTY_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property was not found.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-deleteproperty
     */
    DeleteProperty(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * Gets a list of all the metadata property names on this object.
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives an array of null-terminated wide-character strings. If no properties are available, the <b>PROPVARIANT</b> type is VT_EMPTY. Otherwise, the <b>PROPVARIANT</b> type is VT_VECTOR | VT_LPWSTR. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-getallpropertynames
     */
    GetAllPropertyNames() {
        ppvNames := PROPVARIANT()
        result := ComCall(9, this, PROPVARIANT.Ptr, ppvNames, "HRESULT")
        return ppvNames
    }

    Query(iid) {
        if (IMFMetadata.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetLanguage := CallbackCreate(GetMethod(implObj, "SetLanguage"), flags, 2)
        this.vtbl.GetLanguage := CallbackCreate(GetMethod(implObj, "GetLanguage"), flags, 2)
        this.vtbl.GetAllLanguages := CallbackCreate(GetMethod(implObj, "GetAllLanguages"), flags, 2)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.DeleteProperty := CallbackCreate(GetMethod(implObj, "DeleteProperty"), flags, 2)
        this.vtbl.GetAllPropertyNames := CallbackCreate(GetMethod(implObj, "GetAllPropertyNames"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetLanguage)
        CallbackFree(this.vtbl.GetLanguage)
        CallbackFree(this.vtbl.GetAllLanguages)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.DeleteProperty)
        CallbackFree(this.vtbl.GetAllPropertyNames)
    }
}
