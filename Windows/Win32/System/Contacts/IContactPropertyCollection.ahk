#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. Used to filter contact data, based on a label or property set. Enumerates contact properties exposed with an IContactProperties object. For each property, the name, type, version, and modification date can be retrieved.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Changing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactproperties">IContactProperties</a> properties object 
  * 		while enumerating properties with this interface results in undefined behavior.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icontact/nn-icontact-icontactpropertycollection
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactPropertyCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactPropertyCollection
     * @type {Guid}
     */
    static IID => Guid("{ffd3adf8-fa64-4328-b1b6-2e0db509cb3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Next", "GetPropertyName", "GetPropertyType", "GetPropertyVersion", "GetPropertyModificationDate", "GetPropertyArrayElementID"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-next
     */
    Next() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} cchPropertyName 
     * @param {Pointer<Integer>} pdwcchPropertyNameRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertyname
     */
    GetPropertyName(pszPropertyName, cchPropertyName, pdwcchPropertyNameRequired) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        pdwcchPropertyNameRequiredMarshal := pdwcchPropertyNameRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszPropertyName, "uint", cchPropertyName, pdwcchPropertyNameRequiredMarshal, pdwcchPropertyNameRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertytype
     */
    GetPropertyType(pdwType) {
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwTypeMarshal, pdwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertyversion
     */
    GetPropertyVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftModificationDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertymodificationdate
     */
    GetPropertyModificationDate(pftModificationDate) {
        result := ComCall(8, this, "ptr", pftModificationDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszArrayElementID 
     * @param {Integer} cchArrayElementID 
     * @param {Pointer<Integer>} pdwcchArrayElementIDRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertyarrayelementid
     */
    GetPropertyArrayElementID(pszArrayElementID, cchArrayElementID, pdwcchArrayElementIDRequired) {
        pszArrayElementID := pszArrayElementID is String ? StrPtr(pszArrayElementID) : pszArrayElementID

        pdwcchArrayElementIDRequiredMarshal := pdwcchArrayElementIDRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pszArrayElementID, "uint", cchArrayElementID, pdwcchArrayElementIDRequiredMarshal, pdwcchArrayElementIDRequired, "HRESULT")
        return result
    }
}
