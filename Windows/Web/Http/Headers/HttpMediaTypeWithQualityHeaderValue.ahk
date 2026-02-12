#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpMediaTypeWithQualityHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpMediaTypeWithQualityHeaderValueStatics.ahk
#Include .\IHttpMediaTypeWithQualityHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents accept information used in the **Accept** HTTP header on an HTTP request.
 * @remarks
 * The HttpMediaTypeWithQualityHeaderValue class represents accept information used in the **Accept** HTTP header on an HTTP request.
 * 
 * The [Accept](httprequestheadercollection_accept.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an [HttpMediaTypeWithQualityHeaderValueCollection](httpmediatypewithqualityheadervaluecollection.md) that contains HttpMediaTypeWithQualityHeaderValue objects.
 * 
 * The [Quality](httpmediatypewithqualityheadervalue_quality.md) property represents the quality factor that allows the user agent to indicate the relative degree of preference for the media type in a header. [Quality](httpmediatypewithqualityheadervalue_quality.md) uses a scale from 0 to 1. The default value is q=1.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpMediaTypeWithQualityHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpMediaTypeWithQualityHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpMediaTypeWithQualityHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the media-type, character set, and quality information used in the **Accept** HTTP header.
     * @returns {HttpMediaTypeWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpMediaTypeWithQualityHeaderValue.HasProp("__IHttpMediaTypeWithQualityHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMediaTypeWithQualityHeaderValueStatics.IID)
            HttpMediaTypeWithQualityHeaderValue.__IHttpMediaTypeWithQualityHeaderValueStatics := IHttpMediaTypeWithQualityHeaderValueStatics(factoryPtr)
        }

        return HttpMediaTypeWithQualityHeaderValue.__IHttpMediaTypeWithQualityHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpMediaTypeWithQualityHeaderValue>} mediaTypeWithQualityHeaderValue The [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.tryparse
     */
    static TryParse(input_, mediaTypeWithQualityHeaderValue) {
        if (!HttpMediaTypeWithQualityHeaderValue.HasProp("__IHttpMediaTypeWithQualityHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMediaTypeWithQualityHeaderValueStatics.IID)
            HttpMediaTypeWithQualityHeaderValue.__IHttpMediaTypeWithQualityHeaderValueStatics := IHttpMediaTypeWithQualityHeaderValueStatics(factoryPtr)
        }

        return HttpMediaTypeWithQualityHeaderValue.__IHttpMediaTypeWithQualityHeaderValueStatics.TryParse(input_, mediaTypeWithQualityHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpMediaTypeHeaderValue](httpmediatypeheadervalue.md) class with a media type.
     * @param {HSTRING} mediaType_ The **media-type** of the entity-body to accept that is used in the **Accept** HTTP header.
     * @returns {HttpMediaTypeWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.#ctor
     */
    static CreateFromMediaType(mediaType_) {
        if (!HttpMediaTypeWithQualityHeaderValue.HasProp("__IHttpMediaTypeWithQualityHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMediaTypeWithQualityHeaderValueFactory.IID)
            HttpMediaTypeWithQualityHeaderValue.__IHttpMediaTypeWithQualityHeaderValueFactory := IHttpMediaTypeWithQualityHeaderValueFactory(factoryPtr)
        }

        return HttpMediaTypeWithQualityHeaderValue.__IHttpMediaTypeWithQualityHeaderValueFactory.CreateFromMediaType(mediaType_)
    }

    /**
     * Initializes a new instance of the [HttpMediaTypeHeaderValue](httpmediatypeheadervalue.md) class with a media type and quality.
     * @param {HSTRING} mediaType_ The **media-type** of the entity-body to accept that is used in the **Accept** HTTP header.
     * @param {Float} quality_ The **qvalue** or quality.
     * @returns {HttpMediaTypeWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.#ctor
     */
    static CreateFromMediaTypeWithQuality(mediaType_, quality_) {
        if (!HttpMediaTypeWithQualityHeaderValue.HasProp("__IHttpMediaTypeWithQualityHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMediaTypeWithQualityHeaderValueFactory.IID)
            HttpMediaTypeWithQualityHeaderValue.__IHttpMediaTypeWithQualityHeaderValueFactory := IHttpMediaTypeWithQualityHeaderValueFactory(factoryPtr)
        }

        return HttpMediaTypeWithQualityHeaderValue.__IHttpMediaTypeWithQualityHeaderValueFactory.CreateFromMediaTypeWithQuality(mediaType_, quality_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the character set of the content to accept that is used in the **Accept** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.charset
     * @type {HSTRING} 
     */
    CharSet {
        get => this.get_CharSet()
        set => this.put_CharSet(value)
    }

    /**
     * Gets or sets the **media-type** of the content to accept that is used in the **Accept** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.mediatype
     * @type {HSTRING} 
     */
    MediaType {
        get => this.get_MediaType()
        set => this.put_MediaType(value)
    }

    /**
     * Gets a set of parameters included in the **Accept** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.parameters
     * @type {IVector<HttpNameValueHeaderValue>} 
     */
    Parameters {
        get => this.get_Parameters()
    }

    /**
     * Get or set the **qvalue** or quality used in the **Accept** HTTP header.
     * @remarks
     * The Quality property represents the quality factor that allows the user agent to indicate the relative degree of preference for the media type in a header. Quality uses a scale from 0 to 1. The default value is q=1.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.quality
     * @type {IReference<Float>} 
     */
    Quality {
        get => this.get_Quality()
        set => this.put_Quality(value)
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
    get_CharSet() {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValue := IHttpMediaTypeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValue.get_CharSet()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CharSet(value) {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValue := IHttpMediaTypeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValue.put_CharSet(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaType() {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValue := IHttpMediaTypeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValue.get_MediaType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MediaType(value) {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValue := IHttpMediaTypeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValue.put_MediaType(value)
    }

    /**
     * 
     * @returns {IVector<HttpNameValueHeaderValue>} 
     */
    get_Parameters() {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValue := IHttpMediaTypeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValue.get_Parameters()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Quality() {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValue := IHttpMediaTypeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValue.get_Quality()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_Quality(value) {
        if (!this.HasProp("__IHttpMediaTypeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeWithQualityHeaderValue := IHttpMediaTypeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeWithQualityHeaderValue.put_Quality(value)
    }

    /**
     * Returns a string that represents the current [HttpMediaTypeWithQualityHeaderValue](httpmediatypewithqualityheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypewithqualityheadervalue.tostring
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
