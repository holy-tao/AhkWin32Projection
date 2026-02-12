#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpExpectationHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpExpectationHeaderValueStatics.ahk
#Include .\IHttpExpectationHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a token for a particular server behavior required by the client that is used in the **Expect** HTTP header on an HTTP request.
 * @remarks
 * The HttpExpectationHeaderValue class is a token that represents a particular server behavior that is required by the client. The HttpExpectationHeaderValue is used in the **Expect** HTTP header on an HTTP request.
 * 
 * For example, **100-continue** is a server behavior that the client might depend on and set using the HttpExpectationHeaderValue class.
 * 
 * The [Expect](httprequestheadercollection_expect.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an [HttpExpectationHeaderValueCollection](httpexpectationheadervaluecollection.md) that contains HttpExpectationHeaderValue objects.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpExpectationHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpExpectationHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpExpectationHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpExpectationHeaderValue](httpexpectationheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the information in the **Expect** HTTP header.
     * @returns {HttpExpectationHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpExpectationHeaderValue.HasProp("__IHttpExpectationHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpExpectationHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpExpectationHeaderValueStatics.IID)
            HttpExpectationHeaderValue.__IHttpExpectationHeaderValueStatics := IHttpExpectationHeaderValueStatics(factoryPtr)
        }

        return HttpExpectationHeaderValue.__IHttpExpectationHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpExpectationHeaderValue>} expectationHeaderValue The [HttpExpectationHeaderValue](httpexpectationheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue.tryparse
     */
    static TryParse(input_, expectationHeaderValue) {
        if (!HttpExpectationHeaderValue.HasProp("__IHttpExpectationHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpExpectationHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpExpectationHeaderValueStatics.IID)
            HttpExpectationHeaderValue.__IHttpExpectationHeaderValueStatics := IHttpExpectationHeaderValueStatics(factoryPtr)
        }

        return HttpExpectationHeaderValue.__IHttpExpectationHeaderValueStatics.TryParse(input_, expectationHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) class with a name.
     * @param {HSTRING} name A token that represents a name used in the **Expect** HTTP header.
     * @returns {HttpExpectationHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue.#ctor
     */
    static CreateFromName(name) {
        if (!HttpExpectationHeaderValue.HasProp("__IHttpExpectationHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpExpectationHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpExpectationHeaderValueFactory.IID)
            HttpExpectationHeaderValue.__IHttpExpectationHeaderValueFactory := IHttpExpectationHeaderValueFactory(factoryPtr)
        }

        return HttpExpectationHeaderValue.__IHttpExpectationHeaderValueFactory.CreateFromName(name)
    }

    /**
     * Initializes a new instance of the [HttpExpectationHeaderValue](httpexpectationheadervalue.md) class with a name and value for the name.
     * @param {HSTRING} name A token that represents a name used in the **Expect** HTTP header.
     * @param {HSTRING} value A value for the name used in the **Expect** HTTP header.
     * @returns {HttpExpectationHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue.#ctor
     */
    static CreateFromNameWithValue(name, value) {
        if (!HttpExpectationHeaderValue.HasProp("__IHttpExpectationHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpExpectationHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpExpectationHeaderValueFactory.IID)
            HttpExpectationHeaderValue.__IHttpExpectationHeaderValueFactory := IHttpExpectationHeaderValueFactory(factoryPtr)
        }

        return HttpExpectationHeaderValue.__IHttpExpectationHeaderValueFactory.CreateFromNameWithValue(name, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a token that represents a name for a server behavior used in the **Expect** HTTP header.
     * @remarks
     * An example of a Name property would be a string that contains **100-continue**, which repreesnts a server behavior that the client might depend on.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets or sets a value for a server behavior used in the **Expect** HTTP header.
     * @remarks
     * A given server behavior might not require a value and the Value property would be an empty string. For example, **100-continue** is never used with a value.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets a set of parameters for a server behavior included in the **Expect** HTTP header.
     * @remarks
     * A given server behavior might not allow parameters and the Parameters property would be an empty list. For example, **100-continue** is never used with parameters.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue.parameters
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
    get_Name() {
        if (!this.HasProp("__IHttpExpectationHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpExpectationHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpExpectationHeaderValue := IHttpExpectationHeaderValue(outPtr)
        }

        return this.__IHttpExpectationHeaderValue.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IHttpExpectationHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpExpectationHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpExpectationHeaderValue := IHttpExpectationHeaderValue(outPtr)
        }

        return this.__IHttpExpectationHeaderValue.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IHttpExpectationHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpExpectationHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpExpectationHeaderValue := IHttpExpectationHeaderValue(outPtr)
        }

        return this.__IHttpExpectationHeaderValue.put_Value(value)
    }

    /**
     * 
     * @returns {IVector<HttpNameValueHeaderValue>} 
     */
    get_Parameters() {
        if (!this.HasProp("__IHttpExpectationHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpExpectationHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpExpectationHeaderValue := IHttpExpectationHeaderValue(outPtr)
        }

        return this.__IHttpExpectationHeaderValue.get_Parameters()
    }

    /**
     * Returns a string that represents the current [HttpExpectationHeaderValue](httpexpectationheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpexpectationheadervalue.tostring
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
