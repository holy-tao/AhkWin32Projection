#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlWebResourceRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data to the [Windows.Web.UI.IWebViewControl.WebResourceRequested](iwebviewcontrol_webresourcerequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolwebresourcerequestedeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlWebResourceRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlWebResourceRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlWebResourceRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the intercepted HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolwebresourcerequestedeventargs.request
     * @type {HttpRequestMessage} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * Gets or sets the HTTP response that will be sent to the [Windows.Web.UI.IWebViewControl](iwebviewcontrol.md)
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolwebresourcerequestedeventargs.response
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
     * Gets a deferral.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolwebresourcerequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IWebViewControlWebResourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlWebResourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlWebResourceRequestedEventArgs := IWebViewControlWebResourceRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlWebResourceRequestedEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_Request() {
        if (!this.HasProp("__IWebViewControlWebResourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlWebResourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlWebResourceRequestedEventArgs := IWebViewControlWebResourceRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlWebResourceRequestedEventArgs.get_Request()
    }

    /**
     * 
     * @param {HttpResponseMessage} value 
     * @returns {HRESULT} 
     */
    put_Response(value) {
        if (!this.HasProp("__IWebViewControlWebResourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlWebResourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlWebResourceRequestedEventArgs := IWebViewControlWebResourceRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlWebResourceRequestedEventArgs.put_Response(value)
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_Response() {
        if (!this.HasProp("__IWebViewControlWebResourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlWebResourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlWebResourceRequestedEventArgs := IWebViewControlWebResourceRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlWebResourceRequestedEventArgs.get_Response()
    }

;@endregion Instance Methods
}
