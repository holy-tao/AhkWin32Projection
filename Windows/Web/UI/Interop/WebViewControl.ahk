#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\IWebViewControl.ahk
#Include .\IWebViewControlSite.ahk
#Include ..\IWebViewControl2.ahk
#Include .\IWebViewControlSite2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include ..\WebViewControlNavigationStartingEventArgs.ahk
#Include ..\WebViewControlContentLoadingEventArgs.ahk
#Include ..\WebViewControlDOMContentLoadedEventArgs.ahk
#Include ..\WebViewControlNavigationCompletedEventArgs.ahk
#Include ..\WebViewControlScriptNotifyEventArgs.ahk
#Include ..\WebViewControlLongRunningScriptDetectedEventArgs.ahk
#Include ..\WebViewControlUnviewableContentIdentifiedEventArgs.ahk
#Include ..\WebViewControlPermissionRequestedEventArgs.ahk
#Include ..\WebViewControlUnsupportedUriSchemeIdentifiedEventArgs.ahk
#Include ..\WebViewControlNewWindowRequestedEventArgs.ahk
#Include ..\WebViewControlWebResourceRequestedEventArgs.ahk
#Include .\WebViewControl.ahk
#Include .\WebViewControlMoveFocusRequestedEventArgs.ahk
#Include .\WebViewControlAcceleratorKeyPressedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class is an implementation of an [IWebViewControl](../windows.web.ui/iwebviewcontrol.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class WebViewControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the URI source of the HTML content to display in the control.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.source
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets the title of the page currently displayed in the control.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.documenttitle
     * @type {HSTRING} 
     */
    DocumentTitle {
        get => this.get_DocumentTitle()
    }

    /**
     * Gets a value that indicates whether there is at least one page in the backward navigation history.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.cangoback
     * @type {Boolean} 
     */
    CanGoBack {
        get => this.get_CanGoBack()
    }

    /**
     * Gets a value that indicates whether there is at least one page in the forward navigation history.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.cangoforward
     * @type {Boolean} 
     */
    CanGoForward {
        get => this.get_CanGoForward()
    }

    /**
     * Gets or sets the color to use as the control background when the HTML content does not specify a color.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.defaultbackgroundcolor
     * @type {Color} 
     */
    DefaultBackgroundColor {
        get => this.get_DefaultBackgroundColor()
        set => this.put_DefaultBackgroundColor(value)
    }

    /**
     * Gets a value that indicates whether the control contains an element that supports full screen.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.containsfullscreenelement
     * @type {Boolean} 
     */
    ContainsFullScreenElement {
        get => this.get_ContainsFullScreenElement()
    }

    /**
     * Gets a [WebViewControlSettings](../windows.web.ui/webviewcontrolsettings.md) object that contains properties to enable or disable IWebViewControl features.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.settings
     * @type {WebViewControlSettings} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * Gets a collection of permission requests that are waiting to be granted or denied.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.deferredpermissionrequests
     * @type {IVectorView<WebViewControlDeferredPermissionRequest>} 
     */
    DeferredPermissionRequests {
        get => this.get_DeferredPermissionRequests()
    }

    /**
     * Gets the process that the control is hosted in.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.process
     * @type {WebViewControlProcess} 
     */
    Process {
        get => this.get_Process()
    }

    /**
     * Gets or sets the scale of the window.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.scale
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * Gets or sets the bounds of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
        set => this.put_Bounds(value)
    }

    /**
     * Gets or sets a value that indicates if this control is invisible.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
        set => this.put_IsVisible(value)
    }

    /**
     * An event that is triggered before the control navigates to new content.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when the control has started loading new content.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when the control has finished parsing the current HTML content.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when the control has finished loading the current content or if the navigation has failed.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered before a frame in the control navigates to new content.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when a frame in the control has finished parsing its current HTML content.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when a frame in the control has finished parsing its current HTML content.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when a frame in the control has finished loading its content.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when the content contained in the control passes a string to the app using `window.external.notify`.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when the control shows a warning page for content that was reported as unsafe by SmartScreen Filter.
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when an action in the control requires that permission to be granted.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when an attempt is made to navigate to a URI using a scheme that the control doesn't support.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when a user performs an action in the control that causes content to be opened in a new window.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * An event that is triggered when the status of whether the control currently contains a full screen element or not changes.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
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

    /**
     * An event that is triggered when a focus move is requested.
     * @type {TypedEventHandler<WebViewControl, WebViewControlMoveFocusRequestedEventArgs>}
    */
    OnMoveFocusRequested {
        get {
            if(!this.HasProp("__OnMoveFocusRequested")){
                this.__OnMoveFocusRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{234d40c0-2c51-5128-b919-003f1c0a8a26}"),
                    WebViewControl,
                    WebViewControlMoveFocusRequestedEventArgs
                )
                this.__OnMoveFocusRequestedToken := this.add_MoveFocusRequested(this.__OnMoveFocusRequested.iface)
            }
            return this.__OnMoveFocusRequested
        }
    }

    /**
     * An event that is triggered when the accelerator key is pressed.
     * @type {TypedEventHandler<WebViewControl, WebViewControlAcceleratorKeyPressedEventArgs>}
    */
    OnAcceleratorKeyPressed {
        get {
            if(!this.HasProp("__OnAcceleratorKeyPressed")){
                this.__OnAcceleratorKeyPressed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b24e7b5b-b804-5346-97b5-02e6d9b6cba8}"),
                    WebViewControl,
                    WebViewControlAcceleratorKeyPressedEventArgs
                )
                this.__OnAcceleratorKeyPressedToken := this.add_AcceleratorKeyPressed(this.__OnAcceleratorKeyPressed.iface)
            }
            return this.__OnAcceleratorKeyPressed
        }
    }

    /**
     * Informs your app when the [WebViewControl](/uwp/api/windows.web.ui.interop.webviewcontrol) receives focus (due to the user clicking inside/outside the WebViewControl). Use in combination with the [LostFocus]() event and programmatic focus changes using the [WebViewControl.MoveFocus](/uwp/api/windows.web.ui.interop.webviewcontrol.movefocus) method.
     * @type {TypedEventHandler<WebViewControl, IInspectable>}
    */
    OnGotFocus {
        get {
            if(!this.HasProp("__OnGotFocus")){
                this.__OnGotFocus := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{34a6446f-5467-5063-bdc0-7fb0657510d1}"),
                    WebViewControl,
                    IInspectable
                )
                this.__OnGotFocusToken := this.add_GotFocus(this.__OnGotFocus.iface)
            }
            return this.__OnGotFocus
        }
    }

    /**
     * Informs your app when the [WebViewControl](/uwp/api/windows.web.ui.interop.webviewcontrol) loses focus. May be initiated by the user clicking inside/outside the WebViewControl or by a programmatic focus change, such as the app calling [SetFocus](/windows/desktop/api/winuser/nf-winuser-setfocus) on a window that is not the WebViewControl or a [MoveFocus](/uwp/api/windows.web.ui.interop.webviewcontrol.movefocus) method call.
     * @type {TypedEventHandler<WebViewControl, IInspectable>}
    */
    OnLostFocus {
        get {
            if(!this.HasProp("__OnLostFocus")){
                this.__OnLostFocus := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{34a6446f-5467-5063-bdc0-7fb0657510d1}"),
                    WebViewControl,
                    IInspectable
                )
                this.__OnLostFocusToken := this.add_LostFocus(this.__OnLostFocus.iface)
            }
            return this.__OnLostFocus
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
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

        if(this.HasProp("__OnMoveFocusRequestedToken")) {
            this.remove_MoveFocusRequested(this.__OnMoveFocusRequestedToken)
            this.__OnMoveFocusRequested.iface.Dispose()
        }

        if(this.HasProp("__OnAcceleratorKeyPressedToken")) {
            this.remove_AcceleratorKeyPressed(this.__OnAcceleratorKeyPressedToken)
            this.__OnAcceleratorKeyPressed.iface.Dispose()
        }

        if(this.HasProp("__OnGotFocusToken")) {
            this.remove_GotFocus(this.__OnGotFocusToken)
            this.__OnGotFocus.iface.Dispose()
        }

        if(this.HasProp("__OnLostFocusToken")) {
            this.remove_LostFocus(this.__OnLostFocusToken)
            this.__OnLostFocus.iface.Dispose()
        }

        super.__Delete()
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
     * Navigates the IWebViewControl to the next page in the navigation history.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.goforward
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
     * Navigates the IWebViewControl to the previous page in the navigation history.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.goback
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.refresh
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.stop
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @param {Uri} source The Uniform Resource Identifier (URI) to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.navigate
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @param {HSTRING} text The HTML content to display in the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.navigatetostring
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @param {Uri} source A URI identifying the local HTML content to load.
     * @param {IUriToStreamResolver} streamResolver A resolver that converts the URI into a stream to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.navigatetolocalstreamuri
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @param {HttpRequestMessage} requestMessage The request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.navigatewithhttprequestmessage
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @param {HSTRING} scriptName The name of the script function to invoke.
     * @param {IIterable<HSTRING>} arguments A string array that packages arguments to the script function.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.invokescriptasync
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
     * Creates an image of the current control contents and writes it to the specified stream.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @param {IRandomAccessStream} stream The stream to write the image to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.capturepreviewtostreamasync
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
     * > [!IMPORTANT]
     * > This method has been deprecated, and has a known issue. Avoid using this method in your production code.
     * 
     * Asynchronously gets a [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) that contains the selected content within the control.
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @returns {IAsyncOperation<DataPackage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.captureselectedcontenttodatapackageasync
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @param {HSTRING} contentIdentifier A unique identifier for the content the URI is referencing. This defines the root of the URI.
     * @param {HSTRING} relativePath The path to the resource, relative to the root.
     * @returns {Uri} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.buildlocalstreamuri
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
     * 
     * For more info, see [Windows.Web.UI.IWebViewControl](../windows.web.ui/iwebviewcontrol.md)
     * @param {Integer} id The Id of the deferred permission request.
     * @param {Pointer<WebViewControlDeferredPermissionRequest>} result_ The deferred permission request with the specified Id.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.getdeferredpermissionrequestbyid
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
     * 
     * @returns {WebViewControlProcess} 
     */
    get_Process() {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.get_Process()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.put_Scale(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Scale() {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.get_Scale()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_Bounds(value) {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.put_Bounds(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.get_Bounds()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVisible(value) {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.put_IsVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.get_IsVisible()
    }

    /**
     * Closes the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.close
     */
    Close() {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.Close()
    }

    /**
     * Move the focus.
     * @param {Integer} reason The reason.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.movefocus
     */
    MoveFocus(reason) {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.MoveFocus(reason)
    }

    /**
     * 
     * @param {TypedEventHandler<WebViewControl, WebViewControlMoveFocusRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MoveFocusRequested(handler) {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.add_MoveFocusRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MoveFocusRequested(token) {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.remove_MoveFocusRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebViewControl, WebViewControlAcceleratorKeyPressedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AcceleratorKeyPressed(handler) {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.add_AcceleratorKeyPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AcceleratorKeyPressed(token) {
        if (!this.HasProp("__IWebViewControlSite")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite := IWebViewControlSite(outPtr)
        }

        return this.__IWebViewControlSite.remove_AcceleratorKeyPressed(token)
    }

    /**
     * Injects a script into a [WebViewControl](/uwp/api/windows.web.ui.interop.webviewcontrol) just after [ContentLoading](/uwp/api/windows.ui.xaml.controls.webview.contentloading) but before any other script is run on the page.
     * @param {HSTRING} script 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrol.addinitializescript
     */
    AddInitializeScript(script) {
        if (!this.HasProp("__IWebViewControl2")) {
            if ((queryResult := this.QueryInterface(IWebViewControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControl2 := IWebViewControl2(outPtr)
        }

        return this.__IWebViewControl2.AddInitializeScript(script)
    }

    /**
     * 
     * @param {TypedEventHandler<WebViewControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        if (!this.HasProp("__IWebViewControlSite2")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite2 := IWebViewControlSite2(outPtr)
        }

        return this.__IWebViewControlSite2.add_GotFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GotFocus(token) {
        if (!this.HasProp("__IWebViewControlSite2")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite2 := IWebViewControlSite2(outPtr)
        }

        return this.__IWebViewControlSite2.remove_GotFocus(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebViewControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LostFocus(handler) {
        if (!this.HasProp("__IWebViewControlSite2")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite2 := IWebViewControlSite2(outPtr)
        }

        return this.__IWebViewControlSite2.add_LostFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LostFocus(token) {
        if (!this.HasProp("__IWebViewControlSite2")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSite2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSite2 := IWebViewControlSite2(outPtr)
        }

        return this.__IWebViewControlSite2.remove_LostFocus(token)
    }

;@endregion Instance Methods
}
