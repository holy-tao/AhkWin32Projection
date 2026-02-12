#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IWebView.ahk
#Include .\IWebView2.ahk
#Include .\IWebView3.ahk
#Include .\IWebView4.ahk
#Include .\IWebView5.ahk
#Include .\IWebView6.ahk
#Include .\IWebView7.ahk
#Include .\IWebViewStatics3.ahk
#Include .\IWebViewStatics.ahk
#Include .\IWebViewStatics5.ahk
#Include .\IWebViewStatics2.ahk
#Include .\IWebViewStatics4.ahk
#Include .\IWebViewFactory4.ahk
#Include ..\Navigation\LoadCompletedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\Navigation\NavigationEventArgs.ahk
#Include .\NotifyEventHandler.ahk
#Include .\NotifyEventArgs.ahk
#Include .\WebViewNavigationFailedEventHandler.ahk
#Include .\WebViewNavigationFailedEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\WebView.ahk
#Include .\WebViewNavigationStartingEventArgs.ahk
#Include .\WebViewContentLoadingEventArgs.ahk
#Include .\WebViewDOMContentLoadedEventArgs.ahk
#Include .\WebViewNavigationCompletedEventArgs.ahk
#Include .\WebViewLongRunningScriptDetectedEventArgs.ahk
#Include .\WebViewUnviewableContentIdentifiedEventArgs.ahk
#Include .\WebViewUnsupportedUriSchemeIdentifiedEventArgs.ahk
#Include .\WebViewNewWindowRequestedEventArgs.ahk
#Include .\WebViewPermissionRequestedEventArgs.ahk
#Include .\WebViewSeparateProcessLostEventArgs.ahk
#Include .\WebViewWebResourceRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a control that hosts HTML content in an app.
 * @remarks
 * Use the WebView control to host web content in your app. Apps for Surface Hub or Xbox must use this WebView.
 * 
 * > [!IMPORTANT]
 * > For desktop apps, we recommend that you use the [WebView2](/windows/winui/api/microsoft.ui.xaml.controls.webview2) control, which is available as part of the Windows UI Library 2 for UWP (WinUI 2). WebView2 uses Microsoft Edge (Chromium) as the rendering engine to display web content in apps. For more info, see [Introduction to Microsoft Edge WebView2](/microsoft-edge/webview2/), [Get started with WebView2 in WinUI 2 (UWP) apps](/microsoft-edge/webview2/get-started/winui2), and [WebView2](/windows/winui/api/microsoft.ui.xaml.controls.webview2) in the WinUI API reference.
 * 
 * > [!IMPORTANT]
 * > **XAML Islands**: This control is not supported in XAML Islands apps. For alternatives, see [XAML Islands - Web view controls](/windows/apps/desktop/modernize/xaml-islands#web-view-controls).
 * 
 * WebView is not a [Control](control.md) subclass and thus does not have a control template. You can set various properties to control some visual aspects of the WebView. The display area is constrained by the [Width](../windows.ui.xaml/frameworkelement_width.md) and [Height](../windows.ui.xaml/frameworkelement_height.md) properties. To translate, scale, skew, and rotate a WebView, use the [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) property. To control the opacity of the WebView, set the [Opacity](../windows.ui.xaml/uielement_opacity.md) property. To specify a color to use as the web page background when the HTML content does not specify a color, set the [DefaultBackgroundColor](webview_defaultbackgroundcolor.md) property.
 * 
 * You can get the title of the HTML document currently displayed in the WebView by using the [DocumentTitle](webview_documenttitle.md) property.
 * 
 * Although WebView is not a [Control](control.md) subclass, it will receive keyboard input focus and participate in the tab sequence. It provides a [Focus](webview_focus_195503898.md) method, and [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) and [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) events, but it has no tab-related properties. Its position in the tab sequence is the same as its position in the XAML document order. The tab sequence includes all elements in the WebView content that can receive input focus.
 * 
 * As indicated in the Events table, WebView doesn't support most of the user input events inherited from [UIElement](../windows.ui.xaml/uielement.md), such as [KeyDown](../windows.ui.xaml/uielement_keydown.md), [KeyUp](../windows.ui.xaml/uielement_keyup.md), and [PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md). A common workaround is to use [InvokeScriptAsync](webview_invokescriptasync_1912773610.md) with the JavaScript  **eval** function to use the HTML event handlers, and to use **window.external.notify** from the HTML event handler to notify the application using [WebView.ScriptNotify](webview_scriptnotify.md).
 * 
 * In apps compiled for Windows 10, WebView uses the Microsoft Edge rendering engine to display HTML content. In apps compiled for Windows 8 or Windows 8.1, WebView uses Internet Explorer 11 in document mode. It does not support any Microsoft ActiveX controls or plugins like Microsoft Silverlight or Portable Document Format (PDF) files.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebView extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebView.IID

    /**
     * Identifies the [ContainsFullScreenElement](webview_containsfullscreenelement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.containsfullscreenelementproperty
     * @type {DependencyProperty} 
     */
    static ContainsFullScreenElementProperty {
        get => WebView.get_ContainsFullScreenElementProperty()
    }

    /**
     * > [!NOTE]
     * > AnyScriptNotifyUri is not supported in apps compiled for Windows 8.1. Instead, update the **ApplicationContentUriRules** section of the app manifest. For more info, see the Remarks section.
     * 
     * Gets a value that you can use to set the [AllowedScriptNotifyUris](webview_allowedscriptnotifyuris.md) property to indicate that any page can fire [ScriptNotify](webview_scriptnotify.md) events to this [WebView](webview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.anyscriptnotifyuri
     * @type {IVector<Uri>} 
     */
    static AnyScriptNotifyUri {
        get => WebView.get_AnyScriptNotifyUri()
    }

    /**
     * Identifies the [Source](webview_source.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.sourceproperty
     * @type {DependencyProperty} 
     */
    static SourceProperty {
        get => WebView.get_SourceProperty()
    }

    /**
     * > [!NOTE]
     * > AllowedScriptNotifyUrisProperty is not supported in apps compiled for Windows 8.1. Instead, update the **ApplicationContentUriRules** section of the app manifest. For more info, see the Remarks section.
     * 
     * Identifies the [AllowedScriptNotifyUris](webview_allowedscriptnotifyuris.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.allowedscriptnotifyurisproperty
     * @type {DependencyProperty} 
     */
    static AllowedScriptNotifyUrisProperty {
        get => WebView.get_AllowedScriptNotifyUrisProperty()
    }

    /**
     * > [!NOTE]
     * > DataTransferPackageProperty may be altered or unavailable for releases after Windows 8.1. Instead, use [CaptureSelectedContentToDataPackageAsync](webview_captureselectedcontenttodatapackageasync_1187796026.md).
     * 
     * Identifies the [DataTransferPackage](webview_datatransferpackage.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.datatransferpackageproperty
     * @type {DependencyProperty} 
     */
    static DataTransferPackageProperty {
        get => WebView.get_DataTransferPackageProperty()
    }

    /**
     * Identifies the [XYFocusLeft](webview_xyfocusleft.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.xyfocusleftproperty
     * @type {DependencyProperty} 
     */
    static XYFocusLeftProperty {
        get => WebView.get_XYFocusLeftProperty()
    }

    /**
     * Identifies the [XYFocusRight](webview_xyfocusright.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.xyfocusrightproperty
     * @type {DependencyProperty} 
     */
    static XYFocusRightProperty {
        get => WebView.get_XYFocusRightProperty()
    }

    /**
     * Identifies the [XYFocusUp](webview_xyfocusup.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.xyfocusupproperty
     * @type {DependencyProperty} 
     */
    static XYFocusUpProperty {
        get => WebView.get_XYFocusUpProperty()
    }

    /**
     * Identifies the [XYFocusDown](webview_xyfocusdown.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.xyfocusdownproperty
     * @type {DependencyProperty} 
     */
    static XYFocusDownProperty {
        get => WebView.get_XYFocusDownProperty()
    }

    /**
     * Identifies the [CanGoBack](frame_cangoback.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.cangobackproperty
     * @type {DependencyProperty} 
     */
    static CanGoBackProperty {
        get => WebView.get_CanGoBackProperty()
    }

    /**
     * Identifies the [CanGoForward](frame_cangoforward.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.cangoforwardproperty
     * @type {DependencyProperty} 
     */
    static CanGoForwardProperty {
        get => WebView.get_CanGoForwardProperty()
    }

    /**
     * Identifies the [DocumentTitle](webview_documenttitle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.documenttitleproperty
     * @type {DependencyProperty} 
     */
    static DocumentTitleProperty {
        get => WebView.get_DocumentTitleProperty()
    }

    /**
     * Identifies the [DefaultBackgroundColor](webview_defaultbackgroundcolor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.defaultbackgroundcolorproperty
     * @type {DependencyProperty} 
     */
    static DefaultBackgroundColorProperty {
        get => WebView.get_DefaultBackgroundColorProperty()
    }

    /**
     * Gets the default threading behavior of [WebView](webview.md) instances in the current app.
     * @remarks
     * The default value for the desktop device family is **SameThread**. The default value for all other device families is **SeparateThread**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.defaultexecutionmode
     * @type {Integer} 
     */
    static DefaultExecutionMode {
        get => WebView.get_DefaultExecutionMode()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContainsFullScreenElementProperty() {
        if (!WebView.HasProp("__IWebViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics3.IID)
            WebView.__IWebViewStatics3 := IWebViewStatics3(factoryPtr)
        }

        return WebView.__IWebViewStatics3.get_ContainsFullScreenElementProperty()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    static get_AnyScriptNotifyUri() {
        if (!WebView.HasProp("__IWebViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics.IID)
            WebView.__IWebViewStatics := IWebViewStatics(factoryPtr)
        }

        return WebView.__IWebViewStatics.get_AnyScriptNotifyUri()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourceProperty() {
        if (!WebView.HasProp("__IWebViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics.IID)
            WebView.__IWebViewStatics := IWebViewStatics(factoryPtr)
        }

        return WebView.__IWebViewStatics.get_SourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AllowedScriptNotifyUrisProperty() {
        if (!WebView.HasProp("__IWebViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics.IID)
            WebView.__IWebViewStatics := IWebViewStatics(factoryPtr)
        }

        return WebView.__IWebViewStatics.get_AllowedScriptNotifyUrisProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DataTransferPackageProperty() {
        if (!WebView.HasProp("__IWebViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics.IID)
            WebView.__IWebViewStatics := IWebViewStatics(factoryPtr)
        }

        return WebView.__IWebViewStatics.get_DataTransferPackageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusLeftProperty() {
        if (!WebView.HasProp("__IWebViewStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics5.IID)
            WebView.__IWebViewStatics5 := IWebViewStatics5(factoryPtr)
        }

        return WebView.__IWebViewStatics5.get_XYFocusLeftProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusRightProperty() {
        if (!WebView.HasProp("__IWebViewStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics5.IID)
            WebView.__IWebViewStatics5 := IWebViewStatics5(factoryPtr)
        }

        return WebView.__IWebViewStatics5.get_XYFocusRightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusUpProperty() {
        if (!WebView.HasProp("__IWebViewStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics5.IID)
            WebView.__IWebViewStatics5 := IWebViewStatics5(factoryPtr)
        }

        return WebView.__IWebViewStatics5.get_XYFocusUpProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusDownProperty() {
        if (!WebView.HasProp("__IWebViewStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics5.IID)
            WebView.__IWebViewStatics5 := IWebViewStatics5(factoryPtr)
        }

        return WebView.__IWebViewStatics5.get_XYFocusDownProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanGoBackProperty() {
        if (!WebView.HasProp("__IWebViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics2.IID)
            WebView.__IWebViewStatics2 := IWebViewStatics2(factoryPtr)
        }

        return WebView.__IWebViewStatics2.get_CanGoBackProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanGoForwardProperty() {
        if (!WebView.HasProp("__IWebViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics2.IID)
            WebView.__IWebViewStatics2 := IWebViewStatics2(factoryPtr)
        }

        return WebView.__IWebViewStatics2.get_CanGoForwardProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DocumentTitleProperty() {
        if (!WebView.HasProp("__IWebViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics2.IID)
            WebView.__IWebViewStatics2 := IWebViewStatics2(factoryPtr)
        }

        return WebView.__IWebViewStatics2.get_DocumentTitleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DefaultBackgroundColorProperty() {
        if (!WebView.HasProp("__IWebViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics2.IID)
            WebView.__IWebViewStatics2 := IWebViewStatics2(factoryPtr)
        }

        return WebView.__IWebViewStatics2.get_DefaultBackgroundColorProperty()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_DefaultExecutionMode() {
        if (!WebView.HasProp("__IWebViewStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics4.IID)
            WebView.__IWebViewStatics4 := IWebViewStatics4(factoryPtr)
        }

        return WebView.__IWebViewStatics4.get_DefaultExecutionMode()
    }

    /**
     * Clears the [WebView](webview.md)'s cache and **IndexedDB** data.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.cleartemporarywebdataasync
     */
    static ClearTemporaryWebDataAsync() {
        if (!WebView.HasProp("__IWebViewStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewStatics4.IID)
            WebView.__IWebViewStatics4 := IWebViewStatics4(factoryPtr)
        }

        return WebView.__IWebViewStatics4.ClearTemporaryWebDataAsync()
    }

    /**
     * Initializes a new instance of the [WebView](webview.md) class with the specified execution mode.
     * @param {Integer} executionMode A value of the enumeration that indicates whether the [WebView](webview.md) hosts content on the UI thread or a non-UI thread.
     * @returns {WebView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.#ctor
     */
    static CreateInstanceWithExecutionMode(executionMode) {
        if (!WebView.HasProp("__IWebViewFactory4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewFactory4.IID)
            WebView.__IWebViewFactory4 := IWebViewFactory4(factoryPtr)
        }

        return WebView.__IWebViewFactory4.CreateInstanceWithExecutionMode(executionMode)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) source of the HTML content to display in the [WebView](webview.md) control.
     * @remarks
     * The Source property retains its old value during navigation until the navigation is complete. During navigation, you can get the new Uniform Resource Identifier (URI) through the event arguments for the navigation events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.source
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * > [!NOTE]
     * > AllowedScriptNotifyUris is not supported in apps compiled for Windows 8.1. Instead, update the **ApplicationContentUriRules** section of the app manifest. For more info, see the Remarks section.
     * 
     * Gets or sets a safe list of URIs that are permitted to fire [ScriptNotify](webview_scriptnotify.md) events to this [WebView](webview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.allowedscriptnotifyuris
     * @type {IVector<Uri>} 
     */
    AllowedScriptNotifyUris {
        get => this.get_AllowedScriptNotifyUris()
        set => this.put_AllowedScriptNotifyUris(value)
    }

    /**
     * > [!NOTE]
     * > DataTransferPackage may be altered or unavailable for releases after Windows 8.1. Instead, use [CaptureSelectedContentToDataPackageAsync](webview_captureselectedcontenttodatapackageasync_1187796026.md).
     * 
     * Gets a clipboard [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) as passed to the [WebView](webview.md).
     * @remarks
     * This property is typically used to support sharing. During a share operation, the source app puts the data being shared in a [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) object and sends that object to the target app for processing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.datatransferpackage
     * @type {DataPackage} 
     */
    DataTransferPackage {
        get => this.get_DataTransferPackage()
    }

    /**
     * Gets a value that indicates whether there is at least one page in the backward navigation history.
     * @remarks
     * To navigate backward, call the [GoBack](webview_goback_1030386674.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.cangoback
     * @type {Boolean} 
     */
    CanGoBack {
        get => this.get_CanGoBack()
    }

    /**
     * Gets a value that indicates whether there is at least one page in the forward navigation history.
     * @remarks
     * To navigate forward, call the [GoForward](webview_goforward_1537152893.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.cangoforward
     * @type {Boolean} 
     */
    CanGoForward {
        get => this.get_CanGoForward()
    }

    /**
     * Gets the title of the page currently displayed in the [WebView](webview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.documenttitle
     * @type {HSTRING} 
     */
    DocumentTitle {
        get => this.get_DocumentTitle()
    }

    /**
     * Gets or sets the color to use as the [WebView](webview.md) background when the HTML content does not specify a color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.defaultbackgroundcolor
     * @type {Color} 
     */
    DefaultBackgroundColor {
        get => this.get_DefaultBackgroundColor()
        set => this.put_DefaultBackgroundColor(value)
    }

    /**
     * Gets a value that indicates whether the [WebView](webview.md) contains an element that supports full screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.containsfullscreenelement
     * @type {Boolean} 
     */
    ContainsFullScreenElement {
        get => this.get_ContainsFullScreenElement()
    }

    /**
     * Gets a value that indicates whether the [WebView](webview.md) hosts content on the UI thread or a non-UI thread.
     * @remarks
     * To create a [WebView](webview.md) with a specific ExecutionMode, use the [WebView(WebViewExecutionMode)](webview_webview_499271973.md) constructor.
     * 
     * When the ExecutionMode is **SameThread**, [WebView](webview.md) content is hosted on the UI thread. When the value is **SeparateThread**, content is hosted on a background thread.
     * 
     * When the [WebView](webview.md) is not on the UI thread, the behaviors listed here are not supported:
     * + Scroll chaining and pointer chaining. (Input events aren't propagated to parent controls that uses **DirectManipulation** like [ScrollViewer](scrollviewer.md) or [FlipView](flipview.md).)
     * + Tab navigation to escape focus on [WebView](webview.md).
     * + Printing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.executionmode
     * @type {Integer} 
     */
    ExecutionMode {
        get => this.get_ExecutionMode()
    }

    /**
     * Gets a collection of permission requests that are waiting to be granted or denied.
     * @remarks
     * When you defer a [WebViewPermissionRequest](webviewpermissionrequest.md), a new [WebViewDeferredPermissionRequest](webviewdeferredpermissionrequest.md) is created with the same [Id](webviewpermissionrequest_id.md) and added to the DeferredPermissionRequests collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](webview_deferredpermissionrequestbyid_219166912.md) method and pass the [Id](webviewdeferredpermissionrequest_id.md) of the deferred request. After you retrieve the request, you can call the [Allow](webviewdeferredpermissionrequest_allow_1592747266.md) method to grant the request, or call the [Deny](webviewdeferredpermissionrequest_deny_445869776.md) method to deny the request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.deferredpermissionrequests
     * @type {IVector<WebViewDeferredPermissionRequest>} 
     */
    DeferredPermissionRequests {
        get => this.get_DeferredPermissionRequests()
    }

    /**
     * Gets a [WebViewSettings](webviewsettings.md) object that contains properties to enable or disable [WebView](webview.md) features.
     * @remarks
     * Use the [WebViewSettings](webviewsettings.md) object to enable or disable the use of JavaScript and **IndexedDB** in the [WebView](webview.md). See [WebViewSettings.IsIndexedDBEnabled](webviewsettings_isindexeddbenabled.md) and [WebViewSettings.IsJavaScriptEnabled](webviewsettings_isjavascriptenabled.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.settings
     * @type {WebViewSettings} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (D-pad) left.
     * @remarks
     * XYFocusLeft is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * For more info about this property, see the [XY focus navigation and interaction](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.xyfocusleft
     * @type {DependencyObject} 
     */
    XYFocusLeft {
        get => this.get_XYFocusLeft()
        set => this.put_XYFocusLeft(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (D-pad) right.
     * @remarks
     * XYFocusRight is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * For more info about this property, see the [XY focus navigation and interaction](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.xyfocusright
     * @type {DependencyObject} 
     */
    XYFocusRight {
        get => this.get_XYFocusRight()
        set => this.put_XYFocusRight(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (D-pad) up.
     * @remarks
     * XYFocusUp is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * For more info about this property, see the [XY focus navigation and interaction](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.xyfocusup
     * @type {DependencyObject} 
     */
    XYFocusUp {
        get => this.get_XYFocusUp()
        set => this.put_XYFocusUp(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (D-pad) down.
     * @remarks
     * XYFocusDown is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * For more info about this property, see the [XY focus navigation and interaction](/windows/uwp/input-and-devices/designing-for-tv) section of the [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv) article.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.xyfocusdown
     * @type {DependencyObject} 
     */
    XYFocusDown {
        get => this.get_XYFocusDown()
        set => this.put_XYFocusDown(value)
    }

    /**
     * > [!NOTE]
     * > LoadCompleted may be altered or unavailable for releases after Windows 8.1. Instead, use [NavigationCompleted](webview_navigationcompleted.md).
     * 
     * Occurs when top-level navigation completes and the content loads into the [WebView](webview.md) control or when an error occurs during loading.
     * @type {LoadCompletedEventHandler}
    */
    OnLoadCompleted {
        get {
            if(!this.HasProp("__OnLoadCompleted")){
                this.__OnLoadCompleted := WinRTEventHandler(
                    LoadCompletedEventHandler,
                    LoadCompletedEventHandler.IID,
                    IInspectable,
                    NavigationEventArgs
                )
                this.__OnLoadCompletedToken := this.add_LoadCompleted(this.__OnLoadCompleted.iface)
            }
            return this.__OnLoadCompleted
        }
    }

    /**
     * Occurs when the content contained in the [WebView](webview.md) control passes a string to the application by using JavaScript.
     * @remarks
     * A hosted HTML page can fire the ScriptNotify event in your UWP app when the page calls **window.external.notify** and passes a string parameter.
     * 
     * > [!NOTE]
     * > Because this event is initiated by external code, you should be careful about what you put in the event handler. To prevent malicious scripts from exploiting this event, be sure to enable it only for trusted URIs, as described below.
     * @type {NotifyEventHandler}
    */
    OnScriptNotify {
        get {
            if(!this.HasProp("__OnScriptNotify")){
                this.__OnScriptNotify := WinRTEventHandler(
                    NotifyEventHandler,
                    NotifyEventHandler.IID,
                    IInspectable,
                    NotifyEventArgs
                )
                this.__OnScriptNotifyToken := this.add_ScriptNotify(this.__OnScriptNotify.iface)
            }
            return this.__OnScriptNotify
        }
    }

    /**
     * > [!NOTE]
     * > NavigationFailed may be altered or unavailable for releases after Windows 8.1. Instead, use [NavigationCompleted](webview_navigationcompleted.md).
     * 
     * Occurs when the [WebView](webview.md) cannot complete the navigation attempt.
     * @type {WebViewNavigationFailedEventHandler}
    */
    OnNavigationFailed {
        get {
            if(!this.HasProp("__OnNavigationFailed")){
                this.__OnNavigationFailed := WinRTEventHandler(
                    WebViewNavigationFailedEventHandler,
                    WebViewNavigationFailedEventHandler.IID,
                    IInspectable,
                    WebViewNavigationFailedEventArgs
                )
                this.__OnNavigationFailedToken := this.add_NavigationFailed(this.__OnNavigationFailed.iface)
            }
            return this.__OnNavigationFailed
        }
    }

    /**
     * Occurs before the [WebView](webview.md) navigates to new content.
     * @remarks
     * You can cancel navigation in a handler for this event by setting the [WebViewNavigationStartingEventArgs.Cancel](webviewnavigationstartingeventargs_cancel.md) property to **true**.
     * 
     * [WebView](webview.md) navigation events occur in the following order:
     * 
     * 
     * + NavigationStarting
     * + [ContentLoading](webview_contentloading.md)
     * + [DOMContentLoaded](webview_domcontentloaded.md)
     * + [NavigationCompleted](webview_navigationcompleted.md)
     * 
     * 
     * Similar events occur in the same order for each **iframe** in the [WebView](webview.md) content: 
     * + [FrameNavigationStarting](webview_framenavigationstarting.md)
     * + [FrameContentLoading](webview_framecontentloading.md)
     * + [FrameDOMContentLoaded](webview_framedomcontentloaded.md)
     * + [FrameNavigationCompleted](webview_framenavigationcompleted.md)
     * @type {TypedEventHandler<WebView, WebViewNavigationStartingEventArgs>}
    */
    OnNavigationStarting {
        get {
            if(!this.HasProp("__OnNavigationStarting")){
                this.__OnNavigationStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{98055b5a-36bb-5962-971f-8b87619eb17e}"),
                    WebView,
                    WebViewNavigationStartingEventArgs
                )
                this.__OnNavigationStartingToken := this.add_NavigationStarting(this.__OnNavigationStarting.iface)
            }
            return this.__OnNavigationStarting
        }
    }

    /**
     * Occurs when the [WebView](webview.md) has started loading new content.
     * @remarks
     * [WebView](webview.md) navigation events occur in the following order:
     * 
     * 
     * + [NavigationStarting](webview_navigationstarting.md)
     * + ContentLoading
     * + [DOMContentLoaded](webview_domcontentloaded.md)
     * + [NavigationCompleted](webview_navigationcompleted.md)
     * 
     * 
     * Similar events occur in the same order for each **iframe** in the [WebView](webview.md) content: 
     * + [FrameNavigationStarting](webview_framenavigationstarting.md)
     * + [FrameContentLoading](webview_framecontentloading.md)
     * + [FrameDOMContentLoaded](webview_framedomcontentloaded.md)
     * + [FrameNavigationCompleted](webview_framenavigationcompleted.md)
     * @type {TypedEventHandler<WebView, WebViewContentLoadingEventArgs>}
    */
    OnContentLoading {
        get {
            if(!this.HasProp("__OnContentLoading")){
                this.__OnContentLoading := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e7b42a9a-f140-52ad-a658-e237b9a3dcca}"),
                    WebView,
                    WebViewContentLoadingEventArgs
                )
                this.__OnContentLoadingToken := this.add_ContentLoading(this.__OnContentLoading.iface)
            }
            return this.__OnContentLoading
        }
    }

    /**
     * Occurs when the [WebView](webview.md) has finished parsing the current HTML content.
     * @remarks
     * [WebView](webview.md) navigation events occur in the following order:
     * 
     * 
     * + [NavigationStarting](webview_navigationstarting.md)
     * + [ContentLoading](webview_contentloading.md)
     * + DOMContentLoaded
     * + [NavigationCompleted](webview_navigationcompleted.md)
     * 
     * 
     * Similar events occur in the same order for each **iframe** in the [WebView](webview.md) content: 
     * + [FrameNavigationStarting](webview_framenavigationstarting.md)
     * + [FrameContentLoading](webview_framecontentloading.md)
     * + [FrameDOMContentLoaded](webview_framedomcontentloaded.md)
     * + [FrameNavigationCompleted](webview_framenavigationcompleted.md)
     * @type {TypedEventHandler<WebView, WebViewDOMContentLoadedEventArgs>}
    */
    OnDOMContentLoaded {
        get {
            if(!this.HasProp("__OnDOMContentLoaded")){
                this.__OnDOMContentLoaded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b9cc891c-4745-5a25-9845-e44d13425a38}"),
                    WebView,
                    WebViewDOMContentLoadedEventArgs
                )
                this.__OnDOMContentLoadedToken := this.add_DOMContentLoaded(this.__OnDOMContentLoaded.iface)
            }
            return this.__OnDOMContentLoaded
        }
    }

    /**
     * Occurs when the [WebView](webview.md) has finished loading the current content or if navigation has failed.
     * @remarks
     * To determine whether navigation has failed, check the [IsSuccess](webviewnavigationcompletedeventargs_issuccess.md) and [WebErrorStatus](webviewnavigationcompletedeventargs_weberrorstatus.md) properties of the [WebViewNavigationCompletedEventArgs](webviewnavigationcompletedeventargs.md) class.
     * 
     * [WebView](webview.md) navigation events occur in the following order:
     * 
     * 
     * + [NavigationStarting](webview_navigationstarting.md)
     * + [ContentLoading](webview_contentloading.md)
     * + [DOMContentLoaded](webview_domcontentloaded.md)
     * + NavigationCompleted
     * 
     * 
     * Similar events occur in the same order for each **iframe** in the [WebView](webview.md) content: 
     * + [FrameNavigationStarting](webview_framenavigationstarting.md)
     * + [FrameContentLoading](webview_framecontentloading.md)
     * + [FrameDOMContentLoaded](webview_framedomcontentloaded.md)
     * + [FrameNavigationCompleted](webview_framenavigationcompleted.md)
     * @type {TypedEventHandler<WebView, WebViewNavigationCompletedEventArgs>}
    */
    OnNavigationCompleted {
        get {
            if(!this.HasProp("__OnNavigationCompleted")){
                this.__OnNavigationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{411136f7-770d-599c-8545-6d053a6a1799}"),
                    WebView,
                    WebViewNavigationCompletedEventArgs
                )
                this.__OnNavigationCompletedToken := this.add_NavigationCompleted(this.__OnNavigationCompleted.iface)
            }
            return this.__OnNavigationCompleted
        }
    }

    /**
     * Occurs before a frame in the [WebView](webview.md) navigates to new content.
     * @remarks
     * You can cancel navigation in a handler for this event by setting the [WebViewNavigationStartingEventArgs.Cancel](webviewnavigationstartingeventargs_cancel.md) property to **true**.
     * 
     * [WebView](webview.md) navigation events occur in the following order:
     * 
     * 
     * + [NavigationStarting](webview_navigationstarting.md)
     * + [ContentLoading](webview_contentloading.md)
     * + [DOMContentLoaded](webview_domcontentloaded.md)
     * + [NavigationCompleted](webview_navigationcompleted.md)
     * 
     * 
     * Similar events occur in the same order for each **iframe** in the [WebView](webview.md) content: 
     * + FrameNavigationStarting
     * + [FrameContentLoading](webview_framecontentloading.md)
     * + [FrameDOMContentLoaded](webview_framedomcontentloaded.md)
     * + [FrameNavigationCompleted](webview_framenavigationcompleted.md)
     * @type {TypedEventHandler<WebView, WebViewNavigationStartingEventArgs>}
    */
    OnFrameNavigationStarting {
        get {
            if(!this.HasProp("__OnFrameNavigationStarting")){
                this.__OnFrameNavigationStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{98055b5a-36bb-5962-971f-8b87619eb17e}"),
                    WebView,
                    WebViewNavigationStartingEventArgs
                )
                this.__OnFrameNavigationStartingToken := this.add_FrameNavigationStarting(this.__OnFrameNavigationStarting.iface)
            }
            return this.__OnFrameNavigationStarting
        }
    }

    /**
     * Occurs when a frame in the [WebView](webview.md) has started loading new content.
     * @remarks
     * [WebView](webview.md) navigation events occur in the following order:
     * 
     * 
     * + [NavigationStarting](webview_navigationstarting.md)
     * + [ContentLoading](webview_contentloading.md)
     * + [DOMContentLoaded](webview_domcontentloaded.md)
     * + [NavigationCompleted](webview_navigationcompleted.md)
     * 
     * 
     * Similar events occur in the same order for each **iframe** in the [WebView](webview.md) content: 
     * + [FrameNavigationStarting](webview_framenavigationstarting.md)
     * + FrameContentLoading
     * + [FrameDOMContentLoaded](webview_framedomcontentloaded.md)
     * + [FrameNavigationCompleted](webview_framenavigationcompleted.md)
     * @type {TypedEventHandler<WebView, WebViewContentLoadingEventArgs>}
    */
    OnFrameContentLoading {
        get {
            if(!this.HasProp("__OnFrameContentLoading")){
                this.__OnFrameContentLoading := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e7b42a9a-f140-52ad-a658-e237b9a3dcca}"),
                    WebView,
                    WebViewContentLoadingEventArgs
                )
                this.__OnFrameContentLoadingToken := this.add_FrameContentLoading(this.__OnFrameContentLoading.iface)
            }
            return this.__OnFrameContentLoading
        }
    }

    /**
     * Occurs when a frame in the [WebView](webview.md) has finished parsing its current HTML content.
     * @remarks
     * [WebView](webview.md) navigation events occur in the following order:
     * 
     * 
     * + [NavigationStarting](webview_navigationstarting.md)
     * + [ContentLoading](webview_contentloading.md)
     * + [DOMContentLoaded](webview_domcontentloaded.md)
     * + [NavigationCompleted](webview_navigationcompleted.md)
     * 
     * 
     * Similar events occur in the same order for each **iframe** in the [WebView](webview.md) content: 
     * + [FrameNavigationStarting](webview_framenavigationstarting.md)
     * + [FrameContentLoading](webview_framecontentloading.md)
     * + FrameDOMContentLoaded
     * + [FrameNavigationCompleted](webview_framenavigationcompleted.md)
     * @type {TypedEventHandler<WebView, WebViewDOMContentLoadedEventArgs>}
    */
    OnFrameDOMContentLoaded {
        get {
            if(!this.HasProp("__OnFrameDOMContentLoaded")){
                this.__OnFrameDOMContentLoaded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b9cc891c-4745-5a25-9845-e44d13425a38}"),
                    WebView,
                    WebViewDOMContentLoadedEventArgs
                )
                this.__OnFrameDOMContentLoadedToken := this.add_FrameDOMContentLoaded(this.__OnFrameDOMContentLoaded.iface)
            }
            return this.__OnFrameDOMContentLoaded
        }
    }

    /**
     * Occurs when a frame in the [WebView](webview.md) has finished loading its content.
     * @remarks
     * [WebView](webview.md) navigation events occur in the following order:
     * 
     * 
     * + [NavigationStarting](webview_navigationstarting.md)
     * + [ContentLoading](webview_contentloading.md)
     * + [DOMContentLoaded](webview_domcontentloaded.md)
     * + [NavigationCompleted](webview_navigationcompleted.md)
     * 
     * 
     * Similar events occur in the same order for each **iframe** in the [WebView](webview.md) content: 
     * + [FrameNavigationStarting](webview_framenavigationstarting.md)
     * + [FrameContentLoading](webview_framecontentloading.md)
     * + [FrameDOMContentLoaded](webview_framedomcontentloaded.md)
     * + FrameNavigationCompleted
     * @type {TypedEventHandler<WebView, WebViewNavigationCompletedEventArgs>}
    */
    OnFrameNavigationCompleted {
        get {
            if(!this.HasProp("__OnFrameNavigationCompleted")){
                this.__OnFrameNavigationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{411136f7-770d-599c-8545-6d053a6a1799}"),
                    WebView,
                    WebViewNavigationCompletedEventArgs
                )
                this.__OnFrameNavigationCompletedToken := this.add_FrameNavigationCompleted(this.__OnFrameNavigationCompleted.iface)
            }
            return this.__OnFrameNavigationCompleted
        }
    }

    /**
     * Occurs periodically while the [WebView](webview.md) executes JavaScript, letting you halt the script.
     * @remarks
     * Your app might appear unresponsive while scripts are running. This event provides an opportunity to interrupt a long-running script. To determine how long the script has been running, check the [ExecutionTime](webviewlongrunningscriptdetectedeventargs_executiontime.md) property of the [WebViewLongRunningScriptDetectedEventArgs](webviewlongrunningscriptdetectedeventargs.md) object. To halt the script, set the event args [StopPageScriptExecution](webviewlongrunningscriptdetectedeventargs_stoppagescriptexecution.md) property to **true**. The halted script will not execute again unless it is reloaded during a subsequent [WebView](webview.md) navigation.
     * 
     * 
     * 
     * > [!NOTE]
     * > In some cases, the [WebView](webview.md) cannot detect a long-running script. For example, this event might not occur if the script is stuck in a loop that doesn’t perform any memory allocations.
     * @type {TypedEventHandler<WebView, WebViewLongRunningScriptDetectedEventArgs>}
    */
    OnLongRunningScriptDetected {
        get {
            if(!this.HasProp("__OnLongRunningScriptDetected")){
                this.__OnLongRunningScriptDetected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ecdc76ef-a99b-5ce7-b9a4-c85e66fed1ee}"),
                    WebView,
                    WebViewLongRunningScriptDetectedEventArgs
                )
                this.__OnLongRunningScriptDetectedToken := this.add_LongRunningScriptDetected(this.__OnLongRunningScriptDetected.iface)
            }
            return this.__OnLongRunningScriptDetected
        }
    }

    /**
     * Occurs when the [WebView](webview.md) shows a warning page for content that was reported as unsafe by SmartScreen Filter.
     * @remarks
     * > This event is not implemented on Windows Phone 8.1 and will never be raised.
     * 
     * This event occurs when the warning page appears. If the user chooses to continue the navigation, subsequent navigation to the page will not display the warning nor fire the event.
     * @type {TypedEventHandler<WebView, IInspectable>}
    */
    OnUnsafeContentWarningDisplaying {
        get {
            if(!this.HasProp("__OnUnsafeContentWarningDisplaying")){
                this.__OnUnsafeContentWarningDisplaying := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d9f52e0d-21fb-5a0b-b4c6-7d162af7fb9c}"),
                    WebView,
                    IInspectable
                )
                this.__OnUnsafeContentWarningDisplayingToken := this.add_UnsafeContentWarningDisplaying(this.__OnUnsafeContentWarningDisplaying.iface)
            }
            return this.__OnUnsafeContentWarningDisplaying
        }
    }

    /**
     * Occurs when the [WebView](webview.md) attempts to download an unsupported file.
     * @remarks
     * The [WebView](webview.md) control cannot host arbitrary file types, but you can handle this event and use the [Launcher](../windows.system/launcher.md) class to redirect the file to the browser or another app.
     * @type {TypedEventHandler<WebView, WebViewUnviewableContentIdentifiedEventArgs>}
    */
    OnUnviewableContentIdentified {
        get {
            if(!this.HasProp("__OnUnviewableContentIdentified")){
                this.__OnUnviewableContentIdentified := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f00e9fbf-d30e-5854-8927-c9512abd8118}"),
                    WebView,
                    WebViewUnviewableContentIdentifiedEventArgs
                )
                this.__OnUnviewableContentIdentifiedToken := this.add_UnviewableContentIdentified(this.__OnUnviewableContentIdentified.iface)
            }
            return this.__OnUnviewableContentIdentified
        }
    }

    /**
     * Occurs when the status of whether the [WebView](webview.md) currently contains a full screen element or not changes.
     * @type {TypedEventHandler<WebView, IInspectable>}
    */
    OnContainsFullScreenElementChanged {
        get {
            if(!this.HasProp("__OnContainsFullScreenElementChanged")){
                this.__OnContainsFullScreenElementChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d9f52e0d-21fb-5a0b-b4c6-7d162af7fb9c}"),
                    WebView,
                    IInspectable
                )
                this.__OnContainsFullScreenElementChangedToken := this.add_ContainsFullScreenElementChanged(this.__OnContainsFullScreenElementChanged.iface)
            }
            return this.__OnContainsFullScreenElementChanged
        }
    }

    /**
     * Occurs when an attempt is made to navigate to a Uniform Resource Identifier (URI) using a scheme that [WebView](webview.md) doesn't support.
     * @remarks
     * See [WebViewUnsupportedUriSchemeIdentifiedEventArgs](webviewunsupportedurischemeidentifiedeventargs.md).
     * 
     * [WebView](webview.md) supports navigation to Uniform Resource Identifier (URI) using these schemes: http, https, ms-appx-web, ms-appdata and ms-local-stream.
     * 
     * If an attempt is made to navigate to a Uniform Resource Identifier (URI) that the [WebView](webview.md) doesn't support, the navigation is blocked. By default, when an unsupported Uniform Resource Identifier (URI) scheme is encountered, the launcher is invoked to find the default provider for the Uniform Resource Identifier (URI) scheme. You can handle the UnsupportedUriSchemeIdentified event to decide how to handle an unsupported Uniform Resource Identifier (URI) scheme. If you do nothing, the launcher is invoked. If you provide custom handling for the Uniform Resource Identifier (URI) scheme, set the [Handled](webviewunsupportedurischemeidentifiedeventargs_handled.md) property to true to prevent the default provider for the Uniform Resource Identifier (URI) scheme from being invoked.
     * @type {TypedEventHandler<WebView, WebViewUnsupportedUriSchemeIdentifiedEventArgs>}
    */
    OnUnsupportedUriSchemeIdentified {
        get {
            if(!this.HasProp("__OnUnsupportedUriSchemeIdentified")){
                this.__OnUnsupportedUriSchemeIdentified := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d304027c-5714-502a-9312-68ca86397124}"),
                    WebView,
                    WebViewUnsupportedUriSchemeIdentifiedEventArgs
                )
                this.__OnUnsupportedUriSchemeIdentifiedToken := this.add_UnsupportedUriSchemeIdentified(this.__OnUnsupportedUriSchemeIdentified.iface)
            }
            return this.__OnUnsupportedUriSchemeIdentified
        }
    }

    /**
     * Occurs when a user performs an action in a [WebView](webview.md) that causes content to be opened in a new window.
     * @remarks
     * See [WebViewNewWindowRequestedEventArgs](webviewnewwindowrequestedeventargs.md).
     * 
     * This event occurs only for user initiated actions. By default, when a user clicks a link in a [WebView](webview.md) that requests to open in a new window, the link launches the default browser. A new window can be caused by the user clicking on an **href**, or a button which calls **window.open**.
     * 
     * Handle this event to provide custom handling of the new window request. You might navigate the [WebView](webview.md) to the desired page, or create a new [WebView](webview.md) in your app to display the requested content. If you provide custom handling of the new window request, set the [Handled](webviewnewwindowrequestedeventargs_handled.md) property to true to prevent the default browser from being launched.
     * @type {TypedEventHandler<WebView, WebViewNewWindowRequestedEventArgs>}
    */
    OnNewWindowRequested {
        get {
            if(!this.HasProp("__OnNewWindowRequested")){
                this.__OnNewWindowRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a8d0aff5-90e1-5921-87dd-576a4b0a95b6}"),
                    WebView,
                    WebViewNewWindowRequestedEventArgs
                )
                this.__OnNewWindowRequestedToken := this.add_NewWindowRequested(this.__OnNewWindowRequested.iface)
            }
            return this.__OnNewWindowRequested
        }
    }

    /**
     * Occurs when an action in a [WebView](webview.md) requires that permission be granted.
     * @remarks
     * The types of permission that can be requested are defined in the [WebViewPermissionType](webviewpermissiontype.md) enumeration.
     * 
     * If you don't handle the PermissionRequested event, the [WebView](webview.md) denies permission by default.
     * 
     * When you handle a permission request in a [WebView](webview.md), you get a [WebViewPermissionRequest](webviewpermissionrequest.md) object as the value of the [WebViewPermissionRequestedEventArgs.PermissionRequest](webviewpermissionrequestedeventargs_permissionrequest.md) property. You can call [Allow](webviewpermissionrequest_allow_1592747266.md) to grant the request, [Deny](webviewpermissionrequest_deny_445869776.md) to deny the request, or [Defer](webviewpermissionrequest_defer_1945301616.md) to defer the request until a later time. For example, you might defer the request if you need to prompt the user for consent.
     * 
     * When you defer a [WebViewPermissionRequest](webviewpermissionrequest.md), a new [WebViewDeferredPermissionRequest](webviewdeferredpermissionrequest.md) is created with the same [Id](webviewpermissionrequest_id.md) and added to the [DeferredPermissionRequests](webview_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](webview_deferredpermissionrequestbyid_219166912.md) method and pass the [Id](webviewdeferredpermissionrequest_id.md) of the deferred request. After you retrieve the request, you can call the [Allow](webviewdeferredpermissionrequest_allow_1592747266.md) method to grant the request, or call the [Deny](webviewdeferredpermissionrequest_deny_445869776.md) method to deny the request.
     * @type {TypedEventHandler<WebView, WebViewPermissionRequestedEventArgs>}
    */
    OnPermissionRequested {
        get {
            if(!this.HasProp("__OnPermissionRequested")){
                this.__OnPermissionRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{718c7a23-eb9f-50a6-8cf7-fbac104e59c3}"),
                    WebView,
                    WebViewPermissionRequestedEventArgs
                )
                this.__OnPermissionRequestedToken := this.add_PermissionRequested(this.__OnPermissionRequested.iface)
            }
            return this.__OnPermissionRequested
        }
    }

    /**
     * Occurs when a WebView runs with an [ExecutionMode](webview_executionmode.md) of **SeparateProcess**, and the separate process is lost.
     * @remarks
     * For more info, see the _Execution mode_ section of the WebView class Remarks.
     * @type {TypedEventHandler<WebView, WebViewSeparateProcessLostEventArgs>}
    */
    OnSeparateProcessLost {
        get {
            if(!this.HasProp("__OnSeparateProcessLost")){
                this.__OnSeparateProcessLost := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fb77d6ae-d38a-5599-8133-fc1eede4080b}"),
                    WebView,
                    WebViewSeparateProcessLostEventArgs
                )
                this.__OnSeparateProcessLostToken := this.add_SeparateProcessLost(this.__OnSeparateProcessLost.iface)
            }
            return this.__OnSeparateProcessLost
        }
    }

    /**
     * Occurs when an HTTP request has been made.
     * @remarks
     * This event occurs after the HTTP request has been made. You can use this event to intercept the response before it's processed by the WebView.
     * @type {TypedEventHandler<WebView, WebViewWebResourceRequestedEventArgs>}
    */
    OnWebResourceRequested {
        get {
            if(!this.HasProp("__OnWebResourceRequested")){
                this.__OnWebResourceRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9d2ee0c4-aaf9-5b36-a368-cc908bd213f0}"),
                    WebView,
                    WebViewWebResourceRequestedEventArgs
                )
                this.__OnWebResourceRequestedToken := this.add_WebResourceRequested(this.__OnWebResourceRequested.iface)
            }
            return this.__OnWebResourceRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [WebView](webview.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebView")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLoadCompletedToken")) {
            this.remove_LoadCompleted(this.__OnLoadCompletedToken)
            this.__OnLoadCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnScriptNotifyToken")) {
            this.remove_ScriptNotify(this.__OnScriptNotifyToken)
            this.__OnScriptNotify.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationFailedToken")) {
            this.remove_NavigationFailed(this.__OnNavigationFailedToken)
            this.__OnNavigationFailed.iface.Dispose()
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

        if(this.HasProp("__OnContainsFullScreenElementChangedToken")) {
            this.remove_ContainsFullScreenElementChanged(this.__OnContainsFullScreenElementChangedToken)
            this.__OnContainsFullScreenElementChanged.iface.Dispose()
        }

        if(this.HasProp("__OnUnsupportedUriSchemeIdentifiedToken")) {
            this.remove_UnsupportedUriSchemeIdentified(this.__OnUnsupportedUriSchemeIdentifiedToken)
            this.__OnUnsupportedUriSchemeIdentified.iface.Dispose()
        }

        if(this.HasProp("__OnNewWindowRequestedToken")) {
            this.remove_NewWindowRequested(this.__OnNewWindowRequestedToken)
            this.__OnNewWindowRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPermissionRequestedToken")) {
            this.remove_PermissionRequested(this.__OnPermissionRequestedToken)
            this.__OnPermissionRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSeparateProcessLostToken")) {
            this.remove_SeparateProcessLost(this.__OnSeparateProcessLostToken)
            this.__OnSeparateProcessLost.iface.Dispose()
        }

        if(this.HasProp("__OnWebResourceRequestedToken")) {
            this.remove_WebResourceRequested(this.__OnWebResourceRequestedToken)
            this.__OnWebResourceRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Source() {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.get_Source()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.put_Source(value)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_AllowedScriptNotifyUris() {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.get_AllowedScriptNotifyUris()
    }

    /**
     * 
     * @param {IVector<Uri>} value 
     * @returns {HRESULT} 
     */
    put_AllowedScriptNotifyUris(value) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.put_AllowedScriptNotifyUris(value)
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_DataTransferPackage() {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.get_DataTransferPackage()
    }

    /**
     * 
     * @param {LoadCompletedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LoadCompleted(handler) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.add_LoadCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LoadCompleted(token) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.remove_LoadCompleted(token)
    }

    /**
     * 
     * @param {NotifyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScriptNotify(handler) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.add_ScriptNotify(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ScriptNotify(token) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.remove_ScriptNotify(token)
    }

    /**
     * 
     * @param {WebViewNavigationFailedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationFailed(handler) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.add_NavigationFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationFailed(token) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.remove_NavigationFailed(token)
    }

    /**
     * > [!NOTE]
     * > InvokeScript may be altered or unavailable for releases after Windows 8.1. Instead, use [InvokeScriptAsync](webview_invokescriptasync_1912773610.md).
     * 
     * Executes the specified script function from the currently loaded HTML, with specific arguments.
     * @remarks
     * The invoked script can return only string values.
     * @param {HSTRING} scriptName The name of the script function to invoke.
     * @param {Integer} arguments_length 
     * @param {Pointer<HSTRING>} arguments A string array that packages arguments to the script function.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.invokescript
     */
    InvokeScript(scriptName, arguments_length, arguments) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.InvokeScript(scriptName, arguments_length, arguments)
    }

    /**
     * Loads the HTML content at the specified Uniform Resource Identifier (URI).
     * @remarks
     * If the app possesses the `enterpriseCloudSSO` capability,
     * then web pages hosted inside the WebView control
     * can use single sign on with Azure Active Directory (AAD) resources.
     * @param {Uri} source The Uniform Resource Identifier (URI) to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.navigate
     */
    Navigate(source) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.Navigate(source)
    }

    /**
     * Loads the specified HTML content as a new document.
     * @remarks
     * NavigateToString is asynchronous. Use the [NavigationCompleted](webview_navigationcompleted.md) event to detect when navigation has completed. 
     * 
     * > [!NOTE]
     * > [NavigationCompleted](webview_navigationcompleted.md) replaces [LoadCompleted](webview_loadcompleted.md) starting with Windows 8.1. In apps compiled for Windows 8, use [LoadCompleted](webview_loadcompleted.md) instead.
     * 
     * NavigateToString supports content with references to external files such as CSS, scripts, images, and fonts. However, it does not provide a way to generate or provide these resources programmatically. Windows 8.1 introduces [NavigateToLocalStreamUri](webview_navigatetolocalstreamuri_1538250901.md) to provide this support.
     * 
     * If the app possesses the `enterpriseCloudSSO` capability,
     * then web pages hosted inside the WebView control
     * can use single sign on with Azure Active Directory (AAD) resources.
     * @param {HSTRING} text The HTML content to display in the [WebView](webview.md) control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.navigatetostring
     */
    NavigateToString(text) {
        if (!this.HasProp("__IWebView")) {
            if ((queryResult := this.QueryInterface(IWebView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView := IWebView(outPtr)
        }

        return this.__IWebView.NavigateToString(text)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoBack() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.get_CanGoBack()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoForward() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.get_CanGoForward()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DocumentTitle() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.get_DocumentTitle()
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNavigationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationStarting(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_NavigationStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationStarting(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_NavigationStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewContentLoadingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentLoading(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_ContentLoading(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContentLoading(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_ContentLoading(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewDOMContentLoadedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DOMContentLoaded(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_DOMContentLoaded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DOMContentLoaded(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_DOMContentLoaded(token)
    }

    /**
     * Navigates the [WebView](webview.md) to the next page in the navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.goforward
     */
    GoForward() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.GoForward()
    }

    /**
     * Navigates the [WebView](webview.md) to the previous page in the navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.goback
     */
    GoBack() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.GoBack()
    }

    /**
     * Reloads the current content in the [WebView](webview.md).
     * @remarks
     * If the current content was loaded via an HTTP URI, this method reloads the file without forced cache validation by sending a "Pragma:no-cache" header to the server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.refresh
     */
    Refresh() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.Refresh()
    }

    /**
     * Halts the current [WebView](webview.md) navigation or download.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.stop
     */
    Stop() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.Stop()
    }

    /**
     * Creates an image of the current [WebView](webview.md) contents and writes it to the specified stream.
     * @param {IRandomAccessStream} stream The stream to write the image to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.capturepreviewtostreamasync
     */
    CapturePreviewToStreamAsync(stream) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.CapturePreviewToStreamAsync(stream)
    }

    /**
     * Executes the specified script function from the currently loaded HTML, with specific arguments, as an asynchronous action.
     * @remarks
     * To prevent malicious code from exploiting your app, be sure to call this method to invoke only scripts that you trust.
     * 
     * The invoked script can return only string values. If the return value is not a string, an empty string is returned. For example, `WebView.InvokeScriptAsync("eval", "1==1")` returns an empty string rather than `true`, unless you use `toString`: `WebView.InvokeScriptAsync("eval", "(1==1).toString()")`.
     * 
     * Your app might appear unresponsive while scripts are running. Handle the [LongRunningScriptDetected](webview_longrunningscriptdetected.md) event to interrupt a long-running script.
     * @param {HSTRING} scriptName The name of the script function to invoke.
     * @param {IIterable<HSTRING>} arguments A string array that packages arguments to the script function.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.invokescriptasync
     */
    InvokeScriptAsync(scriptName, arguments) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.InvokeScriptAsync(scriptName, arguments)
    }

    /**
     * Asynchronously gets a [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) that contains the selected content within the [WebView](webview.md).
     * @remarks
     * You can use this method during a share operation to send the selected [WebView](webview.md) content to a target app. This method is asynchronous, so you must use a deferral to prevent your [DataRequested](../windows.applicationmodel.datatransfer/datatransfermanager_datarequested.md) event handler from returning before the asynchronous call is complete. Call [DataRequestedEventArgs.Request.GetDeferral](../windows.applicationmodel.datatransfer/datarequest_getdeferral_254836512.md) to create the deferral and [DataRequestDeferral.Complete](../windows.applicationmodel.datatransfer/datarequestdeferral_complete_1807836922.md) to end it.
     * @returns {IAsyncOperation<DataPackage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.captureselectedcontenttodatapackageasync
     */
    CaptureSelectedContentToDataPackageAsync() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.CaptureSelectedContentToDataPackageAsync()
    }

    /**
     * Loads local web content at the specified URI using an [IUriToStreamResolver](../windows.web/iuritostreamresolver.md).
     * @remarks
     * Use this method to load local content that the [NavigateToString](webview_navigatetostring_1924125949.md) method won't handle. [NavigateToString](webview_navigatetostring_1924125949.md) provides an easy way to navigate to static HTML content, including content with references to resources such as CSS, scripts, images, and fonts. However, [NavigateToString](webview_navigatetostring_1924125949.md) does not provide a way to generate these resources programmatically.
     * 
     * To use the NavigateToLocalStreamUri method, you must pass in an [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) implementation that translates a URI pattern into a content stream. You can do this to supply the content for all the resources used by a web page, or series of pages. For example, you can use this method to display content saved on the local file system as encrypted files or in cab packages. When the content is requested, you can use an [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) implementation to decrypt it on the fly.
     * 
     * The [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) interface has one method, [UriToStreamAsync](../windows.web/iuritostreamresolver_uritostreamasync_1256896073.md) which takes the URI and returns the stream. The URI is in the form of “ms-local-stream://appname_KEY/folder/file” where KEY identifies the resolver. Use [BuildLocalStreamUri](webview_buildlocalstreamuri_803594427.md) to create a URI in the correct format that references the local content to load.
     * 
     * > [!NOTE]
     * > Your [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) implementation must be agile to prevent deadlock that can occur when the UI thread waits for the [IUriToStreamResolver](../windows.web/iuritostreamresolver.md) to finish its work before continuing. For more info, see [Threading and Marshaling](/cpp/cppcx/threading-and-marshaling-c-cx)
     * 
     * If the app possesses the `enterpriseCloudSSO` capability,
     * then web pages hosted inside the WebView control
     * can use single sign on with Azure Active Directory (AAD) resources.
     * @param {Uri} source A URI identifying the local HTML content to load.
     * @param {IUriToStreamResolver} streamResolver A resolver that converts the URI into a stream to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.navigatetolocalstreamuri
     */
    NavigateToLocalStreamUri(source, streamResolver) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.NavigateToLocalStreamUri(source, streamResolver)
    }

    /**
     * Creates a URI that you can pass to [NavigateToLocalStreamUri](webview_navigatetolocalstreamuri_1538250901.md).
     * @param {HSTRING} contentIdentifier A unique identifier for the content the URI is referencing. This defines the root of the URI.
     * @param {HSTRING} relativePath The path to the resource, relative to the root.
     * @returns {Uri} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.buildlocalstreamuri
     */
    BuildLocalStreamUri(contentIdentifier, relativePath) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.BuildLocalStreamUri(contentIdentifier, relativePath)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DefaultBackgroundColor() {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.get_DefaultBackgroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_DefaultBackgroundColor(value) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.put_DefaultBackgroundColor(value)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationCompleted(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_NavigationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationCompleted(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_NavigationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNavigationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameNavigationStarting(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_FrameNavigationStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameNavigationStarting(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_FrameNavigationStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewContentLoadingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameContentLoading(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_FrameContentLoading(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameContentLoading(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_FrameContentLoading(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewDOMContentLoadedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameDOMContentLoaded(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_FrameDOMContentLoaded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameDOMContentLoaded(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_FrameDOMContentLoaded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNavigationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameNavigationCompleted(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_FrameNavigationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameNavigationCompleted(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_FrameNavigationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewLongRunningScriptDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LongRunningScriptDetected(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_LongRunningScriptDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LongRunningScriptDetected(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_LongRunningScriptDetected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnsafeContentWarningDisplaying(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_UnsafeContentWarningDisplaying(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnsafeContentWarningDisplaying(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_UnsafeContentWarningDisplaying(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewUnviewableContentIdentifiedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnviewableContentIdentified(handler) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.add_UnviewableContentIdentified(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnviewableContentIdentified(token) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.remove_UnviewableContentIdentified(token)
    }

    /**
     * Navigates the [WebView](webview.md) to a URI with a POST request and HTTP headers.
     * @remarks
     * This method supports only [HttpMethod.Post](../windows.web.http/httpmethod_post.md) and [HttpMethod.Get](../windows.web.http/httpmethod_get.md) for the [HttpRequestMessage.Method](../windows.web.http/httprequestmessage_method.md) property value.
     * 
     * > [!WARNING]
     * > If you add additional headers to this request, such as authentication credentials, remember that those headers will also be included with any subsequent child requests. Use caution to prevent accidental disclosure of confidential or personal information.
     * 
     * If the app possesses the `enterpriseCloudSSO` capability,
     * then web pages hosted inside the WebView control
     * can use single sign on with Azure Active Directory (AAD) resources.
     * @param {HttpRequestMessage} requestMessage The details of the HTTP request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.navigatewithhttprequestmessage
     */
    NavigateWithHttpRequestMessage(requestMessage) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.NavigateWithHttpRequestMessage(requestMessage)
    }

    /**
     * Sets the input focus to the [WebView](webview.md).
     * @remarks
     * In apps compiled for Windows 8, the [WebView](webview.md) control automatically gets input focus whenever you use script to programmatically set the focus to some content in the [WebView](webview.md). In apps compiled for Windows 8.1, this does not occur automatically. Instead, you must call the Focus method to set the focus to the [WebView](webview.md) control and also use script to set the focus to some content in the control.
     * 
     * When you call this method, you will typically pass in a [FocusState](../windows.ui.xaml/focusstate.md) value of **Programmatic**. Use the **Pointer** and **Keyboard** values when you call this method in response to direct user input. You cannot use this method to remove input focus from the control. The **Unfocused** value will throw an exception.
     * @param {Integer} value A value that indicates how the focus was set.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.focus
     */
    Focus(value) {
        if (!this.HasProp("__IWebView2")) {
            if ((queryResult := this.QueryInterface(IWebView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView2 := IWebView2(outPtr)
        }

        return this.__IWebView2.Focus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ContainsFullScreenElement() {
        if (!this.HasProp("__IWebView3")) {
            if ((queryResult := this.QueryInterface(IWebView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView3 := IWebView3(outPtr)
        }

        return this.__IWebView3.get_ContainsFullScreenElement()
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContainsFullScreenElementChanged(handler) {
        if (!this.HasProp("__IWebView3")) {
            if ((queryResult := this.QueryInterface(IWebView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView3 := IWebView3(outPtr)
        }

        return this.__IWebView3.add_ContainsFullScreenElementChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContainsFullScreenElementChanged(token) {
        if (!this.HasProp("__IWebView3")) {
            if ((queryResult := this.QueryInterface(IWebView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView3 := IWebView3(outPtr)
        }

        return this.__IWebView3.remove_ContainsFullScreenElementChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExecutionMode() {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.get_ExecutionMode()
    }

    /**
     * 
     * @returns {IVector<WebViewDeferredPermissionRequest>} 
     */
    get_DeferredPermissionRequests() {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.get_DeferredPermissionRequests()
    }

    /**
     * 
     * @returns {WebViewSettings} 
     */
    get_Settings() {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.get_Settings()
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewUnsupportedUriSchemeIdentifiedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnsupportedUriSchemeIdentified(handler) {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.add_UnsupportedUriSchemeIdentified(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnsupportedUriSchemeIdentified(token) {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.remove_UnsupportedUriSchemeIdentified(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewNewWindowRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NewWindowRequested(handler) {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.add_NewWindowRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NewWindowRequested(token) {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.remove_NewWindowRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewPermissionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PermissionRequested(handler) {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.add_PermissionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PermissionRequested(token) {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.remove_PermissionRequested(token)
    }

    /**
     * Adds a native Windows Runtime object as a global parameter to the top level document inside of a [WebView](webview.md).
     * @remarks
     * Use this method to expose a native Windows Runtime object as a global parameter in the context of the top level document inside of a [WebView](webview.md). For a Windows Runtime object to be projected, it must agile and be decorated with the **AllowForWeb** attribute.
     * 
     * > [!NOTE]
     * > Runtime classes created using Microsoft Visual Basic, C# or Visual C++ component extensions (C++/CX) are agile by default. For more info, see [Threading and Marshaling](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
     * 
     * 
     * 
     * 
     * The object passed into AddWebAllowedObject must be imported from a [Windows Runtime component](/windows/uwp/winrt-components/index) that is separate from the app assembly. This is necessary for the **AllowForWeb** attribute to be property identified by the [WebView](webview.md) security subsystem. If you use a class from your app project, AddWebAllowedObject does not work.
     * 
     * You must call AddWebAllowedObject every time [WebView](webview.md) is navigated to a new page that accesses the native object. You can use the [WebView.NavigationStarting](webview_navigationstarting.md) event to inject the object when navigation begins.
     * @param {HSTRING} name The name of the object to expose to the document in the [WebView](webview.md).
     * @param {IInspectable} pObject The object to expose to the document in the [WebView](webview.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.addweballowedobject
     */
    AddWebAllowedObject(name, pObject) {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.AddWebAllowedObject(name, pObject)
    }

    /**
     * Returns the deferred permission request with the specified [Id](webviewdeferredpermissionrequest_id.md).
     * @remarks
     * When you defer a [WebViewPermissionRequest](webviewpermissionrequest.md), a new [WebViewDeferredPermissionRequest](webviewdeferredpermissionrequest.md) is created with the same [Id](webviewpermissionrequest_id.md) and added to the [DeferredPermissionRequests](webview_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the DeferredPermissionRequestById method and pass the [Id](webviewdeferredpermissionrequest_id.md) of the deferred request. After you retrieve the request, you can call the [Allow](webviewdeferredpermissionrequest_allow_1592747266.md) method to grant the request, or call the [Deny](webviewdeferredpermissionrequest_deny_445869776.md) method to deny the request.
     * @param {Integer} id The [Id](webviewdeferredpermissionrequest_id.md) of the deferred permission request.
     * @returns {WebViewDeferredPermissionRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webview.deferredpermissionrequestbyid
     */
    DeferredPermissionRequestById(id) {
        if (!this.HasProp("__IWebView4")) {
            if ((queryResult := this.QueryInterface(IWebView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView4 := IWebView4(outPtr)
        }

        return this.__IWebView4.DeferredPermissionRequestById(id)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusLeft() {
        if (!this.HasProp("__IWebView5")) {
            if ((queryResult := this.QueryInterface(IWebView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView5 := IWebView5(outPtr)
        }

        return this.__IWebView5.get_XYFocusLeft()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusLeft(value) {
        if (!this.HasProp("__IWebView5")) {
            if ((queryResult := this.QueryInterface(IWebView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView5 := IWebView5(outPtr)
        }

        return this.__IWebView5.put_XYFocusLeft(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusRight() {
        if (!this.HasProp("__IWebView5")) {
            if ((queryResult := this.QueryInterface(IWebView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView5 := IWebView5(outPtr)
        }

        return this.__IWebView5.get_XYFocusRight()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusRight(value) {
        if (!this.HasProp("__IWebView5")) {
            if ((queryResult := this.QueryInterface(IWebView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView5 := IWebView5(outPtr)
        }

        return this.__IWebView5.put_XYFocusRight(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusUp() {
        if (!this.HasProp("__IWebView5")) {
            if ((queryResult := this.QueryInterface(IWebView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView5 := IWebView5(outPtr)
        }

        return this.__IWebView5.get_XYFocusUp()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusUp(value) {
        if (!this.HasProp("__IWebView5")) {
            if ((queryResult := this.QueryInterface(IWebView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView5 := IWebView5(outPtr)
        }

        return this.__IWebView5.put_XYFocusUp(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusDown() {
        if (!this.HasProp("__IWebView5")) {
            if ((queryResult := this.QueryInterface(IWebView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView5 := IWebView5(outPtr)
        }

        return this.__IWebView5.get_XYFocusDown()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusDown(value) {
        if (!this.HasProp("__IWebView5")) {
            if ((queryResult := this.QueryInterface(IWebView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView5 := IWebView5(outPtr)
        }

        return this.__IWebView5.put_XYFocusDown(value)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewSeparateProcessLostEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SeparateProcessLost(handler) {
        if (!this.HasProp("__IWebView6")) {
            if ((queryResult := this.QueryInterface(IWebView6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView6 := IWebView6(outPtr)
        }

        return this.__IWebView6.add_SeparateProcessLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SeparateProcessLost(token) {
        if (!this.HasProp("__IWebView6")) {
            if ((queryResult := this.QueryInterface(IWebView6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView6 := IWebView6(outPtr)
        }

        return this.__IWebView6.remove_SeparateProcessLost(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebView, WebViewWebResourceRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WebResourceRequested(handler) {
        if (!this.HasProp("__IWebView7")) {
            if ((queryResult := this.QueryInterface(IWebView7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView7 := IWebView7(outPtr)
        }

        return this.__IWebView7.add_WebResourceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_WebResourceRequested(token) {
        if (!this.HasProp("__IWebView7")) {
            if ((queryResult := this.QueryInterface(IWebView7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebView7 := IWebView7(outPtr)
        }

        return this.__IWebView7.remove_WebResourceRequested(token)
    }

;@endregion Instance Methods
}
