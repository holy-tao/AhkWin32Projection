#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserIdentity.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the ID, tickets, and other information associated with a user.
  * 
  * > [!NOTE]
  * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class UserIdentity extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserIdentity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserIdentity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Contains an array of tickets that identify the user. If your app uses the JWT policy, only one ticket is returned. This value is only available to Microsoft application partners.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity.tickets
     * @type {IVectorView<OnlineIdServiceTicket>} 
     */
    Tickets {
        get => this.get_Tickets()
    }

    /**
     * Gets the user's unique Microsoft account identifier. This value is available only to Microsoft application partners.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets an obfuscated customer ID specific to the calling application. This ID allows your application to identify the user across sessions but cannot be used to share data between separate applications since each application will receive a distinct SafeCustomerId value for the same Microsoft account.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity.safecustomerid
     * @type {HSTRING} 
     */
    SafeCustomerId {
        get => this.get_SafeCustomerId()
    }

    /**
     * The sign in name of the user. This value is available only to Microsoft application partners.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @remarks
     * Third-party app developers should use the Live SDK to get access to equivalent functionality.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity.signinname
     * @type {HSTRING} 
     */
    SignInName {
        get => this.get_SignInName()
    }

    /**
     * Contains the first name of the user. This value is available only to Microsoft application partners.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity.firstname
     * @type {HSTRING} 
     */
    FirstName {
        get => this.get_FirstName()
    }

    /**
     * Contains the user's last name. This value is available only to Microsoft application partners.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity.lastname
     * @type {HSTRING} 
     */
    LastName {
        get => this.get_LastName()
    }

    /**
     * Indicates if the user is part of a beta program. This value is available only to Microsoft application partners.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity.isbetaaccount
     * @type {Boolean} 
     */
    IsBetaAccount {
        get => this.get_IsBetaAccount()
    }

    /**
     * Indicates if the user is on a PC that they have confirmed as their PC. This value is available only to Microsoft application partners.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.useridentity.isconfirmedpc
     * @type {Boolean} 
     */
    IsConfirmedPC {
        get => this.get_IsConfirmedPC()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<OnlineIdServiceTicket>} 
     */
    get_Tickets() {
        if (!this.HasProp("__IUserIdentity")) {
            if ((queryResult := this.QueryInterface(IUserIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserIdentity := IUserIdentity(outPtr)
        }

        return this.__IUserIdentity.get_Tickets()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IUserIdentity")) {
            if ((queryResult := this.QueryInterface(IUserIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserIdentity := IUserIdentity(outPtr)
        }

        return this.__IUserIdentity.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SafeCustomerId() {
        if (!this.HasProp("__IUserIdentity")) {
            if ((queryResult := this.QueryInterface(IUserIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserIdentity := IUserIdentity(outPtr)
        }

        return this.__IUserIdentity.get_SafeCustomerId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignInName() {
        if (!this.HasProp("__IUserIdentity")) {
            if ((queryResult := this.QueryInterface(IUserIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserIdentity := IUserIdentity(outPtr)
        }

        return this.__IUserIdentity.get_SignInName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirstName() {
        if (!this.HasProp("__IUserIdentity")) {
            if ((queryResult := this.QueryInterface(IUserIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserIdentity := IUserIdentity(outPtr)
        }

        return this.__IUserIdentity.get_FirstName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LastName() {
        if (!this.HasProp("__IUserIdentity")) {
            if ((queryResult := this.QueryInterface(IUserIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserIdentity := IUserIdentity(outPtr)
        }

        return this.__IUserIdentity.get_LastName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBetaAccount() {
        if (!this.HasProp("__IUserIdentity")) {
            if ((queryResult := this.QueryInterface(IUserIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserIdentity := IUserIdentity(outPtr)
        }

        return this.__IUserIdentity.get_IsBetaAccount()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConfirmedPC() {
        if (!this.HasProp("__IUserIdentity")) {
            if ((queryResult := this.QueryInterface(IUserIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserIdentity := IUserIdentity(outPtr)
        }

        return this.__IUserIdentity.get_IsConfirmedPC()
    }

;@endregion Instance Methods
}
