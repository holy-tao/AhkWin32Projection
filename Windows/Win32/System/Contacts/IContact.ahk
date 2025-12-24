#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. Defines methods for reading and writing properties for a single contact.
 * @remarks
 * 
 * Classes that implement this interface often also implement these interfaces:
 *             
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersistfile">IPersistFile</a>: Enables the contact 
 *             to be loaded from a file. Use this interface when loading a contact to get full support 
 *             in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontact-commitchanges">CommitChanges</a> to change conflict detection.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>: Provides methods for saving and 
 * 			loading objects that use a simple serial stream for their storage needs.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipersiststreaminit">IPersistStreamInit</a>: Enables the contact to be saved 
 * 			or loaded from a stream. Use <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-initnew">IPersistStreamInit::InitNew</a> to create a 
 * 			new <b>IContact</b>. 
 * 			Note: loading a contact with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a> does 
 * 			not give you the locking and conflict detection that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a> 
 * 			and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontact-commitchanges">CommitChanges</a> do.</li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactproperties">IContactProperties</a>: Enables manipulation of contact properties.</li>
 * </ul>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//icontact/nn-icontact-icontact
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContact extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContact
     * @type {Guid}
     */
    static IID => Guid("{f941b671-bda7-4f77-884a-f46462f226a7}")

    /**
     * The class identifier for Contact
     * @type {Guid}
     */
    static CLSID => Guid("{61b68808-8eee-4fd1-acb8-3d804c8db056}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContactID", "GetPath", "CommitChanges"]

    /**
     * Retrieves the local computer unique contact ID.
     * @param {PWSTR} pszContactID Type: <b>LPWSTR</b>
     * 
     * User allocated buffer to store the contact ID.
     * @param {Integer} cchContactID Type: <b>DWORD</b>
     * 
     * Specifies allocated buffer size.
     * @param {Pointer<Integer>} pdwcchContactIDRequired Type: <b>DWORD*</b>
     * 
     * Upon failure due to insufficient buffer, contains the required size for <i>pszContactID</i>. May be <b>NULL</b>.
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
     * Success. <i>pszContactID</i> contains a null-terminated ContactID. 
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
     * Macro HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) returned when <i>pszContactID</i> was not large enough to store the value. The required buffer size is stored in <i>pdwcchContactIDRequired</i>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontact-getcontactid
     */
    GetContactID(pszContactID, cchContactID, pdwcchContactIDRequired) {
        pszContactID := pszContactID is String ? StrPtr(pszContactID) : pszContactID

        pdwcchContactIDRequiredMarshal := pdwcchContactIDRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszContactID, "uint", cchContactID, pdwcchContactIDRequiredMarshal, pdwcchContactIDRequired, "HRESULT")
        return result
    }

    /**
     * Retrieves the file system path used to load this contact.
     * @param {PWSTR} pszPath Type: <b>LPWSTR</b>
     * 
     * User-allocated buffer to store the contact ID.
     * @param {Integer} cchPath Type: <b>DWORD</b>
     * 
     * Specifies the allocated buffer size in characters.
     * @param {Pointer<Integer>} pdwcchPathRequired Type: <b>DWORD*</b>
     * 
     * Upon failure due to insufficient buffer, contains the required size for <i>pszPath</i>.
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
     * Success. <i>pszPath</i> contains the path. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contact ID was not loaded from a file path. 
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
     * Macro HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) returned when <i>pszPath</i> was not large enough to store the value. The required buffer size is stored in <i>pdwcchPathRequired</i>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontact-getpath
     */
    GetPath(pszPath, cchPath, pdwcchPathRequired) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pdwcchPathRequiredMarshal := pdwcchPathRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszPath, "uint", cchPath, pdwcchPathRequiredMarshal, pdwcchPathRequired, "HRESULT")
        return result
    }

    /**
     * Saves changes made to this contact to the contact file.
     * @param {Integer} dwCommitFlags Type: <b>DWORD</b>
     * 
     * Reserved parameter. Must be 0.
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
     * Changes written to disk successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contact not loaded from a file path. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHARING_VIOLATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another process modified the file in a way incompatible with 
     * 					changes to this contact. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontact-commitchanges
     */
    CommitChanges(dwCommitFlags) {
        result := ComCall(5, this, "uint", dwCommitFlags, "HRESULT")
        return result
    }
}
