#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebUIView.ahk
#Include ..\..\Web\UI\IWebViewControl.ahk
#Include ..\..\Web\UI\IWebViewControl2.ahk
#Include .\IWebUIViewStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WebUIView.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlNavigationStartingEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlContentLoadingEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlDOMContentLoadedEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlNavigationCompletedEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlScriptNotifyEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlLongRunningScriptDetectedEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlUnviewableContentIdentifiedEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlPermissionRequestedEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlUnsupportedUriSchemeIdentifiedEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlNewWindowRequestedEventArgs.ahk
#Include ..\..\Web\UI\WebViewControlWebResourceRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a view (window) of the app to the application background script.
 * @remarks
 * Windows 10 web apps support an optional per-application background script that starts before any views are activated and runs for the duration of the process. With this, you can monitor and modify navigations, track state across navigations, monitor navigation errors, and run code before views are activated.
 * 
 * When this background script is specified as the [StartPage](/uwp/schemas/appxpackage/appxmanifestschema2010-v2/element-application) in your [app manifest](/uwp/schemas/appxpackage/appx-package-manifest), each of the app's views (windows) are exposed to the script as instances of the `WebUIView` class, providing the same events, properties, and methods as a general (Win32) [WebView](/uwp/api/windows.ui.xaml.controls.webview).
 * 
 * There are several differences between the HTML [webview](/microsoft-edge/hosting/webview) (x-ms-webview/MSHTMLWebViewElement) and the `WebUIView` class:
 * 
 * &nbsp; | HTML webview | WebUIView class 
 * :--| :-- | :--
 * WebUIView async methods| Return [MSWebViewAsyncOperation](/microsoft-edge/hosting/webview/mswebviewasyncoperation) objects | Return JavaScript [promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) objects
 * `Navigate` method | [Requires](/microsoft-edge/hosting/webview#navigate) a *URI* in the form of a string | [Requires](./webuiview_navigate_1098085581.md) a [Windows.Foundation.Uri](../windows.foundation/uri.md) object
 * `InvokeScriptAsync` method | [Script arguments](/microsoft-edge/hosting/webview#invokescriptasync) are specified as an arbitrary number of string parameters | [Script arguments](./webuiview_invokescriptasync_1912773610.md) are specified as an array of strings
 * 
 * Any app activation with the background script as the StartPage will rely on the script itself for navigation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebUIView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebUIView.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new view with specific arguments, as an asynchronous action.
     * @returns {IAsyncOperation<WebUIView>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.createasync
     */
    static CreateAsync() {
        if (!WebUIView.HasProp("__IWebUIViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIViewStatics.IID)
            WebUIView.__IWebUIViewStatics := IWebUIViewStatics(factoryPtr)
        }

        return WebUIView.__IWebUIViewStatics.CreateAsync()
    }

    /**
     * Creates a new view as an asynchronous action.
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<WebUIView>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.createasync
     */
    static CreateWithUriAsync(uri_) {
        if (!WebUIView.HasProp("__IWebUIViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WebUI.WebUIView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebUIViewStatics.IID)
            WebUIView.__IWebUIViewStatics := IWebUIViewStatics(factoryPtr)
        }

        return WebUIView.__IWebUIViewStatics.CreateWithUriAsync(uri_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier for this view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.applicationviewid
     * @type {Integer} 
     */
    ApplicationViewId {
        get => this.get_ApplicationViewId()
    }

    /**
     * Gets or sets a value that specifies whether to ignore content URI rules and navigation restrictions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.ignoreapplicationcontenturirulesnavigationrestrictions
     * @type {Boolean} 
     */
    IgnoreApplicationContentUriRulesNavigationRestrictions {
        get => this.get_IgnoreApplicationContentUriRulesNavigationRestrictions()
        set => this.put_IgnoreApplicationContentUriRulesNavigationRestrictions(value)
    }

    /**
     * Gets or sets the URI source of the HTML content to display in the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.source
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets the title of the page currently displayed in the view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.documenttitle
     * @type {HSTRING} 
     */
    DocumentTitle {
        get => this.get_DocumentTitle()
    }

    /**
     * Gets a value that indicates whether there is at least one page in the backward navigation history.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.cangoback
     * @type {Boolean} 
     */
    CanGoBack {
        get => this.get_CanGoBack()
    }

    /**
     * Gets a value that indicates whether there is at least one page in the forward navigation history.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.cangoforward
     * @type {Boolean} 
     */
    CanGoForward {
        get => this.get_CanGoForward()
    }

    /**
     * Gets or sets the color to use as the view background when the HTML content does not specify a color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.defaultbackgroundcolor
     * @type {Color} 
     */
    DefaultBackgroundColor {
        get => this.get_DefaultBackgroundColor()
        set => this.put_DefaultBackgroundColor(value)
    }

    /**
     * Gets a value that indicates whether the view contains an element that supports full screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.containsfullscreenelement
     * @type {Boolean} 
     */
    ContainsFullScreenElement {
        get => this.get_ContainsFullScreenElement()
    }

    /**
     * Gets a [WebViewControlSettings](../windows.web.ui/webviewcontrolsettings.md) object that contains properties to enable or disable IWebViewControl features.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.settings
     * @type {WebViewControlSettings} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * Gets a collection of permission requests that are waiting to be granted or denied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.deferredpermissionrequests
     * @type {IVectorView<WebViewControlDeferredPermissionRequest>} 
     */
    DeferredPermissionRequests {
        get => this.get_DeferredPermissionRequests()
    }

    /**
     * Occurs when the view has been closed.
     * @type {TypedEventHandler<WebUIView, IInspectable>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{46fce4c3-528a-5192-a389-0d521b17cc24}"),
                    WebUIView,
                    IInspectable
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs when the view is activated.
     * @type {TypedEventHandler<WebUIView, IActivatedEventArgs>}
    */
    OnActivated {
        get {
            if(!this.HasProp("__OnActivated")){
                this.__OnActivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8a4231a8-c4cb-5130-ba5b-b4963b42b60d}"),
                    WebUIView,
                    IActivatedEventArgs
                )
                this.__OnActivatedToken := this.add_Activated(this.__OnActivated.iface)
            }
            return this.__OnActivated
        }
    }

    /**
     * Occurs before the control navigates to new content.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlNavigationStartingEventArgs>}
    */
    OnNavigationStarting {
        get {
            if(!this.HasProp("__OnNavigationStarting")){
                this.__OnNavigationStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e92e0bcc-9ae9-5b9b-a684-83dd8ee57775}"),
                    IWebViewControl,
                    WebViewControlNavigationStartingEventArgs
                )
                this.__OnNavigationStartingToken := this.add_NavigationStarting(this.__OnNavigationStarting.iface)
            }
            return this.__OnNavigationStarting
        }
    }

    /**
     * Occurs when the view starts loading new content.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlContentLoadingEventArgs>}
    */
    OnContentLoading {
        get {
            if(!this.HasProp("__OnContentLoading")){
                this.__OnContentLoading := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{357154fe-ec1a-5fca-b860-62f03dece49d}"),
                    IWebViewControl,
                    WebViewControlContentLoadingEventArgs
                )
                this.__OnContentLoadingToken := this.add_ContentLoading(this.__OnContentLoading.iface)
            }
            return this.__OnContentLoading
        }
    }

    /**
     * An event that is triggered when the view has finished parsing the current HTML content.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlDOMContentLoadedEventArgs>}
    */
    OnDOMContentLoaded {
        get {
            if(!this.HasProp("__OnDOMContentLoaded")){
                this.__OnDOMContentLoaded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d7dc333e-b521-5b76-a7ff-48b454f597e5}"),
                    IWebViewControl,
                    WebViewControlDOMContentLoadedEventArgs
                )
                this.__OnDOMContentLoadedToken := this.add_DOMContentLoaded(this.__OnDOMContentLoaded.iface)
            }
            return this.__OnDOMContentLoaded
        }
    }

    /**
     * Occurs when the control has finished loading the current content or if the navigation has failed.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlNavigationCompletedEventArgs>}
    */
    OnNavigationCompleted {
        get {
            if(!this.HasProp("__OnNavigationCompleted")){
                this.__OnNavigationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{57a87c53-47a5-5864-9881-fd4c00f230a9}"),
                    IWebViewControl,
                    WebViewControlNavigationCompletedEventArgs
                )
                this.__OnNavigationCompletedToken := this.add_NavigationCompleted(this.__OnNavigationCompleted.iface)
            }
            return this.__OnNavigationCompleted
        }
    }

    /**
     * Occurs just before the view navigates to new content.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlNavigationStartingEventArgs>}
    */
    OnFrameNavigationStarting {
        get {
            if(!this.HasProp("__OnFrameNavigationStarting")){
                this.__OnFrameNavigationStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e92e0bcc-9ae9-5b9b-a684-83dd8ee57775}"),
                    IWebViewControl,
                    WebViewControlNavigationStartingEventArgs
                )
                this.__OnFrameNavigationStartingToken := this.add_FrameNavigationStarting(this.__OnFrameNavigationStarting.iface)
            }
            return this.__OnFrameNavigationStarting
        }
    }

    /**
     * Occurs when a frame in the view begins loading new content.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlContentLoadingEventArgs>}
    */
    OnFrameContentLoading {
        get {
            if(!this.HasProp("__OnFrameContentLoading")){
                this.__OnFrameContentLoading := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{357154fe-ec1a-5fca-b860-62f03dece49d}"),
                    IWebViewControl,
                    WebViewControlContentLoadingEventArgs
                )
                this.__OnFrameContentLoadingToken := this.add_FrameContentLoading(this.__OnFrameContentLoading.iface)
            }
            return this.__OnFrameContentLoading
        }
    }

    /**
     * Occurs when a frame in the view has finished parsing its current HTML content.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlDOMContentLoadedEventArgs>}
    */
    OnFrameDOMContentLoaded {
        get {
            if(!this.HasProp("__OnFrameDOMContentLoaded")){
                this.__OnFrameDOMContentLoaded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d7dc333e-b521-5b76-a7ff-48b454f597e5}"),
                    IWebViewControl,
                    WebViewControlDOMContentLoadedEventArgs
                )
                this.__OnFrameDOMContentLoadedToken := this.add_FrameDOMContentLoaded(this.__OnFrameDOMContentLoaded.iface)
            }
            return this.__OnFrameDOMContentLoaded
        }
    }

    /**
     * Occurs when the control has finished loading the current content or if the navigation has failed.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlNavigationCompletedEventArgs>}
    */
    OnFrameNavigationCompleted {
        get {
            if(!this.HasProp("__OnFrameNavigationCompleted")){
                this.__OnFrameNavigationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{57a87c53-47a5-5864-9881-fd4c00f230a9}"),
                    IWebViewControl,
                    WebViewControlNavigationCompletedEventArgs
                )
                this.__OnFrameNavigationCompletedToken := this.add_FrameNavigationCompleted(this.__OnFrameNavigationCompleted.iface)
            }
            return this.__OnFrameNavigationCompleted
        }
    }

    /**
     * Occurs when the content contained in the control passes a string to the app using JavaScript.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlScriptNotifyEventArgs>}
    */
    OnScriptNotify {
        get {
            if(!this.HasProp("__OnScriptNotify")){
                this.__OnScriptNotify := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ee8b81d3-bbc2-55b0-877b-6ba86e3ad899}"),
                    IWebViewControl,
                    WebViewControlScriptNotifyEventArgs
                )
                this.__OnScriptNotifyToken := this.add_ScriptNotify(this.__OnScriptNotify.iface)
            }
            return this.__OnScriptNotify
        }
    }

    /**
     * An event that is triggered periodically while the control executes JavaScript, letting you halt the script.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlLongRunningScriptDetectedEventArgs>}
    */
    OnLongRunningScriptDetected {
        get {
            if(!this.HasProp("__OnLongRunningScriptDetected")){
                this.__OnLongRunningScriptDetected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bd29249e-4112-533d-96a2-0a1c01519caf}"),
                    IWebViewControl,
                    WebViewControlLongRunningScriptDetectedEventArgs
                )
                this.__OnLongRunningScriptDetectedToken := this.add_LongRunningScriptDetected(this.__OnLongRunningScriptDetected.iface)
            }
            return this.__OnLongRunningScriptDetected
        }
    }

    /**
     * Occurs when the control shows a warning page for content that was reported as unsafe by SmartScreen Filter.
     * @type {TypedEventHandler<IWebViewControl, IInspectable>}
    */
    OnUnsafeContentWarningDisplaying {
        get {
            if(!this.HasProp("__OnUnsafeContentWarningDisplaying")){
                this.__OnUnsafeContentWarningDisplaying := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b5089479-abd8-5985-8a93-4c208a85e3a4}"),
                    IWebViewControl,
                    IInspectable
                )
                this.__OnUnsafeContentWarningDisplayingToken := this.add_UnsafeContentWarningDisplaying(this.__OnUnsafeContentWarningDisplaying.iface)
            }
            return this.__OnUnsafeContentWarningDisplaying
        }
    }

    /**
     * An event that is triggered when the control attempts to download an unsupported file.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlUnviewableContentIdentifiedEventArgs>}
    */
    OnUnviewableContentIdentified {
        get {
            if(!this.HasProp("__OnUnviewableContentIdentified")){
                this.__OnUnviewableContentIdentified := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{571626e3-9780-5b37-be8a-ab8e4e7898cf}"),
                    IWebViewControl,
                    WebViewControlUnviewableContentIdentifiedEventArgs
                )
                this.__OnUnviewableContentIdentifiedToken := this.add_UnviewableContentIdentified(this.__OnUnviewableContentIdentified.iface)
            }
            return this.__OnUnviewableContentIdentified
        }
    }

    /**
     * Occurs when an action in the control requires that permission to be granted.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlPermissionRequestedEventArgs>}
    */
    OnPermissionRequested {
        get {
            if(!this.HasProp("__OnPermissionRequested")){
                this.__OnPermissionRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e5cacc26-2a68-5e0a-b82b-b3d756e10a56}"),
                    IWebViewControl,
                    WebViewControlPermissionRequestedEventArgs
                )
                this.__OnPermissionRequestedToken := this.add_PermissionRequested(this.__OnPermissionRequested.iface)
            }
            return this.__OnPermissionRequested
        }
    }

    /**
     * Occurs when an attempt is made to navigate to a URI using a scheme that the control doesn't support.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlUnsupportedUriSchemeIdentifiedEventArgs>}
    */
    OnUnsupportedUriSchemeIdentified {
        get {
            if(!this.HasProp("__OnUnsupportedUriSchemeIdentified")){
                this.__OnUnsupportedUriSchemeIdentified := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8658050c-5e47-5516-b25b-57fae22c4b88}"),
                    IWebViewControl,
                    WebViewControlUnsupportedUriSchemeIdentifiedEventArgs
                )
                this.__OnUnsupportedUriSchemeIdentifiedToken := this.add_UnsupportedUriSchemeIdentified(this.__OnUnsupportedUriSchemeIdentified.iface)
            }
            return this.__OnUnsupportedUriSchemeIdentified
        }
    }

    /**
     * Occurs when a user performs an action in the control that causes content to be opened in a new window.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlNewWindowRequestedEventArgs>}
    */
    OnNewWindowRequested {
        get {
            if(!this.HasProp("__OnNewWindowRequested")){
                this.__OnNewWindowRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{317111df-10c6-559c-85a1-847eb0a1b2d5}"),
                    IWebViewControl,
                    WebViewControlNewWindowRequestedEventArgs
                )
                this.__OnNewWindowRequestedToken := this.add_NewWindowRequested(this.__OnNewWindowRequested.iface)
            }
            return this.__OnNewWindowRequested
        }
    }

    /**
     * Occurs when the status of whether the view currently contains a full screen element or not changes.
     * @type {TypedEventHandler<IWebViewControl, IInspectable>}
    */
    OnContainsFullScreenElementChanged {
        get {
            if(!this.HasProp("__OnContainsFullScreenElementChanged")){
                this.__OnContainsFullScreenElementChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b5089479-abd8-5985-8a93-4c208a85e3a4}"),
                    IWebViewControl,
                    IInspectable
                )
                this.__OnContainsFullScreenElementChangedToken := this.add_ContainsFullScreenElementChanged(this.__OnContainsFullScreenElementChanged.iface)
            }
            return this.__OnContainsFullScreenElementChanged
        }
    }

    /**
     * An event that is fired when an HTTP request is made.
     * @type {TypedEventHandler<IWebViewControl, WebViewControlWebResourceRequestedEventArgs>}
    */
    OnWebResourceRequested {
        get {
            if(!this.HasProp("__OnWebResourceRequested")){
                this.__OnWebResourceRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3a6ed2bc-032b-5ec7-a20a-c1ef49250c3c}"),
                    IWebViewControl,
                    WebViewControlWebResourceRequestedEventArgs
                )
                this.__OnWebResourceRequestedToken := this.add_WebResourceRequested(this.__OnWebResourceRequested.iface)
            }
            return this.__OnWebResourceRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnActivatedToken")) {
            this.remove_Activated(this.__OnActivatedToken)
            this.__OnActivated.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationStartingToken")) {
            this.remove_NavigationStarting(this.__OnNavigationStartingToken)
            this.__OnNavigationStarting.iface.Dispose()
        }

        if(this.HasProp("__OnContentLoadingToken")) {
            this.remove_ContentLoading(this.__OnContentLoadingToken)
            this.__OnContentLoading.iface.Dispose()
        }

        if(this.HasProp("__OnDOMContentLoadedToken")) {
            this.remove_DOMContentLoaded(this.__OnDOMContentLoadedToken)
            this.__OnDOMContentLoaded.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationCompletedToken")) {
            this.remove_NavigationCompleted(this.__OnNavigationCompletedToken)
            this.__OnNavigationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnFrameNavigationStartingToken")) {
            this.remove_FrameNavigationStarting(this.__OnFrameNavigationStartingToken)
            this.__OnFrameNavigationStarting.iface.Dispose()
        }

        if(this.HasProp("__OnFrameContentLoadingToken")) {
            this.remove_FrameContentLoading(this.__OnFrameContentLoadingToken)
            this.__OnFrameContentLoading.iface.Dispose()
        }

        if(this.HasProp("__OnFrameDOMContentLoadedToken")) {
            this.remove_FrameDOMContentLoaded(this.__OnFrameDOMContentLoadedToken)
            this.__OnFrameDOMContentLoaded.iface.Dispose()
        }

        if(this.HasProp("__OnFrameNavigationCompletedToken")) {
            this.remove_FrameNavigationCompleted(this.__OnFrameNavigationCompletedToken)
            this.__OnFrameNavigationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnScriptNotifyToken")) {
            this.remove_ScriptNotify(this.__OnScriptNotifyToken)
            this.__OnScriptNotify.iface.Dispose()
        }

        if(this.HasProp("__OnLongRunningScriptDetectedToken")) {
            this.remove_LongRunningScriptDetected(this.__OnLongRunningScriptDetectedToken)
            this.__OnLongRunningScriptDetected.iface.Dispose()
        }

        if(this.HasProp("__OnUnsafeContentWarningDisplayingToken")) {
            this.remove_UnsafeContentWarningDisplaying(this.__OnUnsafeContentWarningDisplayingToken)
            this.__OnUnsafeContentWarningDisplaying.iface.Dispose()
        }

        if(this.HasProp("__OnUnviewableContentIdentifiedToken")) {
            this.remove_UnviewableContentIdentified(this.__OnUnviewableContentIdentifiedToken)
            this.__OnUnviewableContentIdentified.iface.Dispose()
        }

        if(this.HasProp("__OnPermissionRequestedToken")) {
            this.remove_PermissionRequested(this.__OnPermissionRequestedToken)
            this.__OnPermissionRequested.iface.Dispose()
        }

        if(this.HasProp("__OnUnsupportedUriSchemeIdentifiedToken")) {
            this.remove_UnsupportedUriSchemeIdentified(this.__OnUnsupportedUriSchemeIdentifiedToken)
            this.__OnUnsupportedUriSchemeIdentified.iface.Dispose()
        }

        if(this.HasProp("__OnNewWindowRequestedToken")) {
            this.remove_NewWindowRequested(this.__OnNewWindowRequestedToken)
            this.__OnNewWindowRequested.iface.Dispose()
        }

        if(this.HasProp("__OnContainsFullScreenElementChangedToken")) {
            this.remove_ContainsFullScreenElementChanged(this.__OnContainsFullScreenElementChangedToken)
            this.__OnContainsFullScreenElementChanged.iface.Dispose()
        }

        if(this.HasProp("__OnWebResourceRequestedToken")) {
            this.remove_WebResourceRequested(this.__OnWebResourceRequestedToken)
            this.__OnWebResourceRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ApplicationViewId() {
        if (!this.HasProp("__IWebUIView")) {
            if ((queryResult := this.QueryInterface(IWebUIView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIView := IWebUIView(outPtr)
        }

        return this.__IWebUIView.get_ApplicationViewId()
    }

    /**
     * 
     * @param {TypedEventHandler<WebUIView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IWebUIView")) {
            if ((queryResult := this.QueryInterface(IWebUIView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIView := IWebUIView(outPtr)
        }

        return this.__IWebUIView.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IWebUIView")) {
            if ((queryResult := this.QueryInterface(IWebUIView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIView := IWebUIView(outPtr)
        }

        return this.__IWebUIView.remove_Closed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebUIView, IActivatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
        if (!this.HasProp("__IWebUIView")) {
            if ((queryResult := this.QueryInterface(IWebUIView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIView := IWebUIView(outPtr)
        }

        return this.__IWebUIView.add_Activated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Activated(token) {
        if (!this.HasProp("__IWebUIView")) {
            if ((queryResult := this.QueryInterface(IWebUIView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIView := IWebUIView(outPtr)
        }

        return this.__IWebUIView.remove_Activated(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IgnoreApplicationContentUriRulesNavigationRestrictions() {
        if (!this.HasProp("__IWebUIView")) {
            if ((queryResult := this.QueryInterface(IWebUIView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIView := IWebUIView(outPtr)
        }

        return this.__IWebUIView.get_IgnoreApplicationContentUriRulesNavigationRestrictions()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IgnoreApplicationContentUriRulesNavigationRestrictions(value) {
        if (!this.HasProp("__IWebUIView")) {
            if ((queryResult := this.QueryInterface(IWebUIView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIView := IWebUIView(outPtr)
        }

        return this.__IWebUIView.put_IgnoreApplicationContentUriRulesNavigationRestrictions(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Source() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.get_Source()
    }

    /**
     * 
     * @param {Uri} source 
     * @returns {HRESULT} 
     */
    put_Source(source) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.put_Source(source)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DocumentTitle() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.get_DocumentTitle()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoBack() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.get_CanGoBack()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoForward() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.get_CanGoForward()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_DefaultBackgroundColor(value) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.put_DefaultBackgroundColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DefaultBackgroundColor() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.get_DefaultBackgroundColor()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ContainsFullScreenElement() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.get_ContainsFullScreenElement()
    }

    /**
     * 
     * @returns {WebViewControlSettings} 
     */
    get_Settings() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.get_Settings()
    }

    /**
     * 
     * @returns {IVectorView<WebViewControlDeferredPermissionRequest>} 
     */
    get_DeferredPermissionRequests() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.get_DeferredPermissionRequests()
    }

    /**
     * Navigates to the next page in the navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.goforward
     */
    GoForward() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.GoForward()
    }

    /**
     * Navigates to the previous page in the navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.goback
     */
    GoBack() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.GoBack()
    }

    /**
     * Reloads the current content in the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.refresh
     */
    Refresh() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.Refresh()
    }

    /**
     * Halts the current control navigation or download.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.stop
     */
    Stop() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.Stop()
    }

    /**
     * Loads the HTML content at the specified Uniform Resource Identifier (URI).
     * @param {Uri} source The Uniform Resource Identifier (URI) of the page to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.navigate
     */
    Navigate(source) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.Navigate(source)
    }

    /**
     * Loads the specified HTML content as a new document.
     * @param {HSTRING} text The HTML content to display in the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.navigatetostring
     */
    NavigateToString(text) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.NavigateToString(text)
    }

    /**
     * Loads local web content at the specified URI using an [IUriToStreamResolver](../windows.web/iuritostreamresolver.md).
     * @param {Uri} source The local HTML content to load.
     * @param {IUriToStreamResolver} streamResolver A resolver that converts the URI into a stream to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.navigatetolocalstreamuri
     */
    NavigateToLocalStreamUri(source, streamResolver) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.NavigateToLocalStreamUri(source, streamResolver)
    }

    /**
     * Navigates the control to a URI with a POST request and HTTP headers.
     * @param {HttpRequestMessage} requestMessage The request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.navigatewithhttprequestmessage
     */
    NavigateWithHttpRequestMessage(requestMessage) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.NavigateWithHttpRequestMessage(requestMessage)
    }

    /**
     * Executes the specified script function from the currently loaded HTML, with specific arguments, as an asynchronous action.
     * @param {HSTRING} scriptName The name of the script function to invoke.
     * @param {IIterable<HSTRING>} arguments A string array that packages arguments to the script function.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.invokescriptasync
     */
    InvokeScriptAsync(scriptName, arguments) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.InvokeScriptAsync(scriptName, arguments)
    }

    /**
     * Creates an image of the current view contents and writes it to the specified stream.
     * @param {IRandomAccessStream} stream The stream to write the image to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.capturepreviewtostreamasync
     */
    CapturePreviewToStreamAsync(stream) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.CapturePreviewToStreamAsync(stream)
    }

    /**
     * Asynchronously gets a [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) that contains the selected content within the control.
     * @returns {IAsyncOperation<DataPackage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.captureselectedcontenttodatapackageasync
     */
    CaptureSelectedContentToDataPackageAsync() {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.CaptureSelectedContentToDataPackageAsync()
    }

    /**
     * Creates a URI that you can pass to [NavigateToLocalStreamUri](../windows.web.ui/iwebviewcontrol_navigatetolocalstreamuri_1538250901.md)
     * @param {HSTRING} contentIdentifier A unique identifier for the content the URI is referencing. This defines the root of the URI.
     * @param {HSTRING} relativePath The path to the resource, relative to the root.
     * @returns {Uri} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.buildlocalstreamuri
     */
    BuildLocalStreamUri(contentIdentifier, relativePath) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.BuildLocalStreamUri(contentIdentifier, relativePath)
    }

    /**
     * Returns the deferred permission request with the specified Id.
     * @param {Integer} id The Id of the deferred permission request.
     * @param {Pointer<WebViewControlDeferredPermissionRequest>} result_ The deferred permission request with the specified Id.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.getdeferredpermissionrequestbyid
     */
    GetDeferredPermissionRequestById(id, result_) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.GetDeferredPermissionRequestById(id, result_)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNavigationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationStarting(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_NavigationStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationStarting(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_NavigationStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlContentLoadingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentLoading(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_ContentLoading(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContentLoading(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_ContentLoading(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlDOMContentLoadedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DOMContentLoaded(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_DOMContentLoaded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DOMContentLoaded(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_DOMContentLoaded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationCompleted(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_NavigationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationCompleted(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_NavigationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNavigationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameNavigationStarting(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_FrameNavigationStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameNavigationStarting(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_FrameNavigationStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlContentLoadingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameContentLoading(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_FrameContentLoading(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameContentLoading(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_FrameContentLoading(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlDOMContentLoadedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameDOMContentLoaded(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_FrameDOMContentLoaded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameDOMContentLoaded(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_FrameDOMContentLoaded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameNavigationCompleted(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_FrameNavigationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameNavigationCompleted(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_FrameNavigationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlScriptNotifyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScriptNotify(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_ScriptNotify(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ScriptNotify(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_ScriptNotify(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlLongRunningScriptDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LongRunningScriptDetected(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_LongRunningScriptDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LongRunningScriptDetected(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_LongRunningScriptDetected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnsafeContentWarningDisplaying(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_UnsafeContentWarningDisplaying(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnsafeContentWarningDisplaying(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_UnsafeContentWarningDisplaying(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlUnviewableContentIdentifiedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnviewableContentIdentified(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_UnviewableContentIdentified(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnviewableContentIdentified(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_UnviewableContentIdentified(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlPermissionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PermissionRequested(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_PermissionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PermissionRequested(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_PermissionRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlUnsupportedUriSchemeIdentifiedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnsupportedUriSchemeIdentified(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_UnsupportedUriSchemeIdentified(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnsupportedUriSchemeIdentified(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_UnsupportedUriSchemeIdentified(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlNewWindowRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NewWindowRequested(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_NewWindowRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NewWindowRequested(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_NewWindowRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContainsFullScreenElementChanged(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_ContainsFullScreenElementChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContainsFullScreenElementChanged(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_ContainsFullScreenElementChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IWebViewControl, WebViewControlWebResourceRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WebResourceRequested(handler) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.add_WebResourceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_WebResourceRequested(token) {
        if (!this.HasProp("__IWebViewControl")) {
            if ((queryResult := this.QueryInterface(IWebViewControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl := IWebViewControl(outPtr)
        }

        return this.__IWebViewControl.remove_WebResourceRequested(token)
    }

    /**
     * Adds a script to initialize the view.
     * @param {HSTRING} script The script to initialize the view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuiview.addinitializescript
     */
    AddInitializeScript(script) {
        if (!this.HasProp("__IWebViewControl2")) {
            if ((queryResult := this.QueryInterface(IWebViewControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl2 := IWebViewControl2(outPtr)
        }

        return this.__IWebViewControl2.AddInitializeScript(script)
    }

;@endregion Instance Methods
}
