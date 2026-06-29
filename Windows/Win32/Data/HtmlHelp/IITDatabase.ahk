#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface for opening and closing the database object, and for instantiating objects stored in the database.
 * @see https://learn.microsoft.com/windows/win32/api/infotech/nn-infotech-iitdatabase
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct IITDatabase extends IUnknown {
    /**
     * The interface identifier for IITDatabase
     * @type {Guid}
     */
    static IID := Guid("{8fa0d5a2-dedf-11d0-9a61-00c04fb68bf7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IITDatabase interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Open                 : IntPtr
        Close                : IntPtr
        CreateObject         : IntPtr
        GetObject            : IntPtr
        GetObjectPersistence : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IITDatabase.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface errors that can occur as storage is opened.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitdatabase-open
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
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitdatabase-close
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
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitdatabase-createobject
     */
    CreateObject(rclsid, pdwObjInstance) {
        pdwObjInstanceMarshal := pdwObjInstance is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, Guid.Ptr, rclsid, pdwObjInstanceMarshal, pdwObjInstance, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitdatabase-getobject
     */
    GetObject(dwObjInstance, riid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", dwObjInstance, Guid.Ptr, riid, ppvObjMarshal, ppvObj, "HRESULT")
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

        result := ComCall(7, this, "ptr", lpwszObject, "uint", dwObjInstance, ppvPersistenceMarshal, ppvPersistence, BOOL, fStream, "HRESULT")
        return result
    }

    Query(iid) {
        if (IITDatabase.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 4)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.CreateObject := CallbackCreate(GetMethod(implObj, "CreateObject"), flags, 3)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 4)
        this.vtbl.GetObjectPersistence := CallbackCreate(GetMethod(implObj, "GetObjectPersistence"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.CreateObject)
        CallbackFree(this.vtbl.GetObject)
        CallbackFree(this.vtbl.GetObjectPersistence)
    }
}
