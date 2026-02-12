#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpDateOrDeltaHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpDateOrDeltaHeaderValueStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Retry-After** HTTP header on an HTTP response.
 * @remarks
 * The HttpDateOrDeltaHeaderValue class represents the **Retry-After** HTTP header on an HTTP response.
 * 
 * The [RetryAfter](httpresponseheadercollection_retryafter.md) property on the [HttpResponseHeaderCollection](httpresponseheadercollection.md) returns an HttpDateOrDeltaHeaderValue object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpdateordeltaheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpDateOrDeltaHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpDateOrDeltaHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpDateOrDeltaHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpDateOrDeltaHeaderValue](httpdateordeltaheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the **HTTP-date** or **delta-seconds** information in the **Retry-After** HTTP header.
     * @returns {HttpDateOrDeltaHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpdateordeltaheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpDateOrDeltaHeaderValue.HasProp("__IHttpDateOrDeltaHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpDateOrDeltaHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpDateOrDeltaHeaderValueStatics.IID)
            HttpDateOrDeltaHeaderValue.__IHttpDateOrDeltaHeaderValueStatics := IHttpDateOrDeltaHeaderValueStatics(factoryPtr)
        }

        return HttpDateOrDeltaHeaderValue.__IHttpDateOrDeltaHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpDateOrDeltaHeaderValue](httpdateordeltaheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpDateOrDeltaHeaderValue>} dateOrDeltaHeaderValue The [HttpDateOrDeltaHeaderValue](httpdateordeltaheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpdateordeltaheadervalue.tryparse
     */
    static TryParse(input_, dateOrDeltaHeaderValue) {
        if (!HttpDateOrDeltaHeaderValue.HasProp("__IHttpDateOrDeltaHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpDateOrDeltaHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpDateOrDeltaHeaderValueStatics.IID)
            HttpDateOrDeltaHeaderValue.__IHttpDateOrDeltaHeaderValueStatics := IHttpDateOrDeltaHeaderValueStatics(factoryPtr)
        }

        return HttpDateOrDeltaHeaderValue.__IHttpDateOrDeltaHeaderValueStatics.TryParse(input_, dateOrDeltaHeaderValue)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the value of the **HTTP-date** information used in the **Retry-After** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpdateordeltaheadervalue.date
     * @type {IReference<DateTime>} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * Gets the value of the **delta-seconds** information used in the **Retry-After** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpdateordeltaheadervalue.delta
     * @type {IReference<TimeSpan>} 
     */
    Delta {
        get => this.get_Delta()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Date() {
        if (!this.HasProp("__IHttpDateOrDeltaHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpDateOrDeltaHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDateOrDeltaHeaderValue := IHttpDateOrDeltaHeaderValue(outPtr)
        }

        return this.__IHttpDateOrDeltaHeaderValue.get_Date()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Delta() {
        if (!this.HasProp("__IHttpDateOrDeltaHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpDateOrDeltaHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDateOrDeltaHeaderValue := IHttpDateOrDeltaHeaderValue(outPtr)
        }

        return this.__IHttpDateOrDeltaHeaderValue.get_Delta()
    }

    /**
     * Returns a string that represents the current [HttpDateOrDeltaHeaderValue](httpdateordeltaheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpdateordeltaheadervalue.tostring
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
