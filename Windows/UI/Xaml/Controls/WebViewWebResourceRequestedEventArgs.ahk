#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewWebResourceRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [WebView.WebResourceRequested](webview_webresourcerequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewwebresourcerequestedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewWebResourceRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewWebResourceRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewWebResourceRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the web resource request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewwebresourcerequestedeventargs.request
     * @type {HttpRequestMessage} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * Gets or sets the response to the web resource request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewwebresourcerequestedeventargs.response
     * @type {HttpResponseMessage} 
     */
    Response {
        get => this.get_Response()
        set => this.put_Response(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_Request() {
        if (!this.HasProp("__IWebViewWebResourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewWebResourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewWebResourceRequestedEventArgs := IWebViewWebResourceRequestedEventArgs(outPtr)
        }

        return this.__IWebViewWebResourceRequestedEventArgs.get_Request()
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_Response() {
        if (!this.HasProp("__IWebViewWebResourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewWebResourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewWebResourceRequestedEventArgs := IWebViewWebResourceRequestedEventArgs(outPtr)
        }

        return this.__IWebViewWebResourceRequestedEventArgs.get_Response()
    }

    /**
     * 
     * @param {HttpResponseMessage} value 
     * @returns {HRESULT} 
     */
    put_Response(value) {
        if (!this.HasProp("__IWebViewWebResourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewWebResourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewWebResourceRequestedEventArgs := IWebViewWebResourceRequestedEventArgs(outPtr)
        }

        return this.__IWebViewWebResourceRequestedEventArgs.put_Response(value)
    }

    /**
     * Gets a deferral object for managing the work done in the WebResourceRequested event handler.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewwebresourcerequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IWebViewWebResourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewWebResourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewWebResourceRequestedEventArgs := IWebViewWebResourceRequestedEventArgs(outPtr)
        }

        return this.__IWebViewWebResourceRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
