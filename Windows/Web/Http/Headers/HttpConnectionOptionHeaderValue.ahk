#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpConnectionOptionHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpConnectionOptionHeaderValueStatics.ahk
#Include .\IHttpConnectionOptionHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents connection information used in the **Connection** HTTP header on an HTTP request.
 * @remarks
 * The HttpConnectionOptionHeaderValue class represents connection information used in the **Connection** HTTP header on an HTTP request.
 * 
 * The [Connection](httprequestheadercollection_connection.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an [HttpConnectionOptionHeaderValueCollection](httpconnectionoptionheadervaluecollection.md) that contains HttpConnectionOptionHeaderValue objects.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpConnectionOptionHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpConnectionOptionHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpConnectionOptionHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) instance.
     * @remarks
     * Below are exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the connection information in the **Connection** HTTP header.
     * @returns {HttpConnectionOptionHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpConnectionOptionHeaderValue.HasProp("__IHttpConnectionOptionHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpConnectionOptionHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpConnectionOptionHeaderValueStatics.IID)
            HttpConnectionOptionHeaderValue.__IHttpConnectionOptionHeaderValueStatics := IHttpConnectionOptionHeaderValueStatics(factoryPtr)
        }

        return HttpConnectionOptionHeaderValue.__IHttpConnectionOptionHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpConnectionOptionHeaderValue>} connectionOptionHeaderValue The [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervalue.tryparse
     */
    static TryParse(input_, connectionOptionHeaderValue) {
        if (!HttpConnectionOptionHeaderValue.HasProp("__IHttpConnectionOptionHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpConnectionOptionHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpConnectionOptionHeaderValueStatics.IID)
            HttpConnectionOptionHeaderValue.__IHttpConnectionOptionHeaderValueStatics := IHttpConnectionOptionHeaderValueStatics(factoryPtr)
        }

        return HttpConnectionOptionHeaderValue.__IHttpConnectionOptionHeaderValueStatics.TryParse(input_, connectionOptionHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) class.
     * @param {HSTRING} token The value of the **connection-token** to use.
     * @returns {HttpConnectionOptionHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervalue.#ctor
     */
    static Create(token) {
        if (!HttpConnectionOptionHeaderValue.HasProp("__IHttpConnectionOptionHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpConnectionOptionHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpConnectionOptionHeaderValueFactory.IID)
            HttpConnectionOptionHeaderValue.__IHttpConnectionOptionHeaderValueFactory := IHttpConnectionOptionHeaderValueFactory(factoryPtr)
        }

        return HttpConnectionOptionHeaderValue.__IHttpConnectionOptionHeaderValueFactory.Create(token)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the value of the **connection-token** in the **Connection** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervalue.token
     * @type {HSTRING} 
     */
    Token {
        get => this.get_Token()
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
    get_Token() {
        if (!this.HasProp("__IHttpConnectionOptionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpConnectionOptionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpConnectionOptionHeaderValue := IHttpConnectionOptionHeaderValue(outPtr)
        }

        return this.__IHttpConnectionOptionHeaderValue.get_Token()
    }

    /**
     * Returns a string that represents the current [HttpConnectionOptionHeaderValue](httpconnectionoptionheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpconnectionoptionheadervalue.tostring
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
