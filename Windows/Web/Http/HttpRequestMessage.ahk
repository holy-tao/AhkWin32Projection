#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpRequestMessage.ahk
#Include .\IHttpRequestMessage2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpRequestMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an HTTP request message including headers.
 * @remarks
 * The HttpRequestMessage class contains headers, the HTTP verb, and potentially data. This class is commonly used by developers who need additional control over HTTP requests. Common examples include the following:
 * + To examine the underlying SSL/TLS transport information.
 * + To use a less-common HTTP method.
 * + To explicitly set request properties on the HttpRequestMessage.
 * 
 * 
 * In these cases, an app uses one of the [HttpRequestMessage](httpclient_httpclient_1221375020.md) constructors to create an HttpRequestMessage instance. The app sets various properties on the HttpRequestMessage as needed. Then the HttpRequestMessage is passed as a parameter to one of the [HttpClient.SendRequestAsync](httpclient_sendrequestasync_234300504.md) methods.
 * 
 * A number of convenience methods on the [HttpClient](httpclient.md) class automatically create an HttpRequestMessage object for the app. These methods include the following:
 * + [DeleteAsync](httpclient_deleteasync_820543917.md).
 * + The [GetAsync](httpclient_getasync_1105627628.md) methods.
 * + [GetBufferAsync](httpclient_getbufferasync_894906839.md).
 * + [GetInputStreamAsync](httpclient_getinputstreamasync_1910746187.md).
 * + [GetStringAsync](httpclient_getstringasync_149346728.md).
 * + [PostAsync](httpclient_postasync_1466488101.md).
 * + [PutAsync](httpclient_putasync_552115331.md).
 * 
 * 
 * Any filters that you add to the filter pipeline will be passed the HttpRequestMessage object whether it was explicitly specified by the app or was automatically constructed for you.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpRequestMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpRequestMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpRequestMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpRequestMessage](httprequestmessage.md) class with an HTTP method and a request [Uri](../windows.foundation/uri.md).
     * @param {HttpMethod} method The HTTP method to perform
     * @param {Uri} uri_ The [Uri](../windows.foundation/uri.md) to request.
     * @returns {HttpRequestMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.#ctor
     */
    static Create(method, uri_) {
        if (!HttpRequestMessage.HasProp("__IHttpRequestMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpRequestMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpRequestMessageFactory.IID)
            HttpRequestMessage.__IHttpRequestMessageFactory := IHttpRequestMessageFactory(factoryPtr)
        }

        return HttpRequestMessage.__IHttpRequestMessageFactory.Create(method, uri_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the HTTP content to send to the server on the [HttpRequestMessage](httprequestmessage.md) object.
     * @remarks
     * The content of an HTTP request message corresponds to the entity body defined in RFC 2616.
     * 
     * A number of classes and an interface can be used for HTTP content. These include the following.
     * 
     * 
     * + [IHttpContent](ihttpcontent.md) - a base interface representing an HTTP entity body and content headers.
     * + [HttpBufferContent](httpbuffercontent.md) - HTTP content based on a stream.
     * + [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) - HTTP content based on name/value data encoded using application/x-www-form-urlencoded MIME type.
     * + [HttpMultipartContent](httpmultipartcontent.md) - HTTP content that uses multipart// MIME type.
     * + [HttpMultipartFormDataContent](httpmultipartformdatacontent.md) - HTTP content that uses the encoded multipart/form-data MIME type.
     * + [HttpStreamContent](httpstreamcontent.md) - HTTP content based on a stream.
     * + [HttpStringContent](httpstringcontent.md) - HTTP content based on a string.
     * 
     * 
     * A number of [HttpClient](httpclient.md) methods don't need to set the Content property on the [HttpRequestMessage](httprequestmessage.md). These include the following:
     * + The [HttpClient.GetAsync](/uwp/api/windows.web.http.httpclient.getasync) methods.
     * + [HttpClient.GetBufferAsync](httpclient_getbufferasync_894906839.md).
     * + [HttpClient.GetInputStreamAsync](httpclient_getinputstreamasync_1910746187.md).
     * + [HttpClient.GetStringAsync](httpclient_getstringasync_149346728.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.content
     * @type {IHttpContent} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets the collection of the HTTP request headers associated with the [HttpRequestMessage](httprequestmessage.md).
     * @remarks
     * The Headers property returns an [HttpRequestHeaderCollection](../windows.web.http.headers/httprequestheadercollection.md) object that can be used to get or set the specific headers on the HTTP request.
     * 
     * The Headers property represents the headers that an app developer can set, not all of the headers that may eventually be sent with the request. The [HttpBaseProtocolFilter](../windows.web.http.filters/httpbaseprotocolfilter.md) will add some additional headers.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.headers
     * @type {HttpRequestHeaderCollection} 
     */
    Headers {
        get => this.get_Headers()
    }

    /**
     * Gets or sets the HTTP method to be performed on the request URI.
     * @remarks
     * The standard HTTP methods include CONNECT, DELETE, GET, HEAD, OPTIONS, POST, PUT, and TRACE.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.method
     * @type {HttpMethod} 
     */
    Method {
        get => this.get_Method()
        set => this.put_Method(value)
    }

    /**
     * Gets a set of properties on the [HttpRequestMessage](httprequestmessage.md) instance that are for use by the developer.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.properties
     * @type {IMap<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets or sets the [Uri](../windows.foundation/uri.md) used for the [HttpRequestMessage](httprequestmessage.md) object.
     * @remarks
     * The *value* of the RequestUri must not be a relative [Uri](../windows.foundation/uri.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.requesturi
     * @type {Uri} 
     */
    RequestUri {
        get => this.get_RequestUri()
        set => this.put_RequestUri(value)
    }

    /**
     * Get information about the underlying transport socket used by an HTTP connection.
     * @remarks
     * The primary use of the TransportInformation property is to get SSL information when SSL is used for the HTTP connection. This is commonly used to get the SSL certificate from the server or to view a list of errors that occurred when making an SSL connection.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.transportinformation
     * @type {HttpTransportInformation} 
     */
    TransportInformation {
        get => this.get_TransportInformation()
    }

    /**
     * @type {HSTRING} 
     */
    PrivacyAnnotation {
        get => this.get_PrivacyAnnotation()
        set => this.put_PrivacyAnnotation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [HttpRequestMessage](httprequestmessage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpRequestMessage")
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
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.get_Content()
    }

    /**
     * 
     * @param {IHttpContent} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.put_Content(value)
    }

    /**
     * 
     * @returns {HttpRequestHeaderCollection} 
     */
    get_Headers() {
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.get_Headers()
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    get_Method() {
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.get_Method()
    }

    /**
     * 
     * @param {HttpMethod} value 
     * @returns {HRESULT} 
     */
    put_Method(value) {
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.put_Method(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.get_Properties()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RequestUri() {
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.get_RequestUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_RequestUri(value) {
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.put_RequestUri(value)
    }

    /**
     * 
     * @returns {HttpTransportInformation} 
     */
    get_TransportInformation() {
        if (!this.HasProp("__IHttpRequestMessage")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage := IHttpRequestMessage(outPtr)
        }

        return this.__IHttpRequestMessage.get_TransportInformation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrivacyAnnotation() {
        if (!this.HasProp("__IHttpRequestMessage2")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage2 := IHttpRequestMessage2(outPtr)
        }

        return this.__IHttpRequestMessage2.get_PrivacyAnnotation()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PrivacyAnnotation(value) {
        if (!this.HasProp("__IHttpRequestMessage2")) {
            if ((queryResult := this.QueryInterface(IHttpRequestMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestMessage2 := IHttpRequestMessage2(outPtr)
        }

        return this.__IHttpRequestMessage2.put_PrivacyAnnotation(value)
    }

    /**
     * Closes the [HttpRequestMessage](httprequestmessage.md) instance and releases allocated resources.
     * @remarks
     * The Close method releases allocated resources used by the [HttpRequestMessage](httprequestmessage.md) instance. The Close method can manage the lifetime of system resources (memory for the [HttpRequestMessage](httprequestmessage.md), for example) used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the [Dispose](/uwp/api/windows.web.http.httprequestmessage.dispose) method. In Visual C++ component extensions (C++/CX), this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources. So the [HttpRequestMessage](httprequestmessage.md) object and associated resources don't get released until the garbage collection pass runs. The Close method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a Close method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.close
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
     * Returns a string that represents the current [HttpRequestMessage](httprequestmessage.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httprequestmessage.tostring
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
