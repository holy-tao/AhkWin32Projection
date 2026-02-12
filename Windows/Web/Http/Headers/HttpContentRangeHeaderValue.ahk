#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpContentRangeHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpContentRangeHeaderValueStatics.ahk
#Include .\IHttpContentRangeHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Content-Range** HTTP header on HTTP content in a request or a response.
 * @remarks
 * The HttpContentRangeHeaderValue class represents the value of the **Content-Range** HTTP header on HTTP content sent in an HTTP request or received in an response.
 * 
 * The [ContentRange](httpcontentheadercollection_contentrange.md) property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) returns an HttpContentRangeHeaderValue object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpContentRangeHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpContentRangeHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpContentRangeHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpContentRangeHeaderValue](httpcontentrangeheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the content range information in the **Content-Range** HTTP header.
     * @returns {HttpContentRangeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpContentRangeHeaderValue.HasProp("__IHttpContentRangeHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentRangeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentRangeHeaderValueStatics.IID)
            HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueStatics := IHttpContentRangeHeaderValueStatics(factoryPtr)
        }

        return HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpContentRangeHeaderValue](httpcontentrangeheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpContentRangeHeaderValue>} contentRangeHeaderValue The [HttpContentRangeHeaderValue](httpcontentrangeheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.tryparse
     */
    static TryParse(input_, contentRangeHeaderValue) {
        if (!HttpContentRangeHeaderValue.HasProp("__IHttpContentRangeHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentRangeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentRangeHeaderValueStatics.IID)
            HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueStatics := IHttpContentRangeHeaderValueStatics(factoryPtr)
        }

        return HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueStatics.TryParse(input_, contentRangeHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpContentRangeHeaderValue](httpcontentrangeheadervalue.md) class with a content length.
     * @param {Integer} length The length, in bytes, of the full content entity body.
     * @returns {HttpContentRangeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.#ctor
     */
    static CreateFromLength(length) {
        if (!HttpContentRangeHeaderValue.HasProp("__IHttpContentRangeHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentRangeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentRangeHeaderValueFactory.IID)
            HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueFactory := IHttpContentRangeHeaderValueFactory(factoryPtr)
        }

        return HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueFactory.CreateFromLength(length)
    }

    /**
     * Initializes a new instance of the [HttpContentRangeHeaderValue](httpcontentrangeheadervalue.md) class with a start and stop position.
     * @param {Integer} from The position, in bytes, at which to start sending data.
     * @param {Integer} to The position, in bytes, at which to stop sending data.
     * @returns {HttpContentRangeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.#ctor
     */
    static CreateFromRange(from, to) {
        if (!HttpContentRangeHeaderValue.HasProp("__IHttpContentRangeHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentRangeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentRangeHeaderValueFactory.IID)
            HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueFactory := IHttpContentRangeHeaderValueFactory(factoryPtr)
        }

        return HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueFactory.CreateFromRange(from, to)
    }

    /**
     * Initializes a new instance of the [HttpContentRangeHeaderValue](httpcontentrangeheadervalue.md) class with a start and stop position and a content length.
     * @param {Integer} from The position, in bytes, at which to start sending data.
     * @param {Integer} to The position, in bytes, at which to stop sending data.
     * @param {Integer} length The length, in bytes, of the full content entity body.
     * @returns {HttpContentRangeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.#ctor
     */
    static CreateFromRangeWithLength(from, to, length) {
        if (!HttpContentRangeHeaderValue.HasProp("__IHttpContentRangeHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentRangeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentRangeHeaderValueFactory.IID)
            HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueFactory := IHttpContentRangeHeaderValueFactory(factoryPtr)
        }

        return HttpContentRangeHeaderValue.__IHttpContentRangeHeaderValueFactory.CreateFromRangeWithLength(from, to, length)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the position at which to start sending data in the **Content-Range** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.firstbyteposition
     * @type {IReference<Integer>} 
     */
    FirstBytePosition {
        get => this.get_FirstBytePosition()
    }

    /**
     * Gets the position at which to stop sending data in the **Content-Range** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.lastbyteposition
     * @type {IReference<Integer>} 
     */
    LastBytePosition {
        get => this.get_LastBytePosition()
    }

    /**
     * Gets the length of the full content entity body in the **Content-Range** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.length
     * @type {IReference<Integer>} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets or sets the value of the range units used in the **Content-Range** HTTP header.
     * @remarks
     * The only range unit defined by HTTP/1.1 is "bytes".
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.unit
     * @type {HSTRING} 
     */
    Unit {
        get => this.get_Unit()
        set => this.put_Unit(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_FirstBytePosition() {
        if (!this.HasProp("__IHttpContentRangeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentRangeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentRangeHeaderValue := IHttpContentRangeHeaderValue(outPtr)
        }

        return this.__IHttpContentRangeHeaderValue.get_FirstBytePosition()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LastBytePosition() {
        if (!this.HasProp("__IHttpContentRangeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentRangeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentRangeHeaderValue := IHttpContentRangeHeaderValue(outPtr)
        }

        return this.__IHttpContentRangeHeaderValue.get_LastBytePosition()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Length() {
        if (!this.HasProp("__IHttpContentRangeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentRangeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentRangeHeaderValue := IHttpContentRangeHeaderValue(outPtr)
        }

        return this.__IHttpContentRangeHeaderValue.get_Length()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Unit() {
        if (!this.HasProp("__IHttpContentRangeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentRangeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentRangeHeaderValue := IHttpContentRangeHeaderValue(outPtr)
        }

        return this.__IHttpContentRangeHeaderValue.get_Unit()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Unit(value) {
        if (!this.HasProp("__IHttpContentRangeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentRangeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentRangeHeaderValue := IHttpContentRangeHeaderValue(outPtr)
        }

        return this.__IHttpContentRangeHeaderValue.put_Unit(value)
    }

    /**
     * Returns a string that represents the current [HttpContentRangeHeaderValue](httpcontentrangeheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentrangeheadervalue.tostring
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
