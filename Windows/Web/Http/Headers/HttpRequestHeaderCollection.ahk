#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IHttpRequestHeaderCollection.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a collection of the HTTP headers associated with an HTTP request.
 * @remarks
 * The HttpRequestHeaderCollection is a collection of the HTTP headers associated with an HTTP request. The HttpRequestHeaderCollection object can be used to get or set the specific headers on an HTTP request. Most of the properties on the HttpRequestHeaderCollection object provide access to the value of a specific HTTP header.
 * 
 * The [Headers](../windows.web.http/httprequestmessage_headers.md) property on [HttpRequestMessage](../windows.web.http/httprequestmessage.md) returns an HttpRequestHeaderCollection object. The [DefaultRequestHeaders](../windows.web.http/httpclient_defaultrequestheaders.md) property on [HttpClient](../windows.web.http/httpclient.md) also returns an HttpRequestHeaderCollection object. These are the two methods to construct an HttpRequestHeaderCollection object.
 * 
 * The HttpRequestHeaderCollection represents HTTP headers on an HTTP request that an app developer can set, not all of the headers that may eventually be sent with the request. The [HttpBaseProtocolFilter](../windows.web.http.filters/httpbaseprotocolfilter.md) will add some additional headers.
 * 
 * Headers on an HTTP request can be changed by the underlying stack. This would be why an app might want to get a header value from the HttpRequestHeaderCollection after the request has completed.
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpRequestHeaderCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpRequestHeaderCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpRequestHeaderCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md) of [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) objects that represent the value of an **Accept** HTTP header on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.accept
     * @type {HttpMediaTypeWithQualityHeaderValueCollection} 
     */
    Accept {
        get => this.get_Accept()
    }

    /**
     * Gets the [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md) of [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) objects that represent the value of an **Accept-Encoding** HTTP header on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.acceptencoding
     * @type {HttpContentCodingWithQualityHeaderValueCollection} 
     */
    AcceptEncoding {
        get => this.get_AcceptEncoding()
    }

    /**
     * Gets the [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md) of [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) objects that represent the value of an **Accept-Language** HTTP header on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.acceptlanguage
     * @type {HttpLanguageRangeWithQualityHeaderValueCollection} 
     */
    AcceptLanguage {
        get => this.get_AcceptLanguage()
    }

    /**
     * Gets or sets the [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) object that represents the value of an **Authorization** HTTP header on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.authorization
     * @type {HttpCredentialsHeaderValue} 
     */
    Authorization {
        get => this.get_Authorization()
        set => this.put_Authorization(value)
    }

    /**
     * Gets the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md) that represents the value of a **Cache-Control** HTTP header on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.cachecontrol
     * @type {HttpCacheDirectiveHeaderValueCollection} 
     */
    CacheControl {
        get => this.get_CacheControl()
    }

    /**
     * Gets the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md) of [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) objects that represent the value of a **Connection** HTTP header on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.connection
     * @type {HttpConnectionOptionHeaderValueCollection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * Gets the [HttpCookiePairHeaderValueCollection](httpcookiepairheadervaluecollection.md) of [HttpCookiePairHeaderValue](httpcookiepairheadervalue.md) objects that represent the value of an **Cookie** HTTP header sent on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.cookie
     * @type {HttpCookiePairHeaderValueCollection} 
     */
    Cookie {
        get => this.get_Cookie()
    }

    /**
     * Gets or sets the [DateTime](../windows.foundation/datetime.md) object that represents the value of a **Date** HTTP header on an HTTP request.
     * @remarks
     * The Date property represents the **Date** header on an HTTP request message. The **Date** header is the date and time the message was sent.
     * 
     * Javascript and .NET languages do not use the [DateTime](../windows.foundation/datetime.md) object directly. In Javascript a [DateTime](../windows.foundation/datetime.md) is projected as a  object, and in .NET it is projected as a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true). Each language transparently handles the conversion to the granularity and date ranges for the respective language.
     * 
     * In C++, a  value has the same granularity as a  and supports the date ranges required by Javascript and .NET.
     * 
     * For more detailed information, see the [Windows.Foundation.DateTime](../windows.foundation/datetime.md) structure.
     * 
     * 
     * 
     * The following sample code shows a method to set the **Date** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the Date property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderRequestDate() {
     *         var request = new HttpRequestMessage();
     * 
     *         // This is not typically set with a string.
     * 
     *         // Set the header with a strong type.
     *         DateTimeOffset value = DateTimeOffset.UtcNow;
     *         request.Headers.Date = value;
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("Date value in ticks: {0}", request.Headers.Date.Value.Ticks);
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The Date ToString() results: {0}", request.Headers.Date.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.date
     * @type {IReference<DateTime>} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * Gets the [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md) of [HttpExpectationHeaderValue](httpexpectationheadervalue.md) objects that represent the value of an **Expect** HTTP header on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.expect
     * @type {HttpExpectationHeaderValueCollection} 
     */
    Expect {
        get => this.get_Expect()
    }

    /**
     * Gets or sets the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) that represents the value of a **From** HTTP header on an HTTP request.
     * @remarks
     * The following sample code shows a method to set the **From** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the From property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderRequestFrom() {
     *         var request = new HttpRequestMessage();
     * 
     *         // Set the header with a string.
     *         request.Headers.From = "person@example.com";
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("From value: {0}", request.Headers.From);
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * Gets or sets the [HostName](../windows.networking/hostname.md) that represents the value of a **Host** HTTP header on an HTTP request.
     * @remarks
     * The following sample code shows a method to set the **Host** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the Host property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderRequestHost() {
     *         var request = new HttpRequestMessage();
     * 
     *         // This is not typically set with a string.
     * 
     *         // Set the header with a strong type.
     *         // HostName is in the Windows.Networking namespace.
     *         var value = new Windows.Networking.HostName("example.com");
     *         request.Headers.Host = value;
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("Canonical Host name: {0}", request.Headers.Host.CanonicalName);
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The Host ToString() results: {0}", request.Headers.Host.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.host
     * @type {HostName} 
     */
    Host {
        get => this.get_Host()
        set => this.put_Host(value)
    }

    /**
     * Gets or sets the [DateTime](../windows.foundation/datetime.md) object that represents the value of an **If-Modified-Since** HTTP header on an HTTP request.
     * @remarks
     * The IfModifiedSince property represents the value of an **If-Modified-Since** HTTP header on an HTTP request message. The **If-Modified-Since** header is the date and time the content was modified since.
     * 
     * Javascript and .NET languages do not use the [DateTime](../windows.foundation/datetime.md) object directly. In Javascript a [DateTime](../windows.foundation/datetime.md) is projected as a  object, and in .NET it is projected as a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true). Each language transparently handles the conversion to the granularity and date ranges for the respective language.
     * 
     * In C++, a  value has the same granularity as a  and supports the date ranges required by Javascript and .NET.
     * 
     * For more detailed information, see the [Windows.Foundation.DateTime](../windows.foundation/datetime.md) structure.
     * 
     * 
     * 
     * The following sample code shows a method to set the **If-Modified-Since** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the IfModifiedSince property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderRequestIfModifiedSince() {
     *         var request = new HttpRequestMessage();
     * 
     *         // This is not typically set with a string.
     * 
     *         // Set the header with a strong type.
     *         var value = DateTimeOffset.Now.AddDays(-1); // Since yesterday.
     *         request.Headers.IfModifiedSince = value;
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("IfModifiedSince value in ticks: {0}", request.Headers.IfModifiedSince.Value.Ticks);
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The IfModifiedSince ToString() results: {0}", request.Headers.IfModifiedSince.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.ifmodifiedsince
     * @type {IReference<DateTime>} 
     */
    IfModifiedSince {
        get => this.get_IfModifiedSince()
        set => this.put_IfModifiedSince(value)
    }

    /**
     * Gets or sets the [DateTime](../windows.foundation/datetime.md) object that represents the value of an **If-Unmodified-Since** HTTP header on an HTTP request.
     * @remarks
     * The IfUnmodifiedSince property represents the value of an **If-Unmodified-Since** HTTP header on an HTTP request message. The **If-Unmodified-Since** header is the date and time the content was not modified since.
     * 
     * Javascript and .NET languages do not use the [DateTime](../windows.foundation/datetime.md) object directly. In Javascript a [DateTime](../windows.foundation/datetime.md) is projected as a  object, and in .NET it is projected as a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true). Each language transparently handles the conversion to the granularity and date ranges for the respective language.
     * 
     * In C++, a  value has the same granularity as a  and supports the date ranges required by Javascript and .NET.
     * 
     * For more detailed information, see the [Windows.Foundation.DateTime](../windows.foundation/datetime.md) structure.
     * 
     * 
     * 
     * The following sample code shows a method to set the **If-Unmodified-Since** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the IfUnmodifiedSince property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderRequestIfUnmodifiedSince() {
     *         var request = new HttpRequestMessage();
     * 
     *         // This is not typically set with a string.
     * 
     *         // Set the header with a strong type.
     *         var value = DateTimeOffset.Now.AddDays(-1); // Since yesterday.
     *         request.Headers.IfUnmodifiedSince = value;
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("IfUnmodifiedSince value in ticks: {0}", request.Headers.IfUnmodifiedSince.Value.Ticks);
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The IfUnmodfiedSince ToString() results: {0}", request.Headers.IfUnmodifiedSince.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.ifunmodifiedsince
     * @type {IReference<DateTime>} 
     */
    IfUnmodifiedSince {
        get => this.get_IfUnmodifiedSince()
        set => this.put_IfUnmodifiedSince(value)
    }

    /**
     * Gets or sets an integer value that represents the value of a **Max-Forwards** HTTP header on an HTTP request.
     * @remarks
     * The following sample code shows a method to set the **Max-Forwards** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the MaxForwards property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderRequestMaxForwards() {
     *         var request = new HttpRequestMessage();
     * 
     *         // Set the header with an integer.
     *         request.Headers.MaxForwards= 2;
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("MaxForwards value: {0}", request.Headers.MaxForwards);
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.maxforwards
     * @type {IReference<Integer>} 
     */
    MaxForwards {
        get => this.get_MaxForwards()
        set => this.put_MaxForwards(value)
    }

    /**
     * Gets or sets the [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) object that represent the value of a **Proxy-Authorization** HTTP header on an HTTP request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.proxyauthorization
     * @type {HttpCredentialsHeaderValue} 
     */
    ProxyAuthorization {
        get => this.get_ProxyAuthorization()
        set => this.put_ProxyAuthorization(value)
    }

    /**
     * Gets or sets the [Uri](../windows.foundation/uri.md) that represents the value of a **Referer** HTTP header on an HTTP request.
     * @remarks
     * The following sample code shows a method to set the **Referer** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the Referer property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderRequestReferer() {
     *         var request = new HttpRequestMessage();
     * 
     *         // This is not typically set with a string.
     * 
     *         // Set the header with a strong type.
     *         // Uri is either in the Windows.Foundation namespace (JavaScript and C++)
     *         // or in the System.Net namespace (C#).
     *         var value = new Uri("http://example.com/");
     *         request.Headers.Referer = value;
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("Referer absolute uri: {0}", request.Headers.Referer.AbsoluteUri);
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The Host ToString() results: {0}", request.Headers.Referer.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.referer
     * @type {Uri} 
     */
    Referer {
        get => this.get_Referer()
        set => this.put_Referer(value)
    }

    /**
     * Gets the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md) of [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) objects that represent the value of a **Transfer-Encoding** HTTP header on an HTTP request.
     * @remarks
     * The only transfer encoding value supported by [HttpClient](../windows.web.http/httpclient.md) is chunked, even though the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md) of [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) objects supports setting other values.
     * 
     * There is no need to set the transfer encoding value manually to chunked if the [HttpRequestMessage](../windows.web.http/httprequestmessage.md) is sent as an  with no content-length specified or available using the  method on [HttpClient](../windows.web.http/httpclient.md) or one of the  methods on the HTTP content classes.
     * 
     * 
     * 
     * The following sample code shows a method to set the **Transfer-Encoding** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the TransferEncoding property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     void DemoTransferEncoding(HttpRequestMessage m) {
     *         var h = m.Headers;
     * 
     *         uiLog.Text += "\nTRANSFERENCODING HEADER\n";
     *         // Transfer-Encoding: chunked
     *         var okTryParseAdd = h.TransferEncoding.TryParseAdd("chunked");
     *         okTryParseAdd = h.TransferEncoding.TryParseAdd("mini; a=b; c=d; e=f");
     *         h.TransferEncoding.Add(new HttpTransferCodingHeaderValue("cab"));
     *         h.TransferEncoding.TryParseAdd("newtype, othernewtype");
     * 
     *         // TransferEncoding is a HttpTransferCodingHeaderValueCollection
     *         // A collection of HttpTransferCodingHeaderValue
     * 
     *         // HttpTransferCodingHeaderValue has three items:
     *         // Value (string); for example, "compress"
     *         // Parameter (IList<HttpNameValueHeaderValue>)
     *         //
     * 
     *         foreach (var item in h.TransferEncoding) {
     *             // item has: Value (string), Parameter IList<HttpNameValueHeaderValue>
     *             var parameterString = "";
     *             foreach (var parameter in item.Parameters) {
     *                 parameterString += string.Format("[{0}={1}] ", parameter.Name, parameter.Value);
     *             }
     *             if (parameterString == "") {
     *                 parameterString = "(no parameters)";
     *             } 
     *             uiLog.Text += string.Format("Value: {0} Parameters: {1} ToString: {2}\n", item.Value, parameterString, item.ToString());
     *         }
     *         uiLog.Text += string.Format("TransferEncoding: ToString: {0}\n\n", h.TransferEncoding.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.transferencoding
     * @type {HttpTransferCodingHeaderValueCollection} 
     */
    TransferEncoding {
        get => this.get_TransferEncoding()
    }

    /**
     * Gets the [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md) of [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) objects that represent the value of a **User-Agent** HTTP header on an HTTP request.
     * @remarks
     * The following sample code shows a method to set the **User-Agent** header on an [HttpRequestMessage](../windows.web.http/httprequestmessage.md) object using the UserAgent property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * 
     * ```csharp
     *     void DemoUserAgent(HttpRequestMessage m) {
     *         var h = m.Headers;
     * 
     *         uiLog.Text += "\nUSERAGENT HEADER\n";
     *         // User-Agent: CERN-LineMode/2.15 libwww/2.17b3
     *         // User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 4.0; InfoPath.3; MS-RTC LM 8; .NET4.0C; .NET4.0E)
     *         var ok = h.UserAgent.TryParseAdd("ie");
     *         ok = h.UserAgent.TryParseAdd("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 4.0; InfoPath.3; MS-RTC LM 8; .NET4.0C; .NET4.0E)");
     *         ok = h.UserAgent.TryParseAdd("CERN-LineMode/2.15 libwww/2.17b3");
     *         h.UserAgent.Add (new HttpProductInfoHeaderValue ("productComment"));
     *         h.UserAgent.Add(new HttpProductInfoHeaderValue("Mozilla", "1.0"));
     * 
     *         // UserAgent is a HttpProductInfoHeaderValueCollection
     *         // A collection of HttpProductInfoHeaderValue
     * 
     *         // HttpProductInfoHeaderValue has two items:
     *         // Product (string)
     *         // Comment (string)
     *         //
     *         // According to the RFC, each "item" is EITHER a product OR a comment, and a product is EITHER product or product/version
     * 
     *         foreach (var item in h.UserAgent) {
     *             // item has: Value (string), Parameter IList<HttpNameValueHeaderValue>
     * 
     *             uiLog.Text += string.Format("Product: {0} Comment: {1} ToString: {2}\n", item.Product, item.Comment, item.ToString());
     *         }
     *         uiLog.Text += string.Format("UserAgent: ToString: {0}\n\n", h.UserAgent.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.useragent
     * @type {HttpProductInfoHeaderValueCollection} 
     */
    UserAgent {
        get => this.get_UserAgent()
    }

    /**
     * Gets the number of objects in the [HttpRequestHeaderCollection](httprequestheadercollection.md).
     * @remarks
     * The Size property returns the true number of items.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HttpMediaTypeWithQualityHeaderValueCollection} 
     */
    get_Accept() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_Accept()
    }

    /**
     * 
     * @returns {HttpContentCodingWithQualityHeaderValueCollection} 
     */
    get_AcceptEncoding() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_AcceptEncoding()
    }

    /**
     * 
     * @returns {HttpLanguageRangeWithQualityHeaderValueCollection} 
     */
    get_AcceptLanguage() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_AcceptLanguage()
    }

    /**
     * 
     * @returns {HttpCredentialsHeaderValue} 
     */
    get_Authorization() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_Authorization()
    }

    /**
     * 
     * @param {HttpCredentialsHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_Authorization(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_Authorization(value)
    }

    /**
     * 
     * @returns {HttpCacheDirectiveHeaderValueCollection} 
     */
    get_CacheControl() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_CacheControl()
    }

    /**
     * 
     * @returns {HttpConnectionOptionHeaderValueCollection} 
     */
    get_Connection() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_Connection()
    }

    /**
     * 
     * @returns {HttpCookiePairHeaderValueCollection} 
     */
    get_Cookie() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_Cookie()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Date() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_Date()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Date(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_Date(value)
    }

    /**
     * 
     * @returns {HttpExpectationHeaderValueCollection} 
     */
    get_Expect() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_Expect()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_From()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_From(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_Host() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_Host()
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_Host(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_Host(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_IfModifiedSince() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_IfModifiedSince()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_IfModifiedSince(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_IfModifiedSince(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_IfUnmodifiedSince() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_IfUnmodifiedSince()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_IfUnmodifiedSince(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_IfUnmodifiedSince(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxForwards() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_MaxForwards()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxForwards(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_MaxForwards(value)
    }

    /**
     * 
     * @returns {HttpCredentialsHeaderValue} 
     */
    get_ProxyAuthorization() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_ProxyAuthorization()
    }

    /**
     * 
     * @param {HttpCredentialsHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_ProxyAuthorization(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_ProxyAuthorization(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Referer() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_Referer()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Referer(value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.put_Referer(value)
    }

    /**
     * 
     * @returns {HttpTransferCodingHeaderValueCollection} 
     */
    get_TransferEncoding() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_TransferEncoding()
    }

    /**
     * 
     * @returns {HttpProductInfoHeaderValueCollection} 
     */
    get_UserAgent() {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.get_UserAgent()
    }

    /**
     * Adds a new item to the end of the [HttpRequestHeaderCollection](httprequestheadercollection.md).
     * @param {HSTRING} name The name of the value to add.
     * @param {HSTRING} value The item value to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.append
     */
    Append(name, value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.Append(name, value)
    }

    /**
     * Try to append the specified item to the [HttpRequestHeaderCollection](httprequestheadercollection.md) without validation.
     * @remarks
     * The TryAppendWithoutValidation method is available when you need to work with an HTTP header on an HTTP request that doesn't have a strongly-typed class for the HTTP header. If there is a strongly-typed implementation of the HTTP header, then the methods and properties on the strongly-typed class should be used instead of the TryAppendWithoutValidation method.
     * @param {HSTRING} name The name of the item to append.
     * @param {HSTRING} value The value of the item to append.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.tryappendwithoutvalidation
     */
    TryAppendWithoutValidation(name, value) {
        if (!this.HasProp("__IHttpRequestHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpRequestHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpRequestHeaderCollection := IHttpRequestHeaderCollection(outPtr)
        }

        return this.__IHttpRequestHeaderCollection.TryAppendWithoutValidation(name, value)
    }

    /**
     * Finds an item in the [HttpRequestHeaderCollection](httprequestheadercollection.md) if it exists.
     * @remarks
     * Use the [HasKey](httprequestheadercollection_haskey_425964900.md) method to determine whether the key exists in the [HttpRequestHeaderCollection](httprequestheadercollection.md).
     * @param {Generic} key The key of the item to lookup.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Determines whether the [HttpRequestHeaderCollection](httprequestheadercollection.md) contains the specified key.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Returns an immutable view of the [HttpRequestHeaderCollection](httprequestheadercollection.md).
     * @remarks
     * When programming with .NET, this method is hidden.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Inserts or replaces an item in the [HttpRequestHeaderCollection](httprequestheadercollection.md) with the specified key and value.
     * @remarks
     * When programming with .NET, this method is hidden and developers should use the **Add** methods.
     * @param {Generic} key The key of the item to be inserted.
     * @param {Generic} value The value of the item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes a specific object from the [HttpRequestHeaderCollection](httprequestheadercollection.md).
     * @param {Generic} key The key of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all objects from the [HttpRequestHeaderCollection](httprequestheadercollection.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f6d1f700-49c2-52ae-8154-826f9908773c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Retrieves an iterator to the first item in the [HttpRequestHeaderCollection](httprequestheadercollection.md).
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{e9bdaaf0-cbf6-5c72-be90-29cbf3a1319b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr })), outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpRequestHeaderCollection](httprequestheadercollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httprequestheadercollection.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
