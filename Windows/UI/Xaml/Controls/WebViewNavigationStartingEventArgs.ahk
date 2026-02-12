#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewNavigationStartingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [WebView.NavigationStarting](webview_navigationstarting.md) and [FrameNavigationStarting](webview_framenavigationstarting.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnavigationstartingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewNavigationStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewNavigationStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewNavigationStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the [WebView](webview.md) is loading.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnavigationstartingeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets or sets a value indicating whether to cancel the [WebView](webview.md) navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnavigationstartingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
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
        if (!this.HasProp("__IWebViewNavigationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNavigationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNavigationStartingEventArgs := IWebViewNavigationStartingEventArgs(outPtr)
        }

        return this.__IWebViewNavigationStartingEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__IWebViewNavigationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNavigationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNavigationStartingEventArgs := IWebViewNavigationStartingEventArgs(outPtr)
        }

        return this.__IWebViewNavigationStartingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IWebViewNavigationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNavigationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNavigationStartingEventArgs := IWebViewNavigationStartingEventArgs(outPtr)
        }

        return this.__IWebViewNavigationStartingEventArgs.put_Cancel(value)
    }

;@endregion Instance Methods
}
