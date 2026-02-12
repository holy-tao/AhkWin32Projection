#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpContentCodingHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpContentCodingHeaderValueFactory.ahk
#Include .\IHttpContentCodingHeaderValueStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents content encoding information used in the **Content-Encoding** HTTP header on HTTP content in a request or a response.
 * @remarks
 * The HttpContentCodingHeaderValue class represents content encoding information used in the **Content-Encoding** HTTP header on HTTP content sent in an HTTP request or received in an HTTP response.
 * 
 * The [ContentEncoding](httpcontentheadercollection_contentencoding.md) property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) returns an [HttpContentCodingHeaderValueCollection](httpcontentcodingheadervaluecollection.md) that contains HttpContentCodingHeaderValue objects.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpContentCodingHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpContentCodingHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpContentCodingHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) class.
     * @param {HSTRING} contentCoding The value of the **content-coding** to use.
     * @returns {HttpContentCodingHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervalue.#ctor
     */
    static Create(contentCoding) {
        if (!HttpContentCodingHeaderValue.HasProp("__IHttpContentCodingHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentCodingHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentCodingHeaderValueFactory.IID)
            HttpContentCodingHeaderValue.__IHttpContentCodingHeaderValueFactory := IHttpContentCodingHeaderValueFactory(factoryPtr)
        }

        return HttpContentCodingHeaderValue.__IHttpContentCodingHeaderValueFactory.Create(contentCoding)
    }

    /**
     * Converts a string to an [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the content coding information in the **Content-Encoding** HTTP header.
     * @returns {HttpContentCodingHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpContentCodingHeaderValue.HasProp("__IHttpContentCodingHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentCodingHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentCodingHeaderValueStatics.IID)
            HttpContentCodingHeaderValue.__IHttpContentCodingHeaderValueStatics := IHttpContentCodingHeaderValueStatics(factoryPtr)
        }

        return HttpContentCodingHeaderValue.__IHttpContentCodingHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpContentCodingHeaderValue>} contentCodingHeaderValue The [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervalue.tryparse
     */
    static TryParse(input_, contentCodingHeaderValue) {
        if (!HttpContentCodingHeaderValue.HasProp("__IHttpContentCodingHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentCodingHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentCodingHeaderValueStatics.IID)
            HttpContentCodingHeaderValue.__IHttpContentCodingHeaderValueStatics := IHttpContentCodingHeaderValueStatics(factoryPtr)
        }

        return HttpContentCodingHeaderValue.__IHttpContentCodingHeaderValueStatics.TryParse(input_, contentCodingHeaderValue)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the value of the **content-coding** information used in the **Content-Encoding** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervalue.contentcoding
     * @type {HSTRING} 
     */
    ContentCoding {
        get => this.get_ContentCoding()
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
        if (!this.HasProp("__IHttpContentCodingHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentCodingHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentCodingHeaderValue := IHttpContentCodingHeaderValue(outPtr)
        }

        return this.__IHttpContentCodingHeaderValue.get_ContentCoding()
    }

    /**
     * Returns a string that represents the current [HttpContentCodingHeaderValue](httpcontentcodingheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentcodingheadervalue.tostring
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
