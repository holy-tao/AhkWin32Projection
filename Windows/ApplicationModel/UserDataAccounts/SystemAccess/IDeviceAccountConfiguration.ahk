#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class IDeviceAccountConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceAccountConfiguration
     * @type {Guid}
     */
    static IID => Guid("{ad0123a3-fbdc-4d1b-be43-5a27ea4a1b63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccountName", "put_AccountName", "get_DeviceAccountTypeId", "put_DeviceAccountTypeId", "get_ServerType", "put_ServerType", "get_EmailAddress", "put_EmailAddress", "get_Domain", "put_Domain", "get_EmailSyncEnabled", "put_EmailSyncEnabled", "get_ContactsSyncEnabled", "put_ContactsSyncEnabled", "get_CalendarSyncEnabled", "put_CalendarSyncEnabled", "get_IncomingServerAddress", "put_IncomingServerAddress", "get_IncomingServerPort", "put_IncomingServerPort", "get_IncomingServerRequiresSsl", "put_IncomingServerRequiresSsl", "get_IncomingServerUsername", "put_IncomingServerUsername", "get_OutgoingServerAddress", "put_OutgoingServerAddress", "get_OutgoingServerPort", "put_OutgoingServerPort", "get_OutgoingServerRequiresSsl", "put_OutgoingServerRequiresSsl", "get_OutgoingServerUsername", "put_OutgoingServerUsername"]

    /**
     * @type {HSTRING} 
     */
    AccountName {
        get => this.get_AccountName()
        set => this.put_AccountName(value)
    }

    /**
     * @type {HSTRING} 
     */
    DeviceAccountTypeId {
        get => this.get_DeviceAccountTypeId()
        set => this.put_DeviceAccountTypeId(value)
    }

    /**
     * @type {Integer} 
     */
    ServerType {
        get => this.get_ServerType()
        set => this.put_ServerType(value)
    }

    /**
     * @type {HSTRING} 
     */
    EmailAddress {
        get => this.get_EmailAddress()
        set => this.put_EmailAddress(value)
    }

    /**
     * @type {HSTRING} 
     */
    Domain {
        get => this.get_Domain()
        set => this.put_Domain(value)
    }

    /**
     * @type {Boolean} 
     */
    EmailSyncEnabled {
        get => this.get_EmailSyncEnabled()
        set => this.put_EmailSyncEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    ContactsSyncEnabled {
        get => this.get_ContactsSyncEnabled()
        set => this.put_ContactsSyncEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    CalendarSyncEnabled {
        get => this.get_CalendarSyncEnabled()
        set => this.put_CalendarSyncEnabled(value)
    }

    /**
     * @type {HSTRING} 
     */
    IncomingServerAddress {
        get => this.get_IncomingServerAddress()
        set => this.put_IncomingServerAddress(value)
    }

    /**
     * @type {Integer} 
     */
    IncomingServerPort {
        get => this.get_IncomingServerPort()
        set => this.put_IncomingServerPort(value)
    }

    /**
     * @type {Boolean} 
     */
    IncomingServerRequiresSsl {
        get => this.get_IncomingServerRequiresSsl()
        set => this.put_IncomingServerRequiresSsl(value)
    }

    /**
     * @type {HSTRING} 
     */
    IncomingServerUsername {
        get => this.get_IncomingServerUsername()
        set => this.put_IncomingServerUsername(value)
    }

    /**
     * @type {HSTRING} 
     */
    OutgoingServerAddress {
        get => this.get_OutgoingServerAddress()
        set => this.put_OutgoingServerAddress(value)
    }

    /**
     * @type {Integer} 
     */
    OutgoingServerPort {
        get => this.get_OutgoingServerPort()
        set => this.put_OutgoingServerPort(value)
    }

    /**
     * @type {Boolean} 
     */
    OutgoingServerRequiresSsl {
        get => this.get_OutgoingServerRequiresSsl()
        set => this.put_OutgoingServerRequiresSsl(value)
    }

    /**
     * @type {HSTRING} 
     */
    OutgoingServerUsername {
        get => this.get_OutgoingServerUsername()
        set => this.put_OutgoingServerUsername(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AccountName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceAccountTypeId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DeviceAccountTypeId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerType() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ServerType(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailAddress() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EmailAddress(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Domain() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Domain(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EmailSyncEnabled() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EmailSyncEnabled(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ContactsSyncEnabled() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ContactsSyncEnabled(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CalendarSyncEnabled() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CalendarSyncEnabled(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IncomingServerAddress() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerAddress(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncomingServerPort() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerPort(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncomingServerRequiresSsl() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerRequiresSsl(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IncomingServerUsername() {
        value := HSTRING()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerUsername(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OutgoingServerAddress() {
        value := HSTRING()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerAddress(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutgoingServerPort() {
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerPort(value) {
        result := ComCall(33, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OutgoingServerRequiresSsl() {
        result := ComCall(34, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerRequiresSsl(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OutgoingServerUsername() {
        value := HSTRING()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerUsername(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
