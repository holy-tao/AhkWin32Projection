#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlNewWindowRequestedEventArgs.ahk
#Include .\IWebViewControlNewWindowRequestedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [NewWindowRequested](iwebviewcontrol_newwindowrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnewwindowrequestedeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlNewWindowRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlNewWindowRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlNewWindowRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the [IWebViewControl](iwebviewcontrol.md) is attempting to navigate to.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnewwindowrequestedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the content where the navigation was initiated.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnewwindowrequestedeventargs.referrer
     * @type {Uri} 
     */
    Referrer {
        get => this.get_Referrer()
    }

    /**
     * Gets or sets a value that marks the routed event as handled.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnewwindowrequestedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Provides a new [`WebViewControl`](/uwp/api/windows.web.ui.interop.webviewcontrol) as the target for a `window.open` script call from inside the requesting `WebViewControl`. The content in target webview is always considered cross-origin to the content in opener webview and vice versa and subject to cross-origin restrictions. The `WebViewControl` provided in the `NewWindow` property must be new, running on the same process as the opener webview and cannot have been navigated. Setting the `NewWindow` property takes priority over the `Handled` property. If `NewWindow` is set, then the provided `WebViewControl` is used. If `NewWindow` is not set, then `Handled` is checked to determine behavior for the new window request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnewwindowrequestedeventargs.newwindow
     * @type {IWebViewControl} 
     */
    NewWindow {
        get => this.get_NewWindow()
        set => this.put_NewWindow(value)
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
        if (!this.HasProp("__IWebViewControlNewWindowRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNewWindowRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNewWindowRequestedEventArgs := IWebViewControlNewWindowRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlNewWindowRequestedEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Referrer() {
        if (!this.HasProp("__IWebViewControlNewWindowRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNewWindowRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNewWindowRequestedEventArgs := IWebViewControlNewWindowRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlNewWindowRequestedEventArgs.get_Referrer()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IWebViewControlNewWindowRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNewWindowRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNewWindowRequestedEventArgs := IWebViewControlNewWindowRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlNewWindowRequestedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IWebViewControlNewWindowRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNewWindowRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNewWindowRequestedEventArgs := IWebViewControlNewWindowRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlNewWindowRequestedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {IWebViewControl} 
     */
    get_NewWindow() {
        if (!this.HasProp("__IWebViewControlNewWindowRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNewWindowRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNewWindowRequestedEventArgs2 := IWebViewControlNewWindowRequestedEventArgs2(outPtr)
        }

        return this.__IWebViewControlNewWindowRequestedEventArgs2.get_NewWindow()
    }

    /**
     * 
     * @param {IWebViewControl} value 
     * @returns {HRESULT} 
     */
    put_NewWindow(value) {
        if (!this.HasProp("__IWebViewControlNewWindowRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNewWindowRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNewWindowRequestedEventArgs2 := IWebViewControlNewWindowRequestedEventArgs2(outPtr)
        }

        return this.__IWebViewControlNewWindowRequestedEventArgs2.put_NewWindow(value)
    }

    /**
     * Gets a deferral.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnewwindowrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IWebViewControlNewWindowRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNewWindowRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNewWindowRequestedEventArgs2 := IWebViewControlNewWindowRequestedEventArgs2(outPtr)
        }

        return this.__IWebViewControlNewWindowRequestedEventArgs2.GetDeferral()
    }

;@endregion Instance Methods
}
