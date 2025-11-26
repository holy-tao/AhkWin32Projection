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
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-get_logincoming
     */
    get_LogIncoming() {
        result := ComCall(7, this, "short*", &pbLogIncoming := 0, "HRESULT")
        return pbLogIncoming
    }

    /**
     * 
     * @param {VARIANT_BOOL} bLogIncoming 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-put_logincoming
     */
    put_LogIncoming(bLogIncoming) {
        result := ComCall(8, this, "short", bLogIncoming, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-get_logoutgoing
     */
    get_LogOutgoing() {
        result := ComCall(9, this, "short*", &pbLogOutgoing := 0, "HRESULT")
        return pbLogOutgoing
    }

    /**
     * 
     * @param {VARIANT_BOOL} bLogOutgoing 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-put_logoutgoing
     */
    put_LogOutgoing(bLogOutgoing) {
        result := ComCall(10, this, "short", bLogOutgoing, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-get_databasepath
     */
    get_DatabasePath() {
        pbstrDatabasePath := BSTR()
        result := ComCall(11, this, "ptr", pbstrDatabasePath, "HRESULT")
        return pbstrDatabasePath
    }

    /**
     * 
     * @param {BSTR} bstrDatabasePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-put_databasepath
     */
    put_DatabasePath(bstrDatabasePath) {
        bstrDatabasePath := bstrDatabasePath is String ? BSTR.Alloc(bstrDatabasePath).Value : bstrDatabasePath

        result := ComCall(12, this, "ptr", bstrDatabasePath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-refresh
     */
    Refresh() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivitylogging-save
     */
    Save() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
