#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpNameValueHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpNameValueHeaderValueStatics.ahk
#Include .\IHttpNameValueHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents name and value information used in a number of HTTP headers.
 * @remarks
 * The HttpNameValueHeaderValue class provides support for name/value pairs used in various headers
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpnamevalueheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpNameValueHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpNameValueHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpNameValueHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the name and value.
     * @returns {HttpNameValueHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpnamevalueheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpNameValueHeaderValue.HasProp("__IHttpNameValueHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpNameValueHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpNameValueHeaderValueStatics.IID)
            HttpNameValueHeaderValue.__IHttpNameValueHeaderValueStatics := IHttpNameValueHeaderValueStatics(factoryPtr)
        }

        return HttpNameValueHeaderValue.__IHttpNameValueHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpNameValueHeaderValue>} nameValueHeaderValue The [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpnamevalueheadervalue.tryparse
     */
    static TryParse(input_, nameValueHeaderValue) {
        if (!HttpNameValueHeaderValue.HasProp("__IHttpNameValueHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpNameValueHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpNameValueHeaderValueStatics.IID)
            HttpNameValueHeaderValue.__IHttpNameValueHeaderValueStatics := IHttpNameValueHeaderValueStatics(factoryPtr)
        }

        return HttpNameValueHeaderValue.__IHttpNameValueHeaderValueStatics.TryParse(input_, nameValueHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) class. with a name.
     * @param {HSTRING} name The name to be used.
     * @returns {HttpNameValueHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpnamevalueheadervalue.#ctor
     */
    static CreateFromName(name) {
        if (!HttpNameValueHeaderValue.HasProp("__IHttpNameValueHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpNameValueHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpNameValueHeaderValueFactory.IID)
            HttpNameValueHeaderValue.__IHttpNameValueHeaderValueFactory := IHttpNameValueHeaderValueFactory(factoryPtr)
        }

        return HttpNameValueHeaderValue.__IHttpNameValueHeaderValueFactory.CreateFromName(name)
    }

    /**
     * Initializes a new instance of the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) class. with a name and value.
     * @param {HSTRING} name The name to be used.
     * @param {HSTRING} value The value to associate with the *name*.
     * @returns {HttpNameValueHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpnamevalueheadervalue.#ctor
     */
    static CreateFromNameWithValue(name, value) {
        if (!HttpNameValueHeaderValue.HasProp("__IHttpNameValueHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpNameValueHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpNameValueHeaderValueFactory.IID)
            HttpNameValueHeaderValue.__IHttpNameValueHeaderValueFactory := IHttpNameValueHeaderValueFactory(factoryPtr)
        }

        return HttpNameValueHeaderValue.__IHttpNameValueHeaderValueFactory.CreateFromNameWithValue(name, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name used in the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpnamevalueheadervalue.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets or sets the value associated with a name used in the [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpnamevalueheadervalue.value
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
        if (!this.HasProp("__IHttpNameValueHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpNameValueHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpNameValueHeaderValue := IHttpNameValueHeaderValue(outPtr)
        }

        return this.__IHttpNameValueHeaderValue.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IHttpNameValueHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpNameValueHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpNameValueHeaderValue := IHttpNameValueHeaderValue(outPtr)
        }

        return this.__IHttpNameValueHeaderValue.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IHttpNameValueHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpNameValueHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpNameValueHeaderValue := IHttpNameValueHeaderValue(outPtr)
        }

        return this.__IHttpNameValueHeaderValue.put_Value(value)
    }

    /**
     * Returns a string that represents the current [HttpNameValueHeaderValue](httpnamevalueheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpnamevalueheadervalue.tostring
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
