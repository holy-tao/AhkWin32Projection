#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxActivityLogging interface defines a configuration object used by a fax client application to retrieve and set options for activity logging.
 * @remarks
 * 
 * A default implementation of <b>IFaxActivityLogging</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxactivitylogging">FaxActivityLogging</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxactivitylogging
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxActivityLogging extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxActivityLogging
     * @type {Guid}
     */
    static IID => Guid("{1e29078b-5a69-497b-9592-49b7e7faddb5}")

    /**
     * The class identifier for FaxActivityLogging
     * @type {Guid}
     */
    static CLSID => Guid("{f0a0294e-3bbd-48b8-8f13-8c591a55bdbc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LogIncoming", "put_LogIncoming", "get_LogOutgoing", "put_LogOutgoing", "get_DatabasePath", "put_DatabasePath", "Refresh", "Save"]

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
     * The IFaxActivityLogging::get_LogIncoming property is a Boolean value that indicates whether the fax service logs entries for incoming faxes in the activity log database.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax service logs entries for incoming fax jobs in the activity log database. If this property is equal to <b>FALSE</b>, the fax service does not log entries.
     * 
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivitylogging-get_logincoming
     */
    get_LogIncoming() {
        result := ComCall(7, this, "short*", &pbLogIncoming := 0, "HRESULT")
        return pbLogIncoming
    }

    /**
     * The IFaxActivityLogging::get_LogIncoming property is a Boolean value that indicates whether the fax service logs entries for incoming faxes in the activity log database.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax service logs entries for incoming fax jobs in the activity log database. If this property is equal to <b>FALSE</b>, the fax service does not log entries.
     * 
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {VARIANT_BOOL} bLogIncoming 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivitylogging-put_logincoming
     */
    put_LogIncoming(bLogIncoming) {
        result := ComCall(8, this, "short", bLogIncoming, "HRESULT")
        return result
    }

    /**
     * The IFaxActivityLogging::get_LogOutgoing property is a Boolean value that indicates whether the fax service logs entries for outgoing faxes in the activity log database.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax service logs entries for outgoing fax jobs in the activity log database. If this property is equal to <b>FALSE</b>, the fax service does not log entries.
     * 
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivitylogging-get_logoutgoing
     */
    get_LogOutgoing() {
        result := ComCall(9, this, "short*", &pbLogOutgoing := 0, "HRESULT")
        return pbLogOutgoing
    }

    /**
     * The IFaxActivityLogging::get_LogOutgoing property is a Boolean value that indicates whether the fax service logs entries for outgoing faxes in the activity log database.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax service logs entries for outgoing fax jobs in the activity log database. If this property is equal to <b>FALSE</b>, the fax service does not log entries.
     * 
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {VARIANT_BOOL} bLogOutgoing 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivitylogging-put_logoutgoing
     */
    put_LogOutgoing(bLogOutgoing) {
        result := ComCall(10, this, "short", bLogOutgoing, "HRESULT")
        return result
    }

    /**
     * The IFaxActivityLogging::get_DatabasePath property is a null-terminated string that contains the path to the activity log database file.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  If you change the path to the activity log directory, be sure to use a secured directory.</div>
     * <div> </div>
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivitylogging-get_databasepath
     */
    get_DatabasePath() {
        pbstrDatabasePath := BSTR()
        result := ComCall(11, this, "ptr", pbstrDatabasePath, "HRESULT")
        return pbstrDatabasePath
    }

    /**
     * The IFaxActivityLogging::get_DatabasePath property is a null-terminated string that contains the path to the activity log database file.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  If you change the path to the activity log directory, be sure to use a secured directory.</div>
     * <div> </div>
     * To read or write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {BSTR} bstrDatabasePath 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivitylogging-put_databasepath
     */
    put_DatabasePath(bstrDatabasePath) {
        bstrDatabasePath := bstrDatabasePath is String ? BSTR.Alloc(bstrDatabasePath).Value : bstrDatabasePath

        result := ComCall(12, this, "ptr", bstrDatabasePath, "HRESULT")
        return result
    }

    /**
     * The IFaxActivityLogging::Refresh method refreshes FaxActivityLogging object information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivitylogging-refresh
     */
    Refresh() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * The IFaxActivityLogging::Save method saves the FaxActivityLogging object's data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivitylogging-save
     */
    Save() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
