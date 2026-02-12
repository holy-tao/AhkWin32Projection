#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IHttpResponseHeaderCollection.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a collection of the HTTP headers associated with an HTTP response.
 * @remarks
 * The HttpResponseHeaderCollection is a collection of the HTTP headers associated with an HTTP response to an HTTP request message. The HttpResponseHeaderCollection object can be used to get or set the specific headers on the HTTP response. Most of the properties on the HttpResponseHeaderCollection object provide access for the value of a specific HTTP header.
 * 
 * The [Headers](../windows.web.http/httpresponsemessage_headers.md) property on [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) returns an HttpResponseHeaderCollection object. This is how an HttpResponseHeaderCollection is constructed.
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpResponseHeaderCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpResponseHeaderCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpResponseHeaderCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the [TimeSpan](../windows.foundation/timespan.md) object that represents the value of an **Age** HTTP header on an HTTP response.
     * @remarks
     * The Age property represents the value of he **Age** header on an HTTP response. The **Age** header is the age of the entity in the cache.
     * 
     * When programming with .NET, this structure is hidden and developers should use the [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) structure. The value can be **null**, because it's typed as `TimeSpan?` (a nullable [TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true)).
     * 
     * In JavaScript, this structure is accessed as a value, not as an object. For example, use `var a = 10000`, not `var a = { duration: 10000 }`.
     * 
     * > [!NOTE]
     * > In JavaScript, this structure is treated as the number of millisecond intervals, not the number of 100-nanosecond intervals. Therefore, [Windows.Foundation.TimeSpan](../windows.foundation/timespan.md) values can lose precision when being ported between languages.
     * 
     * For more detailed information, see the [Windows.Foundation.TimeSpan](../windows.foundation/timespan.md) interface.
     * 
     * 
     * 
     * The following sample code shows a method to set the **Age** header on an [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) object using the Age property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderResponseAge() {
     *         var response = new HttpResponseMessage();
     * 
     *         // Set the header with a strong type.
     *         DateTimeOffset value = DateTimeOffset.UtcNow;
     *         response.Headers.Age = new TimeSpan(1, 35, 55); // 1 hour, 35 minutes, 55 seconds.
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("Age value in minutes: {0}", response.Headers.Age.Value.TotalMinutes);
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The Age ToString() results: {0}", response.Headers.Age.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.age
     * @type {IReference<TimeSpan>} 
     */
    Age {
        get => this.get_Age()
        set => this.put_Age(value)
    }

    /**
     * Gets the [HttpMethodHeaderValueCollection](httpmethodheadervaluecollection.md) of [HttpMethod](../windows.web.http/httpmethod.md) objects that represent the value of an **Allow** HTTP header on an HTTP response.
     * @remarks
     * The Allow property represents the value of an **Allow** HTTP header on an HTTP response. The **Allow** header is a list of HTTP methods (GET, PUT, and POST, for example) allowed by the HTTP server.
     * 
     * 
     * 
     * The following sample code shows a method to get and set the **Allow** header on an [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) object using the Allow property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderResponseAllow() {
     *         var response = new HttpResponseMessage();
     * 
     *         // Set the header with a string
     *         response.Headers.Allow.TryParseAdd ("GET");
     * 
     *         // Set the header with a strong type
     *         response.Headers.Allow.Add(HttpMethod.Patch);
     * 
     *         // Get the strong type out
     *         foreach (var value in response.Headers.Allow) {
     *             System.Diagnostics.Debug.WriteLine("Allow value: {0}", value.Method);
     *         }
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The Allow ToString() results: {0}", response.Headers.Allow.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.allow
     * @type {HttpMethodHeaderValueCollection} 
     */
    Allow {
        get => this.get_Allow()
    }

    /**
     * Gets the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md) of objects that represent the value of a **Cache-Control** HTTP header on an HTTP response.
     * @remarks
     * The CacheControl property represents the value of a **Cache-Control** HTTP header on an HTTP response.
     * 
     * Some of the objects in the [HttpCacheDirectiveHeaderValueCollection](httpcachedirectiveheadervaluecollection.md) for the **Cache-Control** header use the [Windows.Foundation.TimeSpan](../windows.foundation/timespan.md) structure. When programming with .NET, this structure is hidden and developers should use the [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) structure. The value can be **null**, because it's typed as `TimeSpan?` (a nullable [TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true)).
     * 
     * In JavaScript, this structure is accessed as a value, not as an object. For example, use `var a = 10000`, not `var a = { duration: 10000 }`.
     * 
     * > [!NOTE]
     * > In JavaScript, this structure is treated as the number of millisecond intervals, not the number of 100-nanosecond intervals.
     * 
     * For more detailed information, see the [Windows.Foundation.TimeSpan](../windows.foundation/timespan.md) interface.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.cachecontrol
     * @type {HttpCacheDirectiveHeaderValueCollection} 
     */
    CacheControl {
        get => this.get_CacheControl()
    }

    /**
     * Gets the [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md) of [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) objects that represent the value of a **Connection** HTTP header on an HTTP response.
     * @remarks
     * The following sample code shows a method to get and set the **Connection** header on an [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) object using the Connection property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * 
     * ```csharp
     * // Connection:keep-alive
     * // HttpConnectionOptionHeaderValueCollection, a collection of
     * // HttpConnectionOptionHeaderValue which just has a Token (string)
     * // 
     * // This is the same type as on the request
     *     void DemoConnection(HttpResponseMessage response) {
     *         var h = response.Headers;
     *         h.Connection.TryParseAdd("close");
     *         h.Connection.TryParseAdd("some,values");
     *         h.Connection.Add(new HttpConnectionOptionHeaderValue("last"));
     * 
     *         var header = h.Connection;
     *         uiLog.Text += "\nCONNECTION HEADER\n";
     *         foreach (var item in header) {
     *             uiLog.Text += String.Format("Token: {0}  ToString: {1}\n", item.Token, item.ToString());
     *         }
     *         uiLog.Text += String.Format("Connection: {0}\n", header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.connection
     * @type {HttpConnectionOptionHeaderValueCollection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * Gets or sets the [DateTime](../windows.foundation/datetime.md) object that represents the value of a **Date** HTTP header on an HTTP response.
     * @remarks
     * The Date property represents the value of a **Date** HTTP header on an HTTP response. The **Date** header is the date and time the message was sent.
     * 
     * Javascript and .NET languages do not use the [DateTime](../windows.foundation/datetime.md) object directly. In Javascript a [DateTime](../windows.foundation/datetime.md) is projected as a  object, and in .NET it is projected as a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true). Each language transparently handles the conversion to the granularity and date ranges for the respective language.
     * 
     * In C++, a  value has the same granularity as a  and supports the date ranges required by Javascript and .NET.
     * 
     * For more detailed information, see the [Windows.Foundation.DateTime](../windows.foundation/datetime.md) structure.
     * 
     * 
     * 
     * The following sample code shows a method to get and set the **Date** header on an [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) object using the Date property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderResponseDate() {
     *         var response = new HttpResponseMessage();
     * 
     *         // Set the header with a strong type.
     *         response.Headers.Date = DateTimeOffset.UtcNow;
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("Date value in ticks: {0}", response.Headers.Date.Value.Ticks);
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The Date ToString() results: {0}", response.Headers.Date.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.date
     * @type {IReference<DateTime>} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * Gets or sets the [Uri](../windows.foundation/uri.md) that represents the value or a **Location** HTTP header on an HTTP response.
     * @remarks
     * The following sample code shows a method to set the **Location** header on an [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) object using the Location property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * 
     * ```csharp
     *     public void DemonstrateHeaderResponseLocation() {
     *         var response = new HttpResponseMessage();
     * 
     *         // Set the header with a strong type.
     *         response.Headers.Location = new Uri("http://example.com/");
     * 
     *         // Get the strong type out
     *         System.Diagnostics.Debug.WriteLine("Location absolute uri: {0}", response.Headers.Location.AbsoluteUri);
     * 
     *         // The ToString() is useful for diagnostics, too.
     *         System.Diagnostics.Debug.WriteLine("The Location ToString() results: {0}", response.Headers.Location.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.location
     * @type {Uri} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * Gets the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md) of [HttpChallengeHeaderValue](httpchallengeheadervalue.md) objects that represent the value of a **Proxy-Authenticate** HTTP header on an HTTP response.
     * @remarks
     * The following sample code shows a method to get and set the **Proxy-Authenticate** header on an [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) object using the ProxyAuthenticate property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * 
     * ```csharp
     * // Proxy-Authenticate: Basic
     * // HttpChallengeHeaderValueCollection
     * // HttpChallengeHeaderValue has Scheme and Token (both strings) + Parameters
     * // Parameters is an IList<HttpNameValueHeaderValue>
     * // HttpNameValueHeaderValue has Name and Value, both strings
     *     void DemoProxyAuthenticate(HttpResponseMessage response) {
     *         var h = response.Headers;
     *         h.ProxyAuthenticate.TryParseAdd("Basic");
     *         h.ProxyAuthenticate.Add(new HttpChallengeHeaderValue("digest", "token"));
     * 
     *         var header = h.ProxyAuthenticate;
     *         uiLog.Text += "\nPROXY AUTHENTICATE HEADER\n";
     *         foreach (var item in header) {
     *             // Parameters is an IList<HttpNameValueHeaderValue> of Name/Value strings
     *             var parameterString = "";
     *             foreach (var parameter in item.Parameters) {
     *                 parameterString += string.Format("[{0}={1}] ", parameter.Name, parameter.Value);
     *             }
     *             if (parameterString == "") {
     *                 parameterString = "(no parameters)";
     *             }
     *             uiLog.Text += string.Format("Scheme: {0} Token: {1} Parameters: {2} ToString(): {3}\n", item.Scheme, item.Token, parameterString, item.ToString());
     *         }
     *         uiLog.Text += String.Format("ProxyAuthenticate: {0}\n", header.ToString());
     *     }
     * 
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.proxyauthenticate
     * @type {HttpChallengeHeaderValueCollection} 
     */
    ProxyAuthenticate {
        get => this.get_ProxyAuthenticate()
    }

    /**
     * Gets or sets the [HttpDateOrDeltaHeaderValue](httpdateordeltaheadervalue.md) object that represent the value of a **Retry-After** HTTP header on an HTTP response.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.retryafter
     * @type {HttpDateOrDeltaHeaderValue} 
     */
    RetryAfter {
        get => this.get_RetryAfter()
        set => this.put_RetryAfter(value)
    }

    /**
     * Gets the [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md) of [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) objects that represent the value of a **Transfer-Encoding** HTTP header on an HTTP response.
     * @remarks
     * The following sample code shows a method to get and set the **Transfer-Encoding** header on an [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) object using the TransferEncoding property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * 
     * ```csharp
     *     // HttpTransferCodingHeaderValueCollection
     *     // HttpTransferCodingHeaderValue hasValue (string) and Parameters (IList<HttpNameValueHeaderValue>)
     *     // IList<HttpNameValueHeaderValue>
     *     // HttpNameValueHeaderValue
     *     //
     *     // This is the same type as on the Request TransferEncoding  value
     *     void DemoTransferEncoding(HttpResponseMessage response) {
     *         var h = response.Headers;
     *         h.TransferEncoding.TryParseAdd("Basic");
     *         h.TransferEncoding.Add(new HttpTransferCodingHeaderValue("gzip"));
     * 
     *         var header = h.TransferEncoding;
     *         uiLog.Text += "\nTRANSFER ENCODING HEADER\n";
     *         foreach (var item in header) {
     *             // Parameters is an IList<HttpNameValueHeaderValue> of Name/Value strings
     *             var parameterString = "";
     *             foreach (var parameter in item.Parameters) {
     *                 parameterString += string.Format("[{0}={1}] ", parameter.Name, parameter.Value);
     *             }
     *             if (parameterString == "") {
     *                 parameterString = "(no parameters)";
     *             }
     *             uiLog.Text += string.Format("Value: {0} Parameters: {1} ToString(): {2}\n", item.Value, parameterString, item.ToString());
     *         }
     *         uiLog.Text += String.Format("TransferEncoding: {0}\n", header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.transferencoding
     * @type {HttpTransferCodingHeaderValueCollection} 
     */
    TransferEncoding {
        get => this.get_TransferEncoding()
    }

    /**
     * Gets the [HttpChallengeHeaderValueCollection](httpchallengeheadervaluecollection.md) of [HttpChallengeHeaderValue](httpchallengeheadervalue.md) objects that represent the value of a **WWW-Authenticate** HTTP header on an HTTP response.
     * @remarks
     * The following sample code shows a method to get and set the **WWW-Authenticate** header on an [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) object using the WwwAuthenticate property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * 
     * ```csharp
     * // WWW-Authenticate: Basic
     * // HttpChallengeHeaderValueCollection
     * // HttpChallengeHeaderValue has Scheme and Token (both string) and Parameters (IList<HtpNameValueHeaderValue>)
     * // IList<HtpNameValueHeaderValue>
     * // HtpNameValueHeaderValue
     *     void DemoWwwAuthenticate(HttpResponseMessage response) {
     *         var h = response.Headers;
     *         h.WwwAuthenticate.TryParseAdd("Basic");
     *         h.WwwAuthenticate.Add(new HttpChallengeHeaderValue("scheme", "token"));
     * 
     *         var header = h.WwwAuthenticate;
     *         uiLog.Text += "\nWWW AUTHENTICATE HEADER\n";
     *         foreach (var item in header) {
     *             // Parameters is an IList<HttpNameValueHeaderValue> of Name/Value strings
     *             var parameterString = "";
     *             foreach (var parameter in item.Parameters) {
     *                     parameterString += string.Format("[{0}={1}] ", parameter.Name, parameter.Value);
     *             }
     *             if (parameterString == "") {
     *                 parameterString = "(no parameters)";
     *             }
     *             uiLog.Text += string.Format("Scheme: {0} Token: {1} Parameters: {2} ToString(): {3}\n", item.Scheme, item.Token, parameterString, item.ToString());
     *         }
     *         uiLog.Text += String.Format("WwwAuthenticate: {0}\n", header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.wwwauthenticate
     * @type {HttpChallengeHeaderValueCollection} 
     */
    WwwAuthenticate {
        get => this.get_WwwAuthenticate()
    }

    /**
     * Gets the number of objects in the [HttpResponseHeaderCollection](httpresponseheadercollection.md).
     * @remarks
     * The Size property returns the true number of items.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.size
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
     * @returns {IReference<TimeSpan>} 
     */
    get_Age() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_Age()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Age(value) {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.put_Age(value)
    }

    /**
     * 
     * @returns {HttpMethodHeaderValueCollection} 
     */
    get_Allow() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_Allow()
    }

    /**
     * 
     * @returns {HttpCacheDirectiveHeaderValueCollection} 
     */
    get_CacheControl() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_CacheControl()
    }

    /**
     * 
     * @returns {HttpConnectionOptionHeaderValueCollection} 
     */
    get_Connection() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_Connection()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Date() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_Date()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Date(value) {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.put_Date(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Location() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_Location()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.put_Location(value)
    }

    /**
     * 
     * @returns {HttpChallengeHeaderValueCollection} 
     */
    get_ProxyAuthenticate() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_ProxyAuthenticate()
    }

    /**
     * 
     * @returns {HttpDateOrDeltaHeaderValue} 
     */
    get_RetryAfter() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_RetryAfter()
    }

    /**
     * 
     * @param {HttpDateOrDeltaHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_RetryAfter(value) {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.put_RetryAfter(value)
    }

    /**
     * 
     * @returns {HttpTransferCodingHeaderValueCollection} 
     */
    get_TransferEncoding() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_TransferEncoding()
    }

    /**
     * 
     * @returns {HttpChallengeHeaderValueCollection} 
     */
    get_WwwAuthenticate() {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.get_WwwAuthenticate()
    }

    /**
     * Adds a new item to the end of the [HttpResponseHeaderCollection](httpresponseheadercollection.md).
     * @param {HSTRING} name The name of the value to add.
     * @param {HSTRING} value The item value to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.append
     */
    Append(name, value) {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.Append(name, value)
    }

    /**
     * Try to append the specified item to the [HttpResponseHeaderCollection](httpresponseheadercollection.md) without validation.
     * @remarks
     * The TryAppendWithoutValidation method is available when you need to work with an HTTP header on an HTTP response that doesn't have a strongly-typed class for the HTTP header. If there is a strongly-typed implementation of the HTTP header, then the methods and properties on the strongly-typed class should be used instead of the TryAppendWithoutValidation method.
     * @param {HSTRING} name The name of the item to append.
     * @param {HSTRING} value The value of the item to append.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.tryappendwithoutvalidation
     */
    TryAppendWithoutValidation(name, value) {
        if (!this.HasProp("__IHttpResponseHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpResponseHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpResponseHeaderCollection := IHttpResponseHeaderCollection(outPtr)
        }

        return this.__IHttpResponseHeaderCollection.TryAppendWithoutValidation(name, value)
    }

    /**
     * Lookup an item in the [HttpResponseHeaderCollection](httpresponseheadercollection.md).
     * @remarks
     * Use the [HasKey](httpresponseheadercollection_haskey_425964900.md) method to determine whether the key exists in the [HttpResponseHeaderCollection](httpresponseheadercollection.md).
     * @param {Generic} key The key of the item to lookup.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.lookup
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
     * Determines whether the [HttpResponseHeaderCollection](httpresponseheadercollection.md) contains the specified key.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.haskey
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
     * Returns an immutable view of the [HttpResponseHeaderCollection](httpresponseheadercollection.md).
     * @remarks
     * When programming with .NET, this method is hidden.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.getview
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
     * Inserts or replaces an item in the [HttpResponseHeaderCollection](httpresponseheadercollection.md) with the specified key and value.
     * @remarks
     * When programming with .NET, this method is hidden and developers should use one of the **Add** methods.
     * @param {Generic} key The key of the item to be inserted.
     * @param {Generic} value The value of the item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.insert
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
     * Removes an item with a given key from the [HttpResponseHeaderCollection](httpresponseheadercollection.md).
     * @param {Generic} key Key of the item to be removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.remove
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
     * Removes all objects from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.clear
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
     * Retrieves an iterator to the first item in the [HttpResponseHeaderCollection](httpresponseheadercollection.md).
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.first
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
     * Returns a string that represents the current [HttpResponseHeaderCollection](httpresponseheadercollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpresponseheadercollection.tostring
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
