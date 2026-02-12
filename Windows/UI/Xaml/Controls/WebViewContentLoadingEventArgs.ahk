#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewContentLoadingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [WebView.ContentLoading](webview_contentloading.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewcontentloadingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewContentLoadingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewContentLoadingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewContentLoadingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the [WebView](webview.md) is loading.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewcontentloadingeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IWebViewContentLoadingEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewContentLoadingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewContentLoadingEventArgs := IWebViewContentLoadingEventArgs(outPtr)
        }

        return this.__IWebViewContentLoadingEventArgs.get_Uri()
    }

;@endregion Instance Methods
}
