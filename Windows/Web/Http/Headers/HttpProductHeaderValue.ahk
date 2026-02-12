#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpProductHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpProductHeaderValueStatics.ahk
#Include .\IHttpProductHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents product information used by the HttpProductHeaderValue and [HttpProductInfoHeaderValueCollection](httpproductinfoheadervaluecollection.md) classes in the **User-Agent** HTTP header.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpProductHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpProductHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpProductHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpProductHeaderValue](httpproductheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.,
     * @param {HSTRING} input_ A string that represents the product name and version.
     * @returns {HttpProductHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpProductHeaderValue.HasProp("__IHttpProductHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpProductHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpProductHeaderValueStatics.IID)
            HttpProductHeaderValue.__IHttpProductHeaderValueStatics := IHttpProductHeaderValueStatics(factoryPtr)
        }

        return HttpProductHeaderValue.__IHttpProductHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpProductHeaderValue](httpproductheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpProductHeaderValue>} productHeaderValue The [HttpProductHeaderValue](httpproductheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductheadervalue.tryparse
     */
    static TryParse(input_, productHeaderValue) {
        if (!HttpProductHeaderValue.HasProp("__IHttpProductHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpProductHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpProductHeaderValueStatics.IID)
            HttpProductHeaderValue.__IHttpProductHeaderValueStatics := IHttpProductHeaderValueStatics(factoryPtr)
        }

        return HttpProductHeaderValue.__IHttpProductHeaderValueStatics.TryParse(input_, productHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpProductHeaderValue](httpproductheadervalue.md) class with a product name.
     * @param {HSTRING} productName The name of the product token used in the **User-Agent** HTTP header.
     * @returns {HttpProductHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductheadervalue.#ctor
     */
    static CreateFromName(productName) {
        if (!HttpProductHeaderValue.HasProp("__IHttpProductHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpProductHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpProductHeaderValueFactory.IID)
            HttpProductHeaderValue.__IHttpProductHeaderValueFactory := IHttpProductHeaderValueFactory(factoryPtr)
        }

        return HttpProductHeaderValue.__IHttpProductHeaderValueFactory.CreateFromName(productName)
    }

    /**
     * Initializes a new instance of the [HttpProductHeaderValue](httpproductheadervalue.md) class with a product name and a product version.
     * @param {HSTRING} productName The name of the product token used in the **User-Agent** HTTP header.
     * @param {HSTRING} productVersion The version of the product token used in the **User-Agent** HTTP header.
     * @returns {HttpProductHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductheadervalue.#ctor
     */
    static CreateFromNameWithVersion(productName, productVersion) {
        if (!HttpProductHeaderValue.HasProp("__IHttpProductHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpProductHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpProductHeaderValueFactory.IID)
            HttpProductHeaderValue.__IHttpProductHeaderValueFactory := IHttpProductHeaderValueFactory(factoryPtr)
        }

        return HttpProductHeaderValue.__IHttpProductHeaderValueFactory.CreateFromNameWithVersion(productName, productVersion)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a token that represents the name of the product to be used in the **User-Agent** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductheadervalue.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets a token that represents the version of the product to be used in the **User-Agent** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductheadervalue.version
     * @type {HSTRING} 
     */
    Version {
        get => this.get_Version()
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
        if (!this.HasProp("__IHttpProductHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpProductHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpProductHeaderValue := IHttpProductHeaderValue(outPtr)
        }

        return this.__IHttpProductHeaderValue.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Version() {
        if (!this.HasProp("__IHttpProductHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpProductHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpProductHeaderValue := IHttpProductHeaderValue(outPtr)
        }

        return this.__IHttpProductHeaderValue.get_Version()
    }

    /**
     * Returns a string that represents the current [HttpProductHeaderValue](httpproductheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpproductheadervalue.tostring
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
