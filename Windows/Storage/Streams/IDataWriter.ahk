#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DataWriterStoreOperation.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\IBuffer.ahk
#Include .\IOutputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides write access to an output stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IDataWriter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataWriter
     * @type {Guid}
     */
    static IID => Guid("{64b89265-d341-4922-b38a-dd4af8808c4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnstoredBufferLength", "get_UnicodeEncoding", "put_UnicodeEncoding", "get_ByteOrder", "put_ByteOrder", "WriteByte", "WriteBytes", "WriteBuffer", "WriteBufferRange", "WriteBoolean", "WriteGuid", "WriteInt16", "WriteInt32", "WriteInt64", "WriteUInt16", "WriteUInt32", "WriteUInt64", "WriteSingle", "WriteDouble", "WriteDateTime", "WriteTimeSpan", "WriteString", "MeasureString", "StoreAsync", "FlushAsync", "DetachBuffer", "DetachStream"]

    /**
     * Gets the size of the buffer that has not been used.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.unstoredbufferlength
     * @type {Integer} 
     */
    UnstoredBufferLength {
        get => this.get_UnstoredBufferLength()
    }

    /**
     * Gets or sets the Unicode character encoding for the output stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.unicodeencoding
     * @type {Integer} 
     */
    UnicodeEncoding {
        get => this.get_UnicodeEncoding()
        set => this.put_UnicodeEncoding(value)
    }

    /**
     * Gets or sets the byte order of the data in the output stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.byteorder
     * @type {Integer} 
     */
    ByteOrder {
        get => this.get_ByteOrder()
        set => this.put_ByteOrder(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnstoredBufferLength() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnicodeEncoding() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UnicodeEncoding(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ByteOrder() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ByteOrder(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a byte value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writebyte
     */
    WriteByte(value) {
        result := ComCall(11, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes an array of byte values to the output stream.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writebytes
     */
    WriteBytes(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(12, this, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a number of bytes from a buffer to the output stream.
     * @param {IBuffer} buffer_ The buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writebuffer
     */
    WriteBuffer(buffer_) {
        result := ComCall(13, this, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a range of bytes from a buffer to the output stream.
     * @param {IBuffer} buffer_ The buffer.
     * @param {Integer} start The starting byte tobe written.
     * @param {Integer} count The number of bytes to write.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writebuffer
     */
    WriteBufferRange(buffer_, start, count) {
        result := ComCall(14, this, "ptr", buffer_, "uint", start, "uint", count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a Boolean value to the output stream.
     * @param {Boolean} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writeboolean
     */
    WriteBoolean(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) value to the output stream.
     * @param {Guid} value The value to write.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writeguid
     */
    WriteGuid(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a 16-bit integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writeint16
     */
    WriteInt16(value) {
        result := ComCall(17, this, "short", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a 32-bit integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writeint32
     */
    WriteInt32(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a 64-bit integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writeint64
     */
    WriteInt64(value) {
        result := ComCall(19, this, "int64", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a 16-bit unsigned integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writeuint16
     */
    WriteUInt16(value) {
        result := ComCall(20, this, "ushort", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a 32-bit unsigned integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writeuint32
     */
    WriteUInt32(value) {
        result := ComCall(21, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a 64-bit unsigned integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writeuint64
     */
    WriteUInt64(value) {
        result := ComCall(22, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Write a floating-point value to the output stream.
     * @param {Float} value The value to write.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writesingle
     */
    WriteSingle(value) {
        result := ComCall(23, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a floating-point value to the output stream.
     * @param {Float} value The value to write.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writedouble
     */
    WriteDouble(value) {
        result := ComCall(24, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a date and time value to the output stream.
     * @param {DateTime} value The value to write.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writedatetime
     */
    WriteDateTime(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a time interval value to the output stream.
     * @param {TimeSpan} value The value to write.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writetimespan
     */
    WriteTimeSpan(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a string value to the output stream.
     * @param {HSTRING} value The value to write.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.writestring
     */
    WriteString(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(27, this, "ptr", value, "uint*", &codeUnitCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return codeUnitCount
    }

    /**
     * Gets the size of a string.
     * @param {HSTRING} value The string.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.measurestring
     */
    MeasureString(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(28, this, "ptr", value, "uint*", &codeUnitCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return codeUnitCount
    }

    /**
     * Commits data in the buffer to a backing store.
     * @returns {DataWriterStoreOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.storeasync
     */
    StoreAsync() {
        result := ComCall(29, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataWriterStoreOperation(operation)
    }

    /**
     * Flushes data asynchronously.
     * @remarks
     * The [FlushAsync](datawriter_flushasync_491532439.md) method ensures that the data has reached the target storage medium that the stream represents. For example, to improve application responsiveness and throughput, a file stream might respond to a write operation by copying the buffer into another temporary storage medium and returning immediately, while the target device begins writing the data concurrently.
     * 
     * The [FlushAsync](datawriter_flushasync_491532439.md) method doesn't complete until all data specified in previous write calls has reached the target storage medium. If the data can't be written, or an error occurred during a write operation, the method returns false.
     * 
     * The FlushAsync method may produce latencies and does not always guarantee durable and coherent storage of data. It's generally recommended to avoid this method if possible.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.flushasync
     */
    FlushAsync() {
        result := ComCall(30, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * Detaches a buffer that was previously attached to the writer.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.detachbuffer
     */
    DetachBuffer() {
        result := ComCall(31, this, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * Detaches a stream that was previously attached to the writer.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatawriter.detachstream
     */
    DetachStream() {
        result := ComCall(32, this, "ptr*", &outputStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(outputStream)
    }
}
