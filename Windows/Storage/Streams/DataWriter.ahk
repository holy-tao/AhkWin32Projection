#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataWriter.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IDataWriterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Writes data to an output stream.
 * @remarks
 * Instances of DataWriter objects do not support concurrent writes. If an application concurrently writes or detaches a stream from a DataWriter instance that is being written to the call to the object will fail with the error HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class DataWriter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataWriter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataWriter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the data writer to an output stream.
     * @param {IOutputStream} outputStream The new output stream instance.
     * @returns {DataWriter} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.#ctor
     */
    static CreateDataWriter(outputStream) {
        if (!DataWriter.HasProp("__IDataWriterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.DataWriter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataWriterFactory.IID)
            DataWriter.__IDataWriterFactory := IDataWriterFactory(factoryPtr)
        }

        return DataWriter.__IDataWriterFactory.CreateDataWriter(outputStream)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the size of the buffer that has not been used.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.unstoredbufferlength
     * @type {Integer} 
     */
    UnstoredBufferLength {
        get => this.get_UnstoredBufferLength()
    }

    /**
     * Gets or sets the Unicode character encoding for the output stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.unicodeencoding
     * @type {Integer} 
     */
    UnicodeEncoding {
        get => this.get_UnicodeEncoding()
        set => this.put_UnicodeEncoding(value)
    }

    /**
     * Gets or sets the byte order of the data in the output stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.byteorder
     * @type {Integer} 
     */
    ByteOrder {
        get => this.get_ByteOrder()
        set => this.put_ByteOrder(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the data writer.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.DataWriter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnstoredBufferLength() {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.get_UnstoredBufferLength()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnicodeEncoding() {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.get_UnicodeEncoding()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UnicodeEncoding(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.put_UnicodeEncoding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ByteOrder() {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.get_ByteOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ByteOrder(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.put_ByteOrder(value)
    }

    /**
     * Writes a byte value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writebyte
     */
    WriteByte(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteByte(value)
    }

    /**
     * Writes an array of byte values to the output stream.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writebytes
     */
    WriteBytes(value_length, value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteBytes(value_length, value)
    }

    /**
     * Writes the contents of the specified buffer to the output stream.
     * @param {IBuffer} buffer_ The buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writebuffer
     */
    WriteBuffer(buffer_) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteBuffer(buffer_)
    }

    /**
     * Writes the specified bytes from a buffer to the output stream.
     * @param {IBuffer} buffer_ The buffer.
     * @param {Integer} start The starting byte.
     * @param {Integer} count The number of bytes to write.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writebuffer
     */
    WriteBufferRange(buffer_, start, count) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteBufferRange(buffer_, start, count)
    }

    /**
     * Writes a Boolean value to the output stream.
     * @param {Boolean} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writeboolean
     */
    WriteBoolean(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteBoolean(value)
    }

    /**
     * Writes a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) value to the output stream.
     * @param {Guid} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writeguid
     */
    WriteGuid(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteGuid(value)
    }

    /**
     * Writes a 16-bit integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writeint16
     */
    WriteInt16(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteInt16(value)
    }

    /**
     * Writes a 32-bit integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writeint32
     */
    WriteInt32(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteInt32(value)
    }

    /**
     * Writes a 64-bit integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writeint64
     */
    WriteInt64(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteInt64(value)
    }

    /**
     * Writes a 16-bit unsigned integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writeuint16
     */
    WriteUInt16(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteUInt16(value)
    }

    /**
     * Writes a 32-bit unsigned integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writeuint32
     */
    WriteUInt32(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteUInt32(value)
    }

    /**
     * Writes a 64-bit unsigned integer value to the output stream.
     * @param {Integer} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writeuint64
     */
    WriteUInt64(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteUInt64(value)
    }

    /**
     * Writes a floating-point value to the output stream.
     * @param {Float} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writesingle
     */
    WriteSingle(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteSingle(value)
    }

    /**
     * Writes a floating-point value to the output stream.
     * @param {Float} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writedouble
     */
    WriteDouble(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteDouble(value)
    }

    /**
     * Writes a date and time value to the output stream.
     * @param {DateTime} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writedatetime
     */
    WriteDateTime(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteDateTime(value)
    }

    /**
     * Writes a time-interval value to the output stream.
     * @param {TimeSpan} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writetimespan
     */
    WriteTimeSpan(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteTimeSpan(value)
    }

    /**
     * Writes a string value to the output stream.
     * @param {HSTRING} value The value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.writestring
     */
    WriteString(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.WriteString(value)
    }

    /**
     * Gets the size of a string.
     * @param {HSTRING} value The string.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.measurestring
     */
    MeasureString(value) {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.MeasureString(value)
    }

    /**
     * Commits data in the buffer to the output stream. This method should only be called when the DataWriter is writing into a stream; it will fail when the underlying store is a buffer.
     * @returns {DataWriterStoreOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.storeasync
     */
    StoreAsync() {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.StoreAsync()
    }

    /**
     * Flushes data asynchronously.
     * 
     * 
     * <!--<abstract  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">Returns an asynchronous sequential <xref targtype="class_winrt" rid="w_storage_streams.streamflushoperation">StreamFlushOperation</xref> object.</abstract>-->
     * @remarks
     * The FlushAsync method may produce latencies and does not always guarantee durable and coherent storage of data. It's generally recommended to avoid this method if possible.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.flushasync
     */
    FlushAsync() {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.FlushAsync()
    }

    /**
     * Detaches the buffer that is associated with the data writer.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.detachbuffer
     */
    DetachBuffer() {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.DetachBuffer()
    }

    /**
     * Detaches the stream that is associated with the data writer.
     * @remarks
     * If a write operation is in progress when an application attempts to detach the stream, the call will fail with the error HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION).
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.detachstream
     */
    DetachStream() {
        if (!this.HasProp("__IDataWriter")) {
            if ((queryResult := this.QueryInterface(IDataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataWriter := IDataWriter(outPtr)
        }

        return this.__IDataWriter.DetachStream()
    }

    /**
     * Closes the current stream and releases system resources.
     * @remarks
     * [DataWriter](datawriter.md) takes ownership of the stream that is passed to its constructor. Calling this method also calls  on the associated stream. After calling this method, calls to most other [DataWriter](datawriter.md) methods will fail.
     * 
     * If you do not want the associated stream to be closed when the reader closes, call [DataWriter.DetachStream](datawriter_detachstream_464403539.md) before calling this method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datawriter.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
