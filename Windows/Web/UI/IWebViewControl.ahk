#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\UI\Color.ahk
#Include .\WebViewControlSettings.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WebViewControlDeferredPermissionRequest.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\ApplicationModel\DataTransfer\DataPackage.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a control that hosts HTML content in an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class IWebViewControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControl
     * @type {Guid}
     */
    static IID => Guid("{3f921316-bc70-4bda-9136-c94370899fab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "put_Source", "get_DocumentTitle", "get_CanGoBack", "get_CanGoForward", "put_DefaultBackgroundColor", "get_DefaultBackgroundColor", "get_ContainsFullScreenElement", "get_Settings", "get_DeferredPermissionRequests", "GoForward", "GoBack", "Refresh", "Stop", "Navigate", "NavigateToString", "NavigateToLocalStreamUri", "NavigateWithHttpRequestMessage", "InvokeScriptAsync", "CapturePreviewToStreamAsync", "CaptureSelectedContentToDataPackageAsync", "BuildLocalStreamUri", "GetDeferredPermissionRequestById", "add_NavigationStarting", "remove_NavigationStarting", "add_ContentLoading", "remove_ContentLoading", "add_DOMContentLoaded", "remove_DOMContentLoaded", "add_NavigationCompleted", "remove_NavigationCompleted", "add_FrameNavigationStarting", "remove_FrameNavigationStarting", "add_FrameContentLoading", "remove_FrameContentLoading", "add_FrameDOMContentLoaded", "remove_FrameDOMContentLoaded", "add_FrameNavigationCompleted", "remove_FrameNavigationCompleted", "add_ScriptNotify", "remove_ScriptNotify", "add_LongRunningScriptDetected", "remove_LongRunningScriptDetected", "add_UnsafeContentWarningDisplaying", "remove_UnsafeContentWarningDisplaying", "add_UnviewableContentIdentified", "remove_UnviewableContentIdentified", "add_PermissionRequested", "remove_PermissionRequested", "add_UnsupportedUriSchemeIdentified", "remove_UnsupportedUriSchemeIdentified", "add_NewWindowRequested", "remove_NewWindowRequested", "add_ContainsFullScreenElementChanged", "remove_ContainsFullScreenElementChanged", "add_WebResourceRequested", "remove_WebResourceRequested"]

    /**
     * Gets or sets the Uniform Resource Identifier (URI) source of the HTML content to display in the IWebViewControl.
     * @remarks
     * The **Source** property retains its old value during navigation until the navigation is complete. During navigation, you can get the new Uniform Resource Identifier (URI) through the event arguments for the navigation events.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.source
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets the title of the page currently displayed in the IWebViewControl.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.documenttitle
     * @type {HSTRING} 
     */
    DocumentTitle {
        get => this.get_DocumentTitle()
    }

    /**
     * Gets a value that indicates whether there is at least one page in the backward navigation history.
     * @remarks
     * To navigate backward, call the [GoBack](iwebviewcontrol_goback_1030386674.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.cangoback
     * @type {Boolean} 
     */
    CanGoBack {
        get => this.get_CanGoBack()
    }

    /**
     * Gets a value that indicates whether there is at least one page in the forward navigation history.
     * @remarks
     * To navigate forward, call the [GoForward](iwebviewcontrol_goforward_1537152893.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.cangoforward
     * @type {Boolean} 
     */
    CanGoForward {
        get => this.get_CanGoForward()
    }

    /**
     * Gets or sets the color to use as the IWebViewControl background when the HTML content does not specify a color.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.defaultbackgroundcolor
     * @type {Color} 
     */
    DefaultBackgroundColor {
        get => this.get_DefaultBackgroundColor()
        set => this.put_DefaultBackgroundColor(value)
    }

    /**
     * Gets a value that indicates whether the IWebViewControl contains an element that supports full screen.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.containsfullscreenelement
     * @type {Boolean} 
     */
    ContainsFullScreenElement {
        get => this.get_ContainsFullScreenElement()
    }

    /**
     * Gets a [WebViewControlSettings](webviewcontrolsettings.md) object that contains properties to enable or disable IWebViewControl features.
     * @remarks
     * Use the [WebViewControlSettings](webviewcontrolsettings.md) object to enable or disable the use of JavaScript and IndexedDB in the IWebViewControl. For more info, see [WebViewControlSettings.IsIndexedDBEnabled](webviewcontrolsettings_isindexeddbenabled.md) and [WebViewControlSettings.IsJavaScriptEnabled](webviewcontrolsettings_isjavascriptenabled.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.settings
     * @type {WebViewControlSettings} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * Gets a collection of permission requests that are waiting to be granted or denied.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.deferredpermissionrequests
     * @type {IVectorView<WebViewControlDeferredPermissionRequest>} 
     */
    DeferredPermissionRequests {
        get => this.get_DeferredPermissionRequests()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} source 
     * @returns {HRESULT} 
     */
    put_Source(source) {
        result := ComCall(7, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DocumentTitle() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoBack() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoForward() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_DefaultBackgroundColor(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DefaultBackgroundColor() {
        value := Color()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ContainsFullScreenElement() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WebViewControlSettings} 
     */
    get_Settings() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebViewControlSettings(value)
    }

    /**
     * 
     * @returns {IVectorView<WebViewControlDeferredPermissionRequest>} 
     */
    get_DeferredPermissionRequests() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WebViewControlDeferredPermissionRequest, value)
    }

    /**
     * Navigates the IWebViewControl to the next page in the navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.goforward
     */
    GoForward() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Navigates the IWebViewControl to the previous page in the navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.goback
     */
    GoBack() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reloads the current content in the IWebViewControl.
     * @remarks
     * If the current content was loaded via an HTTP URI, this method reloads the file without forced cache validation by sending a "Pragma:no-cache" header to the server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.refresh
     */
    Refresh() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Halts the current IWebViewControl navigation or download.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.stop
     */
    Stop() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads the HTML content at the specified Uniform Resource Identifier (URI).
     * @param {Uri} source The Uniform Resource Identifier (URI) to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.navigate
     */
    Navigate(source) {
        result := ComCall(20, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads the specified HTML content as a new document.
     * @remarks
     * **NavigateToString** is asynchronous. Use the [NavigationCompleted](iwebviewcontrol_navigationcompleted.md) event to detect when navigation has completed.
     * 
     * **NavigateToString** supports content with references to external files such as CSS, scripts, images, and fonts. However, it does not provide a way to generate or provide these resources programmatically. [NavigateToLocalStreamUri](iwebviewcontrol_navigatetolocalstreamuri_1538250901.md) provide this support instead.
     * @param {HSTRING} text The HTML content to display in the IWebViewControl.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.navigatetostring
     */
    NavigateToString(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(21, this, "ptr", text, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads local web content at the specified URI using an [IUriToStreamResolver](../windows.web/iuritostreamresolver.md).
     * @remarks
     * Use this method to load local content that the [NavigateToString](iwebviewcontrol_navigatetostring_1924125949.md) method won't handle. [NavigateToString](iwebviewcontrol_navigatetostring_1924125949.md) provides an easy way to navigate to static HTML content, including content with references to resources such as CSS, scripts, images, and fonts. However, [NavigateToString](iwebviewcontrol_navigatetostring_1924125949.md) does not provide a way to generate these resources programmatically.
     * 
     * To use the **NavigateToLocalStreamUri** method, you must pass in an [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) implementation that translates a URI pattern into a content stream. You can do this to supply the content for all the resources used by a web page, or series of pages. For example, you can use this method to display content saved on the local file system as encrypted files or in cab packages. When the content is requested, you can use an [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) implementation to decrypt it on the fly.
     * 
     * The [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) interface has one method, [UriToStreamAsync](../windows.web/iuritostreamresolver_uritostreamasync_1256896073.md) which takes the URI and returns the stream. The URI is in the form of “ms-local-stream://appname_KEY/folder/file” where KEY identifies the resolver. Use [BuildLocalStreamUri](iwebviewcontrol_buildlocalstreamuri_803594427.md) to create a URI in the correct format that references the local content to load.
     * 
     * > [!NOTE]
     * > Your [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) implementation must be agile to prevent deadlock that can occur when the UI thread waits for the [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) to finish its work before continuing. For more info, see [Threading and Marshaling](/cpp/cppcx/threading-and-marshaling-c-cx)
     * @param {Uri} source A URI identifying the local HTML content to load.
     * @param {IUriToStreamResolver} streamResolver A resolver that converts the URI into a stream to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.navigatetolocalstreamuri
     */
    NavigateToLocalStreamUri(source, streamResolver) {
        result := ComCall(22, this, "ptr", source, "ptr", streamResolver, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Navigates the IWebViewControl to a URI with a POST request and HTTP headers.
     * @remarks
     * This method supports only [HttpMethod.Post](../windows.web.http/httpmethod_post.md) and [HttpMethod.Get](../windows.web.http/httpmethod_get.md) for the [HttpRequestMessage.Method](../windows.web.http/httprequestmessage_method.md) property value.
     * 
     * > [!WARNING]
     * > If you add additional headers to this request, such as authentication credentials, remember that those headers will also be included with any subsequent child requests. Use caution to prevent accidental disclosure of confidential or personal information.
     * @param {HttpRequestMessage} requestMessage The details of the HTTP request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.navigatewithhttprequestmessage
     */
    NavigateWithHttpRequestMessage(requestMessage) {
        result := ComCall(23, this, "ptr", requestMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Executes the specified script function from the currently loaded HTML, with specific arguments, as an asynchronous action.
     * @remarks
     * o prevent malicious code from exploiting your app, be sure to call this method to invoke only scripts that you trust.
     * 
     * The invoked script can return only string values.
     * 
     * Your app might appear unresponsive while scripts are running. Handle the [LongRunningScriptDetected](iwebviewcontrol_longrunningscriptdetected.md) event to interrupt a long-running script.
     * @param {HSTRING} scriptName The name of the script function to invoke.
     * @param {IIterable<HSTRING>} arguments A string array that packages arguments to the script function.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.invokescriptasync
     */
    InvokeScriptAsync(scriptName, arguments) {
        if(scriptName is String) {
            pin := HSTRING.Create(scriptName)
            scriptName := pin.Value
        }
        scriptName := scriptName is Win32Handle ? NumGet(scriptName, "ptr") : scriptName

        result := ComCall(24, this, "ptr", scriptName, "ptr", arguments, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * Creates an image of the current IWebViewControl contents and writes it to the specified stream.
     * @param {IRandomAccessStream} stream The stream to write the image to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.capturepreviewtostreamasync
     */
    CapturePreviewToStreamAsync(stream) {
        result := ComCall(25, this, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Asynchronously gets a [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) that contains the selected content within the IWebViewControl.
     * @returns {IAsyncOperation<DataPackage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.captureselectedcontenttodatapackageasync
     */
    CaptureSelectedContentToDataPackageAsync() {
        result := ComCall(26, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DataPackage, operation)
    }

    /**
     * Creates a URI that you can pass to [NavigateToLocalStreamUri](iwebviewcontrol_navigatetolocalstreamuri_1538250901.md)
     * @param {HSTRING} contentIdentifier A unique identifier for the content the URI is referencing. This defines the root of the URI.
     * @param {HSTRING} relativePath The path to the resource, relative to the root.
     * @returns {Uri} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.buildlocalstreamuri
     */
    BuildLocalStreamUri(contentIdentifier, relativePath) {
        if(contentIdentifier is String) {
            pin := HSTRING.Create(contentIdentifier)
            contentIdentifier := pin.Value
        }
        contentIdentifier := contentIdentifier is Win32Handle ? NumGet(contentIdentifier, "ptr") : contentIdentifier
        if(relativePath is String) {
            pin := HSTRING.Create(relativePath)
            relativePath := pin.Value
        }
        relativePath := relativePath is Win32Handle ? NumGet(relativePath, "ptr") : relativePath

        result := ComCall(27, this, "ptr", contentIdentifier, "ptr", relativePath, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(result_)
    }

    /**
     * Returns the deferred permission request with the specified Id.
     * @remarks
     * When a [WebViewPermissionRequest](webviewcontrolpermissionrequest.md) is deferred, a **WebViewDeferredPermissionRequest** is created with the same Id and added to the [DeferredPermissionRequests](iwebviewcontrol_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the DeferredPermissionRequestById method and pass the Id of the deferred request. After you retrieve the request, you can call the Allow method to grant the request, or call the Deny method to deny the request.
     * @param {Integer} id The Id of the deferred permission request.
     * @param {Pointer<WebViewControlDeferredPermissionRequest>} result_ The deferred permission request with the specified Id.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.getdeferredpermissionrequestbyid
     */
    GetDeferredPermissionRequestById(id, result_) {
        result := ComCall(28, this, "uint", id, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNavigationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlContentLoadingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentLoading(handler) {
        token := EventRegistrationToken()
        result := ComCall(31, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContentLoading(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(32, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlDOMContentLoadedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DOMContentLoaded(handler) {
        token := EventRegistrationToken()
        result := ComCall(33, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DOMContentLoaded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(34, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(35, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(36, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNavigationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameNavigationStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameNavigationStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlContentLoadingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameContentLoading(handler) {
        token := EventRegistrationToken()
        result := ComCall(39, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameContentLoading(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(40, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlDOMContentLoadedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameDOMContentLoaded(handler) {
        token := EventRegistrationToken()
        result := ComCall(41, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameDOMContentLoaded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(42, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameNavigationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(43, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameNavigationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(44, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlScriptNotifyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScriptNotify(handler) {
        token := EventRegistrationToken()
        result := ComCall(45, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ScriptNotify(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(46, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlLongRunningScriptDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LongRunningScriptDetected(handler) {
        token := EventRegistrationToken()
        result := ComCall(47, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LongRunningScriptDetected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(48, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnsafeContentWarningDisplaying(handler) {
        token := EventRegistrationToken()
        result := ComCall(49, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnsafeContentWarningDisplaying(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(50, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlUnviewableContentIdentifiedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnviewableContentIdentified(handler) {
        token := EventRegistrationToken()
        result := ComCall(51, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnviewableContentIdentified(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(52, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlPermissionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PermissionRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(53, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PermissionRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(54, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlUnsupportedUriSchemeIdentifiedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnsupportedUriSchemeIdentified(handler) {
        token := EventRegistrationToken()
        result := ComCall(55, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnsupportedUriSchemeIdentified(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(56, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNewWindowRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NewWindowRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(57, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NewWindowRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(58, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContainsFullScreenElementChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(59, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContainsFullScreenElementChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(60, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlWebResourceRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WebResourceRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(61, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_WebResourceRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(62, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
