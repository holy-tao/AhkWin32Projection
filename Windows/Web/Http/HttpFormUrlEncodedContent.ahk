#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpContent.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpFormUrlEncodedContentFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides HTTP content that uses name/value data encoded with the **application/x-www-form-urlencoded** MIME type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpFormUrlEncodedContent extends IInspectable {
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
     * Initializes a new instance of the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) class with the specified content.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} content The content used to initialize the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md).
     * @returns {HttpFormUrlEncodedContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.#ctor
     */
    static Create(content) {
        if (!HttpFormUrlEncodedContent.HasProp("__IHttpFormUrlEncodedContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpFormUrlEncodedContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpFormUrlEncodedContentFactory.IID)
            HttpFormUrlEncodedContent.__IHttpFormUrlEncodedContentFactory := IHttpFormUrlEncodedContentFactory(factoryPtr)
        }

        return HttpFormUrlEncodedContent.__IHttpFormUrlEncodedContentFactory.Create(content)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get a collection of content headers set on the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.headers
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
     * Serialize the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) into memory as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written into memory.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.bufferallasync
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
     * Serialize the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) to a buffer as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IBuffer](/uwp/api/windows.storage.streams.ibuffer) and unsigned 64-bit integer) completes after all of the content has been written to the buffer.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.readasbufferasync
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
     * Serialize the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) and return an input stream that represents the content as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IInputStream](/uwp/api/windows.storage.streams.iinputstream) and unsigned 64-bit integer) completes after all of the content has been written to the stream.
     * @returns {IAsyncOperationWithProgress<IInputStream, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.readasinputstreamasync
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
     * Serialize the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) to a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(String, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {IAsyncOperationWithProgress<HSTRING, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.readasstringasync
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
     * Computes the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) length in bytes.
     * @remarks
     * The TryComputeLength method calculates the content length for HTTP content in [HttpFormUrlEncodedContent](httpformurlencodedcontent.md). Headers set on the content are not included in the content length. This is useful for content types that are easy to calculate the content length.
     * 
     * If computing the content length is not possible or expensive (would require the system to buffer the whole content where the serialization would be expensive or require the system to allocate a lot of memory), this method can return **false**. If this method returns **false**, this implies that either chunked transfer is needed or the content must get buffered before being sent to the server.
     * @param {Pointer<UInt64>} length The length in bytes of the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.trycomputelength
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
     * Write the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) to an output stream as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the output stream.
     * @param {IOutputStream} outputStream The output stream to write to.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.writetostreamasync
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
     * Closes the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) instance and releases allocated resources.
     * @remarks
     * The Close method releases allocated resources used by the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) instance. The Close method can manage the lifetime of system resources (memory for the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md), for example) used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the [Dispose](/uwp/api/windows.web.http.httpformurlencodedcontent.dispose) method. In Visual C++ component extensions (C++/CX), this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources. So the [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) object and associated resources don't get released until the garbage collection pass runs. The Close method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a Close method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.close
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
     * Returns a string that represents the current [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpformurlencodedcontent.tostring
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
