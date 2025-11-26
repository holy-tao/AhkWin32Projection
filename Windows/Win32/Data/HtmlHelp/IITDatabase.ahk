#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface for opening and closing the database object, and for instantiating objects stored in the database.
 * @see https://docs.microsoft.com/windows/win32/api//infotech/nn-infotech-iitdatabase
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IITDatabase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IITDatabase
     * @type {Guid}
     */
    static IID => Guid("{8fa0d5a2-dedf-11d0-9a61-00c04fb68bf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "CreateObject", "GetObject", "GetObjectPersistence"]

    /**
     * Opens a database.
     * @param {PWSTR} lpszHost Host name. You can pass NULL if calling the <b>Open</b> method locally, otherwise this string should contain the host description string, described below.
     * @param {PWSTR} lpszMoniker Name of database file to open. This should include the full path to the file name, if calling locally. If calling using HTTP, this should contain the ISAPI extension DLL name followed by the relative path to the database file, for example: 
     * 
     * <c>isapiext.dll?path1\path2\db.its</c>
     * @param {Integer} dwFlags Currently not used.
     * @returns {HRESULT} This method can return one of these values.
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
     * The database was successfully opened.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E*</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface errors that can occur as storage is opened.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitdatabase-open
     */
    Open(lpszHost, lpszMoniker, dwFlags) {
        lpszHost := lpszHost is String ? StrPtr(lpszHost) : lpszHost
        lpszMoniker := lpszMoniker is String ? StrPtr(lpszMoniker) : lpszMoniker

        result := ComCall(3, this, "ptr", lpszHost, "ptr", lpszMoniker, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Closes a database.
     * @returns {HRESULT} This method can return one of these values.
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
     * The database was successfully closed.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitdatabase-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Creates an unnamed object you can reference in the future through the *pdwObjInstance parameter.
     * @param {Pointer<Guid>} rclsid Class ID for object.
     * @param {Pointer<Integer>} pdwObjInstance Identifier for object.
     * @returns {HRESULT} This method can return one of these values.
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
     * The object was successfully created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTINIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database has not been opened.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The memory required for internal structures could not be allocated.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitdatabase-createobject
     */
    CreateObject(rclsid, pdwObjInstance) {
        pdwObjInstanceMarshal := pdwObjInstance is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", rclsid, pdwObjInstanceMarshal, pdwObjInstance, "HRESULT")
        return result
    }

    /**
     * Retrieves a specified IUnknown-based interface on the object identified by the dwObjInstance parameter.
     * @param {Integer} dwObjInstance Identifier for object.
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObj Interface ID requested.
     * @returns {HRESULT} This method can return one of these values.
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
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument was not valid.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTINIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database has not been opened.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The memory required for internal structures could not be allocated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitdatabase-getobject
     */
    GetObject(dwObjInstance, riid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", dwObjInstance, "ptr", riid, ppvObjMarshal, ppvObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpwszObject 
     * @param {Integer} dwObjInstance 
     * @param {Pointer<Pointer<Void>>} ppvPersistence 
     * @param {BOOL} fStream 
     * @returns {HRESULT} 
     */
    GetObjectPersistence(lpwszObject, dwObjInstance, ppvPersistence, fStream) {
        lpwszObject := lpwszObject is String ? StrPtr(lpwszObject) : lpwszObject

        ppvPersistenceMarshal := ppvPersistence is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", lpwszObject, "uint", dwObjInstance, ppvPersistenceMarshal, ppvPersistence, "int", fStream, "HRESULT")
        return result
    }
}
