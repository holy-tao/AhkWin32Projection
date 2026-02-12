#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewNavigationFailedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [WebView.NavigationFailed](webview_navigationfailed.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnavigationfailedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewNavigationFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewNavigationFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewNavigationFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the URI that the [WebView](webview.md) attempted to navigate to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnavigationfailedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the error that occurred when navigation failed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnavigationfailedeventargs.weberrorstatus
     * @type {Integer} 
     */
    WebErrorStatus {
        get => this.get_WebErrorStatus()
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
        if (!this.HasProp("__IWebViewNavigationFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNavigationFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNavigationFailedEventArgs := IWebViewNavigationFailedEventArgs(outPtr)
        }

        return this.__IWebViewNavigationFailedEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WebErrorStatus() {
        if (!this.HasProp("__IWebViewNavigationFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNavigationFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNavigationFailedEventArgs := IWebViewNavigationFailedEventArgs(outPtr)
        }

        return this.__IWebViewNavigationFailedEventArgs.get_WebErrorStatus()
    }

;@endregion Instance Methods
}
