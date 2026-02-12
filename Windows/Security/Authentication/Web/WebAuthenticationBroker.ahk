#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAuthenticationBrokerStatics2.ahk
#Include .\IWebAuthenticationBrokerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Starts the authentication operation. You can call the methods of this class multiple times in a single application or across multiple applications at the same time. The [Web authentication broker sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/WebAuthenticationBroker) in the Samples gallery is an example of how to use the WebAuthenticationBroker class for single sign on (SSO) connections.
 * @remarks
 * All members of this class are static. You can access them without creating an object. To troubleshoot issues when using this class, see the event log. To view the event log, start Eventvwr.exe, and navigate to Application and Services Logs &gt; Microsoft &gt; Windows &gt; WebAuth &gt; Operational.
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker
 * @namespace Windows.Security.Authentication.Web
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationBroker extends IInspectable {
;@region Static Methods
    /**
     * Starts the authentication operation with one input.
     * @param {Uri} requestUri The starting URI of the web service. This URI must be a secure address of https://.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker.authenticateandcontinue
     */
    static AuthenticateAndContinue(requestUri) {
        if (!WebAuthenticationBroker.HasProp("__IWebAuthenticationBrokerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.WebAuthenticationBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationBrokerStatics2.IID)
            WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2 := IWebAuthenticationBrokerStatics2(factoryPtr)
        }

        return WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2.AuthenticateAndContinue(requestUri)
    }

    /**
     * Starts the authentication operation with two inputs.
     * @param {Uri} requestUri The starting URI of the web service. This URI must be a secure address of https://.
     * @param {Uri} callbackUri The callback URI that indicates the completion of the web authentication. The broker matches this URI against every URI that it is about to navigate to. The broker never navigates to this URI, instead the broker returns the control back to the application when the user clicks a link or a web server redirection is made.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker.authenticateandcontinue
     */
    static AuthenticateWithCallbackUriAndContinue(requestUri, callbackUri) {
        if (!WebAuthenticationBroker.HasProp("__IWebAuthenticationBrokerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.WebAuthenticationBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationBrokerStatics2.IID)
            WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2 := IWebAuthenticationBrokerStatics2(factoryPtr)
        }

        return WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2.AuthenticateWithCallbackUriAndContinue(requestUri, callbackUri)
    }

    /**
     * Starts the authentication operation with four inputs.
     * @param {Uri} requestUri The starting URI of the web service. This URI must be a secure address of https://.
     * @param {Uri} callbackUri The callback URI that indicates the completion of the web authentication. The broker matches this URI against every URI that it is about to navigate to. The broker never navigates to this URI, instead the broker returns the control back to the application when the user clicks a link or a web server redirection is made.
     * @param {ValueSet} continuationData Continuation data to be passed as part of the authentication operation.
     * @param {Integer} options The options for the authentication operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker.authenticateandcontinue
     */
    static AuthenticateWithCallbackUriContinuationDataAndOptionsAndContinue(requestUri, callbackUri, continuationData, options) {
        if (!WebAuthenticationBroker.HasProp("__IWebAuthenticationBrokerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.WebAuthenticationBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationBrokerStatics2.IID)
            WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2 := IWebAuthenticationBrokerStatics2(factoryPtr)
        }

        return WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2.AuthenticateWithCallbackUriContinuationDataAndOptionsAndContinue(requestUri, callbackUri, continuationData, options)
    }

    /**
     * Starts the asynchronous authentication operation silently (no UI will be shown) with two inputs. You can call this method multiple times in a single application or across multiple applications at the same time.
     * @param {Uri} requestUri The starting URI of the web service. This URI must be a secure address of https://.
     * @returns {IAsyncOperation<WebAuthenticationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker.authenticatesilentlyasync
     */
    static AuthenticateSilentlyAsync(requestUri) {
        if (!WebAuthenticationBroker.HasProp("__IWebAuthenticationBrokerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.WebAuthenticationBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationBrokerStatics2.IID)
            WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2 := IWebAuthenticationBrokerStatics2(factoryPtr)
        }

        return WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2.AuthenticateSilentlyAsync(requestUri)
    }

    /**
     * Starts the asynchronous authentication operation silently (no UI will be shown) with one input. You can call this method multiple times in a single application or across multiple applications at the same time.
     * @param {Uri} requestUri The starting URI of the web service. This URI must be a secure address of https://.
     * @param {Integer} options 
     * @returns {IAsyncOperation<WebAuthenticationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker.authenticatesilentlyasync
     */
    static AuthenticateSilentlyWithOptionsAsync(requestUri, options) {
        if (!WebAuthenticationBroker.HasProp("__IWebAuthenticationBrokerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.WebAuthenticationBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationBrokerStatics2.IID)
            WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2 := IWebAuthenticationBrokerStatics2(factoryPtr)
        }

        return WebAuthenticationBroker.__IWebAuthenticationBrokerStatics2.AuthenticateSilentlyWithOptionsAsync(requestUri, options)
    }

    /**
     * Starts the asynchronous authentication operation with two inputs. You can call this method multiple times in a single application or across multiple applications at the same time.
     * @remarks
     * There is no explicit *callbackUri* parameter in this method. The application's default URI is used internally as the terminator. For more information, see [GetCurrentApplicationCallbackUri](webauthenticationbroker_getcurrentapplicationcallbackuri_1466144424.md).
     * @param {Integer} options The options for the authentication operation.
     * @param {Uri} requestUri The starting URI of the web service. This URI must be a secure address of https://.
     * @param {Uri} callbackUri 
     * @returns {IAsyncOperation<WebAuthenticationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker.authenticateasync
     */
    static AuthenticateWithCallbackUriAsync(options, requestUri, callbackUri) {
        if (!WebAuthenticationBroker.HasProp("__IWebAuthenticationBrokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.WebAuthenticationBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationBrokerStatics.IID)
            WebAuthenticationBroker.__IWebAuthenticationBrokerStatics := IWebAuthenticationBrokerStatics(factoryPtr)
        }

        return WebAuthenticationBroker.__IWebAuthenticationBrokerStatics.AuthenticateWithCallbackUriAsync(options, requestUri, callbackUri)
    }

    /**
     * Starts the asynchronous authentication operation with three inputs. You can call this method multiple times in a single application or across multiple applications at the same time.
     * @remarks
     * When this method is used, no session state or persisted cookies are retained across multiple calls from the same or different UWP app. This method must be called on the UI thread.
     * @param {Integer} options The options for the authentication operation.
     * @param {Uri} requestUri The starting URI of the web service. This URI must be a secure address of https://.
     * @returns {IAsyncOperation<WebAuthenticationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker.authenticateasync
     */
    static AuthenticateWithoutCallbackUriAsync(options, requestUri) {
        if (!WebAuthenticationBroker.HasProp("__IWebAuthenticationBrokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.WebAuthenticationBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationBrokerStatics.IID)
            WebAuthenticationBroker.__IWebAuthenticationBrokerStatics := IWebAuthenticationBrokerStatics(factoryPtr)
        }

        return WebAuthenticationBroker.__IWebAuthenticationBrokerStatics.AuthenticateWithoutCallbackUriAsync(options, requestUri)
    }

    /**
     * Gets the current application callback URI.
     * @remarks
     * The current application callback URI is used as an implicit value of the *callbackUri* parameter of the [AuthenticateAsync](webauthenticationbroker_authenticateasync_1561991399.md) method. However, applications need the URI value to add it to the request URI as required by the online provider.
     * @returns {Uri} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationbroker.getcurrentapplicationcallbackuri
     */
    static GetCurrentApplicationCallbackUri() {
        if (!WebAuthenticationBroker.HasProp("__IWebAuthenticationBrokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.WebAuthenticationBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationBrokerStatics.IID)
            WebAuthenticationBroker.__IWebAuthenticationBrokerStatics := IWebAuthenticationBrokerStatics(factoryPtr)
        }

        return WebAuthenticationBroker.__IWebAuthenticationBrokerStatics.GetCurrentApplicationCallbackUri()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
