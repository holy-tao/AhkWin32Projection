#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\DataReaderLoadOperation.ahk
#Include .\IInputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides read access to an input stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IDataReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataReader
     * @type {Guid}
     */
    static IID => Guid("{e2b50029-b4c1-4314-a4b8-fb813a2f275e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnconsumedBufferLength", "get_UnicodeEncoding", "put_UnicodeEncoding", "get_ByteOrder", "put_ByteOrder", "get_InputStreamOptions", "put_InputStreamOptions", "ReadByte", "ReadBytes", "ReadBuffer", "ReadBoolean", "ReadGuid", "ReadInt16", "ReadInt32", "ReadInt64", "ReadUInt16", "ReadUInt32", "ReadUInt64", "ReadSingle", "ReadDouble", "ReadString", "ReadDateTime", "ReadTimeSpan", "LoadAsync", "DetachBuffer", "DetachStream"]

    /**
     * Gets the size of the buffer that has not been read.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.unconsumedbufferlength
     * @type {Integer} 
     */
    UnconsumedBufferLength {
        get => this.get_UnconsumedBufferLength()
    }

    /**
     * Gets or sets the Unicode character encoding for the input stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.unicodeencoding
     * @type {Integer} 
     */
    UnicodeEncoding {
        get => this.get_UnicodeEncoding()
        set => this.put_UnicodeEncoding(value)
    }

    /**
     * Gets or sets the byte order of the data in the input stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.byteorder
     * @type {Integer} 
     */
    ByteOrder {
        get => this.get_ByteOrder()
        set => this.put_ByteOrder(value)
    }

    /**
     * Gets or sets the read options for the input stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.inputstreamoptions
     * @type {Integer} 
     */
    InputStreamOptions {
        get => this.get_InputStreamOptions()
        set => this.put_InputStreamOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnconsumedBufferLength() {
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
     * 
     * @returns {Integer} 
     */
    get_InputStreamOptions() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
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
    put_InputStreamOptions(value) {
        result := ComCall(12, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads a byte value from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readbyte
     */
    ReadByte() {
        result := ComCall(13, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads an array of byte values from the input stream.
     * @param {Pointer<Integer>} value_length 
     * @param {Pointer<Pointer<Integer>>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readbytes
     */
    ReadBytes(value_length, value) {
        value_lengthMarshal := value_length is VarRef ? "uint*" : "ptr"
        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, value_lengthMarshal, value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads a buffer from the input stream.
     * @param {Integer} length The length of the buffer, in bytes.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readbuffer
     */
    ReadBuffer(length) {
        result := ComCall(15, this, "uint", length, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * Reads a Boolean value from the input stream.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readboolean
     */
    ReadBoolean() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) value from the input stream.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readguid
     */
    ReadGuid() {
        value := Guid()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a 16-bit integer value from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readint16
     */
    ReadInt16() {
        result := ComCall(18, this, "short*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a 32-bit integer value from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readint32
     */
    ReadInt32() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a 64-bit integer value from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readint64
     */
    ReadInt64() {
        result := ComCall(20, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a 16-bit unsigned integer from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readuint16
     */
    ReadUInt16() {
        result := ComCall(21, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a 32-bit unsigned integer from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readuint32
     */
    ReadUInt32() {
        result := ComCall(22, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a 64-bit unsigned integer from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readuint64
     */
    ReadUInt64() {
        result := ComCall(23, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a floating-point value from the input stream.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readsingle
     */
    ReadSingle() {
        result := ComCall(24, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a floating-point value from the input stream.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readdouble
     */
    ReadDouble() {
        result := ComCall(25, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a string value from the input stream.
     * @param {Integer} codeUnitCount The length of the string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readstring
     */
    ReadString(codeUnitCount) {
        value := HSTRING()
        result := ComCall(26, this, "uint", codeUnitCount, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a date and time value from the input stream.
     * @returns {DateTime} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readdatetime
     */
    ReadDateTime() {
        value := DateTime()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads a time interval from the input stream.
     * @returns {TimeSpan} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.readtimespan
     */
    ReadTimeSpan() {
        value := TimeSpan()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Loads data from the input stream.
     * @param {Integer} count The count of bytes to load into the intermediate buffer.
     * @returns {DataReaderLoadOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.loadasync
     */
    LoadAsync(count) {
        result := ComCall(29, this, "uint", count, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataReaderLoadOperation(operation)
    }

    /**
     * Detaches a buffer that was previously attached to the reader.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.detachbuffer
     */
    DetachBuffer() {
        result := ComCall(30, this, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * Detaches a stream that was previously attached to the reader.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.idatareader.detachstream
     */
    DetachStream() {
        result := ComCall(31, this, "ptr*", &stream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(stream)
    }
}
