#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. Used to retrieve, set, create, and remove properties on an IContact. Property names and extension mechanisms are described in icontactproperties.h.
 * @see https://docs.microsoft.com/windows/win32/api//icontact/nn-icontact-icontactproperties
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactProperties
     * @type {Guid}
     */
    static IID => Guid("{70dd27dd-5cbd-46e8-bef0-23b6b346288f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetString", "GetDate", "GetBinary", "GetLabels", "SetString", "SetDate", "SetBinary", "SetLabels", "CreateArrayNode", "DeleteProperty", "DeleteArrayNode", "DeleteLabels", "GetPropertyCollection"]

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszValue 
     * @param {Integer} cchValue 
     * @param {Pointer<Integer>} pdwcchPropertyValueRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-getstring
     */
    GetString(pszPropertyName, dwFlags, pszValue, cchValue, pdwcchPropertyValueRequired) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(3, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pszValue, "uint", cchValue, "uint*", pdwcchPropertyValueRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} dwFlags 
     * @param {Pointer<FILETIME>} pftDateTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-getdate
     */
    GetDate(pszPropertyName, dwFlags, pftDateTime) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := ComCall(4, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pftDateTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszContentType 
     * @param {Integer} cchContentType 
     * @param {Pointer<Integer>} pdwcchContentTypeRequired 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-getbinary
     */
    GetBinary(pszPropertyName, dwFlags, pszContentType, cchContentType, pdwcchContentTypeRequired, ppStream) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszContentType := pszContentType is String ? StrPtr(pszContentType) : pszContentType

        result := ComCall(5, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pszContentType, "uint", cchContentType, "uint*", pdwcchContentTypeRequired, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszArrayElementName 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszLabels 
     * @param {Integer} cchLabels 
     * @param {Pointer<Integer>} pdwcchLabelsRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-getlabels
     */
    GetLabels(pszArrayElementName, dwFlags, pszLabels, cchLabels, pdwcchLabelsRequired) {
        pszArrayElementName := pszArrayElementName is String ? StrPtr(pszArrayElementName) : pszArrayElementName
        pszLabels := pszLabels is String ? StrPtr(pszLabels) : pszLabels

        result := ComCall(6, this, "ptr", pszArrayElementName, "uint", dwFlags, "ptr", pszLabels, "uint", cchLabels, "uint*", pdwcchLabelsRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-setstring
     */
    SetString(pszPropertyName, dwFlags, pszValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(7, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} dwFlags 
     * @param {FILETIME} ftDateTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-setdate
     */
    SetDate(pszPropertyName, dwFlags, ftDateTime) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := ComCall(8, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", ftDateTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszContentType 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-setbinary
     */
    SetBinary(pszPropertyName, dwFlags, pszContentType, pStream) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszContentType := pszContentType is String ? StrPtr(pszContentType) : pszContentType

        result := ComCall(9, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pszContentType, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszArrayElementName 
     * @param {Integer} dwFlags 
     * @param {Integer} dwLabelCount 
     * @param {Pointer<PWSTR>} ppszLabels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-setlabels
     */
    SetLabels(pszArrayElementName, dwFlags, dwLabelCount, ppszLabels) {
        pszArrayElementName := pszArrayElementName is String ? StrPtr(pszArrayElementName) : pszArrayElementName

        result := ComCall(10, this, "ptr", pszArrayElementName, "uint", dwFlags, "uint", dwLabelCount, "ptr", ppszLabels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszArrayName 
     * @param {Integer} dwFlags 
     * @param {BOOL} fAppend 
     * @param {PWSTR} pszNewArrayElementName 
     * @param {Integer} cchNewArrayElementName 
     * @param {Pointer<Integer>} pdwcchNewArrayElementNameRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-createarraynode
     */
    CreateArrayNode(pszArrayName, dwFlags, fAppend, pszNewArrayElementName, cchNewArrayElementName, pdwcchNewArrayElementNameRequired) {
        pszArrayName := pszArrayName is String ? StrPtr(pszArrayName) : pszArrayName
        pszNewArrayElementName := pszNewArrayElementName is String ? StrPtr(pszNewArrayElementName) : pszNewArrayElementName

        result := ComCall(11, this, "ptr", pszArrayName, "uint", dwFlags, "int", fAppend, "ptr", pszNewArrayElementName, "uint", cchNewArrayElementName, "uint*", pdwcchNewArrayElementNameRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-deleteproperty
     */
    DeleteProperty(pszPropertyName, dwFlags) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := ComCall(12, this, "ptr", pszPropertyName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszArrayElementName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-deletearraynode
     */
    DeleteArrayNode(pszArrayElementName, dwFlags) {
        pszArrayElementName := pszArrayElementName is String ? StrPtr(pszArrayElementName) : pszArrayElementName

        result := ComCall(13, this, "ptr", pszArrayElementName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszArrayElementName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-deletelabels
     */
    DeleteLabels(pszArrayElementName, dwFlags) {
        pszArrayElementName := pszArrayElementName is String ? StrPtr(pszArrayElementName) : pszArrayElementName

        result := ComCall(14, this, "ptr", pszArrayElementName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IContactPropertyCollection>} ppPropertyCollection 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszMultiValueName 
     * @param {Integer} dwLabelCount 
     * @param {Pointer<PWSTR>} ppszLabels 
     * @param {BOOL} fAnyLabelMatches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactproperties-getpropertycollection
     */
    GetPropertyCollection(ppPropertyCollection, dwFlags, pszMultiValueName, dwLabelCount, ppszLabels, fAnyLabelMatches) {
        pszMultiValueName := pszMultiValueName is String ? StrPtr(pszMultiValueName) : pszMultiValueName

        result := ComCall(15, this, "ptr*", ppPropertyCollection, "uint", dwFlags, "ptr", pszMultiValueName, "uint", dwLabelCount, "ptr", ppszLabels, "int", fAnyLabelMatches, "HRESULT")
        return result
    }
}
