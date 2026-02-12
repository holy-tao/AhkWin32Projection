#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewDOMContentLoadedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [DOMContentLoaded](webview_domcontentloaded.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewdomcontentloadedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewDOMContentLoadedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewDOMContentLoadedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewDOMContentLoadedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the [WebView](webview.md) is loading.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewdomcontentloadedeventargs.uri
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
        if (!this.HasProp("__IWebViewDOMContentLoadedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewDOMContentLoadedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewDOMContentLoadedEventArgs := IWebViewDOMContentLoadedEventArgs(outPtr)
        }

        return this.__IWebViewDOMContentLoadedEventArgs.get_Uri()
    }

;@endregion Instance Methods
}
