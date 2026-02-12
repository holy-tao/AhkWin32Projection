#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpContentDispositionHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpContentDispositionHeaderValueStatics.ahk
#Include .\IHttpContentDispositionHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Content-Disposition** HTTP header on HTTP content in a request or a response.
 * @remarks
 * The HttpContentDispositionHeaderValue class represents information in the **Content-Disposition** header on HTTP content sent in an HTTP request or received in an HTTP response.
 * 
 * The [ContentDisposition](httpcontentheadercollection_contentdisposition.md) property on the [HttpContentHeaderCollection](httpcontentheadercollection.md) returns an HttpContentDispositionHeaderValue.
 * 
 * The **Content-Disposition** header is normally used for working with file uploads and downloads. The format differs from other headers in that it is a single header with a disposition type followed by a list of parameters, some of which are well defined.
 * 
 * This header is used in two different contexts: 
 * + A MIME header for nested body content in the [HttpMultipartFormDataContent](../windows.web.http/httpmultipartformdatacontent.md) class. For more information, see IETF RFC 2183.
 * + An HTTP header in [HttpContentHeaderCollection](httpcontentheadercollection.md) class. For more information, see IETF RFC 6266.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpContentDispositionHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpContentDispositionHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpContentDispositionHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpContentDispositionHeaderValue](httpcontentdispositionheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the content disposition information in the **Content-Disposition** HTTP header.
     * @returns {HttpContentDispositionHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpContentDispositionHeaderValue.HasProp("__IHttpContentDispositionHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentDispositionHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentDispositionHeaderValueStatics.IID)
            HttpContentDispositionHeaderValue.__IHttpContentDispositionHeaderValueStatics := IHttpContentDispositionHeaderValueStatics(factoryPtr)
        }

        return HttpContentDispositionHeaderValue.__IHttpContentDispositionHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpContentDispositionHeaderValue](httpcontentdispositionheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpContentDispositionHeaderValue>} contentDispositionHeaderValue The [HttpContentDispositionHeaderValue](httpcontentdispositionheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.tryparse
     */
    static TryParse(input_, contentDispositionHeaderValue) {
        if (!HttpContentDispositionHeaderValue.HasProp("__IHttpContentDispositionHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentDispositionHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentDispositionHeaderValueStatics.IID)
            HttpContentDispositionHeaderValue.__IHttpContentDispositionHeaderValueStatics := IHttpContentDispositionHeaderValueStatics(factoryPtr)
        }

        return HttpContentDispositionHeaderValue.__IHttpContentDispositionHeaderValueStatics.TryParse(input_, contentDispositionHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpContentDispositionHeaderValue](httpcontentdispositionheadervalue.md) class with **content-coding** information for use in the **Content-Disposition** HTTP header.
     * @param {HSTRING} dispositionType The content disposition value to be used in the **Content-Disposition** HTTP header. For valid values, see [Content Disposition Values](https://www.iana.org/assignments/cont-disp/cont-disp.xhtml) and [Content-Disposition
     * ](https://developer.mozilla.org/docs/Web/HTTP/Headers/Content-Disposition).
     * @returns {HttpContentDispositionHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.#ctor
     */
    static Create(dispositionType) {
        if (!HttpContentDispositionHeaderValue.HasProp("__IHttpContentDispositionHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpContentDispositionHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpContentDispositionHeaderValueFactory.IID)
            HttpContentDispositionHeaderValue.__IHttpContentDispositionHeaderValueFactory := IHttpContentDispositionHeaderValueFactory(factoryPtr)
        }

        return HttpContentDispositionHeaderValue.__IHttpContentDispositionHeaderValueFactory.Create(dispositionType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the value of the **disposition-type** information in the **Content-Disposition** HTTP header.
     * @remarks
     * The DispositionType property represents the disposition type for a content body part.
     * 
     * A body part should be marked with a DispositionType property of "inline" if it is intended to be displayed automatically upon display of the message. A body part can be designated with a DispositionType property of "attachment" to indicate that they are separate from the main body of the HTTP request or response.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.dispositiontype
     * @type {HSTRING} 
     */
    DispositionType {
        get => this.get_DispositionType()
        set => this.put_DispositionType(value)
    }

    /**
     * Gets or sets the value of the **filename-parm** information in the **Content-Disposition** HTTP header for a single file.
     * @remarks
     * The FileName property is a suggestion for how to construct a filename for storing the message payload to be used if the entity is detached and stored in a separate file.
     * 
     * The FileName property uses MIME encoding for non-ascii characters.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.filename
     * @type {HSTRING} 
     */
    FileName {
        get => this.get_FileName()
        set => this.put_FileName(value)
    }

    /**
     * Gets or sets the value of the **filename-parm** characteristic in the **Content-Disposition** HTTP header for multiple files.
     * @remarks
     * The FileNameStar property is a suggestion for how to construct filenames for storing message payloads to be used if the entities are detached and stored in a separate files.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.filenamestar
     * @type {HSTRING} 
     */
    FileNameStar {
        get => this.get_FileNameStar()
        set => this.put_FileNameStar(value)
    }

    /**
     * Gets or sets the name for a content body part in the **Content-Disposition** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets a set of parameters included in the **Content-Disposition** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.parameters
     * @type {IVector<HttpNameValueHeaderValue>} 
     */
    Parameters {
        get => this.get_Parameters()
    }

    /**
     * Gets or sets the approximate size, in bytes, of the file used in the **Content-Disposition** HTTP header.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.size
     * @type {IReference<Integer>} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
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
    get_DispositionType() {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.get_DispositionType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DispositionType(value) {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.put_DispositionType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileName() {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.get_FileName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FileName(value) {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.put_FileName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileNameStar() {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.get_FileNameStar()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FileNameStar(value) {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.put_FileNameStar(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.put_Name(value)
    }

    /**
     * 
     * @returns {IVector<HttpNameValueHeaderValue>} 
     */
    get_Parameters() {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.get_Parameters()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Size() {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.get_Size()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__IHttpContentDispositionHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpContentDispositionHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContentDispositionHeaderValue := IHttpContentDispositionHeaderValue(outPtr)
        }

        return this.__IHttpContentDispositionHeaderValue.put_Size(value)
    }

    /**
     * Returns a string that represents the current [HttpContentDispositionHeaderValue](httpcontentdispositionheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcontentdispositionheadervalue.tostring
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
