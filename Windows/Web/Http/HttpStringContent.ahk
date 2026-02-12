#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpContent.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpStringContentFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides HTTP content that uses a string.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpStringContent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpContent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpContent.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpStringContent](httpstringcontent.md) class with the specified content.
     * @remarks
     * The character encoding in the **Content-Type** header for the [HttpStringContent](httpstringcontent.md) created defaults to UTF-8.
     * 
     * The media type in the **Content-Type** header for the [HttpStringContent](httpstringcontent.md) created defaults to text/plain.
     * @param {HSTRING} content The content used to initialize the [HttpStringContent](httpstringcontent.md).
     * @returns {HttpStringContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.#ctor
     */
    static CreateFromString(content) {
        if (!HttpStringContent.HasProp("__IHttpStringContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpStringContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpStringContentFactory.IID)
            HttpStringContent.__IHttpStringContentFactory := IHttpStringContentFactory(factoryPtr)
        }

        return HttpStringContent.__IHttpStringContentFactory.CreateFromString(content)
    }

    /**
     * Initializes a new instance of the [HttpStringContent](httpstringcontent.md) class with the specified content and encoding.
     * @remarks
     * The media type in the **Content-Type** header for the [HttpStringContent](httpstringcontent.md) created defaults to text/plain.
     * @param {HSTRING} content The content used to initialize the [HttpStringContent](httpstringcontent.md).
     * @param {Integer} encoding The encoding to use for the content.
     * @returns {HttpStringContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.#ctor
     */
    static CreateFromStringWithEncoding(content, encoding) {
        if (!HttpStringContent.HasProp("__IHttpStringContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpStringContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpStringContentFactory.IID)
            HttpStringContent.__IHttpStringContentFactory := IHttpStringContentFactory(factoryPtr)
        }

        return HttpStringContent.__IHttpStringContentFactory.CreateFromStringWithEncoding(content, encoding)
    }

    /**
     * Initializes a new instance of the [HttpStringContent](httpstringcontent.md) class with the specified content, encoding, and media type.
     * @remarks
     * The media type in the **Content-Type** header for the [HttpStringContent](httpstringcontent.md) created is set to the value of the *mediaType* parameter.
     * @param {HSTRING} content The content used to initialize the [HttpStringContent](httpstringcontent.md).
     * @param {Integer} encoding The encoding to use for the content.
     * @param {HSTRING} mediaType_ The media type to use for the content.
     * @returns {HttpStringContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.#ctor
     */
    static CreateFromStringWithEncodingAndMediaType(content, encoding, mediaType_) {
        if (!HttpStringContent.HasProp("__IHttpStringContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpStringContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpStringContentFactory.IID)
            HttpStringContent.__IHttpStringContentFactory := IHttpStringContentFactory(factoryPtr)
        }

        return HttpStringContent.__IHttpStringContentFactory.CreateFromStringWithEncodingAndMediaType(content, encoding, mediaType_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get a collection of content headers set on the [HttpStringContent](httpstringcontent.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.headers
     * @type {HttpContentHeaderCollection} 
     */
    Headers {
        get => this.get_Headers()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HttpContentHeaderCollection} 
     */
    get_Headers() {
        if (!this.HasProp("__IHttpContent")) {
            if ((queryResult := this.QueryInterface(IHttpContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContent := IHttpContent(outPtr)
        }

        return this.__IHttpContent.get_Headers()
    }

    /**
     * Serialize the [HttpStringContent](httpstringcontent.md) into memory as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written into memory.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.bufferallasync
     */
    BufferAllAsync() {
        if (!this.HasProp("__IHttpContent")) {
            if ((queryResult := this.QueryInterface(IHttpContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContent := IHttpContent(outPtr)
        }

        return this.__IHttpContent.BufferAllAsync()
    }

    /**
     * Serialize the [HttpStringContent](httpstringcontent.md) to a buffer as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IBuffer](/uwp/api/windows.storage.streams.ibuffer) and unsigned 64-bit integer) completes after all of the content has been written to the buffer.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.readasbufferasync
     */
    ReadAsBufferAsync() {
        if (!this.HasProp("__IHttpContent")) {
            if ((queryResult := this.QueryInterface(IHttpContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContent := IHttpContent(outPtr)
        }

        return this.__IHttpContent.ReadAsBufferAsync()
    }

    /**
     * Serialize the [HttpStringContent](httpstringcontent.md) and return an input stream that represents the content as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IInputStream](/uwp/api/windows.storage.streams.iinputstream) and unsigned 64-bit integer) completes after all of the content has been written to the stream.
     * @returns {IAsyncOperationWithProgress<IInputStream, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.readasinputstreamasync
     */
    ReadAsInputStreamAsync() {
        if (!this.HasProp("__IHttpContent")) {
            if ((queryResult := this.QueryInterface(IHttpContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContent := IHttpContent(outPtr)
        }

        return this.__IHttpContent.ReadAsInputStreamAsync()
    }

    /**
     * Serialize the [HttpStringContent](httpstringcontent.md) to a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(String, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {IAsyncOperationWithProgress<HSTRING, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.readasstringasync
     */
    ReadAsStringAsync() {
        if (!this.HasProp("__IHttpContent")) {
            if ((queryResult := this.QueryInterface(IHttpContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContent := IHttpContent(outPtr)
        }

        return this.__IHttpContent.ReadAsStringAsync()
    }

    /**
     * Compute the [HttpStringContent](httpstringcontent.md) length in bytes.
     * @remarks
     * The TryComputeLength method calculates the content length for HTTP content in [HttpStringContent](httpstringcontent.md). Headers set on the content are not included in the content length. This is useful for content types that are easy to calculate the content length.
     * @param {Pointer<UInt64>} length The length in bytes of the [HttpStringContent](httpstringcontent.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.trycomputelength
     */
    TryComputeLength(length) {
        if (!this.HasProp("__IHttpContent")) {
            if ((queryResult := this.QueryInterface(IHttpContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContent := IHttpContent(outPtr)
        }

        return this.__IHttpContent.TryComputeLength(length)
    }

    /**
     * Write the [HttpStringContent](httpstringcontent.md) to an output stream as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the output stream.
     * @param {IOutputStream} outputStream The output stream to write to.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.writetostreamasync
     */
    WriteToStreamAsync(outputStream) {
        if (!this.HasProp("__IHttpContent")) {
            if ((queryResult := this.QueryInterface(IHttpContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpContent := IHttpContent(outPtr)
        }

        return this.__IHttpContent.WriteToStreamAsync(outputStream)
    }

    /**
     * Closes the [HttpStringContent](httpstringcontent.md) instance and releases allocated resources.
     * @remarks
     * The Close method releases allocated resources used by the [HttpStringContent](httpstringcontent.md) instance. The Close method can manage the lifetime of system resources (memory for the [HttpStringContent](httpstringcontent.md), for example) used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the [Dispose](/uwp/api/windows.web.http.httpstringcontent.dispose) method. In Visual C++ component extensions (C++/CX), this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources. So the [HttpStringContent](httpstringcontent.md) object and associated resources don't get released until the garbage collection pass runs. The Close method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a Close method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Returns a string that represents the current [HttpStringContent](httpstringcontent.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstringcontent.tostring
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
