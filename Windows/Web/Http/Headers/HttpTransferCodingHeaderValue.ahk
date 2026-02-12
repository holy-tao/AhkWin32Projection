#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpTransferCodingHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpTransferCodingHeaderValueStatics.ahk
#Include .\IHttpTransferCodingHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents transfer coding information used in the **Transfer-Encoding** HTTP header on an HTTP request.
 * @remarks
 * The HttpTransferCodingHeaderValue class represents transfer coding information used in the **Transfer-Encoding** HTTP header on an HTTP request.
 * 
 * The [TransferEncoding](httprequestheadercollection_transferencoding.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an [HttpTransferCodingHeaderValueCollection](httptransfercodingheadervaluecollection.md) that contains HttpTransferCodingHeaderValue objects.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpTransferCodingHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpTransferCodingHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpTransferCodingHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the **transfer-coding** information.
     * @returns {HttpTransferCodingHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpTransferCodingHeaderValue.HasProp("__IHttpTransferCodingHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpTransferCodingHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpTransferCodingHeaderValueStatics.IID)
            HttpTransferCodingHeaderValue.__IHttpTransferCodingHeaderValueStatics := IHttpTransferCodingHeaderValueStatics(factoryPtr)
        }

        return HttpTransferCodingHeaderValue.__IHttpTransferCodingHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpTransferCodingHeaderValue>} transferCodingHeaderValue The [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervalue.tryparse
     */
    static TryParse(input_, transferCodingHeaderValue) {
        if (!HttpTransferCodingHeaderValue.HasProp("__IHttpTransferCodingHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpTransferCodingHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpTransferCodingHeaderValueStatics.IID)
            HttpTransferCodingHeaderValue.__IHttpTransferCodingHeaderValueStatics := IHttpTransferCodingHeaderValueStatics(factoryPtr)
        }

        return HttpTransferCodingHeaderValue.__IHttpTransferCodingHeaderValueStatics.TryParse(input_, transferCodingHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) class.
     * @param {HSTRING} input_ The **transfer-coding** information to initialize the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) object.
     * @returns {HttpTransferCodingHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervalue.#ctor
     */
    static Create(input_) {
        if (!HttpTransferCodingHeaderValue.HasProp("__IHttpTransferCodingHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpTransferCodingHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpTransferCodingHeaderValueFactory.IID)
            HttpTransferCodingHeaderValue.__IHttpTransferCodingHeaderValueFactory := IHttpTransferCodingHeaderValueFactory(factoryPtr)
        }

        return HttpTransferCodingHeaderValue.__IHttpTransferCodingHeaderValueFactory.Create(input_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a set of parameters used in the **Transfer-Encoding** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervalue.parameters
     * @type {IVector<HttpNameValueHeaderValue>} 
     */
    Parameters {
        get => this.get_Parameters()
    }

    /**
     * Gets the transfer-coding value used in the **Transfer-Encoding** HTTP header.
     * @remarks
     * All transfer-coding names are case-insensitive and ought to be registered within the HTTP Transfer Coding registry.
     * 
     * For the list of registered transfer-coding values, see [Hypertext Transfer Protocol (HTTP) Parameters
     * ](https://www.iana.org/assignments/http-parameters/http-parameters.xml#http-parameters-2).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervalue.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HttpNameValueHeaderValue>} 
     */
    get_Parameters() {
        if (!this.HasProp("__IHttpTransferCodingHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpTransferCodingHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpTransferCodingHeaderValue := IHttpTransferCodingHeaderValue(outPtr)
        }

        return this.__IHttpTransferCodingHeaderValue.get_Parameters()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IHttpTransferCodingHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpTransferCodingHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpTransferCodingHeaderValue := IHttpTransferCodingHeaderValue(outPtr)
        }

        return this.__IHttpTransferCodingHeaderValue.get_Value()
    }

    /**
     * Returns a string that represents the current [HttpTransferCodingHeaderValue](httptransfercodingheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httptransfercodingheadervalue.tostring
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
