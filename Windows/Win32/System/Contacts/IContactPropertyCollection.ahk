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
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Next() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} cchPropertyName 
     * @param {Pointer<UInt32>} pdwcchPropertyNameRequired 
     * @returns {HRESULT} 
     */
    GetPropertyName(pszPropertyName, cchPropertyName, pdwcchPropertyNameRequired) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := ComCall(5, this, "ptr", pszPropertyName, "uint", cchPropertyName, "uint*", pdwcchPropertyNameRequired, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwType 
     * @returns {HRESULT} 
     */
    GetPropertyType(pdwType) {
        result := ComCall(6, this, "uint*", pdwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVersion 
     * @returns {HRESULT} 
     */
    GetPropertyVersion(pdwVersion) {
        result := ComCall(7, this, "uint*", pdwVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftModificationDate 
     * @returns {HRESULT} 
     */
    GetPropertyModificationDate(pftModificationDate) {
        result := ComCall(8, this, "ptr", pftModificationDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszArrayElementID 
     * @param {Integer} cchArrayElementID 
     * @param {Pointer<UInt32>} pdwcchArrayElementIDRequired 
     * @returns {HRESULT} 
     */
    GetPropertyArrayElementID(pszArrayElementID, cchArrayElementID, pdwcchArrayElementIDRequired) {
        pszArrayElementID := pszArrayElementID is String ? StrPtr(pszArrayElementID) : pszArrayElementID

        result := ComCall(9, this, "ptr", pszArrayElementID, "uint", cchArrayElementID, "uint*", pdwcchArrayElementIDRequired, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
