#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpGetBufferResult.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Combines the final buffer result along with the following: the original HTTP request, the resulting HTTP response (if any), an extended error value, and a succeeded indication.
 * @remarks
 * The HttpGetBufferResult is the return result from a call to **HttpClient** [TryGetBufferAsync](httpclient_trygetbufferasync_1418039801.md)
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpgetbufferresult
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpGetBufferResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpGetBufferResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpGetBufferResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The extended error code for an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpgetbufferresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets the request message that led to this [HttpGetBufferResult](httpgetbufferresult.md).
     * @remarks
     * This property is the request message that led to this response message. For a request sent using [HttpClient](httpclient.md), this property will point to the actual request message leading to the final response. Note that this may not be the same message the user provided when sending the request. This is typically the case if the request needs to be resent due to redirects or authentication. This property can be used to determine what URI actually created the response (useful in case of redirects).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpgetbufferresult.requestmessage
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
    }

    /**
     * Gets the HTTP response message including headers, the status code, and data.
     * @remarks
     * The response message contains the headers and content sent back from the HTTP server.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpgetbufferresult.responsemessage
     * @type {HttpResponseMessage} 
     */
    ResponseMessage {
        get => this.get_ResponseMessage()
    }

    /**
     * Gets whether the HTTP request was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpgetbufferresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * The returned data from an HTTP request as an [IBuffer](../windows.storage.streams/ibuffer.md).
     * @remarks
     * The **IBuffer** will only be available if the HTTP server returned a valid HTTP response and the body of the response could be read.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpgetbufferresult.value
     * @type {IBuffer} 
     */
    Value {
        get => this.get_Value()
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
        if (!this.HasProp("__IHttpGetBufferResult")) {
            if ((queryResult := this.QueryInterface(IHttpGetBufferResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpGetBufferResult := IHttpGetBufferResult(outPtr)
        }

        return this.__IHttpGetBufferResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        if (!this.HasProp("__IHttpGetBufferResult")) {
            if ((queryResult := this.QueryInterface(IHttpGetBufferResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpGetBufferResult := IHttpGetBufferResult(outPtr)
        }

        return this.__IHttpGetBufferResult.get_RequestMessage()
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_ResponseMessage() {
        if (!this.HasProp("__IHttpGetBufferResult")) {
            if ((queryResult := this.QueryInterface(IHttpGetBufferResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpGetBufferResult := IHttpGetBufferResult(outPtr)
        }

        return this.__IHttpGetBufferResult.get_ResponseMessage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IHttpGetBufferResult")) {
            if ((queryResult := this.QueryInterface(IHttpGetBufferResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpGetBufferResult := IHttpGetBufferResult(outPtr)
        }

        return this.__IHttpGetBufferResult.get_Succeeded()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Value() {
        if (!this.HasProp("__IHttpGetBufferResult")) {
            if ((queryResult := this.QueryInterface(IHttpGetBufferResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpGetBufferResult := IHttpGetBufferResult(outPtr)
        }

        return this.__IHttpGetBufferResult.get_Value()
    }

    /**
     * Closes the [HttpGetBufferResult](httpgetbufferresult.md) instance and releases allocated resources.
     * @remarks
     * The **Close** method releases allocated resources used by the [HttpGetBufferResult](httpgetbufferresult.md) instance. The **Close** method can manage the lifetime of system resources used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the **Dispose** method. In Visual C++ component extensions (C++/CX), this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources; the object and associated resources don't get released until the garbage collection pass runs. The **Close** method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a **Close** method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpgetbufferresult.close
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
     * Returns a string that represents the current [HttpGetBufferResult](httpgetbufferresult.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpgetbufferresult.tostring
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
