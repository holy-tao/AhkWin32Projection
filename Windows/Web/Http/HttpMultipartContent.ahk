#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\IHttpContent.ahk
#Include .\IHttpMultipartContent.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpMultipartContentFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides HTTP content that uses the **multipart//** MIME type.
 * @remarks
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpMultipartContent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpMultipartContent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpMultipartContent.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpMultipartContent](httpmultipartcontent.md) class with the specified MIME subtype.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} subtype The MIME subtype of the multipart content.
     * @returns {HttpMultipartContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.#ctor
     */
    static CreateWithSubtype(subtype) {
        if (!HttpMultipartContent.HasProp("__IHttpMultipartContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMultipartContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMultipartContentFactory.IID)
            HttpMultipartContent.__IHttpMultipartContentFactory := IHttpMultipartContentFactory(factoryPtr)
        }

        return HttpMultipartContent.__IHttpMultipartContentFactory.CreateWithSubtype(subtype)
    }

    /**
     * Initializes a new instance of the [HttpMultipartContent](httpmultipartcontent.md) class with the specified MIME subtype and boundary string.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} subtype The MIME subtype of the multipart content.
     * @param {HSTRING} boundary The boundary string for the multipart content.
     * @returns {HttpMultipartContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.#ctor
     */
    static CreateWithSubtypeAndBoundary(subtype, boundary) {
        if (!HttpMultipartContent.HasProp("__IHttpMultipartContentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMultipartContent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMultipartContentFactory.IID)
            HttpMultipartContent.__IHttpMultipartContentFactory := IHttpMultipartContentFactory(factoryPtr)
        }

        return HttpMultipartContent.__IHttpMultipartContentFactory.CreateWithSubtypeAndBoundary(subtype, boundary)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get a collection of content headers set on the [HttpMultipartContent](httpmultipartcontent.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.headers
     * @type {HttpContentHeaderCollection} 
     */
    Headers {
        get => this.get_Headers()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [HttpMultipartContent](httpmultipartcontent.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpMultipartContent")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Add HTTP content to the [HttpMultipartContent](httpmultipartcontent.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {IHttpContent} content The HTTP content to add to [HttpMultipartContent](httpmultipartcontent.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.add
     */
    Add(content) {
        if (!this.HasProp("__IHttpMultipartContent")) {
            if ((queryResult := this.QueryInterface(IHttpMultipartContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMultipartContent := IHttpMultipartContent(outPtr)
        }

        return this.__IHttpMultipartContent.Add(content)
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
     * Serialize the [HttpMultipartContent](httpmultipartcontent.md) into memory as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written into memory.
     * 
     * The [HttpMultipartContent](httpmultipartcontent.md) class can be used to stream content that might be of arbitrary length. The BufferAllAsync method will fail if all of the [HttpMultipartContent](httpmultipartcontent.md) can't fit in memory.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.bufferallasync
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
     * Serialize the [HttpMultipartContent](httpmultipartcontent.md) to a buffer as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IBuffer](/uwp/api/windows.storage.streams.ibuffer) and unsigned 64-bit integer) completes after all of the content has been written to the buffer.
     * 
     * The [HttpMultipartContent](httpmultipartcontent.md) class can be used to stream content that might be of arbitrary length. The ReadAsBufferAsync method will fail if all of the [HttpMultipartContent](httpmultipartcontent.md) can't fit in memory since this method requires the entire content to be buffered in memory first.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.readasbufferasync
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
     * Serialize the [HttpMultipartContent](httpmultipartcontent.md) and return an input stream that represents the content as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IInputStream](/uwp/api/windows.storage.streams.iinputstream) and unsigned 64-bit integer) completes after all of the content has been written to the stream.
     * @returns {IAsyncOperationWithProgress<IInputStream, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.readasinputstreamasync
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
     * Serialize the [HttpMultipartContent](httpmultipartcontent.md) to a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(String, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true).
     * 
     * The [HttpMultipartContent](httpmultipartcontent.md) class can be used to stream content that might be of arbitrary length. The ReadAsStringAsync method will fail if all of the [HttpMultipartContent](httpmultipartcontent.md) can't fit in memory since this method requires the entire content to be buffered in memory first.
     * @returns {IAsyncOperationWithProgress<HSTRING, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.readasstringasync
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
     * Determines whether the [HttpMultipartContent](httpmultipartcontent.md) has a valid length in bytes.
     * @remarks
     * The TryComputeLength method calculates the content length for HTTP content in [HttpMultipartContent](httpmultipartcontent.md). Headers set on the content are not included in the content length. This is useful for content types that are easy to calculate the content length.
     * 
     * If computing the content length is not possible or expensive (would require the system to buffer the whole content where the serialization would be expensive or require the system to allocate a lot of memory), this method can return **false**. If this method returns **false**, this implies that either chunked transfer is needed or the content must get buffered before being sent to the server.
     * @param {Pointer<UInt64>} length The length in bytes of the [HttpMultipartContent](httpmultipartcontent.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.trycomputelength
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
     * Write the [HttpMultipartContent](httpmultipartcontent.md) to an output stream as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the output stream.
     * @param {IOutputStream} outputStream The output stream to write to.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.writetostreamasync
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
     * Closes the [HttpMultipartContent](httpmultipartcontent.md) instance and releases allocated resources.
     * @remarks
     * The Close method releases allocated resources used by the [HttpMultipartContent](httpmultipartcontent.md) instance. The Close method can manage the lifetime of system resources (memory for the [HttpMultipartContent](httpmultipartcontent.md), for example) used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method projects as the [Dispose](/uwp/api/windows.web.http.httpmultipartcontent.dispose) method. In Visual C++ component extensions (C++/CX), this method projects as the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources. So the [HttpMultipartContent](httpmultipartcontent.md) object and associated resources don't get released until the garbage collection pass runs. The Close method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a Close method since these apps can destroy the object. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.close
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
     * Gets an object that can be used to enumerate the contents in the [HttpMultipartContent](httpmultipartcontent.md) object.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{f102157f-b482-5736-9d12-c683bc494942}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IHttpContent, outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * Returns a string that represents the current [HttpMultipartContent](httpmultipartcontent.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpmultipartcontent.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
