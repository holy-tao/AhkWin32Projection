#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpProductInfoHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpProductInfoHeaderValueStatics.ahk
#Include .\IHttpProductInfoHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents product information used in the **User-Agent** HTTP header on an HTTP request.
 * @remarks
 * The HttpProductInfoHeaderValue class represents product information used in the **User-Agent** HTTP header on an HTTP request.
 * 
 * The **User-Agent** header contains information about the user agent originating the request. The **User-Agent** header can contain multiple product tokens, each followed by optional comments which together identify the user agent and any sub-products. By convention, the product identifiers are listed in decreasing order of their significance for identifying the user agent software. Each product identifier consists of a name and optional version.
 * 
 * Each instance of the HttpProductInfoHeaderValue contains either a value for the [Product](httpproductinfoheadervalue_product.md) or [Comment](httpproductinfoheadervalue_comment.md) property, but not both simultaneously.
 * 
 * The [UserAgent](httprequestheadercollection_useragent.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md) that contains HttpProductInfoHeaderValue objects.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpProductInfoHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpProductInfoHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpProductInfoHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the product information.
     * @returns {HttpProductInfoHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpProductInfoHeaderValue.HasProp("__IHttpProductInfoHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpProductInfoHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpProductInfoHeaderValueStatics.IID)
            HttpProductInfoHeaderValue.__IHttpProductInfoHeaderValueStatics := IHttpProductInfoHeaderValueStatics(factoryPtr)
        }

        return HttpProductInfoHeaderValue.__IHttpProductInfoHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpProductInfoHeaderValue>} productInfoHeaderValue The [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervalue.tryparse
     */
    static TryParse(input_, productInfoHeaderValue) {
        if (!HttpProductInfoHeaderValue.HasProp("__IHttpProductInfoHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpProductInfoHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpProductInfoHeaderValueStatics.IID)
            HttpProductInfoHeaderValue.__IHttpProductInfoHeaderValueStatics := IHttpProductInfoHeaderValueStatics(factoryPtr)
        }

        return HttpProductInfoHeaderValue.__IHttpProductInfoHeaderValueStatics.TryParse(input_, productInfoHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) class with a product comment.
     * @param {HSTRING} productComment The product comment used in the **User-Agent** HTTP header.
     * @returns {HttpProductInfoHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervalue.#ctor
     */
    static CreateFromComment(productComment) {
        if (!HttpProductInfoHeaderValue.HasProp("__IHttpProductInfoHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpProductInfoHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpProductInfoHeaderValueFactory.IID)
            HttpProductInfoHeaderValue.__IHttpProductInfoHeaderValueFactory := IHttpProductInfoHeaderValueFactory(factoryPtr)
        }

        return HttpProductInfoHeaderValue.__IHttpProductInfoHeaderValueFactory.CreateFromComment(productComment)
    }

    /**
     * Initializes a new instance of the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) class with a product name and version.
     * @param {HSTRING} productName The name of the product token used in the **User-Agent** HTTP header.
     * @param {HSTRING} productVersion The version of the product token used in the **User-Agent** HTTP header.
     * @returns {HttpProductInfoHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervalue.#ctor
     */
    static CreateFromNameWithVersion(productName, productVersion) {
        if (!HttpProductInfoHeaderValue.HasProp("__IHttpProductInfoHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpProductInfoHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpProductInfoHeaderValueFactory.IID)
            HttpProductInfoHeaderValue.__IHttpProductInfoHeaderValueFactory := IHttpProductInfoHeaderValueFactory(factoryPtr)
        }

        return HttpProductInfoHeaderValue.__IHttpProductInfoHeaderValueFactory.CreateFromNameWithVersion(productName, productVersion)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the product from the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) used in the **User-Agent** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervalue.product
     * @type {HttpProductHeaderValue} 
     */
    Product {
        get => this.get_Product()
    }

    /**
     * Gets the product comment from the [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) used in the **User-Agent** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervalue.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HttpProductHeaderValue} 
     */
    get_Product() {
        if (!this.HasProp("__IHttpProductInfoHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpProductInfoHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpProductInfoHeaderValue := IHttpProductInfoHeaderValue(outPtr)
        }

        return this.__IHttpProductInfoHeaderValue.get_Product()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IHttpProductInfoHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpProductInfoHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpProductInfoHeaderValue := IHttpProductInfoHeaderValue(outPtr)
        }

        return this.__IHttpProductInfoHeaderValue.get_Comment()
    }

    /**
     * Returns a string that represents the current [HttpProductInfoHeaderValue](httpproductinfoheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductinfoheadervalue.tostring
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
