#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpRequestResult.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Combines the original HTTP request along with the following: the resulting HTTP response (if any), an extended error value, and a succeeded indication.
 * @remarks
 * A common way to get an HttpRequestResult is from the return value of the [TryDeleteAsync](httpclient_trydeleteasync_2029828064.md), [TryGetAsync](httpclient_trygetasync_641528473.md), [TryPostAsync](httpclient_trypostasync_1613087419.md) ,[TryPutAsync](httpclient_tryputasync_1991770449.md), or [TrySendRequestAsync](httpclient_trysendrequestasync_1392908712.md) methods on the [HttpClient](httpclient.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestresult
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpRequestResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpRequestResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpRequestResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The extended error code for an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets the request message that led to this  [HttpRequestResult](httprequestresult.md).
     * @remarks
     * This property is the request message that led to this response message. For a request sent using [HttpClient](httpclient.md), this property will point to the actual request message leading to the final response. Note that this may not be the same message the user provided when sending the request. This is typically the case if the request needs to be resent due to redirects or authentication. This property can be used to determine what URI actually created the response (useful in case of redirects).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestresult.requestmessage
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
    }

    /**
     * Gets the HTTP response message including headers, the status code, and data.
     * @remarks
     * The response message contains the headers and content sent back from the HTTP server.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestresult.responsemessage
     * @type {HttpResponseMessage} 
     */
    ResponseMessage {
        get => this.get_ResponseMessage()
    }

    /**
     * Gets whether the HTTP request was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IHttpRequestResult")) {
            if ((queryResult := this.QueryInterface(IHttpRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestResult := IHttpRequestResult(outPtr)
        }

        return this.__IHttpRequestResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        if (!this.HasProp("__IHttpRequestResult")) {
            if ((queryResult := this.QueryInterface(IHttpRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestResult := IHttpRequestResult(outPtr)
        }

        return this.__IHttpRequestResult.get_RequestMessage()
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_ResponseMessage() {
        if (!this.HasProp("__IHttpRequestResult")) {
            if ((queryResult := this.QueryInterface(IHttpRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestResult := IHttpRequestResult(outPtr)
        }

        return this.__IHttpRequestResult.get_ResponseMessage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IHttpRequestResult")) {
            if ((queryResult := this.QueryInterface(IHttpRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestResult := IHttpRequestResult(outPtr)
        }

        return this.__IHttpRequestResult.get_Succeeded()
    }

    /**
     * Closes the [HttpRequestResult](httprequestresult.md) instance and releases allocated resources.
     * @remarks
     * The **Close** method releases allocated resources used by the [HttpRequestResult](httprequestresult.md) instance. The **Close** method can manage the lifetime of system resources used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the **Dispose** method. In Visual C++ component extensions (C++/CX), this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources; the object and associated resources don't get released until the garbage collection pass runs. The *Close* method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a **Close** method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestresult.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Returns a string that represents the current [HttpRequestResult](httprequestresult.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestresult.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}
