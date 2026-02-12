#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpContent.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpBufferContentFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides HTTP content that uses a buffer.
 * @remarks
 * When sending (POST method) an HttpBufferContent class, the [HttpProgress.BytesSent](httpprogress.md) value jumps from 0% bytes sent to 100% bytes sent in one progress event, because the whole buffer is moved to lower network APIs all at once. For more detailed progress, use [HttpStreamContent](httpstreamcontent.md) instead of HttpBufferContent, because streams are read and sent in smaller chunks, resulting in more progress events. E.g. 0 bytes sent, 65536 bytes sent, 131072 bytes sent, etc.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpBufferContent extends IInspectable {
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
     * Initializes a new instance of the [HttpBufferContent](httpbuffercontent.md) class with the specified buffer.
     * @remarks
     * The entire buffer specified in the *content* parameter is used to initialize the [HttpBufferContent](httpbuffercontent.md).
     * 
     * Below are the exceptions that this function throws.
     * @param {IBuffer} content The content used to initialize the [HttpBufferContent](httpbuffercontent.md).
     * @returns {HttpBufferContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.#ctor
     */
    static CreateFromBuffer(content) {
        if (!HttpBufferContent.HasProp("__IHttpBufferContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpBufferContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpBufferContentFactory.IID)
            HttpBufferContent.__IHttpBufferContentFactory := IHttpBufferContentFactory(factoryPtr)
        }

        return HttpBufferContent.__IHttpBufferContentFactory.CreateFromBuffer(content)
    }

    /**
     * Initializes a new instance of the [HttpBufferContent](httpbuffercontent.md) class with an offset and count of bytes from the specified buffer.
     * @remarks
     * Only the range specified by the *offset* parameter and the *count* parameter is used to initialize the [HttpBufferContent](httpbuffercontent.md).
     * 
     * Below are the exceptions that this content throws.
     * @param {IBuffer} content The content used to initialize the [HttpBufferContent](httpbuffercontent.md).
     * @param {Integer} offset The offset in bytes from the beginning of the *content* buffer to initialize the [HttpBufferContent](httpbuffercontent.md).
     * @param {Integer} count The count of bytes in the *content* buffer to initialize the [HttpBufferContent](httpbuffercontent.md).
     * @returns {HttpBufferContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.#ctor
     */
    static CreateFromBufferWithOffset(content, offset, count) {
        if (!HttpBufferContent.HasProp("__IHttpBufferContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpBufferContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpBufferContentFactory.IID)
            HttpBufferContent.__IHttpBufferContentFactory := IHttpBufferContentFactory(factoryPtr)
        }

        return HttpBufferContent.__IHttpBufferContentFactory.CreateFromBufferWithOffset(content, offset, count)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get a collection of content headers set on the [HttpBufferContent](httpbuffercontent.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.headers
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
     * Serialize the [HttpBufferContent](httpbuffercontent.md) into memory as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written into memory.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.bufferallasync
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
     * Serialize the [HttpBufferContent](httpbuffercontent.md) to a buffer as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IBuffer](/uwp/api/windows.storage.streams.ibuffer) and unsigned 64-bit int) completes after all of the content has been written to the buffer.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.readasbufferasync
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
     * Serialize the [HttpBufferContent](httpbuffercontent.md) and return an input stream that represents the content as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IInputStream](/uwp/api/windows.storage.streams.iinputstream) and unsigned 64-bit int) completes after all of the content has been written to the stream.
     * @returns {IAsyncOperationWithProgress<IInputStream, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.readasinputstreamasync
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
     * Serialize the [HttpBufferContent](httpbuffercontent.md) to a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(String, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {IAsyncOperationWithProgress<HSTRING, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.readasstringasync
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
     * Computes the [HttpBufferContent](httpbuffercontent.md) length in bytes.
     * @remarks
     * The TryComputeLength method calculates the content length for the [HttpBufferContent](httpbuffercontent.md). This is useful for content types that are easy to calculate the content length.
     * @param {Pointer<UInt64>} length The length in bytes of the [HttpBufferContent](httpbuffercontent.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.trycomputelength
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
     * Write the [HttpBufferContent](httpbuffercontent.md) to an output stream as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the output stream.
     * @param {IOutputStream} outputStream The output stream to write to.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.writetostreamasync
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
     * Closes the [HttpBufferContent](httpbuffercontent.md) instance and releases allocated resources.
     * @remarks
     * The Close method releases allocated resources used by the [HttpBufferContent](httpbuffercontent.md) instance. The Close method can manage the lifetime of system resources (memory for the [HttpBufferContent](httpbuffercontent.md), for example) used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the [Dispose](/uwp/api/windows.web.http.httpbuffercontent.dispose) method. In C++ and CX, this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources. So the [HttpBufferContent](httpbuffercontent.md) object and associated resources don't get released until the garbage collection pass runs. The Close method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a Close method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.close
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
     * Returns a string that represents the current [HttpBufferContent](httpbuffercontent.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpbuffercontent.tostring
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
