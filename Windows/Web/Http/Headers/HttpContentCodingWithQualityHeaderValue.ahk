#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpContentCodingWithQualityHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpContentCodingWithQualityHeaderValueStatics.ahk
#Include .\IHttpContentCodingWithQualityHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents accept encoding information used in the **Accept-Encoding** HTTP header on an HTTP request.
 * @remarks
 * The HttpContentCodingWithQualityHeaderValue class represents accept encoding information used in the **Accept-Encoding** HTTP header on an HTTP request.
 * 
 * The [AcceptEncoding](httprequestheadercollection_acceptencoding.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an [HttpContentCodingWithQualityHeaderValueCollection](httpcontentcodingwithqualityheadervaluecollection.md) that contains HttpContentCodingWithQualityHeaderValue objects.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpContentCodingWithQualityHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpContentCodingWithQualityHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpContentCodingWithQualityHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the content coding information in the **Accept-Encoding** HTTP header.
     * @returns {HttpContentCodingWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpContentCodingWithQualityHeaderValue.HasProp("__IHttpContentCodingWithQualityHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentCodingWithQualityHeaderValueStatics.IID)
            HttpContentCodingWithQualityHeaderValue.__IHttpContentCodingWithQualityHeaderValueStatics := IHttpContentCodingWithQualityHeaderValueStatics(factoryPtr)
        }

        return HttpContentCodingWithQualityHeaderValue.__IHttpContentCodingWithQualityHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpContentCodingWithQualityHeaderValue>} contentCodingWithQualityHeaderValue The [HttpContentCodingWithQualityHeaderValue](httpcontentcodingwithqualityheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervalue.tryparse
     */
    static TryParse(input_, contentCodingWithQualityHeaderValue) {
        if (!HttpContentCodingWithQualityHeaderValue.HasProp("__IHttpContentCodingWithQualityHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentCodingWithQualityHeaderValueStatics.IID)
            HttpContentCodingWithQualityHeaderValue.__IHttpContentCodingWithQualityHeaderValueStatics := IHttpContentCodingWithQualityHeaderValueStatics(factoryPtr)
        }

        return HttpContentCodingWithQualityHeaderValue.__IHttpContentCodingWithQualityHeaderValueStatics.TryParse(input_, contentCodingWithQualityHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) class with **content-coding** information.
     * @param {HSTRING} contentCoding The value of the **content-coding** to use.
     * @returns {HttpContentCodingWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervalue.#ctor
     */
    static CreateFromValue(contentCoding) {
        if (!HttpContentCodingWithQualityHeaderValue.HasProp("__IHttpContentCodingWithQualityHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentCodingWithQualityHeaderValueFactory.IID)
            HttpContentCodingWithQualityHeaderValue.__IHttpContentCodingWithQualityHeaderValueFactory := IHttpContentCodingWithQualityHeaderValueFactory(factoryPtr)
        }

        return HttpContentCodingWithQualityHeaderValue.__IHttpContentCodingWithQualityHeaderValueFactory.CreateFromValue(contentCoding)
    }

    /**
     * Initializes a new instance of the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) class with **content-coding** information and a qvalue.
     * @param {HSTRING} contentCoding The value of the **content-coding** information to use.
     * @param {Float} quality_ The value of the **qvalue** to use.
     * @returns {HttpContentCodingWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervalue.#ctor
     */
    static CreateFromValueWithQuality(contentCoding, quality_) {
        if (!HttpContentCodingWithQualityHeaderValue.HasProp("__IHttpContentCodingWithQualityHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentCodingWithQualityHeaderValueFactory.IID)
            HttpContentCodingWithQualityHeaderValue.__IHttpContentCodingWithQualityHeaderValueFactory := IHttpContentCodingWithQualityHeaderValueFactory(factoryPtr)
        }

        return HttpContentCodingWithQualityHeaderValue.__IHttpContentCodingWithQualityHeaderValueFactory.CreateFromValueWithQuality(contentCoding, quality_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the value of the **content-coding** characteristic in the **Accept-Encoding** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervalue.contentcoding
     * @type {HSTRING} 
     */
    ContentCoding {
        get => this.get_ContentCoding()
    }

    /**
     * Gets the value of the **qvalue** attribute in the **Accept-Encoding** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervalue.quality
     * @type {IReference<Float>} 
     */
    Quality {
        get => this.get_Quality()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentCoding() {
        if (!this.HasProp("__IHttpContentCodingWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentCodingWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentCodingWithQualityHeaderValue := IHttpContentCodingWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpContentCodingWithQualityHeaderValue.get_ContentCoding()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Quality() {
        if (!this.HasProp("__IHttpContentCodingWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentCodingWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentCodingWithQualityHeaderValue := IHttpContentCodingWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpContentCodingWithQualityHeaderValue.get_Quality()
    }

    /**
     * Returns a string that represents the current [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingwithqualityheadervalue.tostring
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
