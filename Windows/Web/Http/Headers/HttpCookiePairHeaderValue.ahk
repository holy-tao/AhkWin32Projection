#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpCookiePairHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpCookiePairHeaderValueStatics.ahk
#Include .\IHttpCookiePairHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents cookie information used in the **Cookie** HTTP header on an HTTP request.
 * @remarks
 * The HttpCookiePairHeaderValue class represents cookie information used in the **Cookie** HTTP header on an HTTP request.
 * 
 * The [Cookie](httprequestheadercollection_cookie.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an [HttpCookiePairHeaderValueCollection](httpcookiepairheadervaluecollection.md) that contains HttpCookiePairHeaderValue objects.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcookiepairheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpCookiePairHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpCookiePairHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpCookiePairHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpCookiePairHeaderValue](httpcookiepairheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the cookie name and value in the **Cookie** HTTP header.
     * @returns {HttpCookiePairHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcookiepairheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpCookiePairHeaderValue.HasProp("__IHttpCookiePairHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpCookiePairHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCookiePairHeaderValueStatics.IID)
            HttpCookiePairHeaderValue.__IHttpCookiePairHeaderValueStatics := IHttpCookiePairHeaderValueStatics(factoryPtr)
        }

        return HttpCookiePairHeaderValue.__IHttpCookiePairHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpCookiePairHeaderValue](httpcookiepairheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpCookiePairHeaderValue>} cookiePairHeaderValue The [HttpCookiePairHeaderValue](httpcookiepairheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcookiepairheadervalue.tryparse
     */
    static TryParse(input_, cookiePairHeaderValue) {
        if (!HttpCookiePairHeaderValue.HasProp("__IHttpCookiePairHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpCookiePairHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCookiePairHeaderValueStatics.IID)
            HttpCookiePairHeaderValue.__IHttpCookiePairHeaderValueStatics := IHttpCookiePairHeaderValueStatics(factoryPtr)
        }

        return HttpCookiePairHeaderValue.__IHttpCookiePairHeaderValueStatics.TryParse(input_, cookiePairHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpCookiePairHeaderValue](httpcookiepairheadervalue.md) class. with a cookie name.
     * @param {HSTRING} name A token that represents the cookie name.
     * @returns {HttpCookiePairHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcookiepairheadervalue.#ctor
     */
    static CreateFromName(name) {
        if (!HttpCookiePairHeaderValue.HasProp("__IHttpCookiePairHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpCookiePairHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCookiePairHeaderValueFactory.IID)
            HttpCookiePairHeaderValue.__IHttpCookiePairHeaderValueFactory := IHttpCookiePairHeaderValueFactory(factoryPtr)
        }

        return HttpCookiePairHeaderValue.__IHttpCookiePairHeaderValueFactory.CreateFromName(name)
    }

    /**
     * Initializes a new instance of the [HttpCookiePairHeaderValue](httpcookiepairheadervalue.md) class. with a cookie name and a value for the cookie.
     * @param {HSTRING} name A token that represents the cookie name.
     * @param {HSTRING} value A value for the cookie.
     * @returns {HttpCookiePairHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcookiepairheadervalue.#ctor
     */
    static CreateFromNameWithValue(name, value) {
        if (!HttpCookiePairHeaderValue.HasProp("__IHttpCookiePairHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpCookiePairHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCookiePairHeaderValueFactory.IID)
            HttpCookiePairHeaderValue.__IHttpCookiePairHeaderValueFactory := IHttpCookiePairHeaderValueFactory(factoryPtr)
        }

        return HttpCookiePairHeaderValue.__IHttpCookiePairHeaderValueFactory.CreateFromNameWithValue(name, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a token that represents the cookie name used in the **Cookie** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcookiepairheadervalue.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets or sets a value for the cookie used in the **Cookie** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcookiepairheadervalue.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
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
    get_Name() {
        if (!this.HasProp("__IHttpCookiePairHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpCookiePairHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookiePairHeaderValue := IHttpCookiePairHeaderValue(outPtr)
        }

        return this.__IHttpCookiePairHeaderValue.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IHttpCookiePairHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpCookiePairHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookiePairHeaderValue := IHttpCookiePairHeaderValue(outPtr)
        }

        return this.__IHttpCookiePairHeaderValue.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IHttpCookiePairHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpCookiePairHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookiePairHeaderValue := IHttpCookiePairHeaderValue(outPtr)
        }

        return this.__IHttpCookiePairHeaderValue.put_Value(value)
    }

    /**
     * Returns a string that represents the current [HttpCookiePairHeaderValue](httpcookiepairheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcookiepairheadervalue.tostring
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
