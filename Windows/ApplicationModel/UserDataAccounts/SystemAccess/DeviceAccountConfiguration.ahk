#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceAccountConfiguration.ahk
#Include .\IDeviceAccountConfiguration2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents device settings for app sync relationships.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class DeviceAccountConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceAccountConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceAccountConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name that identifies the device account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.accountname
     * @type {HSTRING} 
     */
    AccountName {
        get => this.get_AccountName()
        set => this.put_AccountName(value)
    }

    /**
     * Gets or sets the value that identifies the device account type.
     * @remarks
     * Valid values for this property are:
     * 
     * <table>
     *    <tr><th>Account type</th><th>ID</th></tr>
     *    <tr><td>Exchange Active Sync</td><td>6833942B-ABDA-4C20-9757-4F9252396BD4</td></tr>
     *    <tr><td>Google via Exchange Active Sync</td><td>E288529A-1917-4985-897F-34D8121EBFC3</td></tr>
     *    <tr><td>Internet Mail (Pop/IMAP)</td><td>DC23EAD7-BBF2-44D7-A791-6B2B7580F0C2</td></tr>
     *    <tr><td>Google via IMAP/CardDAV/CalDAV</td><td>0A95CDAA-C7EB-4133-9793-75E13089F082</td></tr>
     *    <tr><td>iCloud via IMAP/CardDAV/CalDAV</td><td>45157403-77C9-4E68-9485-6DD9A79D534A</td></tr>
     * </table>
     * 
     * Other values may be added in the future, so you should have a default case to handle unknown values.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.deviceaccounttypeid
     * @type {HSTRING} 
     */
    DeviceAccountTypeId {
        get => this.get_DeviceAccountTypeId()
        set => this.put_DeviceAccountTypeId(value)
    }

    /**
     * Gets or sets a value indicating the type of the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.servertype
     * @type {Integer} 
     */
    ServerType {
        get => this.get_ServerType()
        set => this.put_ServerType(value)
    }

    /**
     * Gets or sets the email address of the current user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.emailaddress
     * @type {HSTRING} 
     */
    EmailAddress {
        get => this.get_EmailAddress()
        set => this.put_EmailAddress(value)
    }

    /**
     * Gets or sets the network domain of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.domain
     * @type {HSTRING} 
     */
    Domain {
        get => this.get_Domain()
        set => this.put_Domain(value)
    }

    /**
     * Gets or sets a Boolean value indicating if email syncing is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.emailsyncenabled
     * @type {Boolean} 
     */
    EmailSyncEnabled {
        get => this.get_EmailSyncEnabled()
        set => this.put_EmailSyncEnabled(value)
    }

    /**
     * Gets or sets a Boolean value indicating if contacts syncing is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.contactssyncenabled
     * @type {Boolean} 
     */
    ContactsSyncEnabled {
        get => this.get_ContactsSyncEnabled()
        set => this.put_ContactsSyncEnabled(value)
    }

    /**
     * Gets or sets a Boolean value indicating if calendar syncing is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.calendarsyncenabled
     * @type {Boolean} 
     */
    CalendarSyncEnabled {
        get => this.get_CalendarSyncEnabled()
        set => this.put_CalendarSyncEnabled(value)
    }

    /**
     * Gets or sets the incoming email server address.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.incomingserveraddress
     * @type {HSTRING} 
     */
    IncomingServerAddress {
        get => this.get_IncomingServerAddress()
        set => this.put_IncomingServerAddress(value)
    }

    /**
     * Gets or sets the port number to use to connect to the incoming email server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.incomingserverport
     * @type {Integer} 
     */
    IncomingServerPort {
        get => this.get_IncomingServerPort()
        set => this.put_IncomingServerPort(value)
    }

    /**
     * Gets or sets a Boolean value indicating if Secure Sockets Layer (SSL) should be used when connecting to the incoming email server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.incomingserverrequiresssl
     * @type {Boolean} 
     */
    IncomingServerRequiresSsl {
        get => this.get_IncomingServerRequiresSsl()
        set => this.put_IncomingServerRequiresSsl(value)
    }

    /**
     * Gets or sets the username to use when connecting to the incoming email server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.incomingserverusername
     * @type {HSTRING} 
     */
    IncomingServerUsername {
        get => this.get_IncomingServerUsername()
        set => this.put_IncomingServerUsername(value)
    }

    /**
     * Gets or sets the outgoing email server address.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.outgoingserveraddress
     * @type {HSTRING} 
     */
    OutgoingServerAddress {
        get => this.get_OutgoingServerAddress()
        set => this.put_OutgoingServerAddress(value)
    }

    /**
     * Gets or sets the port number to use to connect to the outgoing email server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.outgoingserverport
     * @type {Integer} 
     */
    OutgoingServerPort {
        get => this.get_OutgoingServerPort()
        set => this.put_OutgoingServerPort(value)
    }

    /**
     * Gets or sets a Boolean value indicating if Secure Sockets Layer (SSL) should be used when connecting to the outgoing email server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.outgoingserverrequiresssl
     * @type {Boolean} 
     */
    OutgoingServerRequiresSsl {
        get => this.get_OutgoingServerRequiresSsl()
        set => this.put_OutgoingServerRequiresSsl(value)
    }

    /**
     * Gets or sets the username to use when connecting to the outgoing email server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.outgoingserverusername
     * @type {HSTRING} 
     */
    OutgoingServerUsername {
        get => this.get_OutgoingServerUsername()
        set => this.put_OutgoingServerUsername(value)
    }

    /**
     * Gets or sets the incoming mail server's password.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.incomingservercredential
     * @type {PasswordCredential} 
     */
    IncomingServerCredential {
        get => this.get_IncomingServerCredential()
        set => this.put_IncomingServerCredential(value)
    }

    /**
     * Gets or sets the outgoing mail server's password.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.outgoingservercredential
     * @type {PasswordCredential} 
     */
    OutgoingServerCredential {
        get => this.get_OutgoingServerCredential()
        set => this.put_OutgoingServerCredential(value)
    }

    /**
     * Gets or sets the OAuth refresh token used to create a new access token.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.oauthrefreshtoken
     * @type {HSTRING} 
     */
    OAuthRefreshToken {
        get => this.get_OAuthRefreshToken()
        set => this.put_OAuthRefreshToken(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the device account is managed outside the organization.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.isexternallymanaged
     * @type {Boolean} 
     */
    IsExternallyManaged {
        get => this.get_IsExternallyManaged()
        set => this.put_IsExternallyManaged(value)
    }

    /**
     * Gets or sets the identifier for the device account icon.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.accounticonid
     * @type {Integer} 
     */
    AccountIconId {
        get => this.get_AccountIconId()
        set => this.put_AccountIconId(value)
    }

    /**
     * Gets or sets the [DeviceAccountAuthenticationType](deviceaccountauthenticationtype.md) for this account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.authenticationtype
     * @type {Integer} 
     */
    AuthenticationType {
        get => this.get_AuthenticationType()
        set => this.put_AuthenticationType(value)
    }

    /**
     * Gets or sets a Boolean value indicating if single sign on (SSO) authentication is supported by the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.isssoauthenticationsupported
     * @type {Boolean} 
     */
    IsSsoAuthenticationSupported {
        get => this.get_IsSsoAuthenticationSupported()
    }

    /**
     * Gets or sets the single sign on account ID.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.ssoaccountid
     * @type {HSTRING} 
     */
    SsoAccountId {
        get => this.get_SsoAccountId()
        set => this.put_SsoAccountId(value)
    }

    /**
     * Gets or sets a Boolean value indicating if the full email message should always be downloaded as opposed to only header information.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.alwaysdownloadfullmessage
     * @type {Boolean} 
     */
    AlwaysDownloadFullMessage {
        get => this.get_AlwaysDownloadFullMessage()
        set => this.put_AlwaysDownloadFullMessage(value)
    }

    /**
     * Gets a Boolean value that indicates if this device is allowed to sync with the email server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.doespolicyallowmailsync
     * @type {Boolean} 
     */
    DoesPolicyAllowMailSync {
        get => this.get_DoesPolicyAllowMailSync()
    }

    /**
     * Gets or sets an enum value that specifies how often the account is synced.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.syncschedulekind
     * @type {Integer} 
     */
    SyncScheduleKind {
        get => this.get_SyncScheduleKind()
        set => this.put_SyncScheduleKind(value)
    }

    /**
     * Gets or sets an enum value that indicates how many days of email to keep on the client.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.mailagefilter
     * @type {Integer} 
     */
    MailAgeFilter {
        get => this.get_MailAgeFilter()
        set => this.put_MailAgeFilter(value)
    }

    /**
     * Gets or sets a Boolean value indicating if a client authentication certificate is required by the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.isclientauthenticationcertificaterequired
     * @type {Boolean} 
     */
    IsClientAuthenticationCertificateRequired {
        get => this.get_IsClientAuthenticationCertificateRequired()
        set => this.put_IsClientAuthenticationCertificateRequired(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the authentication certificate should be automatically selected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.autoselectauthenticationcertificate
     * @type {Boolean} 
     */
    AutoSelectAuthenticationCertificate {
        get => this.get_AutoSelectAuthenticationCertificate()
        set => this.put_AutoSelectAuthenticationCertificate(value)
    }

    /**
     * Gets or sets the identifier for the authentication certificate for this account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.authenticationcertificateid
     * @type {HSTRING} 
     */
    AuthenticationCertificateId {
        get => this.get_AuthenticationCertificateId()
        set => this.put_AuthenticationCertificateId(value)
    }

    /**
     * Gets or sets an enum value that specifies how often the account is synced.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.carddavsyncschedulekind
     * @type {Integer} 
     */
    CardDavSyncScheduleKind {
        get => this.get_CardDavSyncScheduleKind()
        set => this.put_CardDavSyncScheduleKind(value)
    }

    /**
     * Gets or sets an enum value that specifies how often the account is synced.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.caldavsyncschedulekind
     * @type {Integer} 
     */
    CalDavSyncScheduleKind {
        get => this.get_CalDavSyncScheduleKind()
        set => this.put_CalDavSyncScheduleKind(value)
    }

    /**
     * Gets or sets the address of the CardDav server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.carddavserverurl
     * @type {Uri} 
     */
    CardDavServerUrl {
        get => this.get_CardDavServerUrl()
        set => this.put_CardDavServerUrl(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the CardDav server requires an SSL connection.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.carddavrequiresssl
     * @type {Boolean} 
     */
    CardDavRequiresSsl {
        get => this.get_CardDavRequiresSsl()
        set => this.put_CardDavRequiresSsl(value)
    }

    /**
     * Gets or sets the address of the CalDav server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.caldavserverurl
     * @type {Uri} 
     */
    CalDavServerUrl {
        get => this.get_CalDavServerUrl()
        set => this.put_CalDavServerUrl(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the CalDav server requires an SSL connection.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.caldavrequiresssl
     * @type {Boolean} 
     */
    CalDavRequiresSsl {
        get => this.get_CalDavRequiresSsl()
        set => this.put_CalDavRequiresSsl(value)
    }

    /**
     * Gets or sets a Boolean value that indicates if the account has been modified by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.wasmodifiedbyuser
     * @type {Boolean} 
     */
    WasModifiedByUser {
        get => this.get_WasModifiedByUser()
        set => this.put_WasModifiedByUser(value)
    }

    /**
     * Gets or sets a Boolean value indicating if the incoming server's certificate hash has been confirmed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.wasincomingservercertificatehashconfirmed
     * @type {Boolean} 
     */
    WasIncomingServerCertificateHashConfirmed {
        get => this.get_WasIncomingServerCertificateHashConfirmed()
        set => this.put_WasIncomingServerCertificateHashConfirmed(value)
    }

    /**
     * Gets or sets the incoming mail server's encryption certificate hash.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.incomingservercertificatehash
     * @type {HSTRING} 
     */
    IncomingServerCertificateHash {
        get => this.get_IncomingServerCertificateHash()
        set => this.put_IncomingServerCertificateHash(value)
    }

    /**
     * Gets or sets a Boolean value indicating if authentication is required by the outgoing mail server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.isoutgoingserverauthenticationrequired
     * @type {Boolean} 
     */
    IsOutgoingServerAuthenticationRequired {
        get => this.get_IsOutgoingServerAuthenticationRequired()
        set => this.put_IsOutgoingServerAuthenticationRequired(value)
    }

    /**
     * Gets or sets a Boolean value indicating if authentication is enabled for the outgoing mail server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.isoutgoingserverauthenticationenabled
     * @type {Boolean} 
     */
    IsOutgoingServerAuthenticationEnabled {
        get => this.get_IsOutgoingServerAuthenticationEnabled()
        set => this.put_IsOutgoingServerAuthenticationEnabled(value)
    }

    /**
     * Gets or sets a Boolean value indicating if the outgoing server's certificate hash has been confirmed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.wasoutgoingservercertificatehashconfirmed
     * @type {Boolean} 
     */
    WasOutgoingServerCertificateHashConfirmed {
        get => this.get_WasOutgoingServerCertificateHashConfirmed()
        set => this.put_WasOutgoingServerCertificateHashConfirmed(value)
    }

    /**
     * Gets or sets the outgoing mail server's encryption certificate hash.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.outgoingservercertificatehash
     * @type {HSTRING} 
     */
    OutgoingServerCertificateHash {
        get => this.get_OutgoingServerCertificateHash()
        set => this.put_OutgoingServerCertificateHash(value)
    }

    /**
     * Gets a Boolean value that indicates if the sync schedule is managed by the system as opposed to the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountconfiguration.issyncschedulemanagedbysystem
     * @type {Boolean} 
     */
    IsSyncScheduleManagedBySystem {
        get => this.get_IsSyncScheduleManagedBySystem()
        set => this.put_IsSyncScheduleManagedBySystem(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DeviceAccountConfiguration](deviceaccountconfiguration.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountConfiguration")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountName() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_AccountName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AccountName(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_AccountName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceAccountTypeId() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_DeviceAccountTypeId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DeviceAccountTypeId(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_DeviceAccountTypeId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerType() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_ServerType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ServerType(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_ServerType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailAddress() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_EmailAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EmailAddress(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_EmailAddress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Domain() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_Domain()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Domain(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_Domain(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EmailSyncEnabled() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_EmailSyncEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EmailSyncEnabled(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_EmailSyncEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ContactsSyncEnabled() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_ContactsSyncEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ContactsSyncEnabled(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_ContactsSyncEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CalendarSyncEnabled() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_CalendarSyncEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CalendarSyncEnabled(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_CalendarSyncEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IncomingServerAddress() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_IncomingServerAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerAddress(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_IncomingServerAddress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncomingServerPort() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_IncomingServerPort()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerPort(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_IncomingServerPort(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncomingServerRequiresSsl() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_IncomingServerRequiresSsl()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerRequiresSsl(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_IncomingServerRequiresSsl(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IncomingServerUsername() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_IncomingServerUsername()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerUsername(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_IncomingServerUsername(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OutgoingServerAddress() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_OutgoingServerAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerAddress(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_OutgoingServerAddress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutgoingServerPort() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_OutgoingServerPort()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerPort(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_OutgoingServerPort(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OutgoingServerRequiresSsl() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_OutgoingServerRequiresSsl()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerRequiresSsl(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_OutgoingServerRequiresSsl(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OutgoingServerUsername() {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.get_OutgoingServerUsername()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerUsername(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration := IDeviceAccountConfiguration(outPtr)
        }

        return this.__IDeviceAccountConfiguration.put_OutgoingServerUsername(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_IncomingServerCredential() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_IncomingServerCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerCredential(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_IncomingServerCredential(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_OutgoingServerCredential() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_OutgoingServerCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerCredential(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_OutgoingServerCredential(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OAuthRefreshToken() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_OAuthRefreshToken()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OAuthRefreshToken(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_OAuthRefreshToken(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExternallyManaged() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_IsExternallyManaged()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsExternallyManaged(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_IsExternallyManaged(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AccountIconId() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_AccountIconId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AccountIconId(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_AccountIconId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationType() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_AuthenticationType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationType(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_AuthenticationType(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSsoAuthenticationSupported() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_IsSsoAuthenticationSupported()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SsoAccountId() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_SsoAccountId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SsoAccountId(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_SsoAccountId(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysDownloadFullMessage() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_AlwaysDownloadFullMessage()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysDownloadFullMessage(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_AlwaysDownloadFullMessage(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DoesPolicyAllowMailSync() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_DoesPolicyAllowMailSync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SyncScheduleKind() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_SyncScheduleKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SyncScheduleKind(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_SyncScheduleKind(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MailAgeFilter() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_MailAgeFilter()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MailAgeFilter(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_MailAgeFilter(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClientAuthenticationCertificateRequired() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_IsClientAuthenticationCertificateRequired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsClientAuthenticationCertificateRequired(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_IsClientAuthenticationCertificateRequired(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoSelectAuthenticationCertificate() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_AutoSelectAuthenticationCertificate()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoSelectAuthenticationCertificate(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_AutoSelectAuthenticationCertificate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AuthenticationCertificateId() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_AuthenticationCertificateId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationCertificateId(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_AuthenticationCertificateId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CardDavSyncScheduleKind() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_CardDavSyncScheduleKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CardDavSyncScheduleKind(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_CardDavSyncScheduleKind(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CalDavSyncScheduleKind() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_CalDavSyncScheduleKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CalDavSyncScheduleKind(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_CalDavSyncScheduleKind(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_CardDavServerUrl() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_CardDavServerUrl()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_CardDavServerUrl(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_CardDavServerUrl(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CardDavRequiresSsl() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_CardDavRequiresSsl()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CardDavRequiresSsl(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_CardDavRequiresSsl(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_CalDavServerUrl() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_CalDavServerUrl()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_CalDavServerUrl(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_CalDavServerUrl(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CalDavRequiresSsl() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_CalDavRequiresSsl()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CalDavRequiresSsl(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_CalDavRequiresSsl(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasModifiedByUser() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_WasModifiedByUser()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_WasModifiedByUser(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_WasModifiedByUser(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasIncomingServerCertificateHashConfirmed() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_WasIncomingServerCertificateHashConfirmed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_WasIncomingServerCertificateHashConfirmed(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_WasIncomingServerCertificateHashConfirmed(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IncomingServerCertificateHash() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_IncomingServerCertificateHash()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IncomingServerCertificateHash(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_IncomingServerCertificateHash(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOutgoingServerAuthenticationRequired() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_IsOutgoingServerAuthenticationRequired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOutgoingServerAuthenticationRequired(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_IsOutgoingServerAuthenticationRequired(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOutgoingServerAuthenticationEnabled() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_IsOutgoingServerAuthenticationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOutgoingServerAuthenticationEnabled(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_IsOutgoingServerAuthenticationEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasOutgoingServerCertificateHashConfirmed() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_WasOutgoingServerCertificateHashConfirmed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_WasOutgoingServerCertificateHashConfirmed(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_WasOutgoingServerCertificateHashConfirmed(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OutgoingServerCertificateHash() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_OutgoingServerCertificateHash()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OutgoingServerCertificateHash(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_OutgoingServerCertificateHash(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSyncScheduleManagedBySystem() {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.get_IsSyncScheduleManagedBySystem()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSyncScheduleManagedBySystem(value) {
        if (!this.HasProp("__IDeviceAccountConfiguration2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccountConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccountConfiguration2 := IDeviceAccountConfiguration2(outPtr)
        }

        return this.__IDeviceAccountConfiguration2.put_IsSyncScheduleManagedBySystem(value)
    }

;@endregion Instance Methods
}
