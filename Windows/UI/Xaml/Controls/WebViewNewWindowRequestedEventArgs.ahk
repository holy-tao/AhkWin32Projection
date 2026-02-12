#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewNewWindowRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [WebView.NewWindowRequested](webview_newwindowrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnewwindowrequestedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewNewWindowRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewNewWindowRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewNewWindowRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the [WebView](webview.md) is attempting to navigate to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnewwindowrequestedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the content where the navigation was initiated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnewwindowrequestedeventargs.referrer
     * @type {Uri} 
     */
    Referrer {
        get => this.get_Referrer()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for [Handled](containercontentchangingeventargs_handled.md) prevents other handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewnewwindowrequestedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
        if (!this.HasProp("__IWebViewNewWindowRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNewWindowRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNewWindowRequestedEventArgs := IWebViewNewWindowRequestedEventArgs(outPtr)
        }

        return this.__IWebViewNewWindowRequestedEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Referrer() {
        if (!this.HasProp("__IWebViewNewWindowRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNewWindowRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNewWindowRequestedEventArgs := IWebViewNewWindowRequestedEventArgs(outPtr)
        }

        return this.__IWebViewNewWindowRequestedEventArgs.get_Referrer()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IWebViewNewWindowRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNewWindowRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNewWindowRequestedEventArgs := IWebViewNewWindowRequestedEventArgs(outPtr)
        }

        return this.__IWebViewNewWindowRequestedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IWebViewNewWindowRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewNewWindowRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewNewWindowRequestedEventArgs := IWebViewNewWindowRequestedEventArgs(outPtr)
        }

        return this.__IWebViewNewWindowRequestedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
