#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IFaxActivityLogging interface defines a configuration object used by a fax client application to retrieve and set options for activity logging.
 * @remarks
 * A default implementation of <b>IFaxActivityLogging</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxactivitylogging">FaxActivityLogging</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxactivitylogging
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxActivityLogging extends IDispatch {
    /**
     * The interface identifier for IFaxActivityLogging
     * @type {Guid}
     */
    static IID := Guid("{1e29078b-5a69-497b-9592-49b7e7faddb5}")

    /**
     * The class identifier for FaxActivityLogging
     * @type {Guid}
     */
    static CLSID := Guid("{f0a0294e-3bbd-48b8-8f13-8c591a55bdbc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxActivityLogging interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_LogIncoming  : IntPtr
        put_LogIncoming  : IntPtr
        get_LogOutgoing  : IntPtr
        put_LogOutgoing  : IntPtr
        get_DatabasePath : IntPtr
        put_DatabasePath : IntPtr
        Refresh          : IntPtr
        Save             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxActivityLogging.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LogIncoming {
        get => this.get_LogIncoming()
        set => this.put_LogIncoming(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LogOutgoing {
        get => this.get_LogOutgoing()
        set => this.put_LogOutgoing(value)
    }

    /**
     * @type {BSTR} 
     */
    DatabasePath {
        get => this.get_DatabasePath()
        set => this.put_DatabasePath(value)
    }

    /**
     * The IFaxActivityLogging::get_LogIncoming property is a Boolean value that indicates whether the fax service logs entries for incoming faxes in the activity log database. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax service logs entries for incoming fax jobs in the activity log database. If this property is equal to <b>FALSE</b>, the fax service does not log entries.
     * 
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-get_logincoming
     */
    get_LogIncoming() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pbLogIncoming := 0, "HRESULT")
        return pbLogIncoming
    }

    /**
     * The IFaxActivityLogging::get_LogIncoming property is a Boolean value that indicates whether the fax service logs entries for incoming faxes in the activity log database. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax service logs entries for incoming fax jobs in the activity log database. If this property is equal to <b>FALSE</b>, the fax service does not log entries.
     * 
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bLogIncoming 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-put_logincoming
     */
    put_LogIncoming(bLogIncoming) {
        result := ComCall(8, this, VARIANT_BOOL, bLogIncoming, "HRESULT")
        return result
    }

    /**
     * The IFaxActivityLogging::get_LogOutgoing property is a Boolean value that indicates whether the fax service logs entries for outgoing faxes in the activity log database. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax service logs entries for outgoing fax jobs in the activity log database. If this property is equal to <b>FALSE</b>, the fax service does not log entries.
     * 
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-get_logoutgoing
     */
    get_LogOutgoing() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pbLogOutgoing := 0, "HRESULT")
        return pbLogOutgoing
    }

    /**
     * The IFaxActivityLogging::get_LogOutgoing property is a Boolean value that indicates whether the fax service logs entries for outgoing faxes in the activity log database. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax service logs entries for outgoing fax jobs in the activity log database. If this property is equal to <b>FALSE</b>, the fax service does not log entries.
     * 
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bLogOutgoing 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-put_logoutgoing
     */
    put_LogOutgoing(bLogOutgoing) {
        result := ComCall(10, this, VARIANT_BOOL, bLogOutgoing, "HRESULT")
        return result
    }

    /**
     * The IFaxActivityLogging::get_DatabasePath property is a null-terminated string that contains the path to the activity log database file. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  If you change the path to the activity log directory, be sure to use a secured directory.</div>
     * <div> </div>
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-get_databasepath
     */
    get_DatabasePath() {
        pbstrDatabasePath := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrDatabasePath, "HRESULT")
        return pbstrDatabasePath
    }

    /**
     * The IFaxActivityLogging::get_DatabasePath property is a null-terminated string that contains the path to the activity log database file. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  If you change the path to the activity log directory, be sure to use a secured directory.</div>
     * <div> </div>
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {BSTR} bstrDatabasePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-put_databasepath
     */
    put_DatabasePath(bstrDatabasePath) {
        bstrDatabasePath := bstrDatabasePath is String ? BSTR.Alloc(bstrDatabasePath).Value : bstrDatabasePath

        result := ComCall(12, this, BSTR, bstrDatabasePath, "HRESULT")
        return result
    }

    /**
     * The IFaxActivityLogging::Refresh method refreshes FaxActivityLogging object information from the fax server.
     * @remarks
     * When the <b>IFaxActivityLogging::Refresh</b> method is called, any configuration changes made after the last <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxactivitylogging-save-vb">IFaxActivityLogging::Save</a> method call are lost.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-refresh
     */
    Refresh() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * The IFaxActivityLogging::Save method saves the FaxActivityLogging object's data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-save
     */
    Save() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxActivityLogging.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LogIncoming := CallbackCreate(GetMethod(implObj, "get_LogIncoming"), flags, 2)
        this.vtbl.put_LogIncoming := CallbackCreate(GetMethod(implObj, "put_LogIncoming"), flags, 2)
        this.vtbl.get_LogOutgoing := CallbackCreate(GetMethod(implObj, "get_LogOutgoing"), flags, 2)
        this.vtbl.put_LogOutgoing := CallbackCreate(GetMethod(implObj, "put_LogOutgoing"), flags, 2)
        this.vtbl.get_DatabasePath := CallbackCreate(GetMethod(implObj, "get_DatabasePath"), flags, 2)
        this.vtbl.put_DatabasePath := CallbackCreate(GetMethod(implObj, "put_DatabasePath"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LogIncoming)
        CallbackFree(this.vtbl.put_LogIncoming)
        CallbackFree(this.vtbl.get_LogOutgoing)
        CallbackFree(this.vtbl.put_LogOutgoing)
        CallbackFree(this.vtbl.get_DatabasePath)
        CallbackFree(this.vtbl.put_DatabasePath)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
    }
}
