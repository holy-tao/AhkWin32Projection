#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IStream.ahk
#Include .\IContactPropertyCollection.ahk
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
     * Retrieves the string value at a specified property into a caller-allocated buffer.
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to retrieve.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
     * @param {PWSTR} pszValue Type: <b>LPWSTR</b>
     * 
     * Specifies user-allocated buffer to store the property.
     * @param {Integer} cchValue Type: <b>DWORD*</b>
     * 
     * Specifies allocated buffer size in characters.
     * @param {Pointer<Integer>} pdwcchPropertyValueRequired Type: <b>DWORD*</b>
     * 
     * On failure, contains the required size for <i>pszValue</i>.
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
     * <i>pszValue</i> contains the null-terminated value. 
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
     * No data for this value. Either the property has been present in the past but its value has been removed 
     * 					or the property is a container of other properties (toplevel/secondlevel[3]). The buffer at <i>pszValue</i> has been zero'ed. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data found for this property name. 
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
     * <i>pszValue</i> was not large enough to store the value. 
     * 					The required buffer size is stored in *<i>pdwcchPropertyValueRequired</i>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-getstring
     */
    GetString(pszPropertyName, dwFlags, pszValue, cchValue, pdwcchPropertyValueRequired) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        pdwcchPropertyValueRequiredMarshal := pdwcchPropertyValueRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pszValue, "uint", cchValue, pdwcchPropertyValueRequiredMarshal, pdwcchPropertyValueRequired, "HRESULT")
        return result
    }

    /**
     * Retrieves the date and time value at a specified property into a caller's FILETIME structure. All times are stored and returned as Coordinated Universal Time (UTC).
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to retrieve.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
     * @param {Pointer<FILETIME>} pftDateTime Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>*</b>
     * 
     * Specifies caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
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
     * <i>pftDateTime</i> contains a valid <a href="/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>. 
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
     * The property has been present in the past but its value has been removed. 
     * 					The <a href="/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> has been zero'ed. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data found for this property name. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-getdate
     */
    GetDate(pszPropertyName, dwFlags, pftDateTime) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := ComCall(4, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pftDateTime, "HRESULT")
        return result
    }

    /**
     * Retrieves the binary data of a property using an IStream interface [Structured Storage].
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to retrieve.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
     * @param {PWSTR} pszContentType Type: <b>LPWSTR</b>
     * 
     * Specifies user-allocated buffer to store the MIME content type.
     * @param {Integer} cchContentType Type: <b>DWORD</b>
     * 
     * Specifies the allocated buffer size in characters.
     * @param {Pointer<Integer>} pdwcchContentTypeRequired Type: <b>DWORD*</b>
     * 
     * On failure, contains the required size for <i>pszContentType</i>.
     * @returns {IStream} Type: <b>IStream**</b>
     * 
     * On success, contains a new <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream interface [Structured Storage]</a>. Use this to retrieve the binary data.
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-getbinary
     */
    GetBinary(pszPropertyName, dwFlags, pszContentType, cchContentType, pdwcchContentTypeRequired) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszContentType := pszContentType is String ? StrPtr(pszContentType) : pszContentType

        pdwcchContentTypeRequiredMarshal := pdwcchContentTypeRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pszContentType, "uint", cchContentType, pdwcchContentTypeRequiredMarshal, pdwcchContentTypeRequired, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    /**
     * Retrieves the labels for a specified array element name.
     * @param {PWSTR} pszArrayElementName Type: <b>LPCWSTR</b>
     * 
     * Specifies the array element name.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
     * @param {PWSTR} pszLabels Type: <b>LPWSTR</b>
     * 
     * Specifies user-allocated buffer to store the labels.
     * @param {Integer} cchLabels Type: <b>DWORD</b>
     * 
     * Specifies allocated buffer size in characters.
     * @param {Pointer<Integer>} pdwcchLabelsRequired Type: <b>DWORD*</b>
     * 
     * On failure, contains the required size for <i>pszLabels</i>.
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
     * Retrieval successful. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data found for this property name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to get value 
     * 					for this property due to schema. 
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
     * <i>pszLabels</i> was not large enough to store the value. 
     * 					The required buffer size is stored in *<i>pdwcchLabelsRequired</i>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-getlabels
     */
    GetLabels(pszArrayElementName, dwFlags, pszLabels, cchLabels, pdwcchLabelsRequired) {
        pszArrayElementName := pszArrayElementName is String ? StrPtr(pszArrayElementName) : pszArrayElementName
        pszLabels := pszLabels is String ? StrPtr(pszLabels) : pszLabels

        pdwcchLabelsRequiredMarshal := pdwcchLabelsRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pszArrayElementName, "uint", dwFlags, "ptr", pszLabels, "uint", cchLabels, pdwcchLabelsRequiredMarshal, pdwcchLabelsRequired, "HRESULT")
        return result
    }

    /**
     * Sets the string value of a specified property to that of a specified null-terminated string.
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to set.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * CGD_DEFAULT can be used to create or overwrite value at <i>pszPropertyName</i>.
     * @param {PWSTR} pszValue Type: <b>LPWSTR</b>
     * 
     * Specifies null-terminated string to store.
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
     * Value is set at this property. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Property name invalid for set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to set value for this property due to schema. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-setstring
     */
    SetString(pszPropertyName, dwFlags, pszValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(7, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pszValue, "HRESULT")
        return result
    }

    /**
     * Sets the date and time value at a specified property to a given FILETIME. All times are stored and returned as Coordinated Universal Time (UTC).
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to set.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * CGD_DEFAULT can be used to create or overwrite value at <i>pszPropertyName</i>.
     * @param {FILETIME} ftDateTime Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to use for date.
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
     * Value is set at this property. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Property name invalid for set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to set the value for this property due to schema. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-setdate
     */
    SetDate(pszPropertyName, dwFlags, ftDateTime) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := ComCall(8, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", ftDateTime, "HRESULT")
        return result
    }

    /**
     * Sets the binary data at a specified property to the contents of a specified IStream interface [Structured Storage], which contains a null-terminated string (as MIME type) data.
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to set.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * CGD_DEFAULT can be used to create or overwrite the value at <i>pszPropertyName</i>.
     * @param {PWSTR} pszContentType Type: <b>LPWSTR</b>
     * 
     * Specifies null-terminated string representing MIME type to store when CGD_DEFAULT.
     * @param {IStream} pStream Type: <b>IStream*</b>
     * 
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream interface [Structured Storage]</a> object containing data to place at this node. 
     * 				NOTE: IStream::Read is called for the data until it succeeds with a zero-length read. 
     * 				Any other return value results in a failure and no change.
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
     * Value is set successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Property name is invalid for set, or property name doesn't exist for delete. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to set the value for this property due to schema. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-setbinary
     */
    SetBinary(pszPropertyName, dwFlags, pszContentType, pStream) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszContentType := pszContentType is String ? StrPtr(pszContentType) : pszContentType

        result := ComCall(9, this, "ptr", pszPropertyName, "uint", dwFlags, "ptr", pszContentType, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * Appends the set of labels passed in to the specified property's label set. Note:\_This method does not check for duplicate labels.
     * @param {PWSTR} pszArrayElementName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to label.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
     * @param {Integer} dwLabelCount Type: <b>DWORD</b>
     * 
     * Specifies the count of labels in array.
     * @param {Pointer<PWSTR>} ppszLabels Type: <b>LPCWSTR</b>
     * 
     *  Specifies an array of LPCWSTR labels.
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
     * Labels set successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data found for this property name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to set value for this property due to schema. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-setlabels
     */
    SetLabels(pszArrayElementName, dwFlags, dwLabelCount, ppszLabels) {
        pszArrayElementName := pszArrayElementName is String ? StrPtr(pszArrayElementName) : pszArrayElementName

        ppszLabelsMarshal := ppszLabels is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", pszArrayElementName, "uint", dwFlags, "uint", dwLabelCount, ppszLabelsMarshal, ppszLabels, "HRESULT")
        return result
    }

    /**
     * Creates a new array node in a multi-value property.
     * @param {PWSTR} pszArrayName Type: <b>LPCWSTR</b>
     * 
     * Specifies the top-level property for which to create a new node.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
     * @param {BOOL} fAppend Type: <b>BOOL</b>
     * 
     * TRUE for insert after, <b>FALSE</b> for insert before.
     * @param {PWSTR} pszNewArrayElementName Type: <b>LPWSTR</b>
     * 
     * Specifies a user-allocated buffer to store the new array element name.
     * @param {Integer} cchNewArrayElementName Type: <b>DWORD</b>
     * 
     * Specifies an allocated buffer size in characters.
     * @param {Pointer<Integer>} pdwcchNewArrayElementNameRequired Type: <b>DWORD*</b>
     * 
     * On failure, contains the required size for <i>pszNewArrayElementName</i>.
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
     * New node is created and name is in <i>pszNewArrayElementName</i>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Macro HRESULT_FROM_WIN32(ERROR_PATH_NOT_FOUND) returned when array name is invalid. 
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
     * Macro HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) returned when <i>pszNewArrayElementName</i> is not large enough to store the value. The required buffer size is stored in <i>pdwcchNewArrayElementNameRequired</i>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-createarraynode
     */
    CreateArrayNode(pszArrayName, dwFlags, fAppend, pszNewArrayElementName, cchNewArrayElementName, pdwcchNewArrayElementNameRequired) {
        pszArrayName := pszArrayName is String ? StrPtr(pszArrayName) : pszArrayName
        pszNewArrayElementName := pszNewArrayElementName is String ? StrPtr(pszNewArrayElementName) : pszNewArrayElementName

        pdwcchNewArrayElementNameRequiredMarshal := pdwcchNewArrayElementNameRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pszArrayName, "uint", dwFlags, "int", fAppend, "ptr", pszNewArrayElementName, "uint", cchNewArrayElementName, pdwcchNewArrayElementNameRequiredMarshal, pdwcchNewArrayElementNameRequired, "HRESULT")
        return result
    }

    /**
     * Deletes the value at a specified property. Property modification and version data can still be enumerated with IContactPropertyCollection.
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to delete the value for.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
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
     * Property deleted successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Property name doesn't exist for delete. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-deleteproperty
     */
    DeleteProperty(pszPropertyName, dwFlags) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := ComCall(12, this, "ptr", pszPropertyName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Deletes the data at a specified array entry.
     * @param {PWSTR} pszArrayElementName Type: <b>LPCWSTR</b>
     * 
     * Specifies array entry from which to remove all data.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
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
     * Node is deleted. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Property name doesn't exist for delete. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-deletearraynode
     */
    DeleteArrayNode(pszArrayElementName, dwFlags) {
        pszArrayElementName := pszArrayElementName is String ? StrPtr(pszArrayElementName) : pszArrayElementName

        result := ComCall(13, this, "ptr", pszArrayElementName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Deletes the labels at a specified array entry.
     * @param {PWSTR} pszArrayElementName Type: <b>LPCWSTR</b>
     * 
     * Specifies the property to delete labels on.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
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
     * Labels deleted successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Property name doesn't exist for delete. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-deletelabels
     */
    DeleteLabels(pszArrayElementName, dwFlags) {
        pszArrayElementName := pszArrayElementName is String ? StrPtr(pszArrayElementName) : pszArrayElementName

        result := ComCall(14, this, "ptr", pszArrayElementName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Returns an IContactPropertyCollection for the current contact. Optionally, filters the IContactPropertyCollection to enumerate only some values.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Must be CGD_DEFAULT.
     * @param {PWSTR} pszMultiValueName Type: <b>LPCWSTR</b>
     * 
     * Specifies the name of the collection (for example: emailAddresses or [namespace]arrayNode). 
     * 				If <b>NULL</b>, all collections are searched for <i>ppszLabels</i>.
     * @param {Integer} dwLabelCount Type: <b>DWORD</b>
     * 
     * Specifies the number of labels in <i>ppszLabels</i>. 
     * 				If zero, all subproperties with labels are returned.
     * @param {Pointer<PWSTR>} ppszLabels Type: <b>LPCWSTR</b>
     * 
     * Specifies an array of string labels to test for. 
     * 				All labels in the array must be set to a valid string (not <b>NULL</b>).
     * @param {BOOL} fAnyLabelMatches Type: <b>BOOL</b>
     * 
     * TRUE if the presence of any label on a given property matches the property. 
     * 				FALSE if all labels must be present to match the property.
     * @returns {IContactPropertyCollection} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactpropertycollection">IContactPropertyCollection</a>**</b>
     * 
     * On success, points to the new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactpropertycollection">IContactPropertyCollection</a>.
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactproperties-getpropertycollection
     */
    GetPropertyCollection(dwFlags, pszMultiValueName, dwLabelCount, ppszLabels, fAnyLabelMatches) {
        pszMultiValueName := pszMultiValueName is String ? StrPtr(pszMultiValueName) : pszMultiValueName

        ppszLabelsMarshal := ppszLabels is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "ptr*", &ppPropertyCollection := 0, "uint", dwFlags, "ptr", pszMultiValueName, "uint", dwLabelCount, ppszLabelsMarshal, ppszLabels, "int", fAnyLabelMatches, "HRESULT")
        return IContactPropertyCollection(ppPropertyCollection)
    }
}
