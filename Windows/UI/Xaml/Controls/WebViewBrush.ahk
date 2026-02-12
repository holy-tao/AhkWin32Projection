#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Media\TileBrush.ahk
#Include .\IWebViewBrush.ahk
#Include .\IWebViewBrushStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a brush that renders the content that is currently hosted in a [WebView](webview.md) control.
 * @remarks
 * In Windows 8, the [WebView](webview.md) control has the characteristic that other UI regions such as controls cannot be rendered on top of it. This is because of how window regions are handled internally, particularly how input events are processed and how the screen draws. If you want to render HTML content and also place other UI elements on top of that HTML content, you should use WebViewBrush as the render area. The [WebView](webview.md) still provides the HTML source information, and you reference that [WebView](webview.md) through the [SourceName](webviewbrush_sourcename.md) property (or by calling [SetSource](webviewbrush_setsource_1533101357.md), the method and property yield the same results). WebViewBrush does not have this overlay limitation, but it doesn't enable interaction.
 * 
 * > [!NOTE]
 * > The preceding remarks apply only to apps compiled for Windows 8, even when running on Windows 8.1. Windows 8.1 introduces changes to the [WebView](webview.md) control that fix the issues described here. For Windows 8.1, it's anticipated that scenarios where you'll still use a WebViewBrush won't be very common. In most cases you can just use a [WebView](webview.md) control and get the functionality you need.
 * 
 * You can apply a WebViewBrush to any property that takes a [Brush](../windows.ui.xaml.media/brush.md). For example, you can set [Shape.Fill](../windows.ui.xaml.shapes/shape_fill.md) or [Control.Background](control_background.md) with a WebViewBrush.
 * 
 * There are two alternatives for associating a WebViewBrush with a [WebView](webview.md) control source:
 * + Reference the source [WebView](webview.md) by its identifier name, by setting the [SourceName](webviewbrush_sourcename.md) property.
 * + Reference the source [WebView](webview.md) by reference, by calling the [SetSource](webviewbrush_setsource_1533101357.md) method and passing a [WebView](webview.md) object.
 * 
 * 
 * 
 * 
 * > [!IMPORTANT]
 * > It's often necessary to call [Redraw](webviewbrush_redraw_2022175783.md) for a WebViewBrush that's declared in XAML in the same UI as is the [WebView](webview.md) source. A [WebView](webview.md) control has an inherently asynchronous behavior that redraws the control when its content is completely loaded. But an associated WebViewBrush renders as soon as the XAML is parsed (which might be before the URI content is loaded by the [WebView](webview.md)). Alternatively, you can wait to call [SetSource](webviewbrush_setsource_1533101357.md) on the WebViewBrush until the source content is fully loaded (for example by calling [SetSource](webviewbrush_setsource_1533101357.md) in the handler for the [WebView.LoadCompleted](webview_loadcompleted.md) event.
 * 
 * > This class is not supported on Windows Phone 8.x. [WebView](webview.md) content will not be captured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewbrush
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewBrush extends TileBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewBrush.IID

    /**
     * Identifies the [SourceName](webviewbrush_sourcename.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewbrush.sourcenameproperty
     * @type {DependencyProperty} 
     */
    static SourceNameProperty {
        get => WebViewBrush.get_SourceNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourceNameProperty() {
        if (!WebViewBrush.HasProp("__IWebViewBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebViewBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewBrushStatics.IID)
            WebViewBrush.__IWebViewBrushStatics := IWebViewBrushStatics(factoryPtr)
        }

        return WebViewBrush.__IWebViewBrushStatics.get_SourceNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the name of the source [WebView](webview.md) control that provides the HTML content.
     * @remarks
     * There are two alternatives for associating a [WebViewBrush](webviewbrush.md) with a [WebView](webview.md) control source:
     * + Reference the source [WebView](webview.md) by its identifier name, by setting the SourceName property.
     * + Reference the source [WebView](webview.md) by reference, by calling the [SetSource](webviewbrush_setsource_1533101357.md) method and passing a [WebView](webview.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewbrush.sourcename
     * @type {HSTRING} 
     */
    SourceName {
        get => this.get_SourceName()
        set => this.put_SourceName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [WebViewBrush](webviewbrush.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WebViewBrush")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceName() {
        if (!this.HasProp("__IWebViewBrush")) {
            if ((queryResult := this.QueryInterface(IWebViewBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewBrush := IWebViewBrush(outPtr)
        }

        return this.__IWebViewBrush.get_SourceName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SourceName(value) {
        if (!this.HasProp("__IWebViewBrush")) {
            if ((queryResult := this.QueryInterface(IWebViewBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewBrush := IWebViewBrush(outPtr)
        }

        return this.__IWebViewBrush.put_SourceName(value)
    }

    /**
     * Causes the [WebViewBrush](webviewbrush.md) to get updated source pixels from the associated [WebView](webview.md) and its current content. This happens asynchronously.
     * @remarks
     * A [WebViewBrush](webviewbrush.md) is basically a snapshot of the content being displayed in a [WebView](webview.md). It won't show animations or any dynamic changes to the content. Call Redraw if the source [WebView](webview.md) has changed its content significantly and you want to make a new snapshot to display as the [WebViewBrush](webviewbrush.md) content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewbrush.redraw
     */
    Redraw() {
        if (!this.HasProp("__IWebViewBrush")) {
            if ((queryResult := this.QueryInterface(IWebViewBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewBrush := IWebViewBrush(outPtr)
        }

        return this.__IWebViewBrush.Redraw()
    }

    /**
     * Sets the source of the content for the [WebViewBrush](webviewbrush.md).
     * @remarks
     * There are two alternatives for associating a [WebViewBrush](webviewbrush.md) with a [WebView](webview.md) control source:
     * + Reference the source [WebView](webview.md) by its identifier name, by setting the [SourceName](webviewbrush_sourcename.md) property.
     * + Reference the source [WebView](webview.md) by reference, by calling the SetSource method and passing a [WebView](webview.md) object.
     * @param {WebView} source The [WebView](webview.md) hosting the HTML content that is the source for the brush.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewbrush.setsource
     */
    SetSource(source) {
        if (!this.HasProp("__IWebViewBrush")) {
            if ((queryResult := this.QueryInterface(IWebViewBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewBrush := IWebViewBrush(outPtr)
        }

        return this.__IWebViewBrush.SetSource(source)
    }

;@endregion Instance Methods
}
