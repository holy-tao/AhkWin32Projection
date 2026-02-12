#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpLanguageRangeWithQualityHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpLanguageRangeWithQualityHeaderValueFactory.ahk
#Include .\IHttpLanguageRangeWithQualityHeaderValueStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents accept language information used in the **Accept-Language** HTTP header on an HTTP request.
 * @remarks
 * The HttpLanguageRangeWithQualityHeaderValue class represents accept language information used in the **Accept-Language** HTTP header on an HTTP request.
 * 
 * The **Accept-Language** header can be used by clients to indicate the set of natural languages that are preferred in the response. A language range is defined in IETF [RFC 4647](https://tools.ietf.org/html/rfc4647). It is a language tag, or partial language tag, indicating a language, or range of languages. For example **en-us** would be American English, and **en-gb** would be British English. While **en** is a language range, meaning any variation of English.
 * 
 * Each language-range can be given an associated quality value representing an estimate of the user's preference for the languages specified by that range. The quality must be in the range 0.0 to 1.0.
 * 
 * Some recipients treat the order in which language tags are listed as an indication of descending priority, particularly for tags that are assigned equal quality values (no value is the same as q=1). However, this behavior cannot be relied upon. For consistency and to maximize interoperability, many user agents assign each language tag a unique quality value while also listing them in order of decreasing quality.
 * 
 * The [AcceptLanguage](httprequestheadercollection_acceptlanguage.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an [HttpLanguageRangeWithQualityHeaderValueCollection](httplanguagerangewithqualityheadervaluecollection.md) that contains HttpLanguageRangeWithQualityHeaderValue objects.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpLanguageRangeWithQualityHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpLanguageRangeWithQualityHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpLanguageRangeWithQualityHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) class with language-range information.
     * @param {HSTRING} languageRange The value of the **language-range** information used in the **Accept-Language** HTTP header.
     * @returns {HttpLanguageRangeWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervalue.#ctor
     */
    static CreateFromLanguageRange(languageRange) {
        if (!HttpLanguageRangeWithQualityHeaderValue.HasProp("__IHttpLanguageRangeWithQualityHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpLanguageRangeWithQualityHeaderValueFactory.IID)
            HttpLanguageRangeWithQualityHeaderValue.__IHttpLanguageRangeWithQualityHeaderValueFactory := IHttpLanguageRangeWithQualityHeaderValueFactory(factoryPtr)
        }

        return HttpLanguageRangeWithQualityHeaderValue.__IHttpLanguageRangeWithQualityHeaderValueFactory.CreateFromLanguageRange(languageRange)
    }

    /**
     * Initializes a new instance of the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) class with language-range and quality information.
     * @param {HSTRING} languageRange The value of the **language-range** information used in the **Accept-Language** HTTP header.
     * @param {Float} quality_ The value of the **qvalue** or quality factor used in the **Accept-Language** HTTP header.
     * @returns {HttpLanguageRangeWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervalue.#ctor
     */
    static CreateFromLanguageRangeWithQuality(languageRange, quality_) {
        if (!HttpLanguageRangeWithQualityHeaderValue.HasProp("__IHttpLanguageRangeWithQualityHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpLanguageRangeWithQualityHeaderValueFactory.IID)
            HttpLanguageRangeWithQualityHeaderValue.__IHttpLanguageRangeWithQualityHeaderValueFactory := IHttpLanguageRangeWithQualityHeaderValueFactory(factoryPtr)
        }

        return HttpLanguageRangeWithQualityHeaderValue.__IHttpLanguageRangeWithQualityHeaderValueFactory.CreateFromLanguageRangeWithQuality(languageRange, quality_)
    }

    /**
     * Converts a string to an [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) instance.
     * @remarks
     * Below is the exception that this function throws.
     * @param {HSTRING} input_ A string that represents the language-range and quality factor information used in the **Accept-Encoding** HTTP header.
     * @returns {HttpLanguageRangeWithQualityHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpLanguageRangeWithQualityHeaderValue.HasProp("__IHttpLanguageRangeWithQualityHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpLanguageRangeWithQualityHeaderValueStatics.IID)
            HttpLanguageRangeWithQualityHeaderValue.__IHttpLanguageRangeWithQualityHeaderValueStatics := IHttpLanguageRangeWithQualityHeaderValueStatics(factoryPtr)
        }

        return HttpLanguageRangeWithQualityHeaderValue.__IHttpLanguageRangeWithQualityHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpLanguageRangeWithQualityHeaderValue>} languageRangeWithQualityHeaderValue The [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervalue.tryparse
     */
    static TryParse(input_, languageRangeWithQualityHeaderValue) {
        if (!HttpLanguageRangeWithQualityHeaderValue.HasProp("__IHttpLanguageRangeWithQualityHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpLanguageRangeWithQualityHeaderValueStatics.IID)
            HttpLanguageRangeWithQualityHeaderValue.__IHttpLanguageRangeWithQualityHeaderValueStatics := IHttpLanguageRangeWithQualityHeaderValueStatics(factoryPtr)
        }

        return HttpLanguageRangeWithQualityHeaderValue.__IHttpLanguageRangeWithQualityHeaderValueStatics.TryParse(input_, languageRangeWithQualityHeaderValue)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the value of the **language-range** information from the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) used in the **Accept-Language** HTTP header.
     * @remarks
     * The **Accept-Language** header can be used by clients to indicate the set of natural languages that are preferred in the response. A language range is defined in IETF [RFC 4647](https://tools.ietf.org/html/rfc4647). It is a language tag, or partial language tag, indicating a language, or range of languages. For example **en-us** would be American English, and **en-gb** would be British English. While **en** is a language range, meaning any variation of English.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervalue.languagerange
     * @type {HSTRING} 
     */
    LanguageRange {
        get => this.get_LanguageRange()
    }

    /**
     * Gets the value of the **qvalue** or quality factor from the [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) used in the **Accept-Language** HTTP header.
     * @remarks
     * Each language-range can be given an associated quality value representing an estimate of the user's preference for the languages specified by that range. The quality must be in the range 0.0 to 1.0. No value for the Quality property is the same as q=1.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervalue.quality
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
    get_LanguageRange() {
        if (!this.HasProp("__IHttpLanguageRangeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpLanguageRangeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpLanguageRangeWithQualityHeaderValue := IHttpLanguageRangeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpLanguageRangeWithQualityHeaderValue.get_LanguageRange()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Quality() {
        if (!this.HasProp("__IHttpLanguageRangeWithQualityHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpLanguageRangeWithQualityHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpLanguageRangeWithQualityHeaderValue := IHttpLanguageRangeWithQualityHeaderValue(outPtr)
        }

        return this.__IHttpLanguageRangeWithQualityHeaderValue.get_Quality()
    }

    /**
     * Returns a string that represents the current [HttpLanguageRangeWithQualityHeaderValue](httplanguagerangewithqualityheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httplanguagerangewithqualityheadervalue.tostring
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
