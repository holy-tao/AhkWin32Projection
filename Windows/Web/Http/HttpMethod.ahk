#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpMethod.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpMethodStatics.ahk
#Include .\IHttpMethodFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Retrieves standard HTTP methods such as GET and POST and creates new HTTP methods.
 * @remarks
 * The most common use of HttpMethod is to get a standard HTTP method (verb) from a property on this class. However, if an app needs a different value for the HTTP method, the [HttpMethod](httpmethod_httpmethod_290278668.md) constructor initializes a new instance of the HttpMethod with an HTTP method that the app developer specifies.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpMethod extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpMethod

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpMethod.IID

    /**
     * Gets the HTTP DELETE method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.delete
     * @type {HttpMethod} 
     */
    static Delete {
        get => HttpMethod.get_Delete()
    }

    /**
     * Gets the HTTP GET method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.get
     * @type {HttpMethod} 
     */
    static Get {
        get => HttpMethod.get_Get()
    }

    /**
     * Gets the HTTP HEAD method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.head
     * @type {HttpMethod} 
     */
    static Head {
        get => HttpMethod.get_Head()
    }

    /**
     * Gets the HTTP OPTIONS method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.options
     * @type {HttpMethod} 
     */
    static Options {
        get => HttpMethod.get_Options()
    }

    /**
     * Gets the HTTP PATCH method,
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.patch
     * @type {HttpMethod} 
     */
    static Patch {
        get => HttpMethod.get_Patch()
    }

    /**
     * Gets the HTTP POST method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.post
     * @type {HttpMethod} 
     */
    static Post {
        get => HttpMethod.get_Post()
    }

    /**
     * Gets the HTTP PUT method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.put
     * @type {HttpMethod} 
     */
    static Put {
        get => HttpMethod.get_Put()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HttpMethod} 
     */
    static get_Delete() {
        if (!HttpMethod.HasProp("__IHttpMethodStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMethod")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMethodStatics.IID)
            HttpMethod.__IHttpMethodStatics := IHttpMethodStatics(factoryPtr)
        }

        return HttpMethod.__IHttpMethodStatics.get_Delete()
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    static get_Get() {
        if (!HttpMethod.HasProp("__IHttpMethodStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMethod")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMethodStatics.IID)
            HttpMethod.__IHttpMethodStatics := IHttpMethodStatics(factoryPtr)
        }

        return HttpMethod.__IHttpMethodStatics.get_Get()
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    static get_Head() {
        if (!HttpMethod.HasProp("__IHttpMethodStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMethod")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMethodStatics.IID)
            HttpMethod.__IHttpMethodStatics := IHttpMethodStatics(factoryPtr)
        }

        return HttpMethod.__IHttpMethodStatics.get_Head()
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    static get_Options() {
        if (!HttpMethod.HasProp("__IHttpMethodStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMethod")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMethodStatics.IID)
            HttpMethod.__IHttpMethodStatics := IHttpMethodStatics(factoryPtr)
        }

        return HttpMethod.__IHttpMethodStatics.get_Options()
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    static get_Patch() {
        if (!HttpMethod.HasProp("__IHttpMethodStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMethod")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMethodStatics.IID)
            HttpMethod.__IHttpMethodStatics := IHttpMethodStatics(factoryPtr)
        }

        return HttpMethod.__IHttpMethodStatics.get_Patch()
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    static get_Post() {
        if (!HttpMethod.HasProp("__IHttpMethodStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMethod")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMethodStatics.IID)
            HttpMethod.__IHttpMethodStatics := IHttpMethodStatics(factoryPtr)
        }

        return HttpMethod.__IHttpMethodStatics.get_Post()
    }

    /**
     * 
     * @returns {HttpMethod} 
     */
    static get_Put() {
        if (!HttpMethod.HasProp("__IHttpMethodStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMethod")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMethodStatics.IID)
            HttpMethod.__IHttpMethodStatics := IHttpMethodStatics(factoryPtr)
        }

        return HttpMethod.__IHttpMethodStatics.get_Put()
    }

    /**
     * Initializes a new instance of the [HttpMethod](httpmethod.md) class with a specific HTTP method.
     * @remarks
     * If an app needs a different value for the HTTP method from one of the static properties, the HttpMethod constructor initializes a new instance of the [HttpMethod](httpmethod.md) with an HTTP method that caller specifies.
     * @param {HSTRING} method The HTTP method.
     * @returns {HttpMethod} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.#ctor
     */
    static Create(method) {
        if (!HttpMethod.HasProp("__IHttpMethodFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMethod")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMethodFactory.IID)
            HttpMethod.__IHttpMethodFactory := IHttpMethodFactory(factoryPtr)
        }

        return HttpMethod.__IHttpMethodFactory.Create(method)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the HTTP method.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.method
     * @type {HSTRING} 
     */
    Method {
        get => this.get_Method()
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
    get_Method() {
        if (!this.HasProp("__IHttpMethod")) {
            if ((queryResult := this.QueryInterface(IHttpMethod.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMethod := IHttpMethod(outPtr)
        }

        return this.__IHttpMethod.get_Method()
    }

    /**
     * Returns a string that represents the current [HttpMethod](httpmethod.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmethod.tostring
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
