#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOnlineIdAuthenticator.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides an app with the ability to start the authentication request to get JavaScript Object Notation (JSON) tokens to use with your service or request tickets that can be used to get data that the user has consented to for your app using the Live ConnectAPI.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
  * 
  * > [!NOTE]
  * > If you're developing for Windows 10 or later, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidauthenticator
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class OnlineIdAuthenticator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOnlineIdAuthenticator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOnlineIdAuthenticator.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the ID of the application as a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid).
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @remarks
     * This ID is not necessary for UWP app.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidauthenticator.applicationid
     * @type {Guid} 
     */
    ApplicationId {
        get => this.get_ApplicationId()
        set => this.put_ApplicationId(value)
    }

    /**
     * Indicates whether a user can sign out of the app, and whether to show the sign out link in the app.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @remarks
     * An app that uses the [OnlineIdAuthenticator](onlineidauthenticator.md) class must show an option for the user to sign out. The sign out option must appear in the Settings charm, and the app must create a new page for its user account settings in Accounts. To see an example of how to add the sign out option and the account setting page, see the [Windows Account Authorization sample](https://github.com/microsoft/VCSamples/tree/9e1d4475555b76a17a3568369867f1d7b6cc6126/VC2012Samples/Windows%208%20samples/C%2B%2B/Windows%208%20app%20samples/Windows%20account%20authorization%20sample%20(Windows%208)).
     * 
     * If the user has a connected account, they can sign out by visiting the Users page in PC Settings.
     * 
     * If this property is **false**, a call to [SignOutUserAsync](onlineidauthenticator_signoutuserasync_658229157.md) fails with the **ONL_E_CONNECTED_ACCOUNT_CAN_NOT_SIGNOUT** error code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidauthenticator.cansignout
     * @type {Boolean} 
     */
    CanSignOut {
        get => this.get_CanSignOut()
    }

    /**
     * Returns the ID of a user who has been successfully authenticated for your app.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @remarks
     * This property returns the same user ID as the [UserIdentity.SafeCustomerId](useridentity_safecustomerid.md) property.
     * 
     * If the user was not successfully authenticated for your app, this property value is empty.
     * 
     * If your app stores local data based on the user's identity, you must check the authenticatedSafeCustomerId property to ensure there were no changes since the last authentication for your app. Check this property when your app is launched or activated, before getting the user identity and associated tickets.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidauthenticator.authenticatedsafecustomerid
     * @type {HSTRING} 
     */
    AuthenticatedSafeCustomerId {
        get => this.get_AuthenticatedSafeCustomerId()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [OnlineIdAuthenticator](onlineidauthenticator.md).
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * 
     * > [!NOTE]
     * > If you're developing for Windows 10 or later, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.OnlineId.OnlineIdAuthenticator")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Starts the async authentication request with multiple [OnlineIdServiceTicketRequests](onlineidserviceticketrequest.md) and provides the ability to control the user experience by setting the [CredentialPromptType](credentialprompttype.md) to get the tickets. If a user is signed into a Windows 8 system with a Microsoft account, this user will be used for the authentication request.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @param {OnlineIdServiceTicketRequest} request 
     * @returns {UserAuthenticationOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidauthenticator.authenticateuserasync
     */
    AuthenticateUserAsync(request) {
        if (!this.HasProp("__IOnlineIdAuthenticator")) {
            if ((queryResult := this.QueryInterface(IOnlineIdAuthenticator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdAuthenticator := IOnlineIdAuthenticator(outPtr)
        }

        return this.__IOnlineIdAuthenticator.AuthenticateUserAsync(request)
    }

    /**
     * Starts the asynchronous authentication request with one [OnlineIdServiceTicketRequest](onlineidserviceticketrequest.md) by showing the credential prompt if needed to collect credentials or consent and get the ticket. If a user is signed into a Windows 8 system with a Microsoft account, this user will be used for the authentication request.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @remarks
     * <!-- The following is from the PM. Needs to be rewritten after Beta. -->
     * When using these methods, consider the following error-handling guidelines:
     * + If the asynchronous authentication request fails, the error is captured in the errorcode of the [IAsyncInfo](/windows/desktop/api/asyncinfo/nn-asyncinfo-iasyncinfo) object.
     * + If the asynchronous authentication requests starts and some of the tickets were obtained but some of them failed, the response is S_OK.
     * + If the authentication request itself succeeded but individual tickets couldn’t be requested, [IAsyncInfo](/windows/desktop/api/asyncinfo/nn-asyncinfo-iasyncinfo) returns S_OK but [OnlineIdServiceTicket.ErrorCode](onlineidserviceticket_errorcode.md) captures individual ticket error codes.
     * + If all of the ticket requests failed, the [IAsyncInfo](/windows/desktop/api/asyncinfo/nn-asyncinfo-iasyncinfo) will contain the actual error code.
     * + If all calls succeeded and all of the tickets were successfully obtained, the error code will be S_OK indicating no error occurred .
     * @param {IIterable<OnlineIdServiceTicketRequest>} requests 
     * @param {Integer} credentialPromptType_ 
     * @returns {UserAuthenticationOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidauthenticator.authenticateuserasync
     */
    AuthenticateUserAsyncAdvanced(requests, credentialPromptType_) {
        if (!this.HasProp("__IOnlineIdAuthenticator")) {
            if ((queryResult := this.QueryInterface(IOnlineIdAuthenticator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdAuthenticator := IOnlineIdAuthenticator(outPtr)
        }

        return this.__IOnlineIdAuthenticator.AuthenticateUserAsyncAdvanced(requests, credentialPromptType_)
    }

    /**
     * Allows users to sign out of your app.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @returns {SignOutUserOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidauthenticator.signoutuserasync
     */
    SignOutUserAsync() {
        if (!this.HasProp("__IOnlineIdAuthenticator")) {
            if ((queryResult := this.QueryInterface(IOnlineIdAuthenticator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdAuthenticator := IOnlineIdAuthenticator(outPtr)
        }

        return this.__IOnlineIdAuthenticator.SignOutUserAsync()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_ApplicationId(value) {
        if (!this.HasProp("__IOnlineIdAuthenticator")) {
            if ((queryResult := this.QueryInterface(IOnlineIdAuthenticator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdAuthenticator := IOnlineIdAuthenticator(outPtr)
        }

        return this.__IOnlineIdAuthenticator.put_ApplicationId(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ApplicationId() {
        if (!this.HasProp("__IOnlineIdAuthenticator")) {
            if ((queryResult := this.QueryInterface(IOnlineIdAuthenticator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdAuthenticator := IOnlineIdAuthenticator(outPtr)
        }

        return this.__IOnlineIdAuthenticator.get_ApplicationId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSignOut() {
        if (!this.HasProp("__IOnlineIdAuthenticator")) {
            if ((queryResult := this.QueryInterface(IOnlineIdAuthenticator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdAuthenticator := IOnlineIdAuthenticator(outPtr)
        }

        return this.__IOnlineIdAuthenticator.get_CanSignOut()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AuthenticatedSafeCustomerId() {
        if (!this.HasProp("__IOnlineIdAuthenticator")) {
            if ((queryResult := this.QueryInterface(IOnlineIdAuthenticator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdAuthenticator := IOnlineIdAuthenticator(outPtr)
        }

        return this.__IOnlineIdAuthenticator.get_AuthenticatedSafeCustomerId()
    }

;@endregion Instance Methods
}
