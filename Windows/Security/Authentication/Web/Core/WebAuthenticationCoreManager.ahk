#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAuthenticationCoreManagerStatics2.ahk
#Include .\IWebAuthenticationCoreManagerStatics4.ahk
#Include .\IWebAuthenticationCoreManagerStatics5.ahk
#Include .\IWebAuthenticationCoreManagerStatics.ahk
#Include .\IWebAuthenticationCoreManagerStatics3.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains core methods for obtaining tokens from web account providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationCoreManager extends IInspectable {
;@region Static Methods
    /**
     * Asynchronously attempts to find a web account provider.
     * @param {HSTRING} webAccountProviderId The Id of the web account provider to find.
     * @param {HSTRING} authority 
     * @param {User} user_ 
     * @returns {IAsyncOperation<WebAccountProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findaccountproviderasync
     */
    static FindAccountProviderWithAuthorityForUserAsync(webAccountProviderId, authority, user_) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics2.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics2 := IWebAuthenticationCoreManagerStatics2(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics2.FindAccountProviderWithAuthorityForUserAsync(webAccountProviderId, authority, user_)
    }

    /**
     * Enumerates all of the accounts that have been added by a user for a particular ID provider.
     * @param {WebAccountProvider} provider The ID provider that owns the accounts to be retrieved.
     * @returns {IAsyncOperation<FindAllAccountsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findallaccountsasync
     */
    static FindAllAccountsAsync(provider) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics4.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4 := IWebAuthenticationCoreManagerStatics4(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4.FindAllAccountsAsync(provider)
    }

    /**
     * Enumerates all of the accounts that have been added by a user for a particular ID provider.
     * @param {WebAccountProvider} provider The ID provider that owns the accounts to be retrieved.
     * @param {HSTRING} clientId 
     * @returns {IAsyncOperation<FindAllAccountsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findallaccountsasync
     */
    static FindAllAccountsWithClientIdAsync(provider, clientId) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics4.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4 := IWebAuthenticationCoreManagerStatics4(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4.FindAllAccountsWithClientIdAsync(provider, clientId)
    }

    /**
     * Asynchronously attempts to find a web account provider for device-wide authentication.
     * @remarks
     * The device token feature is intended for cases in which a service needs to connect to cloud resources before a user ever signs into the device (for example, in out-of-box experiences where there are System Center Configuration Manager (SCCM) policies that must be applied right away). Only first-party ID providers (Xbox, MSA, AAD) allow device-wide tokens; other ID providers do not.
     * @param {HSTRING} webAccountProviderId The Id of the web account provider to find.
     * @returns {IAsyncOperation<WebAccountProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findsystemaccountproviderasync
     */
    static FindSystemAccountProviderAsync(webAccountProviderId) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics4.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4 := IWebAuthenticationCoreManagerStatics4(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4.FindSystemAccountProviderAsync(webAccountProviderId)
    }

    /**
     * Asynchronously attempts to find a web account provider for device-wide authentication.
     * @param {HSTRING} webAccountProviderId The Id of the web account provider to find.
     * @param {HSTRING} authority The authority of the web account provider to find.
     * @returns {IAsyncOperation<WebAccountProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findsystemaccountproviderasync
     */
    static FindSystemAccountProviderWithAuthorityAsync(webAccountProviderId, authority) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics4.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4 := IWebAuthenticationCoreManagerStatics4(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4.FindSystemAccountProviderWithAuthorityAsync(webAccountProviderId, authority)
    }

    /**
     * Asynchronously attempts to find a web account provider for device-wide authentication.
     * @param {HSTRING} webAccountProviderId The Id of the web account provider to find.
     * @param {HSTRING} authority 
     * @param {User} user_ 
     * @returns {IAsyncOperation<WebAccountProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findsystemaccountproviderasync
     */
    static FindSystemAccountProviderWithAuthorityForUserAsync(webAccountProviderId, authority, user_) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics4.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4 := IWebAuthenticationCoreManagerStatics4(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics4.FindSystemAccountProviderWithAuthorityForUserAsync(webAccountProviderId, authority, user_)
    }

    /**
     * A method that adds a user's account to a cloud device using a transfer token.
     * @remarks
     * This API can be used to redeem a transfer token blob to provision a Web Account on Windows for seamless single sign-on resulting in the provisioning of the desired Web Account.
     * @param {WebAuthenticationTransferTokenRequest} request The [WebAuthenticationTransferTokenRequest](webauthenticationtransfertokenrequest.md) object that contains the transfer token blob and the account provider ID.
     * @returns {IAsyncOperation<WebAuthenticationAddAccountResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.addaccountwithtransfertokenasync
     */
    static AddAccountWithTransferTokenAsync(request) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics5")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics5.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics5 := IWebAuthenticationCoreManagerStatics5(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics5.AddAccountWithTransferTokenAsync(request)
    }

    /**
     * Asynchronously attempts to get a token without showing any UI. The user will never be prompted to enter their credentials.
     * @param {WebTokenRequest} request The web token request.
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.gettokensilentlyasync
     */
    static GetTokenSilentlyAsync(request) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics := IWebAuthenticationCoreManagerStatics(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics.GetTokenSilentlyAsync(request)
    }

    /**
     * Asynchronously attempts to get a token without showing any UI. The user will never be prompted to enter their credentials.
     * @remarks
     * Unlike [RequestTokenAsync](webauthenticationcoremanager_requesttokenasync_1777535178.md), you may call this method from background threads.
     * @param {WebTokenRequest} request The web token request.
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.gettokensilentlyasync
     */
    static GetTokenSilentlyWithWebAccountAsync(request, webAccount_) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics := IWebAuthenticationCoreManagerStatics(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics.GetTokenSilentlyWithWebAccountAsync(request, webAccount_)
    }

    /**
     * Asynchronously requests a token from a web account provider. If necessary, the user is prompted to enter their credentials.
     * @remarks
     * This method cannot be called from desktop apps or from background threads of UWP apps.
     * For an equivalent of this method for desktop apps, see
     * [IWebAuthenticationCoreManagerInterop::RequestTokenWithWebAccountForWindowAsync](/windows/win32/api/webauthenticationcoremanagerinterop/nf-webauthenticationcoremanagerinterop-iwebauthenticationcoremanagerinterop-requesttokenwithwebaccountforwindowasync).
     * @param {WebTokenRequest} request The web token request.
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.requesttokenasync
     */
    static RequestTokenAsync(request) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics := IWebAuthenticationCoreManagerStatics(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics.RequestTokenAsync(request)
    }

    /**
     * Asynchronously requests a token from a web account provider. If necessary, the user is prompted to enter their credentials.
     * @remarks
     * This method cannot be called from desktop apps or from background threads of UWP apps.
     * For an equivalent of this method for desktop apps, see
     * [IWebAuthenticationCoreManagerInterop::RequestTokenForWindowAsync](/windows/win32/api/webauthenticationcoremanagerinterop/nf-webauthenticationcoremanagerinterop-iwebauthenticationcoremanagerinterop-requesttokenforwindowasync).
     * @param {WebTokenRequest} request The web token request.
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.requesttokenasync
     */
    static RequestTokenWithWebAccountAsync(request, webAccount_) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics := IWebAuthenticationCoreManagerStatics(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics.RequestTokenWithWebAccountAsync(request, webAccount_)
    }

    /**
     * Asynchronously attempts to find a web account provider.
     * @param {WebAccountProvider} provider The web account provider for the web account.
     * @param {HSTRING} webAccountId The identifier of the web account.
     * @returns {IAsyncOperation<WebAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findaccountasync
     */
    static FindAccountAsync(provider, webAccountId) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics := IWebAuthenticationCoreManagerStatics(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics.FindAccountAsync(provider, webAccountId)
    }

    /**
     * Asynchronously attempts to find a web account provider.
     * @param {HSTRING} webAccountProviderId The Id of the web account provider to find.
     * @returns {IAsyncOperation<WebAccountProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findaccountproviderasync
     */
    static FindAccountProviderAsync(webAccountProviderId) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics := IWebAuthenticationCoreManagerStatics(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics.FindAccountProviderAsync(webAccountProviderId)
    }

    /**
     * Asynchronously attempts to find a web account provider.
     * @param {HSTRING} webAccountProviderId The Id of the web account provider to find.
     * @param {HSTRING} authority The authority of the web account provider to find.
     * @returns {IAsyncOperation<WebAccountProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.findaccountproviderasync
     */
    static FindAccountProviderWithAuthorityAsync(webAccountProviderId, authority) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics := IWebAuthenticationCoreManagerStatics(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics.FindAccountProviderWithAuthorityAsync(webAccountProviderId, authority)
    }

    /**
     * Creates a web account monitor to watch given accounts.
     * @param {IIterable<WebAccount>} webAccounts The web accounts to monitor.
     * @returns {WebAccountMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.createwebaccountmonitor
     */
    static CreateWebAccountMonitor(webAccounts) {
        if (!WebAuthenticationCoreManager.HasProp("__IWebAuthenticationCoreManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationCoreManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerStatics3.IID)
            WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics3 := IWebAuthenticationCoreManagerStatics3(factoryPtr)
        }

        return WebAuthenticationCoreManager.__IWebAuthenticationCoreManagerStatics3.CreateWebAccountMonitor(webAccounts)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
