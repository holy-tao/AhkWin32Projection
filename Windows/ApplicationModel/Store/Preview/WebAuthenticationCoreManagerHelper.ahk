#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAuthenticationCoreManagerHelper.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the ability to host a custom UI to request an authentication token.
  * 
  * > [!IMPORTANT]
  * > Access to this API is protected by a private capability that is restricted to apps that are developed by Microsoft.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.webauthenticationcoremanagerhelper
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationCoreManagerHelper extends IInspectable {
;@region Static Methods
    /**
     * Requests an authentication token for the specified account using the specified custom UI.
     * @param {WebTokenRequest} request An object that represents the request to an online identity provider for an authentication token.
     * @param {UIElement} uiElement_ The custom UI that is shown to the user to retrieve information needed for the authentication token (such as a user ID or password).
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.webauthenticationcoremanagerhelper.requesttokenwithuielementhostingasync
     */
    static RequestTokenWithUIElementHostingAsync(request, uiElement_) {
        if (!WebAuthenticationCoreManagerHelper.HasProp("__IWebAuthenticationCoreManagerHelper")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.WebAuthenticationCoreManagerHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerHelper.IID)
            WebAuthenticationCoreManagerHelper.__IWebAuthenticationCoreManagerHelper := IWebAuthenticationCoreManagerHelper(factoryPtr)
        }

        return WebAuthenticationCoreManagerHelper.__IWebAuthenticationCoreManagerHelper.RequestTokenWithUIElementHostingAsync(request, uiElement_)
    }

    /**
     * Requests an authentication token using the specified custom UI.
     * @param {WebTokenRequest} request An object that represents the request to an online identity provider for an authentication token.
     * @param {WebAccount} webAccount_ 
     * @param {UIElement} uiElement_ The custom UI that is shown to the user to retrieve information needed for the authentication token (such as a user ID or password).
     * @returns {IAsyncOperation<WebTokenRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.webauthenticationcoremanagerhelper.requesttokenwithuielementhostingasync
     */
    static RequestTokenWithUIElementHostingAndWebAccountAsync(request, webAccount_, uiElement_) {
        if (!WebAuthenticationCoreManagerHelper.HasProp("__IWebAuthenticationCoreManagerHelper")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.WebAuthenticationCoreManagerHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationCoreManagerHelper.IID)
            WebAuthenticationCoreManagerHelper.__IWebAuthenticationCoreManagerHelper := IWebAuthenticationCoreManagerHelper(factoryPtr)
        }

        return WebAuthenticationCoreManagerHelper.__IWebAuthenticationCoreManagerHelper.RequestTokenWithUIElementHostingAndWebAccountAsync(request, webAccount_, uiElement_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
