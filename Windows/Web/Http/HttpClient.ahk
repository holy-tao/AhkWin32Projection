#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpClient.ahk
#Include .\IHttpClient2.ahk
#Include .\IHttpClient3.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpClientFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Sends HTTP requests and receives HTTP responses from a resource identified by a URI. For programming guidance for the **HttpClient** class, and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
 * @remarks
 * The HttpClient class instance acts as a session to send HTTP requests and receive responses. An HttpClient instance is a collection of settings that apply to all requests executed by that instance. In addition, every HttpClient instance uses its own connection pool, isolating its requests from requests executed by other HttpClient instances.
 * 
 * The HttpClient also acts as a class to use with filters for more specific HTTP clients. An example would be an HttpClientFilter that provides additional methods specific to a social network service (a GetFriends method, for instance).
 * 
 * If an app using HttpClient and related classes in the [Windows.Web.Http](windows_web_http.md) namespace downloads large amounts of data (50 megabytes or more), then the app should stream those downloads and not use the default buffering. If the default buffering is used the client memory usage will get very large, potentially resulting in reduced performance.
 * 
 * For sample code in C# and C++/WinRT that shows how to use HttpClient to connect to an HTTP server, see [HttpClient](/windows/uwp/networking/httpclient).
 * 
 * For sample code in JavaScript and HTML that shows how to use HttpClient to connect to an HTTP server, see [Connecting to an HTTP server using Windows.Web.Http](/previous-versions/windows/apps/dn469430(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpClient extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpClient

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpClient.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpClient](httpclient.md) class with a specific filter for handling HTTP response messages. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * If a **null** reference (**Nothing** in Visual Basic) is specified for the filter parameter, the default transport handler for receiving responses with no filter is used.
     * @param {IHttpFilter} filter The HTTP filter to use for handling response messages.
     * @returns {HttpClient} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.#ctor
     */
    static Create(filter) {
        if (!HttpClient.HasProp("__IHttpClientFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpClient")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpClientFactory.IID)
            HttpClient.__IHttpClientFactory := IHttpClientFactory(factoryPtr)
        }

        return HttpClient.__IHttpClientFactory.Create(filter)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a collection of headers that should be sent with each request. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * The DefaultRequestHeaders property returns an [HttpRequestHeaderCollection](../windows.web.http.headers/httprequestheadercollection.md) object that can be used to get or set the specific headers on the [HttpClient](httpclient.md) instance. HTTP headers set on this property will be sent on all request messages sent on this [HttpClient](httpclient.md) instance and don't need to be set on each [HttpRequestMessage](httprequestmessage.md) instance.
     * 
     * The [Headers](httprequestmessage_headers.md) property on the [HttpRequestMessage](httprequestmessage.md) object returns an [HttpRequestHeaderCollection](../windows.web.http.headers/httprequestheadercollection.md) object that can be used to get or set the specific headers on a specific HTTP request.
     * 
     * The DefaultRequestHeaders property represents the headers that an app developer can set, not all of the headers that may eventually be sent with the request. The [HttpBaseProtocolFilter](../windows.web.http.filters/httpbaseprotocolfilter.md) will add some additional headers.
     * 
     * > [!WARNING]
     * > In versions before Windows 10, setting certain headers to NULL caused an empty header value to be set, which caused an unexpected failure in subsequent calls to [GetAsync](/uwp/api/windows.web.http.httpclient.getasync). Starting in Windows 10, setting any of the following headers to NULL causes them to be removed from the request entirely, so that the remaining headers are valid.
     * 
     * + Authorization
     * + Date
     * + From
     * + Host
     * + If-Modified-Since
     * + If-Unmodified-Since
     * + Max-Forwards
     * + Proxy-Authorization
     * + Referer
     * 
     * If you are writing for versions before Windows 10, do not set these header values to NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.defaultrequestheaders
     * @type {HttpRequestHeaderCollection} 
     */
    DefaultRequestHeaders {
        get => this.get_DefaultRequestHeaders()
    }

    /**
     * @type {HSTRING} 
     */
    DefaultPrivacyAnnotation {
        get => this.get_DefaultPrivacyAnnotation()
        set => this.put_DefaultPrivacyAnnotation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [HttpClient](httpclient.md) class. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpClient")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Send a DELETE request to the specified [Uri](../windows.foundation/uri.md) as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpResponseMessage](/uwp/api/windows.web.http.httpresponsemessage) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.deleteasync
     */
    DeleteAsync(uri_) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.DeleteAsync(uri_)
    }

    /**
     * Send a GET request to the specified [Uri](../windows.foundation/uri.md) with an HTTP completion option as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpResponseMessage](/uwp/api/windows.web.http.httpresponsemessage) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes based on the *completionOption* parameter after part or all of the response (including content) is read.
     * 
     * Below are the exceptions that this content throws.
     * @param {Uri} uri_ The [Uri](../windows.foundation/uri.md) the request is sent to.
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.getasync
     */
    GetAsync(uri_) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.GetAsync(uri_)
    }

    /**
     * Send a GET request to the specified Uri as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpResponseMessage](/uwp/api/windows.web.http.httpresponsemessage) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * 
     * For sample code in C#/VB/C++ and XAML that shows how to use [HttpClient](httpclient.md) and GetAsync(Uri) to connect to an HTTP server and send a GET request, see [HttpClient](/windows/uwp/networking/httpclient).
     * 
     * For sample code in JavaScript and HTML that shows how to use [HttpClient](httpclient.md) and GetAsync(Uri) to connect to an HTTP server and send a GET request, see [Connecting to an HTTP server using Windows.Web.Http](/previous-versions/windows/apps/dn469430(v=win.10)).
     * 
     * Below are the exceptions that this function throws.
     * @param {Uri} uri_ The [Uri](../windows.foundation/uri.md) to which the request is to be sent.
     * @param {Integer} completionOption 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.getasync
     */
    GetWithOptionAsync(uri_, completionOption) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.GetWithOptionAsync(uri_, completionOption)
    }

    /**
     * Send a GET request to the specified Uri and return the response body as a buffer in an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This method is commonly called when downloading binary content such as small images and compressed files. Very large binary content should be downloaded as a stream with [HttpClient.GetInputStreamAsync](httpclient_getinputstreamasync_1910746187.md) to prevent unneeded buffering.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IBuffer](/uwp/api/windows.storage.streams.ibuffer) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response body is read.
     * 
     * The [HttpClient](httpclient.md) class is often used by an app to download and then parse text. It is possible that the character encoding specified in the **Content-Type** header by an HTTP server does not match the character encoding of the HTTP response body (the XML encoding in an XML document, for example). One way to use [HttpClient](httpclient.md) with text is to call the [GetStringAsync](httpclient_getstringasync_149346728.md) method and pass the returned string to the text parser. However, this can result in errors if the **Content-Type** is not a type expressible as a string. A reliable way to use [HttpClient](httpclient.md) with an XML parser is to call the GetBufferAsync method and parse the buffer for the "&lt;?xml&gt;" element. Then use the character encoding specified ("&lt;xmlversion="1.0" encoding="UTF-8"?&gt;", for example) to parse the HTTP response body. For other text formats, similar methods can be used where the app scans the initial part of the HTTP response body to determine the character encoding used.
     * 
     * Below are the exceptions that this function throws.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @returns {IAsyncOperationWithProgress<IBuffer, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.getbufferasync
     */
    GetBufferAsync(uri_) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.GetBufferAsync(uri_)
    }

    /**
     * Send a GET request to the specified [Uri](../windows.foundation/uri.md) and return the response body as a stream in an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IInputStream](/uwp/api/windows.storage.streams.iinputstream) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response body is read. This method does not buffer the stream, so this method can support long streams of arbitrary length.
     * 
     * Below are the exceptions that this function throws.
     * @param {Uri} uri_ The [Uri](../windows.foundation/uri.md) the request is sent to.
     * @returns {IAsyncOperationWithProgress<IInputStream, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.getinputstreamasync
     */
    GetInputStreamAsync(uri_) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.GetInputStreamAsync(uri_)
    }

    /**
     * Send a GET request to the specified Uri and return the response body as a string in an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of string and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response body is read.
     * 
     * The [HttpClient](httpclient.md) class is often used by an app to download and then parse text. It is possible that the character encoding specified in the **Content-Type** header by an HTTP server does not match the character encoding of the HTTP response body (the XML encoding in an XML document, for example). One way to use [HttpClient](httpclient.md) with text is to call the GetStringAsync method and pass the returned string to the text parser. However, this can result in errors if the **Content-Type** is not a type expressible as a string. A reliable way to use [HttpClient](httpclient.md) with an XML parser is to call the [GetBufferAsync](httpclient_getbufferasync_894906839.md) method and parse the buffer for the "&lt;?xml&gt;" element. Then use the character encoding specified ("&lt;xmlversion="1.0" encoding="UTF-8"?&gt;", for example) to parse the HTTP response body. For other text formats, similar methods can be used where the app scans the initial part of the HTTP response body to determine the character encoding used.
     * 
     * Below are the exceptions that this function throws.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @returns {IAsyncOperationWithProgress<HSTRING, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.getstringasync
     */
    GetStringAsync(uri_) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.GetStringAsync(uri_)
    }

    /**
     * Send a POST request to the specified URI as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of[HttpResponseMessage](/uwp/api/windows.web.http.httpresponsemessage) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * 
     * The PostAsync and [PutAsync](httpclient_putasync_552115331.md) methods only allow setting a limited number of HTTP content headers. In contrast, the [SendRequestAsync](httpclient_sendrequestasync_234300504.md) method allows setting headers on the request message as well as on the HTTP content to be sent.
     * 
     * Below are the exceptions that this function throws.
     * @param {Uri} uri_ The URI the request is sent to.
     * @param {IHttpContent} content The HTTP request content to send to the server.
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.postasync
     */
    PostAsync(uri_, content) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.PostAsync(uri_, content)
    }

    /**
     * Send a PUT request to the specified Uri as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpResponseMessage](/uwp/api/windows.web.http.httpresponsemessage) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * 
     * The PutAsync and [PostAsync](httpclient_postasync_1466488101.md) methods only allow setting a limited number of HTTP content headers. In contrast, the [SendRequestAsync](/uwp/api/windows.web.http.httpclient.sendrequestasync) method allows setting headers on the request message as well as on the HTTP content to be sent.
     * 
     * Below are the exceptions that this function throws.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @param {IHttpContent} content The HTTP request content to send to the server.
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.putasync
     */
    PutAsync(uri_, content) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.PutAsync(uri_, content)
    }

    /**
     * Send an HTTP request with an HTTP completion option as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpResponseMessage](/uwp/api/windows.web.http.httpresponsemessage) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes depending on the value of the *completionOption* parameter.
     * 
     * The [HttpRequestMessage](httprequestmessage.md) passed in the *request* parameter allows the SendRequestAsync method to set headers on the request message as well as on the HTTP content to be sent. In contrast, the [PostAsync](httpclient_postasync_1466488101.md) and [PutAsync](httpclient_putasync_552115331.md) methods only allow setting a more limited set of HTTP content headers.
     * 
     * Below are the exceptions that this function throws.
     * @param {HttpRequestMessage} request The HTTP request message to send.
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.sendrequestasync
     */
    SendRequestAsync(request) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.SendRequestAsync(request)
    }

    /**
     * Send an HTTP request as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpResponseMessage](/uwp/api/windows.web.http.httpresponsemessage) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * 
     * The [HttpRequestMessage](httprequestmessage.md) passed in the *request* parameter allows the SendRequestAsync method to set headers on the request message as well as on the HTTP content to be sent. In contrast, the [PostAsync](httpclient_postasync_1466488101.md) and [PutAsync](httpclient_putasync_552115331.md) methods only allow setting a more limited set of HTTP content headers.
     * 
     * Below are the exceptions that this function throws.
     * @param {HttpRequestMessage} request The HTTP request message to send.
     * @param {Integer} completionOption 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.sendrequestasync
     */
    SendRequestWithOptionAsync(request, completionOption) {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.SendRequestWithOptionAsync(request, completionOption)
    }

    /**
     * 
     * @returns {HttpRequestHeaderCollection} 
     */
    get_DefaultRequestHeaders() {
        if (!this.HasProp("__IHttpClient")) {
            if ((queryResult := this.QueryInterface(IHttpClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient := IHttpClient(outPtr)
        }

        return this.__IHttpClient.get_DefaultRequestHeaders()
    }

    /**
     * Send a DELETE request to the specified [Uri](../windows.foundation/uri.md) as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not throw an exception on network errors. Instead you should examine the [HttpRequestResult](httprequestresult.md) to learn about the original HTTP request, the resulting HTTP response (if any) and error (if any). This operation will throw when the operation is canceled.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpRequestResult](/uwp/api/windows.web.http.httprequestresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trydeleteasync
     */
    TryDeleteAsync(uri_) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TryDeleteAsync(uri_)
    }

    /**
     * Sends a GET request to the specified [Uri](../windows.foundation/uri.md) as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not throw an exception on network errors. Instead you should examine the [HttpRequestResult](httprequestresult.md) to learn about the original HTTP request, the resulting HTTP response (if any) and error (if any). This operation will throw when the operation is canceled.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpRequestResult](/uwp/api/windows.web.http.httprequestresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes based on the *completionOption* parameter after part or all of the response (including content) is read.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trygetasync
     */
    TryGetAsync(uri_) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TryGetAsync(uri_)
    }

    /**
     * Sends a GET request to the specified [Uri](../windows.foundation/uri.md) as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not throw an exception on network errors. Instead you should examine the [HttpRequestResult](httprequestresult.md) to learn about the original HTTP request, the resulting HTTP response (if any) and error (if any). This operation will throw when the operation is canceled.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpRequestResult](/uwp/api/windows.web.http.httprequestresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @param {Integer} completionOption 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trygetasync
     */
    TryGetAsync2(uri_, completionOption) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TryGetAsync2(uri_, completionOption)
    }

    /**
     * Send a GET request to the specified Uri and return the response body as [HttpGetBufferResult](httpgetbufferresult.md) with an IBuffer value in an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This method is commonly called when downloading binary content such as small images and compressed files. Very large binary content should be downloaded as a stream with [HttpClient.TryGetInputStreamAsync](httpclient_trygetinputstreamasync_434735070.md) to prevent unneeded buffering.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpGetBufferResult](/uwp/api/windows.web.http.httpgetbufferresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response body is read.
     * 
     * The [HttpClient](httpclient.md) class is often used by an app to download and then parse text. It is possible that the character encoding specified in the **Content-Type** header by an HTTP server does not match the character encoding of the HTTP response body (the XML encoding in an XML document, for example). One way to use [HttpClient](httpclient.md) with text is to call the [TryGetStringAsync](httpclient_trygetstringasync_236582977.md) method and pass the returned string to the text parser. However, this can result in errors if the **Content-Type** is not a type expressible as a string. A reliable way to use [HttpClient](httpclient.md) with an XML parser is to call the TryGetBufferAsync method and parse the buffer for the "&lt;?xml&gt;" element. Then use the character encoding specified ("&lt;xmlversion="1.0" encoding="UTF-8"?&gt;", for example) to parse the HTTP response body. For other text formats, similar methods can be used where the app scans the initial part of the HTTP response body to determine the character encoding used.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @returns {IAsyncOperationWithProgress<HttpGetBufferResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trygetbufferasync
     */
    TryGetBufferAsync(uri_) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TryGetBufferAsync(uri_)
    }

    /**
     * Send a GET request to the specified [Uri](../windows.foundation/uri.md) and return the response body as a stream in an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpGetInputStreamResult](/uwp/api/windows.web.http.httpgetinputstreamresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response body is read. This method does not buffer the stream, so this method can support long streams of arbitrary length.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @returns {IAsyncOperationWithProgress<HttpGetInputStreamResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trygetinputstreamasync
     */
    TryGetInputStreamAsync(uri_) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TryGetInputStreamAsync(uri_)
    }

    /**
     * Send a GET request to the specified Uri and return the response body as a string in an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpGetStringResult](/uwp/api/windows.web.http.httpgetstringresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response body is read.
     * 
     * The [HttpClient](httpclient.md) class is often used by an app to download and then parse text. It is possible that the character encoding specified in the **Content-Type** header by an HTTP server does not match the character encoding of the HTTP response body (the XML encoding in an XML document, for example). One way to use [HttpClient](httpclient.md) with text is to call the TryGetStringAsync method and pass the returned string to the text parser. However, this can result in errors if the **Content-Type** is not a type expressible as a string. A reliable way to use [HttpClient](httpclient.md) with an XML parser is to call the [TryGetBufferAsync](httpclient_trygetbufferasync_1418039801.md) method and parse the buffer for the "&lt;?xml&gt;" element. Then use the character encoding specified ("&lt;xmlversion="1.0" encoding="UTF-8"?&gt;", for example) to parse the HTTP response body. For other text formats, similar methods can be used where the app scans the initial part of the HTTP response body to determine the character encoding used.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @returns {IAsyncOperationWithProgress<HttpGetStringResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trygetstringasync
     */
    TryGetStringAsync(uri_) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TryGetStringAsync(uri_)
    }

    /**
     * Sends a POST request to the specified [Uri](../windows.foundation/uri.md) as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not throw an exception on network errors. Instead you should examine the [HttpRequestResult](httprequestresult.md) to learn about the original HTTP request, the resulting HTTP response (if any) and error (if any). This operation will throw when the operation is canceled.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpRequestResult](/uwp/api/windows.web.http.httprequestresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * 
     * The [TryPutAsync](httpclient_tryputasync_1991770449.md) and TryPostAsync methods only allow setting a limited number of HTTP content headers. In contrast, the [TrySendRequestAsync](httpclient_trysendrequestasync_1392908712.md) method allows setting headers on the request message as well as on the HTTP content to be sent.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @param {IHttpContent} content The HTTP request content to send to the server.
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trypostasync
     */
    TryPostAsync(uri_, content) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TryPostAsync(uri_, content)
    }

    /**
     * Sends a PUT request to the specified [Uri](../windows.foundation/uri.md) as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not throw an exception on network errors. Instead you should examine the [HttpRequestResult](httprequestresult.md) to learn about the original HTTP request, the resulting HTTP response (if any) and error (if any). This operation will throw when the operation is canceled.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpRequestResult](/uwp/api/windows.web.http.httprequestresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * @param {Uri} uri_ The Uri the request is sent to.
     * @param {IHttpContent} content The HTTP request content to send to the server.
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.tryputasync
     */
    TryPutAsync(uri_, content) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TryPutAsync(uri_, content)
    }

    /**
     * Sends an HTTP request with a completion option to the specified [Uri](../windows.foundation/uri.md) as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not throw an exception on network errors. Instead you should examine the [HttpRequestResult](httprequestresult.md) to learn about the original HTTP request, the resulting HTTP response (if any) and error (if any). This operation will throw when the operation is canceled.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpRequestResult](/uwp/api/windows.web.http.httprequestresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes based on the *completionOption* parameter after part or all of the response (including content) is read.
     * @param {HttpRequestMessage} request The HTTP request message to send.
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trysendrequestasync
     */
    TrySendRequestAsync(request) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TrySendRequestAsync(request)
    }

    /**
     * Sends an HTTP request to the specified [Uri](../windows.foundation/uri.md) as an asynchronous operation. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * This operation will not throw an exception on network errors. Instead you should examine the [HttpRequestResult](httprequestresult.md) to learn about the original HTTP request, the resulting HTTP response (if any) and error (if any). This operation will throw when the operation is canceled.
     * 
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpRequestResult](/uwp/api/windows.web.http.httprequestresult) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes after the whole response (including content) is read.
     * @param {HttpRequestMessage} request The HTTP request message to send.
     * @param {Integer} completionOption 
     * @returns {IAsyncOperationWithProgress<HttpRequestResult, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.trysendrequestasync
     */
    TrySendRequestAsync2(request, completionOption) {
        if (!this.HasProp("__IHttpClient2")) {
            if ((queryResult := this.QueryInterface(IHttpClient2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient2 := IHttpClient2(outPtr)
        }

        return this.__IHttpClient2.TrySendRequestAsync2(request, completionOption)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DefaultPrivacyAnnotation() {
        if (!this.HasProp("__IHttpClient3")) {
            if ((queryResult := this.QueryInterface(IHttpClient3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient3 := IHttpClient3(outPtr)
        }

        return this.__IHttpClient3.get_DefaultPrivacyAnnotation()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DefaultPrivacyAnnotation(value) {
        if (!this.HasProp("__IHttpClient3")) {
            if ((queryResult := this.QueryInterface(IHttpClient3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpClient3 := IHttpClient3(outPtr)
        }

        return this.__IHttpClient3.put_DefaultPrivacyAnnotation(value)
    }

    /**
     * Closes the [HttpClient](httpclient.md) instance and releases allocated resources. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @remarks
     * The Close method releases allocated resources used by the [HttpClient](httpclient.md) instance. The Close method can manage the lifetime of system resources (the underlying socket and memory for the [HttpClient](httpclient.md), for example) used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the [Dispose](/uwp/api/windows.web.http.httpclient.dispose) method. In Visual C++ component extensions (C++/CX), this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources. So the [HttpClient](httpclient.md) object and associated resources don't get released until the garbage collection pass runs. The Close method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a Close method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.close
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
     * Returns a string that represents the current [HttpClient](httpclient.md) object. For programming guidance for the [HttpClient class](/uwp/api/windows.web.http.httpclient), and code examples, see the [HttpClient](/windows/uwp/networking/httpclient) conceptual topic.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpclient.tostring
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
