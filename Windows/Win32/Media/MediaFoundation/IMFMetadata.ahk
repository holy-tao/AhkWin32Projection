#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages metadata for an object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmetadata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMetadata extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMetadata
     * @type {Guid}
     */
    static IID => Guid("{f88cfb8c-ef16-4991-b450-cb8c69e51704}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLanguage", "GetLanguage", "GetAllLanguages", "SetProperty", "GetProperty", "DeleteProperty", "GetAllPropertyNames"]

    /**
     * Sets the language for setting and retrieving metadata.
     * @param {PWSTR} pwszRFC1766 Pointer to a null-terminated string containing an RFC 1766-compliant language tag.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmetadata-setlanguage
     */
    SetLanguage(pwszRFC1766) {
        pwszRFC1766 := pwszRFC1766 is String ? StrPtr(pwszRFC1766) : pwszRFC1766

        result := ComCall(3, this, "ptr", pwszRFC1766, "HRESULT")
        return result
    }

    /**
     * Gets the current language setting.
     * @returns {PWSTR} Receives a pointer to a null-terminated string containing an RFC 1766-compliant language tag. The caller must release the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmetadata-getlanguage
     */
    GetLanguage() {
        result := ComCall(4, this, "ptr*", &ppwszRFC1766 := 0, "HRESULT")
        return ppwszRFC1766
    }

    /**
     * Gets a list of the languages in which metadata is available.
     * @returns {PROPVARIANT} A pointer to a <b>PROPVARIANT</b> that receives the list of languages. The list is returned as an array of null-terminated wide-character strings. Each string in the array is an RFC 1766-compliant language tag. 
     * 
     * The returned <b>PROPVARIANT</b> type is VT_VECTOR | VT_LPWSTR. The list might be empty, if no language tags are present. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmetadata-getalllanguages
     */
    GetAllLanguages() {
        ppvLanguages := PROPVARIANT()
        result := ComCall(5, this, "ptr", ppvLanguages, "HRESULT")
        return ppvLanguages
    }

    /**
     * Sets the value of a metadata property.
     * @param {PWSTR} pwszName Pointer to a null-terminated string containing the name of the property.
     * @param {Pointer<PROPVARIANT>} ppvValue Pointer to a <b>PROPVARIANT</b> that contains the value of the property. For multivalued properties, use a <b>PROPVARIANT</b> with a VT_VECTOR type.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmetadata-setproperty
     */
    SetProperty(pwszName, ppvValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "ptr", ppvValue, "HRESULT")
        return result
    }

    /**
     * Gets the value of a metadata property.
     * @param {PWSTR} pwszName A pointer to a null-terminated string that containings the name of the property.
     *           To get the list of property names, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmetadata-getallpropertynames">IMFMetadata::GetAllPropertyNames</a>.
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives the value of the property. The <b>PROPVARIANT</b> type depends on the property. For multivalued properties, the <b>PROPVARIANT</b> is a <b>VT_VECTOR</b> type. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmetadata-getproperty
     */
    GetProperty(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        ppvValue := PROPVARIANT()
        result := ComCall(7, this, "ptr", pwszName, "ptr", ppvValue, "HRESULT")
        return ppvValue
    }

    /**
     * Deletes a metadata property.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmetadata-deleteproperty
     */
    DeleteProperty(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * Gets a list of all the metadata property names on this object.
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives an array of null-terminated wide-character strings. If no properties are available, the <b>PROPVARIANT</b> type is VT_EMPTY. Otherwise, the <b>PROPVARIANT</b> type is VT_VECTOR | VT_LPWSTR. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmetadata-getallpropertynames
     */
    GetAllPropertyNames() {
        ppvNames := PROPVARIANT()
        result := ComCall(9, this, "ptr", ppvNames, "HRESULT")
        return ppvNames
    }
}
