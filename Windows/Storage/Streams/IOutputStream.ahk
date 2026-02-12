#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a sequential stream of bytes to be written.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ioutputstream
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IOutputStream extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOutputStream
     * @type {Guid}
     */
    static IID => Guid("{905a0fe6-bc53-11df-8c49-001e4fc686da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteAsync", "FlushAsync"]

    /**
     * Writes data asynchronously in a sequential stream.
     * @remarks
     * Some stream implementations support queuing of write operations. In this case, the asynchronous execution of the WriteAsync method does not complete until the [FlushAsync](ioutputstream_flushasync_491532439.md) method has completed. For the *buffer* parameter, you don't have to implement the [IBuffer](ibuffer.md) interface. Instead, you can create an instance of the [Buffer](buffer.md) class or create a buffer by using methods in the [CryptographicBuffer](../windows.security.cryptography/cryptographicbuffer.md) class.
     * 
     * Also consider writing a buffer into an [IOutputStream](ioutputstream.md) by using the [WriteBuffer](datawriter_writebuffer_210574036.md) method of the [DataWriter](datawriter.md) class.
     * @param {IBuffer} buffer_ A buffer that contains the data to be written.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ioutputstream.writeasync
     */
    WriteAsync(buffer_) {
        result := ComCall(6, this, "ptr", buffer_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt32(), (ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * Flushes data asynchronously in a sequential stream.
     * @remarks
     * The FlushAsync method improves, but does not guarantee durable and coherent storage of data and it introduces latencies. It's generally recommended to avoid this method to achieve good performance but it should be used if coherency is desired.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ioutputstream.flushasync
     */
    FlushAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
