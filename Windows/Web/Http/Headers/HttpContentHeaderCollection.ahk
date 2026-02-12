#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IHttpContentHeaderCollection.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a collection of the HTTP headers associated with content on an HTTP request or response.
 * @remarks
 * The **HttpContentHeaderCollection** is a collection of the HTTP headers associated with the HTTP content on an HTTP request or an HTTP response message. The **HttpContentHeaderCollection** object can be used to get or set the specific headers on the HTTP content. Most of the properties on the **HttpContentHeaderCollection** object provide access to a container collection for a specific HTTP header.
 * 
 * The **HttpContentHeaderCollection** has a constructor and also is returned by the  property on [HttpBufferContent](../windows.web.http/httpbuffercontent.md), [HttpFormUrlEncodedContent](../windows.web.http/httpformurlencodedcontent.md), [HttpMultipartContent](../windows.web.http/httpmultipartcontent.md), [HttpMultipartFormDataContent](../windows.web.http/httpmultipartformdatacontent.md), [HttpStreamContent](../windows.web.http/httpstreamcontent.md), and [HttpStringContent](../windows.web.http/httpstringcontent.md), classes and the [IHttpContent](../windows.web.http/ihttpcontent.md) interface.
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpContentHeaderCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpContentHeaderCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpContentHeaderCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the [HttpContentDispositionHeaderValue](httpcontentdispositionheadervalue.md) object that represents the value of an HTTP **Content-Disposition** header on the HTTP content.
     * @remarks
     * The following sample code shows a method to get or set the **Content-Disposition** header value on HTTP content using the ContentDisposition property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Content-Disposition header
     *     // HttpContentDispositionHeaderValue
     *     void DemoContentDisposition(IHttpContent content) {
     *         var h = content.Headers;
     * 
     *         HttpContentDispositionHeaderValue value;
     *         bool ok = HttpContentDispositionHeaderValue.TryParse("attachment; filename=\"myfile.txt\"; myparam=myvalue", out value);
     *         h.ContentDisposition = value;
     * 
     *         h.ContentDisposition = HttpContentDispositionHeaderValue.Parse("attachment; filename=\"myfile.txt\"; myparam=myvalue");
     *         var header = h.ContentDisposition;
     * 
     *         uiLog.Text += "\nCONTENT DISPOSITION HEADER\n";
     *         // Content-Disposition: attachment; filename="fname.ext"
     * 
     *         // ContentDisposition is a HttpContentDispositionHeaderValue and contains:
     *         // DispositionType, FileName, FileNameStar, Name: all strings
     *         // Size: nullable long
     *         // Parameters: IList<HttpNameValueHeaderValue> 
     *         var parameterString = "";
     *         foreach (var parameter in header.Parameters) {
     *             parameterString += string.Format("[{0}={1}] ", parameter.Name, parameter.Value);
     *         }
     *         if (parameterString == "") {
     *             parameterString = "(no parameters)";
     *         }
     * 
     *         uiLog.Text += string.Format("ContentDisposition: DispositionType: {0} FileName: {1} FileNameStar: {2} Name: {3} Parameters: {4} Size: {5} ToString: {6}\n\n", 
     *         header.DispositionType, header.FileName, header.FileNameStar, header.Name, parameterString, header.Size, header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.contentdisposition
     * @type {HttpContentDispositionHeaderValue} 
     */
    ContentDisposition {
        get => this.get_ContentDisposition()
        set => this.put_ContentDisposition(value)
    }

    /**
     * Gets the [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md) of [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) objects that represent the value of an HTTP **Content-Encoding** header on the HTTP content.
     * @remarks
     * The following sample code shows a method to get or set the **Content-Encoding** header value on HTTP content using the ContentEncoding property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Content-Encoding header
     *     // HttpContentCodingHeaderValueCollection
     *     // HttpContentCodingHeaderValue [has ContentCoding, a string]
     *     void DemoContentEncoding(IHttpContent content) {
     *         var h = content.Headers;
     * 
     *         h.ContentEncoding.TryParseAdd("gzip");
     *         h.ContentEncoding.TryParseAdd("cab, compress");
     *         h.ContentEncoding.Add(new HttpContentCodingHeaderValue("myencoding"));
     * 
     *         var header = h.ContentEncoding;
     *         uiLog.Text += "\nCONTENT ENCODING HEADER\n";
     *         foreach (var item in header) {
     *             uiLog.Text += string.Format("ContentCoding: {0}  ToString: {1}\n", item.ContentCoding, item.ToString());
     *         }
     *         uiLog.Text += string.Format("ContentEncoding: ToString: {0}\n\n", header.ToString());
     *     }
     * 
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.contentencoding
     * @type {HttpContentCodingHeaderValueCollection} 
     */
    ContentEncoding {
        get => this.get_ContentEncoding()
    }

    /**
     * Gets the [HttpLanguageHeaderValueCollection](httplanguageheadervaluecollection.md) of objects that represent the value of an HTTP **Content-Language** header on the HTTP content.
     * @remarks
     * The following sample code shows a method to get or set the **Content-Language** header value on HTTP content using the ContentLanguage property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Content-Language header
     *     // HttpLanguageHeaderValueCollection (of Windows.Globalization.Language)
     *     void DemoContentLanguage(IHttpContent content) {
     *         var h = content.Headers;
     * 
     *         h.ContentLanguage.TryParseAdd("en-us");
     *         h.ContentLanguage.TryParseAdd("ru-ru, ru-us");
     *         h.ContentLanguage.Add(new Windows.Globalization.Language("ko-ko"));
     * 
     *         var header = h.ContentLanguage;
     *         uiLog.Text += "\nCONTENT LANGUAGE HEADER\n";
     *         foreach (var item in header) {
     *             uiLog.Text += string.Format("DisplayName: {0} ToString: {1}\n", item.DisplayName, item.ToString());
     *         }
     *         uiLog.Text += string.Format("ContentLanguage: ToString: {0}\n\n", header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.contentlanguage
     * @type {HttpLanguageHeaderValueCollection} 
     */
    ContentLanguage {
        get => this.get_ContentLanguage()
    }

    /**
     * Gets or sets the value of the HTTP **Content-Length** header on the HTTP content.
     * @remarks
     * The following sample code shows a method to get or set the **Content-Length** header on HTTP content using the ContentLength property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Content-Length header
     *     // nullable ulong
     *     void DemoContentLength(IHttpContent content) {
     *         var h = content.Headers;
     * 
     *         h.ContentLength = 313;
     * 
     *         var header = h.ContentLength;
     *         uiLog.Text += "\nCONTENT LENGTH HEADER\n";
     * 
     *         uiLog.Text += string.Format("ContentLength: ToString: {0}\n\n", header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.contentlength
     * @type {IReference<Integer>} 
     */
    ContentLength {
        get => this.get_ContentLength()
        set => this.put_ContentLength(value)
    }

    /**
     * Gets or sets the value of the HTTP **Content-Location** header on the HTTP content.
     * @remarks
     * The following sample code shows a method to get or set the **Content-Location** header value on HTTP content using the ContentLocation property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Content-Location header
     *     // Uri
     *     void DemoContentLocation(IHttpContent content) {
     *         var h = content.Headers;
     * 
     *         h.ContentLocation = new Uri("http://example.com/");
     * 
     *         var header = h.ContentLocation;
     *         uiLog.Text += "\nCONTENT LOCATION HEADER\n";
     * 
     *         uiLog.Text += string.Format("ContentLocation: ToString: {0}\n\n", header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.contentlocation
     * @type {Uri} 
     */
    ContentLocation {
        get => this.get_ContentLocation()
        set => this.put_ContentLocation(value)
    }

    /**
     * Gets or sets the value of an HTTP **Content-MD5** header on the HTTP content.
     * @remarks
     * The following sample code shows a method to get or set the **Content-MD5** header value on HTTP content using the ContentMD5 property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Content-MD5 header
     *     // IBuffer
     *     void DemoContentMD5(IHttpContent content) {
     *         var h = content.Headers;
     * 
     *         var str = "This is my content string";
     *         var alg = Windows.Security.Cryptography.Core.HashAlgorithmProvider.OpenAlgorithm("MD5");
     *         var buff = Windows.Security.Cryptography.CryptographicBuffer.ConvertStringToBinary(str, Windows.Security.Cryptography.BinaryStringEncoding.Utf8);
     *         var hashed = alg.HashData(buff);
     *         var res = Windows.Security.Cryptography.CryptographicBuffer.EncodeToHexString(hashed);
     *         h.ContentMD5 = hashed;
     * 
     *         var header = h.ContentMD5;
     *         uiLog.Text += "\nCONTENT MD5 HEADER\n";
     * 
     *         uiLog.Text += string.Format("ContentMD5: ToString: {0}\n\n", header.ToString());
     *         uiLog.Text += string.Format("ContentMD5: base64: {0} hex: {1}\n\n", Convert.ToBase64String(h.ContentMD5.ToArray()), res);
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.contentmd5
     * @type {IBuffer} 
     */
    ContentMD5 {
        get => this.get_ContentMD5()
        set => this.put_ContentMD5(value)
    }

    /**
     * Gets or sets the [HttpContentRangeHeaderValue](httpcontentrangeheadervalue.md) object that represent the value of an HTTP **Content-Range** header on the HTTP content.
     * @remarks
     * The following sample code shows a method to get or set the **Content-Range** header value on HTTP content using the ContentRange property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Content-Range header
     *     // HttpContentRangeHeaderValue (Unit=string, FirstBytePosition, LastBytePosition, Length) all nullable ulong
     *     //
     *     void DemoContentRange(IHttpContent content) {
     *         var h = content.Headers;
     *         h.ContentRange = new HttpContentRangeHeaderValue (10, 20, 333);
     * 
     *         var header = h.ContentRange;
     *         uiLog.Text += "\nCONTENT RANGE HEADER\n";
     * 
     *         uiLog.Text += string.Format("ContentRange: Unit: {0} FirstBytePosition: {1} LastBytePosition: {2} Length: {3} ToString: {4}\n\n", header.Unit, header.FirstBytePosition, header.LastBytePosition, header.Length, header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.contentrange
     * @type {HttpContentRangeHeaderValue} 
     */
    ContentRange {
        get => this.get_ContentRange()
        set => this.put_ContentRange(value)
    }

    /**
     * Gets or sets the [HttpMediaTypeHeaderValue](httpmediatypeheadervalue.md) object that represent the value of an HTTP **Content-Type** header on the HTTP content.
     * @remarks
     * The ContentType property represents the **Content-Type** header value on HTTP content. The **Content-Type** header is the MIME type of the content.
     * 
     * 
     * 
     * The following sample code shows a method to get or set the **Content-Type** header value on HTTP content using the ContentType property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Content-Type header
     *     // HttpMediaTypeHeaderValue (MediaType, Charset are strings, Parameters is an IList<HttpNameValueHeaderValue>)
     *     //
     *     void DemoContentType(IHttpContent content) {
     *         var h = content.Headers;
     *         h.ContentType = new HttpMediaTypeHeaderValue("myMediaType");
     * 
     *         var header = h.ContentType;
     *         uiLog.Text += "\nCONTENT TYPE HEADER\n";
     * 
     *         // Parameters is an IList<HttpNameValueHeaderValue> of Name/Value strings
     *         var parameterString = "";
     *         foreach (var parameter in header.Parameters) {
     *                 parameterString += string.Format("[{0}={1}] ", parameter.Name, parameter.Value);
     *         }
     *         if (parameterString == "") {
     *                 parameterString = "(no parameters)";
     *         }
     * 
     *         uiLog.Text += string.Format("Content-Type: MediaType: {0} CharSet: {1} Parameters: {2} ToString: {3}\n", header.MediaType, header.CharSet, parameterString, header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.contenttype
     * @type {HttpMediaTypeHeaderValue} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * Gets or sets the [DateTime](../windows.foundation/datetime.md) object that represents the value of an HTTP **Expires** header on the HTTP content.
     * @remarks
     * The Expires property represents the value of the **Expires** header on HTTP content. The **Expires** header is the date and time after which the HTTP content is considered outdated.
     * 
     * Javascript and .NET languages do not use the [DateTime](../windows.foundation/datetime.md) object directly. In Javascript a [DateTime](../windows.foundation/datetime.md) is projected as a  object, and in .NET it is projected as a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true). Each language transparently handles the conversion to the granularity and date ranges for the respective language.
     * 
     * In C++, a  value has the same granularity as a  and supports the date ranges required by Javascript and .NET.
     * 
     * For more detailed information, see the [Windows.Foundation.DateTime](../windows.foundation/datetime.md) structure.
     * 
     * 
     * 
     * The following sample code shows a method to get or set the **Expires** header value on HTTP content using the Expires property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Expires header
     *     // nullable DateTimeOffset
     *     //
     *     void DemoExpires(IHttpContent content) {
     *         var h = content.Headers;
     *         h.Expires = DateTimeOffset.Now;
     * 
     *         var header = h.Expires;
     *         uiLog.Text += "\nEXPIRES HEADER\n";
     *         uiLog.Text += String.Format ("Expires: {0}\n", header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.expires
     * @type {IReference<DateTime>} 
     */
    Expires {
        get => this.get_Expires()
        set => this.put_Expires(value)
    }

    /**
     * Gets or sets the [DateTime](../windows.foundation/datetime.md) object that represents the value of an HTTP **Last-Modified** header on the HTTP content.
     * @remarks
     * The LastModified property represents the **Last-Modified** header on HTTP content. The **Last-Modified** header is the date and time that the HTTP content was last modified.
     * 
     * Javascript and .NET languages do not use the [DateTime](../windows.foundation/datetime.md) object directly. In Javascript a [DateTime](../windows.foundation/datetime.md) is projected as a  object, and in .NET it is projected as a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true). Each language transparently handles the conversion to the granularity and date ranges for the respective language.
     * 
     * In C++, a  value has the same granularity as a  and supports the date ranges required by Javascript and .NET.
     * 
     * For more detailed information, see the [Windows.Foundation.DateTime](../windows.foundation/datetime.md) structure.
     * 
     * 
     * 
     * The following sample code shows a method to get or set the **Expires** header value on HTTP content using the LastModified property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * 
     * ```csharp
     *     // Last-Modified header
     *     // nullable DateTimeOffset
     *     //
     *     void DemoLastModified(IHttpContent content) {
     *         var h = content.Headers;
     *         h.LastModified = DateTimeOffset.Now;
     * 
     *         var header = h.LastModified;
     *         uiLog.Text += "\nLAST MODIFIED HEADER\n";
     *         uiLog.Text += String.Format("LastModified: {0}\n", header.ToString());
     *     }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.lastmodified
     * @type {IReference<DateTime>} 
     */
    LastModified {
        get => this.get_LastModified()
        set => this.put_LastModified(value)
    }

    /**
     * Gets the number of objects in the [HttpContentHeaderCollection](httpcontentheadercollection.md).
     * @remarks
     * The Size property returns the true number of items.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.size
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
    /**
     * Initializes a new instance of the [HttpContentHeaderCollection](httpcontentheadercollection.md) class.
     * @remarks
     * An [HttpContentHeaderCollection](httpcontentheadercollection.md) object is returned by the  property on [HttpBufferContent](../windows.web.http/httpbuffercontent.md), [HttpFormUrlEncodedContent](../windows.web.http/httpformurlencodedcontent.md), [HttpMultipartContent](../windows.web.http/httpmultipartcontent.md), [HttpMultipartFormDataContent](../windows.web.http/httpmultipartformdatacontent.md), [HttpStreamContent](../windows.web.http/httpstreamcontent.md), and [HttpStringContent](../windows.web.http/httpstringcontent.md), classes and the [IHttpContent](../windows.web.http/ihttpcontent.md) interface.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentHeaderCollection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HttpContentDispositionHeaderValue} 
     */
    get_ContentDisposition() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_ContentDisposition()
    }

    /**
     * 
     * @param {HttpContentDispositionHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_ContentDisposition(value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.put_ContentDisposition(value)
    }

    /**
     * 
     * @returns {HttpContentCodingHeaderValueCollection} 
     */
    get_ContentEncoding() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_ContentEncoding()
    }

    /**
     * 
     * @returns {HttpLanguageHeaderValueCollection} 
     */
    get_ContentLanguage() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_ContentLanguage()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ContentLength() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_ContentLength()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ContentLength(value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.put_ContentLength(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentLocation() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_ContentLocation()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ContentLocation(value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.put_ContentLocation(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ContentMD5() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_ContentMD5()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_ContentMD5(value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.put_ContentMD5(value)
    }

    /**
     * 
     * @returns {HttpContentRangeHeaderValue} 
     */
    get_ContentRange() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_ContentRange()
    }

    /**
     * 
     * @param {HttpContentRangeHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_ContentRange(value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.put_ContentRange(value)
    }

    /**
     * 
     * @returns {HttpMediaTypeHeaderValue} 
     */
    get_ContentType() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_ContentType()
    }

    /**
     * 
     * @param {HttpMediaTypeHeaderValue} value 
     * @returns {HRESULT} 
     */
    put_ContentType(value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.put_ContentType(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Expires() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_Expires()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Expires(value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.put_Expires(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastModified() {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.get_LastModified()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_LastModified(value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.put_LastModified(value)
    }

    /**
     * Adds a new item to the end of the [HttpContentHeaderCollection](httpcontentheadercollection.md).
     * @param {HSTRING} name The name of the value to add.
     * @param {HSTRING} value The item value to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.append
     */
    Append(name, value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.Append(name, value)
    }

    /**
     * Try to append the specified item to the [HttpContentHeaderCollection](httpcontentheadercollection.md) without validation.
     * @remarks
     * The TryAppendWithoutValidation method is available when you need to work with an HTTP header on HTTP content that doesn't have a strongly-typed class for the HTTP header. If there is a strongly-typed implementation of the HTTP header, then the methods and properties on the strongly-typed class should be used instead of the TryAppendWithoutValidation method.
     * @param {HSTRING} name The name of the item to append.
     * @param {HSTRING} value The value of the item to append.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.tryappendwithoutvalidation
     */
    TryAppendWithoutValidation(name, value) {
        if (!this.HasProp("__IHttpContentHeaderCollection")) {
            if ((queryResult := this.QueryInterface(IHttpContentHeaderCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentHeaderCollection := IHttpContentHeaderCollection(outPtr)
        }

        return this.__IHttpContentHeaderCollection.TryAppendWithoutValidation(name, value)
    }

    /**
     * Finds an item in the [HttpContentHeaderCollection](httpcontentheadercollection.md) if it exists.
     * @remarks
     * Use the [HasKey](httpcontentheadercollection_haskey_425964900.md) method to determine whether the key exists in the [HttpContentHeaderCollection](httpcontentheadercollection.md).
     * @param {Generic} key The key of the item to lookup.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.lookup
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
     * Determines whether the [HttpContentHeaderCollection](httpcontentheadercollection.md) contains the specified key.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.haskey
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
     * Returns an immutable view of the [HttpContentHeaderCollection](httpcontentheadercollection.md).
     * @remarks
     * When programming with .NET, this method is hidden.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.getview
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
     * Inserts or replaces an item in the [HttpContentHeaderCollection](httpcontentheadercollection.md) with the specified key and value.
     * @remarks
     * When programming with .NET, this method is hidden and developers should use the **Add** methods.
     * @param {Generic} key The key of the item to be inserted.
     * @param {Generic} value The value of the item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.insert
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
     * Removes a specific object from the [HttpContentHeaderCollection](httpcontentheadercollection.md).
     * @param {Generic} key The key of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.remove
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
     * Removes all objects from the [HttpContentHeaderCollection](httpcontentheadercollection.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.clear
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
     * Retrieves an iterator to the first item in the [HttpContentHeaderCollection](httpcontentheadercollection.md).
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.first
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
     * Returns a string that represents the current [HttpContentHeaderCollection](httpcontentheadercollection.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentheadercollection.tostring
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
