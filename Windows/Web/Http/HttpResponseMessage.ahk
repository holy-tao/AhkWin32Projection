#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpResponseMessage.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpResponseMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an HTTP response message including headers, the status code, and data.
 * @remarks
 * A common way to get an HttpResponseMessage is from the return value of one of the [DeleteAsync](httpclient_deleteasync_820543917.md), [GetAsync](httpclient_getasync_1105627628.md), [PostAsync](httpclient_postasync_1466488101.md) , [PutAsync](httpclient_putasync_552115331.md), or [SendRequestAsync](httpclient_sendrequestasync_234300504.md) methods on the [HttpClient](httpclient.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpResponseMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpResponseMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpResponseMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpResponseMessage](httpresponsemessage.md) class with a specific [HttpStatusCode](httpstatuscode.md).
     * @param {Integer} statusCode_ The status code of the HTTP response.
     * @returns {HttpResponseMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.#ctor
     */
    static Create(statusCode_) {
        if (!HttpResponseMessage.HasProp("__IHttpResponseMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpResponseMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpResponseMessageFactory.IID)
            HttpResponseMessage.__IHttpResponseMessageFactory := IHttpResponseMessageFactory(factoryPtr)
        }

        return HttpResponseMessage.__IHttpResponseMessageFactory.Create(statusCode_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content of the HTTP response message on the [HttpResponseMessage](httpresponsemessage.md) object.
     * @remarks
     * The content of an HTTP response message corresponds to the entity body defined in [RFC 2616](https://tools.ietf.org/html/rfc2616).
     * 
     * A number of classes and an interface can be used for HTTP content. These include the following.
     * 
     * 
     * + [IHttpContent](ihttpcontent.md) - a base interface representing an HTTP entity body and content headers.
     * + [HttpBufferContent](httpbuffercontent.md) - HTTP content based on a stream.
     * + [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) - HTTP content based on name/value data encoded using application/x-www-form-urlencoded MIME type.
     * + [HttpStreamContent](httpstreamcontent.md) - HTTP content based on a stream.
     * + [HttpStringContent](httpstringcontent.md) - HTTP content based on a string.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.content
     * @type {IHttpContent} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets the collection of HTTP response headers associated with the [HttpResponseMessage](httpresponsemessage.md) that were sent by the server.
     * @remarks
     * The Headers property returns an [HttpResponseHeaderCollection](../windows.web.http.headers/httpresponseheadercollection.md) object that can be used to get or set the specific headers on the HTTP response.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.headers
     * @type {HttpResponseHeaderCollection} 
     */
    Headers {
        get => this.get_Headers()
    }

    /**
     * Gets a value that indicates whether the HTTP response was successful.
     * @remarks
     * If the server doesn't return a successful [HttpStatusCode](httpstatuscode.md) in the **Successful** range (200-299) for the request, then the [HttpResponseMessage.IsSuccessStatusCode](/uwp/api/windows.web.http.httpresponsemessage.issuccessstatuscode) property is set to `false`.
     * 
     * Calling [HttpResponseMessage.EnsureSuccessStatusCode](/uwp/api/windows.web.http.httpresponsemessage.ensuresuccessstatuscode) causes the value of **IsSuccessStatusCode** to be checked, and an exception thrown if that value is `false`.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.issuccessstatuscode
     * @type {Boolean} 
     */
    IsSuccessStatusCode {
        get => this.get_IsSuccessStatusCode()
    }

    /**
     * Gets or sets the reason phrase which typically is sent by servers together with the status code.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.reasonphrase
     * @type {HSTRING} 
     */
    ReasonPhrase {
        get => this.get_ReasonPhrase()
        set => this.put_ReasonPhrase(value)
    }

    /**
     * Gets or sets the request message that led to this response message.
     * @remarks
     * This property is the request message that led to this response message. For a request sent using [HttpClient](httpclient.md), this property will point to the actual request message leading to the final response. Note that this may not be the same message the user provided when sending the request. This is typically the case if the request needs to be resent due to redirects or authentication. This property can be used to determine what URI actually created the response (useful in case of redirects).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.requestmessage
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
        set => this.put_RequestMessage(value)
    }

    /**
     * Gets the source of the data received in the [HttpResponseMessage](httpresponsemessage.md).
     * @remarks
     * The Source property indicates whether the data received in the [HttpResponseMessage](httpresponsemessage.md) was from the local cache or was received over the network.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.source
     * @type {Integer} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets the status code of the HTTP response.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.statuscode
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
        set => this.put_StatusCode(value)
    }

    /**
     * Gets or sets the HTTP protocol version used on the [HttpResponseMessage](httpresponsemessage.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.version
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [HttpResponseMessage](httpresponsemessage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpResponseMessage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {IHttpContent} 
     */
    get_Content() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.get_Content()
    }

    /**
     * 
     * @param {IHttpContent} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.put_Content(value)
    }

    /**
     * 
     * @returns {HttpResponseHeaderCollection} 
     */
    get_Headers() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.get_Headers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuccessStatusCode() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.get_IsSuccessStatusCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ReasonPhrase() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.get_ReasonPhrase()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ReasonPhrase(value) {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.put_ReasonPhrase(value)
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.get_RequestMessage()
    }

    /**
     * 
     * @param {HttpRequestMessage} value 
     * @returns {HRESULT} 
     */
    put_RequestMessage(value) {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.put_RequestMessage(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Source() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.get_Source()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.put_Source(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.get_StatusCode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StatusCode(value) {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.put_StatusCode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.get_Version()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Version(value) {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.put_Version(value)
    }

    /**
     * Throws an exception if the [HttpResponseMessage.IsSuccessStatusCode](/uwp/api/windows.web.http.httpresponsemessage.issuccessstatuscode) property for the HTTP response object is `false`; if it's `true`, then no exception is thrown.
     * @remarks
     * If the server doesn't return a successful [HttpStatusCode](httpstatuscode.md) in the **Successful** range (200-299) for the request, then the [HttpResponseMessage.IsSuccessStatusCode](/uwp/api/windows.web.http.httpresponsemessage.issuccessstatuscode) property is set to `false`. Calling **EnsureSuccessStatusCode** causes the value of **IsSuccessStatusCode** to be checked, and an exception thrown if that value is `false`. No exception is thrown if the value is `true`.
     * 
     * Any exception thrown is specific to the Windows Runtime language projection that you're programming in. For C#, for example, a **System.Exception** is thrown, and that exception includes an **HRESULT** that encodes the original HTTP error. For example, if the **HRESULT** is 0x80190194, then remove the 0x8019000 to give 0x00000194, which is decimal 404.
     * 
     * To avoid dealing with exceptions, check the [HttpResponseMessage.IsSuccessStatusCode](/uwp/api/windows.web.http.httpresponsemessage.issuccessstatuscode) property instead of calling **EnsureSuccessStatusCode**.
     * @returns {HttpResponseMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.ensuresuccessstatuscode
     */
    EnsureSuccessStatusCode() {
        if (!this.HasProp("__IHttpResponseMessage")) {
            if ((queryResult := this.QueryInterface(IHttpResponseMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseMessage := IHttpResponseMessage(outPtr)
        }

        return this.__IHttpResponseMessage.EnsureSuccessStatusCode()
    }

    /**
     * Closes the [HttpResponseMessage](httpresponsemessage.md) instance and releases allocated resources.
     * @remarks
     * The **Close** method releases allocated resources used by the [HttpResponseMessage](httpresponsemessage.md) instance. The **Close** method can manage the lifetime of system resources (memory for the [HttpResponseMessage](httpresponsemessage.md), for example) used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the [Dispose](/uwp/api/windows.web.http.httpresponsemessage.dispose) method. In Visual C++ component extensions (C++/CX), this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources. So the [HttpResponseMessage](httpresponsemessage.md) object and associated resources don't get released until the garbage collection pass runs. The **Close** method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a **Close** method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.close
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
     * Returns a string that represents the current [HttpResponseMessage](httpresponsemessage.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessage.tostring
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
