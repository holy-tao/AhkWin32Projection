#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpMediaTypeHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpMediaTypeHeaderValueFactory.ahk
#Include .\IHttpMediaTypeHeaderValueStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Content-Type** HTTP header on the HTTP content in a request or a response.
 * @remarks
 * The HttpMediaTypeHeaderValue class represents the value of the **Content-Type** HTTP header on HTTP content sent in an HTTP request or received in an HTTP response.
 * 
 * The [ContentType](httpcontentheadercollection_contenttype.md) property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) returns an HttpMediaTypeHeaderValue object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypeheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpMediaTypeHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpMediaTypeHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpMediaTypeHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpMediaTypeHeaderValue](httpmediatypeheadervalue.md) class.
     * @param {HSTRING} mediaType_ The **media-type** of the entity-body used in the **Content-Type** HTTP header.
     * @returns {HttpMediaTypeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypeheadervalue.#ctor
     */
    static Create(mediaType_) {
        if (!HttpMediaTypeHeaderValue.HasProp("__IHttpMediaTypeHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpMediaTypeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMediaTypeHeaderValueFactory.IID)
            HttpMediaTypeHeaderValue.__IHttpMediaTypeHeaderValueFactory := IHttpMediaTypeHeaderValueFactory(factoryPtr)
        }

        return HttpMediaTypeHeaderValue.__IHttpMediaTypeHeaderValueFactory.Create(mediaType_)
    }

    /**
     * Converts a string to an [HttpMediaTypeHeaderValue](httpmediatypeheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the media-type and character set information used in the **Content-Type** HTTP header.
     * @returns {HttpMediaTypeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypeheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpMediaTypeHeaderValue.HasProp("__IHttpMediaTypeHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpMediaTypeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMediaTypeHeaderValueStatics.IID)
            HttpMediaTypeHeaderValue.__IHttpMediaTypeHeaderValueStatics := IHttpMediaTypeHeaderValueStatics(factoryPtr)
        }

        return HttpMediaTypeHeaderValue.__IHttpMediaTypeHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpMediaTypeHeaderValue](httpmediatypeheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpMediaTypeHeaderValue>} mediaTypeHeaderValue The [HttpMediaTypeHeaderValue](httpmediatypeheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypeheadervalue.tryparse
     */
    static TryParse(input_, mediaTypeHeaderValue) {
        if (!HttpMediaTypeHeaderValue.HasProp("__IHttpMediaTypeHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpMediaTypeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMediaTypeHeaderValueStatics.IID)
            HttpMediaTypeHeaderValue.__IHttpMediaTypeHeaderValueStatics := IHttpMediaTypeHeaderValueStatics(factoryPtr)
        }

        return HttpMediaTypeHeaderValue.__IHttpMediaTypeHeaderValueStatics.TryParse(input_, mediaTypeHeaderValue)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the character set of the entity-body used in the **Content-Type** HTTP header.
     * @remarks
     * HTTP uses character set names to indicate or negotiate the character encoding scheme of a textual representation [RFC6365]. A CharSet property is identified by a case-insensitive token.
     * 
     * Character set names ought to be registered in the [IANA Character Set registry](https://www.iana.org/assignments/character-sets/character-sets.xml).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypeheadervalue.charset
     * @type {HSTRING} 
     */
    CharSet {
        get => this.get_CharSet()
        set => this.put_CharSet(value)
    }

    /**
     * Gets or sets the **media-type** of the entity-body used in the **Content-Type** HTTP header.
     * @remarks
     * Internet media types should be registered with IANA. Media type registrations are listed in categories by IANA as [MIME Media Types](https://www.iana.org/assignments/media-types).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypeheadervalue.mediatype
     * @type {HSTRING} 
     */
    MediaType {
        get => this.get_MediaType()
        set => this.put_MediaType(value)
    }

    /**
     * Gets a set of parameters included in the **Content-Type** HTTP header.
     * @remarks
     * The Parameters property contains a set of zero or more name/value pairs associated with the [MediaType](httpmediatypeheadervalue_mediatype.md).
     * 
     * The [CharSet](httpmediatypeheadervalue_charset.md) property is one name/value pair. The [CharSet](httpmediatypeheadervalue_charset.md) property is a shortcut to access the value of the entry in the Parameters list whose name is **charset**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypeheadervalue.parameters
     * @type {IVector<HttpNameValueHeaderValue>} 
     */
    Parameters {
        get => this.get_Parameters()
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
        if (!this.HasProp("__IHttpMediaTypeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeHeaderValue := IHttpMediaTypeHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeHeaderValue.get_CharSet()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CharSet(value) {
        if (!this.HasProp("__IHttpMediaTypeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeHeaderValue := IHttpMediaTypeHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeHeaderValue.put_CharSet(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaType() {
        if (!this.HasProp("__IHttpMediaTypeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeHeaderValue := IHttpMediaTypeHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeHeaderValue.get_MediaType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MediaType(value) {
        if (!this.HasProp("__IHttpMediaTypeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeHeaderValue := IHttpMediaTypeHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeHeaderValue.put_MediaType(value)
    }

    /**
     * 
     * @returns {IVector<HttpNameValueHeaderValue>} 
     */
    get_Parameters() {
        if (!this.HasProp("__IHttpMediaTypeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpMediaTypeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMediaTypeHeaderValue := IHttpMediaTypeHeaderValue(outPtr)
        }

        return this.__IHttpMediaTypeHeaderValue.get_Parameters()
    }

    /**
     * Returns a string that represents the current [HttpMediaTypeHeaderValue](httpmediatypeheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpmediatypeheadervalue.tostring
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
