#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Security\Credentials\PasswordCredential.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class IDeviceAccountConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceAccountConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{f2b2e5a6-728d-4a4a-8945-2bf8580136de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IncomingServerCredential", "put_IncomingServerCredential", "get_OutgoingServerCredential", "put_OutgoingServerCredential", "get_OAuthRefreshToken", "put_OAuthRefreshToken", "get_IsExternallyManaged", "put_IsExternallyManaged", "get_AccountIconId", "put_AccountIconId", "get_AuthenticationType", "put_AuthenticationType", "get_IsSsoAuthenticationSupported", "get_SsoAccountId", "put_SsoAccountId", "get_AlwaysDownloadFullMessage", "put_AlwaysDownloadFullMessage", "get_DoesPolicyAllowMailSync", "get_SyncScheduleKind", "put_SyncScheduleKind", "get_MailAgeFilter", "put_MailAgeFilter", "get_IsClientAuthenticationCertificateRequired", "put_IsClientAuthenticationCertificateRequired", "get_AutoSelectAuthenticationCertificate", "put_AutoSelectAuthenticationCertificate", "get_AuthenticationCertificateId", "put_AuthenticationCertificateId", "get_CardDavSyncScheduleKind", "put_CardDavSyncScheduleKind", "get_CalDavSyncScheduleKind", "put_CalDavSyncScheduleKind", "get_CardDavServerUrl", "put_CardDavServerUrl", "get_CardDavRequiresSsl", "put_CardDavRequiresSsl", "get_CalDavServerUrl", "put_CalDavServerUrl", "get_CalDavRequiresSsl", "put_CalDavRequiresSsl", "get_WasModifiedByUser", "put_WasModifiedByUser", "get_WasIncomingServerCertificateHashConfirmed", "put_WasIncomingServerCertificateHashConfirmed", "get_IncomingServerCertificateHash", "put_IncomingServerCertificateHash", "get_IsOutgoingServerAuthenticationRequired", "put_IsOutgoingServerAuthenticationRequired", "get_IsOutgoingServerAuthenticationEnabled", "put_IsOutgoingServerAuthenticationEnabled", "get_WasOutgoingServerCertificateHashConfirmed", "put_WasOutgoingServerCertificateHashConfirmed", "get_OutgoingServerCertificateHash", "put_OutgoingServerCertificateHash", "get_IsSyncScheduleManagedBySystem", "put_IsSyncScheduleManagedBySystem"]

    /**
     * @type {PasswordCredential} 
     */
    IncomingServerCredential {
        get => this.get_IncomingServerCredential()
        set => this.put_IncomingServerCredential(value)
    }

    /**
     * @type {PasswordCredential} 
     */
    OutgoingServerCredential {
        get => this.get_OutgoingServerCredential()
        set => this.put_OutgoingServerCredential(value)
    }

    /**
     * @type {HSTRING} 
     */
    OAuthRefreshToken {
        get => this.get_OAuthRefreshToken()
        set => this.put_OAuthRefreshToken(value)
    }

    /**
     * @type {Boolean} 
     */
    IsExternallyManaged {
        get => this.get_IsExternallyManaged()
        set => this.put_IsExternallyManaged(value)
    }

    /**
     * @type {Integer} 
     */
    AccountIconId {
        get => this.get_AccountIconId()
        set => this.put_AccountIconId(value)
    }

    /**
     * @type {Integer} 
     */
    AuthenticationType {
        get => this.get_AuthenticationType()
        set => this.put_AuthenticationType(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSsoAuthenticationSupported {
        get => this.get_IsSsoAuthenticationSupported()
    }

    /**
     * @type {HSTRING} 
     */
    SsoAccountId {
        get => this.get_SsoAccountId()
        set => this.put_SsoAccountId(value)
    }

    /**
     * @type {Boolean} 
     */
    AlwaysDownloadFullMessage {
        get => this.get_AlwaysDownloadFullMessage()
        set => this.put_AlwaysDownloadFullMessage(value)
    }

    /**
     * @type {Boolean} 
     */
    DoesPolicyAllowMailSync {
        get => this.get_DoesPolicyAllowMailSync()
    }

    /**
     * @type {Integer} 
     */
    SyncScheduleKind {
        get => this.get_SyncScheduleKind()
        set => this.put_SyncScheduleKind(value)
    }

    /**
     * @type {Integer} 
     */
    MailAgeFilter {
        get => this.get_MailAgeFilter()
        set => this.put_MailAgeFilter(value)
    }

    /**
     * @type {Boolean} 
     */
    IsClientAuthenticationCertificateRequired {
        get => this.get_IsClientAuthenticationCertificateRequired()
        set => this.put_IsClientAuthenticationCertificateRequired(value)
    }

    /**
     * @type {Boolean} 
     */
    AutoSelectAuthenticationCertificate {
        get => this.get_AutoSelectAuthenticationCertificate()
        set => this.put_AutoSelectAuthenticationCertificate(value)
    }

    /**
     * @type {HSTRING} 
     */
    AuthenticationCertificateId {
        get => this.get_AuthenticationCertificateId()
        set => this.put_AuthenticationCertificateId(value)
    }

    /**
     * @type {Integer} 
     */
    CardDavSyncScheduleKind {
        get => this.get_CardDavSyncScheduleKind()
        set => this.put_CardDavSyncScheduleKind(value)
    }

    /**
     * @type {Integer} 
     */
    CalDavSyncScheduleKind {
        get => this.get_CalDavSyncScheduleKind()
        set => this.put_CalDavSyncScheduleKind(value)
    }

    /**
     * @type {Uri} 
     */
    CardDavServerUrl {
        get => this.get_CardDavServerUrl()
        set => this.put_CardDavServerUrl(value)
    }

    /**
     * @type {Boolean} 
     */
    CardDavRequiresSsl {
        get => this.get_CardDavRequiresSsl()
        set => this.put_CardDavRequiresSsl(value)
    }

    /**
     * @type {Uri} 
     */
    CalDavServerUrl {
        get => this.get_CalDavServerUrl()
        set => this.put_CalDavServerUrl(value)
    }

    /**
     * @type {Boolean} 
     */
    CalDavRequiresSsl {
        get => this.get_CalDavRequiresSsl()
        set => this.put_CalDavRequiresSsl(value)
    }

    /**
     * @type {Boolean} 
     */
    WasModifiedByUser {
        get => this.get_WasModifiedByUser()
        set => this.put_WasModifiedByUser(value)
    }

    /**
     * @type {Boolean} 
     */
    WasIncomingServerCertificateHashConfirmed {
        get => this.get_WasIncomingServerCertificateHashConfirmed()
        set => this.put_WasIncomingServerCertificateHashConfirmed(value)
    }

    /**
     * @type {HSTRING} 
     */
    IncomingServerCertificateHash {
        get => this.get_IncomingServerCertificateHash()
        set => this.put_IncomingServerCertificateHash(value)
    }

    /**
     * @type {Boolean} 
     */
    IsOutgoingServerAuthenticationRequired {
        get => this.get_IsOutgoingServerAuthenticationRequired()
        set => this.put_IsOutgoingServerAuthenticationRequired(value)
    }

    /**
     * @type {Boolean} 
     */
    IsOutgoingServerAuthenticationEnabled {
        get => this.get_IsOutgoingServerAuthenticationEnabled()
        set => this.put_IsOutgoingServerAuthenticationEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    WasOutgoingServerCertificateHashConfirmed {
        get => this.get_WasOutgoingServerCertificateHashConfirmed()
        set => this.put_WasOutgoingServerCertificateHashConfirmed(value)
    }

    /**
     * @type {HSTRING} 
     */
    OutgoingServerCertificateHash {
        get => this.get_OutgoingServerCertificateHash()
        set => this.put_OutgoingServerCertificateHash(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSyncScheduleManagedBySystem {
        get => this.get_IsSyncScheduleManagedBySystem()
        set => this.put_IsSyncScheduleManagedBySystem(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_IncomingServerCredential() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerCredential(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_OutgoingServerCredential() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerCredential(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OAuthRefreshToken() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_OAuthRefreshToken(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExternallyManaged() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IsExternallyManaged(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AccountIconId() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_AccountIconId(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationType() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_AuthenticationType(value) {
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
    get_IsSsoAuthenticationSupported() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SsoAccountId() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
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
    put_SsoAccountId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysDownloadFullMessage() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_AlwaysDownloadFullMessage(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DoesPolicyAllowMailSync() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SyncScheduleKind() {
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
    put_SyncScheduleKind(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MailAgeFilter() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_MailAgeFilter(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClientAuthenticationCertificateRequired() {
        result := ComCall(28, this, "int*", &value := 0, "int")
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
    put_IsClientAuthenticationCertificateRequired(value) {
        result := ComCall(29, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoSelectAuthenticationCertificate() {
        result := ComCall(30, this, "int*", &value := 0, "int")
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
    put_AutoSelectAuthenticationCertificate(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AuthenticationCertificateId() {
        value := HSTRING()
        result := ComCall(32, this, "ptr", value, "int")
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
    put_AuthenticationCertificateId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CardDavSyncScheduleKind() {
        result := ComCall(34, this, "int*", &value := 0, "int")
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
    put_CardDavSyncScheduleKind(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CalDavSyncScheduleKind() {
        result := ComCall(36, this, "int*", &value := 0, "int")
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
    put_CalDavSyncScheduleKind(value) {
        result := ComCall(37, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_CardDavServerUrl() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_CardDavServerUrl(value) {
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CardDavRequiresSsl() {
        result := ComCall(40, this, "int*", &value := 0, "int")
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
    put_CardDavRequiresSsl(value) {
        result := ComCall(41, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_CalDavServerUrl() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_CalDavServerUrl(value) {
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CalDavRequiresSsl() {
        result := ComCall(44, this, "int*", &value := 0, "int")
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
    put_CalDavRequiresSsl(value) {
        result := ComCall(45, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasModifiedByUser() {
        result := ComCall(46, this, "int*", &value := 0, "int")
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
    put_WasModifiedByUser(value) {
        result := ComCall(47, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasIncomingServerCertificateHashConfirmed() {
        result := ComCall(48, this, "int*", &value := 0, "int")
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
    put_WasIncomingServerCertificateHashConfirmed(value) {
        result := ComCall(49, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IncomingServerCertificateHash() {
        value := HSTRING()
        result := ComCall(50, this, "ptr", value, "int")
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
    put_IncomingServerCertificateHash(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOutgoingServerAuthenticationRequired() {
        result := ComCall(52, this, "int*", &value := 0, "int")
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
    put_IsOutgoingServerAuthenticationRequired(value) {
        result := ComCall(53, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOutgoingServerAuthenticationEnabled() {
        result := ComCall(54, this, "int*", &value := 0, "int")
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
    put_IsOutgoingServerAuthenticationEnabled(value) {
        result := ComCall(55, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasOutgoingServerCertificateHashConfirmed() {
        result := ComCall(56, this, "int*", &value := 0, "int")
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
    put_WasOutgoingServerCertificateHashConfirmed(value) {
        result := ComCall(57, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OutgoingServerCertificateHash() {
        value := HSTRING()
        result := ComCall(58, this, "ptr", value, "int")
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
    put_OutgoingServerCertificateHash(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSyncScheduleManagedBySystem() {
        result := ComCall(60, this, "int*", &value := 0, "int")
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
    put_IsSyncScheduleManagedBySystem(value) {
        result := ComCall(61, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
