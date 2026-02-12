#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountManagerStatics2.ahk
#Include .\IWebAccountManagerStatics.ahk
#Include .\IWebAccountManagerStatics3.ahk
#Include .\IWebAccountManagerStatics4.ahk
#Include .\IWebAccountScopeManagerStatics.ahk
#Include .\IWebAccountMapManagerStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides methods for managing web accounts.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountManager extends IInspectable {
;@region Static Methods
    /**
     * Pulls cookies asynchronously. Use this to enable single sign-on in an app after a user has entered their credentials into a web browser.
     * @param {HSTRING} uriString The Uri to pull cookies from.
     * @param {HSTRING} callerPFN The caller's package family name.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.pullcookiesasync
     */
    static PullCookiesAsync(uriString, callerPFN) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics2.IID)
            WebAccountManager.__IWebAccountManagerStatics2 := IWebAccountManagerStatics2(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics2.PullCookiesAsync(uriString, callerPFN)
    }

    /**
     * Updates the properties of a web account asynchronously.
     * @param {WebAccount} webAccount_ The web account to update.
     * @param {HSTRING} webAccountUserName The username to update.
     * @param {IMapView<HSTRING, HSTRING>} additionalProperties The properties to update.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.updatewebaccountpropertiesasync
     */
    static UpdateWebAccountPropertiesAsync(webAccount_, webAccountUserName, additionalProperties) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.UpdateWebAccountPropertiesAsync(webAccount_, webAccountUserName, additionalProperties)
    }

    /**
     * Adds a new web account asynchronously with four inputs.
     * @param {HSTRING} webAccountId The Id for the web account.
     * @param {HSTRING} webAccountUserName The user name for the web account.
     * @param {IMapView<HSTRING, HSTRING>} props Properties for the web account.
     * @returns {IAsyncOperation<WebAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.addwebaccountasync
     */
    static AddWebAccountAsync(webAccountId, webAccountUserName, props) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.AddWebAccountAsync(webAccountId, webAccountUserName, props)
    }

    /**
     * Deletes a web account asynchronously.
     * @param {WebAccount} webAccount_ The [WebAccount](../windows.security.credentials/webaccount.md) to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.deletewebaccountasync
     */
    static DeleteWebAccountAsync(webAccount_) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.DeleteWebAccountAsync(webAccount_)
    }

    /**
     * Finds all provider web accounts asynchronously.
     * @returns {IAsyncOperation<IVectorView<WebAccount>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.findallproviderwebaccountsasync
     */
    static FindAllProviderWebAccountsAsync() {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.FindAllProviderWebAccountsAsync()
    }

    /**
     * Pushes cookies asynchronously. Use this to enable single sign-on for a web account in a browser after the user has entered their credentials into the app.
     * @param {Uri} uri_ The Uri to push the cookies to.
     * @param {IVectorView<HttpCookie>} cookies The cookies to push.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.pushcookiesasync
     */
    static PushCookiesAsync(uri_, cookies) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.PushCookiesAsync(uri_, cookies)
    }

    /**
     * Sets the view for a web account asynchronously.
     * @param {WebAccount} webAccount_ The web account to set the view for.
     * @param {WebAccountClientView} view_ The view to set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.setviewasync
     */
    static SetViewAsync(webAccount_, view_) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.SetViewAsync(webAccount_, view_)
    }

    /**
     * Clears the view for a web account.
     * @param {WebAccount} webAccount_ The web account to clear the view for.
     * @param {Uri} applicationCallbackUri The callback Uri that indicates the completion of the operation. The broker matches this Uri against every Uri that it is about to navigate to. The broker never navigates to this Uri, instead the broker returns the control back to the application when the user clicks a link or a web server redirection is made.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.clearviewasync
     */
    static ClearViewAsync(webAccount_, applicationCallbackUri) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.ClearViewAsync(webAccount_, applicationCallbackUri)
    }

    /**
     * Gets the views for a web account asynchronously.
     * @param {WebAccount} webAccount_ The web account to get views for.
     * @returns {IAsyncOperation<IVectorView<WebAccountClientView>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.getviewsasync
     */
    static GetViewsAsync(webAccount_) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.GetViewsAsync(webAccount_)
    }

    /**
     * Sets the picture of a web account asynchronously.
     * @param {WebAccount} webAccount_ The web account to set the picture for.
     * @param {IRandomAccessStream} webAccountPicture The picture to set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.setwebaccountpictureasync
     */
    static SetWebAccountPictureAsync(webAccount_, webAccountPicture) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.SetWebAccountPictureAsync(webAccount_, webAccountPicture)
    }

    /**
     * Clears a web account picture asynchronously.
     * @param {WebAccount} webAccount_ The web account to clear the picture from.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.clearwebaccountpictureasync
     */
    static ClearWebAccountPictureAsync(webAccount_) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics.IID)
            WebAccountManager.__IWebAccountManagerStatics := IWebAccountManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics.ClearWebAccountPictureAsync(webAccount_)
    }

    /**
     * Finds all provider web accounts associated with a given user asynchronously (for use with multi-user-aware apps).
     * @param {User} user_ The user associated with the accounts.
     * @returns {IAsyncOperation<IVectorView<WebAccount>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.findallproviderwebaccountsforuserasync
     */
    static FindAllProviderWebAccountsForUserAsync(user_) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics3.IID)
            WebAccountManager.__IWebAccountManagerStatics3 := IWebAccountManagerStatics3(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics3.FindAllProviderWebAccountsForUserAsync(user_)
    }

    /**
     * Adds a new web account. This process is tracked as belonging to a specified user (for use with multi-user-aware apps).
     * @param {User} user_ The user for which an account must be authenticated.
     * @param {HSTRING} webAccountId The Id for the web account.
     * @param {HSTRING} webAccountUserName The user name for the web account.
     * @param {IMapView<HSTRING, HSTRING>} props Properties for the web account.
     * @returns {IAsyncOperation<WebAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.addwebaccountforuserasync
     */
    static AddWebAccountForUserAsync(user_, webAccountId, webAccountUserName, props) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics3.IID)
            WebAccountManager.__IWebAccountManagerStatics3 := IWebAccountManagerStatics3(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics3.AddWebAccountForUserAsync(user_, webAccountId, webAccountUserName, props)
    }

    /**
     * Adds a new web account. This process is tracked as belonging to a specified user (for use with multi-user-aware apps).
     * @param {User} user_ The user for which an account must be authenticated.
     * @param {HSTRING} webAccountId The Id for the web account.
     * @param {HSTRING} webAccountUserName The user name for the web account.
     * @param {IMapView<HSTRING, HSTRING>} props Properties for the web account.
     * @param {Integer} scope The scope of the web account.
     * @returns {IAsyncOperation<WebAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.addwebaccountforuserasync
     */
    static AddWebAccountWithScopeForUserAsync(user_, webAccountId, webAccountUserName, props, scope) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics3.IID)
            WebAccountManager.__IWebAccountManagerStatics3 := IWebAccountManagerStatics3(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics3.AddWebAccountWithScopeForUserAsync(user_, webAccountId, webAccountUserName, props, scope)
    }

    /**
     * Adds a new web account. This process is tracked as belonging to a specified user (for use with multi-user-aware apps).
     * @param {User} user_ The user for which an account must be authenticated.
     * @param {HSTRING} webAccountId The Id for the web account.
     * @param {HSTRING} webAccountUserName The user name for the web account.
     * @param {IMapView<HSTRING, HSTRING>} props Properties for the web account.
     * @param {Integer} scope 
     * @param {HSTRING} perUserWebAccountId 
     * @returns {IAsyncOperation<WebAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.addwebaccountforuserasync
     */
    static AddWebAccountWithScopeAndMapForUserAsync(user_, webAccountId, webAccountUserName, props, scope, perUserWebAccountId) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics3.IID)
            WebAccountManager.__IWebAccountManagerStatics3 := IWebAccountManagerStatics3(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics3.AddWebAccountWithScopeAndMapForUserAsync(user_, webAccountId, webAccountUserName, props, scope, perUserWebAccountId)
    }

    /**
     * Clears the web account manager's token cache for all web accounts.
     * @remarks
     * This method should be called whenever a web account provider app detects that a token cached by the web account manager is invalid.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.invalidateappcacheforallaccountsasync
     */
    static InvalidateAppCacheForAllAccountsAsync() {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics4.IID)
            WebAccountManager.__IWebAccountManagerStatics4 := IWebAccountManagerStatics4(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics4.InvalidateAppCacheForAllAccountsAsync()
    }

    /**
     * Clears the web account manager's token cache for a specific web account.
     * @remarks
     * This method should be called whenever a web account provider app detects that a token cached by the web account manager for a specific account is invalid.
     * @param {WebAccount} webAccount_ The web account for which tokens will be cleared.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.invalidateappcacheforaccountasync
     */
    static InvalidateAppCacheForAccountAsync(webAccount_) {
        if (!WebAccountManager.HasProp("__IWebAccountManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountManagerStatics4.IID)
            WebAccountManager.__IWebAccountManagerStatics4 := IWebAccountManagerStatics4(factoryPtr)
        }

        return WebAccountManager.__IWebAccountManagerStatics4.InvalidateAppCacheForAccountAsync(webAccount_)
    }

    /**
     * Adds a new web account asynchronously with five inputs.
     * @param {HSTRING} webAccountId The Id for the web account.
     * @param {HSTRING} webAccountUserName The user name for the web account.
     * @param {IMapView<HSTRING, HSTRING>} props Properties for the web account.
     * @param {Integer} scope The scope of the web account.
     * @returns {IAsyncOperation<WebAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.addwebaccountasync
     */
    static AddWebAccountWithScopeAsync(webAccountId, webAccountUserName, props, scope) {
        if (!WebAccountManager.HasProp("__IWebAccountScopeManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountScopeManagerStatics.IID)
            WebAccountManager.__IWebAccountScopeManagerStatics := IWebAccountScopeManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountScopeManagerStatics.AddWebAccountWithScopeAsync(webAccountId, webAccountUserName, props, scope)
    }

    /**
     * Sets the scope of a web account asynchronously.
     * @param {WebAccount} webAccount_ The web account to set scope for.
     * @param {Integer} scope The scope to set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.setscopeasync
     */
    static SetScopeAsync(webAccount_, scope) {
        if (!WebAccountManager.HasProp("__IWebAccountScopeManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountScopeManagerStatics.IID)
            WebAccountManager.__IWebAccountScopeManagerStatics := IWebAccountScopeManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountScopeManagerStatics.SetScopeAsync(webAccount_, scope)
    }

    /**
     * Gets the scope of the web account.
     * @param {WebAccount} webAccount_ The web account to get scope for.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.getscope
     */
    static GetScope(webAccount_) {
        if (!WebAccountManager.HasProp("__IWebAccountScopeManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountScopeManagerStatics.IID)
            WebAccountManager.__IWebAccountScopeManagerStatics := IWebAccountScopeManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountScopeManagerStatics.GetScope(webAccount_)
    }

    /**
     * Adds a new web account asynchronously with three inputs.
     * @param {HSTRING} webAccountId The Id for the web account.
     * @param {HSTRING} webAccountUserName The user name for the web account.
     * @param {IMapView<HSTRING, HSTRING>} props Properties for the web account.
     * @param {Integer} scope 
     * @param {HSTRING} perUserWebAccountId 
     * @returns {IAsyncOperation<WebAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.addwebaccountasync
     */
    static AddWebAccountWithScopeAndMapAsync(webAccountId, webAccountUserName, props, scope, perUserWebAccountId) {
        if (!WebAccountManager.HasProp("__IWebAccountMapManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountMapManagerStatics.IID)
            WebAccountManager.__IWebAccountMapManagerStatics := IWebAccountMapManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountMapManagerStatics.AddWebAccountWithScopeAndMapAsync(webAccountId, webAccountUserName, props, scope, perUserWebAccountId)
    }

    /**
     * Creates a per-app to per-user account link.
     * @param {WebAccount} perAppAccount The per-app web account.
     * @param {HSTRING} perUserWebAccountId The web account Id of the per-user web account to link.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.setperapptoperuseraccountasync
     */
    static SetPerAppToPerUserAccountAsync(perAppAccount, perUserWebAccountId) {
        if (!WebAccountManager.HasProp("__IWebAccountMapManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountMapManagerStatics.IID)
            WebAccountManager.__IWebAccountMapManagerStatics := IWebAccountMapManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountMapManagerStatics.SetPerAppToPerUserAccountAsync(perAppAccount, perUserWebAccountId)
    }

    /**
     * Gets a per-user web account from a per-app web account.
     * @param {WebAccount} perAppAccount The per-app web account.
     * @returns {IAsyncOperation<WebAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.getperuserfromperappaccountasync
     */
    static GetPerUserFromPerAppAccountAsync(perAppAccount) {
        if (!WebAccountManager.HasProp("__IWebAccountMapManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountMapManagerStatics.IID)
            WebAccountManager.__IWebAccountMapManagerStatics := IWebAccountMapManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountMapManagerStatics.GetPerUserFromPerAppAccountAsync(perAppAccount)
    }

    /**
     * Clears the link between per-user and per-app web accounts.
     * @param {WebAccount} perAppAccount The per-app web account to clear.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountmanager.clearperuserfromperappaccountasync
     */
    static ClearPerUserFromPerAppAccountAsync(perAppAccount) {
        if (!WebAccountManager.HasProp("__IWebAccountMapManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountMapManagerStatics.IID)
            WebAccountManager.__IWebAccountMapManagerStatics := IWebAccountMapManagerStatics(factoryPtr)
        }

        return WebAccountManager.__IWebAccountMapManagerStatics.ClearPerUserFromPerAppAccountAsync(perAppAccount)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
