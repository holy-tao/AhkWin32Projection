#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\IBuffer.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a sequential stream of bytes to be read.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.iinputstream
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IInputStream extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputStream
     * @type {Guid}
     */
    static IID => Guid("{905a0fe2-bc53-11df-8c49-001e4fc686da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadAsync"]

    /**
     * Reads data from the stream asynchronously.
     * @remarks
     * Always read data from the buffer returned in the [IAsyncOperationWithProgress(IBuffer, UInt32)](../windows.foundation/iasyncoperationwithprogress_2.md). Don't assume that the input buffer contains the data. Depending on the implementation, the data that's read might be placed into the input buffer, or it might be returned in a different buffer. For the input buffer, you don't have to implement the [IBuffer](ibuffer.md) interface. Instead, you can create an instance of the [Buffer](buffer.md) class.
     * 
     * Also consider reading a buffer into an [IInputStream](iinputstream.md) by using the [ReadBuffer](datareader_readbuffer_1019013844.md) method of the [DataReader](datareader.md) class.
     * @param {IBuffer} buffer_ A buffer that may be used to return the bytes that are read. The return value contains the buffer that holds the results.
     * @param {Integer} count The number of bytes to read that is less than or equal to the [Capacity](ibuffer_capacity.md) value.
     * @param {Integer} options Specifies the type of the asynchronous read operation.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.iinputstream.readasync
     */
    ReadAsync(buffer_, count, options) {
        result := ComCall(6, this, "ptr", buffer_, "uint", count, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IBuffer, (ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }
}
