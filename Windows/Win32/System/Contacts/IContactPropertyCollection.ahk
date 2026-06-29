#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Do not use. Used to filter contact data, based on a label or property set. Enumerates contact properties exposed with an IContactProperties object. For each property, the name, type, version, and modification date can be retrieved.
 * @remarks
 * <div class="alert"><b>Note</b>  Changing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactproperties">IContactProperties</a> properties object 
 * 		while enumerating properties with this interface results in undefined behavior.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/icontact/nn-icontact-icontactpropertycollection
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactPropertyCollection extends IUnknown {
    /**
     * The interface identifier for IContactPropertyCollection
     * @type {Guid}
     */
    static IID := Guid("{ffd3adf8-fa64-4328-b1b6-2e0db509cb3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactPropertyCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reset                       : IntPtr
        Next                        : IntPtr
        GetPropertyName             : IntPtr
        GetPropertyType             : IntPtr
        GetPropertyVersion          : IntPtr
        GetPropertyModificationDate : IntPtr
        GetPropertyArrayElementID   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactPropertyCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Resets enumeration of properties.
     * @remarks
     * <div class="alert"><b>Note</b>  Collection has been reset to the location before the first element (if any elements are present), 
     * 		so you must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontactpropertycollection-next">IContactPropertyCollection::Next</a> to begin querying data.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
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
     * Reset is successful. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Moves to the next property.
     * @remarks
     * <div class="alert"><b>Note</b>  After S_FALSE, further calls to interface's query methods will fail.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
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
     * Move is successful. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not move, positioned at the end of the collection. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-next
     */
    Next() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the name for the current property in the enumeration.
     * @param {PWSTR} pszPropertyName Type: <b>LPWSTR</b>
     * 
     * On success, contains the name to use for querying on <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactproperties">IContactProperties</a>. 
     * 				EX: toplevel -or- toplevel/secondlevel[4]/thirdlevel.
     * @param {Integer} cchPropertyName Type: <b>DWORD</b>
     * 
     * Specifies caller-allocated buffer size in characters.
     * @param {Pointer<Integer>} pdwcchPropertyNameRequired Type: <b>DWORD*</b>
     * 
     * On failure, contains the required size for <i>pszPropertyName</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
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
     * Query is successful. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszPropertyName</i> was not large enough to store the value. 
     * 					The required buffer size is stored in *<i>pdwcchPropertyNameRequired</i>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertyname
     */
    GetPropertyName(pszPropertyName, cchPropertyName, pdwcchPropertyNameRequired) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        pdwcchPropertyNameRequiredMarshal := pdwcchPropertyNameRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszPropertyName, "uint", cchPropertyName, pdwcchPropertyNameRequiredMarshal, pdwcchPropertyNameRequired, "HRESULT")
        return result
    }

    /**
     * Retrieves the type for the current property in the enumeration.
     * @param {Pointer<Integer>} pdwType Type: <b>DWORD*</b>
     * 
     * Specifies the type of property. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CGD_UNKNOWN_PROPERTY"></a><a id="cgd_unknown_property"></a><dl>
     * <dt><b>CGD_UNKNOWN_PROPERTY</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CGD_STRING_PROPERTY"></a><a id="cgd_string_property"></a><dl>
     * <dt><b>CGD_STRING_PROPERTY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CGD_DATE_PROPERTY"></a><a id="cgd_date_property"></a><dl>
     * <dt><b>CGD_DATE_PROPERTY</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CGD_BINARY_PROPERTY"></a><a id="cgd_binary_property"></a><dl>
     * <dt><b>CGD_BINARY_PROPERTY</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CGD_ARRAY_NODE"></a><a id="cgd_array_node"></a><dl>
     * <dt><b>CGD_ARRAY_NODE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
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
     * Query is successful. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertytype
     */
    GetPropertyType(pdwType) {
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwTypeMarshal, pdwType, "HRESULT")
        return result
    }

    /**
     * Retrieves the version number for the current property in the enumeration.
     * @param {Pointer<Integer>} pdwVersion Type: <b>DWORD*</b>
     * 
     * Specifies the version of the property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
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
     * Query is successful. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertyversion
     */
    GetPropertyVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }

    /**
     * Retrieves the last modification date for the current property in the enumeration. If not modified, contact creation date is returned.
     * @param {Pointer<FILETIME>} pftModificationDate Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>*</b>
     * 
     * Specifies the last modified date as a UTC FILETIME.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
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
     * Query is successful. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertymodificationdate
     */
    GetPropertyModificationDate(pftModificationDate) {
        result := ComCall(8, this, FILETIME.Ptr, pftModificationDate, "HRESULT")
        return result
    }

    /**
     * Retrieves the unique ID for a given element in a property array.
     * @remarks
     * <div class="alert"><b>Note</b>  Valid only when <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontactpropertycollection-getpropertytype">IContactPropertyCollection::GetPropertyType</a> 
     * 		returns CGD_ARRAY_NODE for the current property.</div>
     * <div> </div>
     * @param {PWSTR} pszArrayElementID Type: <b>LPWSTR</b>
     * 
     * On success, contains the unique ID for the element.
     * @param {Integer} cchArrayElementID Type: <b>DWORD</b>
     * 
     * Specifies caller-allocated buffer size in characters.
     * @param {Pointer<Integer>} pdwcchArrayElementIDRequired Type: <b>DWORD*</b>
     * 
     * On failure, contains the required size for <i>pszArrayElementID</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
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
     * Query is successful. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Array node does not have a unique array element ID. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszArrayElementID</i> was not large enough to store the value. 
     * 					The required buffer size is stored in *<i>pdwcchArrayElementIDRequired</i>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactpropertycollection-getpropertyarrayelementid
     */
    GetPropertyArrayElementID(pszArrayElementID, cchArrayElementID, pdwcchArrayElementIDRequired) {
        pszArrayElementID := pszArrayElementID is String ? StrPtr(pszArrayElementID) : pszArrayElementID

        pdwcchArrayElementIDRequiredMarshal := pdwcchArrayElementIDRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pszArrayElementID, "uint", cchArrayElementID, pdwcchArrayElementIDRequiredMarshal, pdwcchArrayElementIDRequired, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContactPropertyCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 1)
        this.vtbl.GetPropertyName := CallbackCreate(GetMethod(implObj, "GetPropertyName"), flags, 4)
        this.vtbl.GetPropertyType := CallbackCreate(GetMethod(implObj, "GetPropertyType"), flags, 2)
        this.vtbl.GetPropertyVersion := CallbackCreate(GetMethod(implObj, "GetPropertyVersion"), flags, 2)
        this.vtbl.GetPropertyModificationDate := CallbackCreate(GetMethod(implObj, "GetPropertyModificationDate"), flags, 2)
        this.vtbl.GetPropertyArrayElementID := CallbackCreate(GetMethod(implObj, "GetPropertyArrayElementID"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.GetPropertyName)
        CallbackFree(this.vtbl.GetPropertyType)
        CallbackFree(this.vtbl.GetPropertyVersion)
        CallbackFree(this.vtbl.GetPropertyModificationDate)
        CallbackFree(this.vtbl.GetPropertyArrayElementID)
    }
}
