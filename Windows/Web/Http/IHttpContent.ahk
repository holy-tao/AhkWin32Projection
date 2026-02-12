#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include Headers\HttpContentHeaderCollection.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a base interface for an HTTP entity body and content headers.
 * @remarks
 * The contents of an HTTP message corresponds to the entity body and headers associated with the content defined in [RFC 2616](https://tools.ietf.org/html/rfc2616). Several classes and an interface in the [Windows.Web.Http](windows_web_http.md) namespace can be used for HTTP content, including:
 * 
 * 
 * + IHttpContent - A base interface for developers to create their own content objects. It represents an HTTP entity body and content headers. This interface has methods that get and set the actual content data. It also provides properties that get and set content related headers.
 * + [HttpBufferContent](httpbuffercontent.md) - HTTP content that uses a buffer.
 * + [HttpFormUrlEncodedContent](httpformurlencodedcontent.md) - HTTP content that uses name/value tuples encoded with the **application/x-www-form-urlencoded** MIME type.
 * + [HttpMultipartContent](httpmultipartcontent.md) - HTTP content that uses **multipart//** MIME type.
 * + [HttpMultipartFormDataContent](httpmultipartformdatacontent.md) - HTTP content that uses the encoded **multipart/form-data** MIME type.
 * + [HttpStreamContent](httpstreamcontent.md) - HTTP content that uses a stream. This content type is used by the HTTP methods to receive data and HTTP methods to upload data.
 * + [HttpStringContent](httpstringcontent.md) - HTTP content that uses a string.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.ihttpcontent
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpContent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpContent
     * @type {Guid}
     */
    static IID => Guid("{6b14a441-fba7-4bd2-af0a-839de7c295da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Headers", "BufferAllAsync", "ReadAsBufferAsync", "ReadAsInputStreamAsync", "ReadAsStringAsync", "TryComputeLength", "WriteToStreamAsync"]

    /**
     * Get a collection of content headers set on the [IHttpContent](ihttpcontent.md).
     * @remarks
     * The Headers property returns an [HttpContentHeaderCollection](../windows.web.http.headers/httpcontentheadercollection.md) object that can be used to get or set the specific headers on the HTTP content in an HTTP request or HTTP response.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.ihttpcontent.headers
     * @type {HttpContentHeaderCollection} 
     */
    Headers {
        get => this.get_Headers()
    }

    /**
     * 
     * @returns {HttpContentHeaderCollection} 
     */
    get_Headers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentHeaderCollection(value)
    }

    /**
     * Serialize the HTTP content into memory as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written into memory.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.ihttpcontent.bufferallasync
     */
    BufferAllAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt64(), (ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }

    /**
     * Serialize the HTTP content to a buffer as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IBuffer](/uwp/api/windows.storage.streams.ibuffer) and unsigned long) completes after all of the content has been written to the buffer.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.ihttpcontent.readasbufferasync
     */
    ReadAsBufferAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IBuffer, (ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }

    /**
     * Serialize the HTTP content and return an input stream that represents the content as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [IInputStream](/uwp/api/windows.storage.streams.iinputstream) and unsigned 64-bit integer) completes after all of the content has been written to the input stream.
     * @returns {IAsyncOperationWithProgress<IInputStream, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.ihttpcontent.readasinputstreamasync
     */
    ReadAsInputStreamAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IInputStream, (ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }

    /**
     * Serialize the HTTP content to a [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(String, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {IAsyncOperationWithProgress<HSTRING, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.ihttpcontent.readasstringasync
     */
    ReadAsStringAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }

    /**
     * Determines whether the HTTP content has a valid length in bytes.
     * @remarks
     * The TryComputeLength method calculates the content length for HTTP content in [IHttpContent](ihttpcontent.md). This is useful for content types that are easy to calculate the content length.
     * 
     * If computing the content length is not possible or expensive (would require the system to buffer the whole content where the serialization would be expensive or require the system to allocate a lot of memory), this method can return **false**. If this method returns **false**, this implies that either chunked transfer is needed or the content must get buffered before being sent to the server.
     * @param {Pointer<UInt64>} length The length in bytes of the HTTP content.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.ihttpcontent.trycomputelength
     */
    TryComputeLength(length) {
        result := ComCall(11, this, "ptr", length, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }

    /**
     * Write the HTTP content to an output stream as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress(UInt64, UInt64)](../windows.foundation/iasyncoperationwithprogress_2.md) object will complete after all of the content has been written to the output stream.
     * @param {IOutputStream} outputStream The output stream to write to.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.ihttpcontent.writetostreamasync
     */
    WriteToStreamAsync(outputStream) {
        result := ComCall(12, this, "ptr", outputStream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt64(), (ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }
}
