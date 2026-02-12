#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataReader.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IDataReaderFactory.ahk
#Include .\IDataReaderStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Reads data from an input stream.
 * @remarks
 * Instances of DataReader objects do not support concurrent read operations. If an application concurrently reads or detaches a stream from a DataReader instance that is being read from, the call to the object will fail with the error HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class DataReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataReader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the data reader.
     * @param {IInputStream} inputStream The input stream.
     * @returns {DataReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.#ctor
     */
    static CreateDataReader(inputStream) {
        if (!DataReader.HasProp("__IDataReaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.DataReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataReaderFactory.IID)
            DataReader.__IDataReaderFactory := IDataReaderFactory(factoryPtr)
        }

        return DataReader.__IDataReaderFactory.CreateDataReader(inputStream)
    }

    /**
     * Creates a new instance of the data reader with data from the specified buffer.
     * @param {IBuffer} buffer_ The buffer.
     * @returns {DataReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.frombuffer
     */
    static FromBuffer(buffer_) {
        if (!DataReader.HasProp("__IDataReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.DataReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataReaderStatics.IID)
            DataReader.__IDataReaderStatics := IDataReaderStatics(factoryPtr)
        }

        return DataReader.__IDataReaderStatics.FromBuffer(buffer_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the size of the buffer that has not been read.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.unconsumedbufferlength
     * @type {Integer} 
     */
    UnconsumedBufferLength {
        get => this.get_UnconsumedBufferLength()
    }

    /**
     * Gets or sets the Unicode character encoding for the input stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.unicodeencoding
     * @type {Integer} 
     */
    UnicodeEncoding {
        get => this.get_UnicodeEncoding()
        set => this.put_UnicodeEncoding(value)
    }

    /**
     * Gets or sets the byte order of the data in the input stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.byteorder
     * @type {Integer} 
     */
    ByteOrder {
        get => this.get_ByteOrder()
        set => this.put_ByteOrder(value)
    }

    /**
     * Gets or sets the read options for the input stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.inputstreamoptions
     * @type {Integer} 
     */
    InputStreamOptions {
        get => this.get_InputStreamOptions()
        set => this.put_InputStreamOptions(value)
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
     * @returns {Integer} 
     */
    get_UnconsumedBufferLength() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.get_UnconsumedBufferLength()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnicodeEncoding() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.get_UnicodeEncoding()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UnicodeEncoding(value) {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.put_UnicodeEncoding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ByteOrder() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.get_ByteOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ByteOrder(value) {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.put_ByteOrder(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputStreamOptions() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.get_InputStreamOptions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InputStreamOptions(value) {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.put_InputStreamOptions(value)
    }

    /**
     * Reads a byte value from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readbyte
     */
    ReadByte() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadByte()
    }

    /**
     * Reads an array of byte values from the input stream.
     * @param {Pointer<Integer>} value_length 
     * @param {Pointer<Pointer<Integer>>} value The array that receives the byte values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readbytes
     */
    ReadBytes(value_length, value) {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadBytes(value_length, value)
    }

    /**
     * Reads a buffer from the input stream.
     * @param {Integer} length The length of the buffer, in bytes.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readbuffer
     */
    ReadBuffer(length) {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadBuffer(length)
    }

    /**
     * Reads a Boolean value from the input stream.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readboolean
     */
    ReadBoolean() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadBoolean()
    }

    /**
     * Reads a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) value from the input stream.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readguid
     */
    ReadGuid() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadGuid()
    }

    /**
     * Reads a 16-bit integer value from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readint16
     */
    ReadInt16() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadInt16()
    }

    /**
     * Reads a 32-bit integer value from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readint32
     */
    ReadInt32() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadInt32()
    }

    /**
     * Reads a 64-bit integer value from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readint64
     */
    ReadInt64() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadInt64()
    }

    /**
     * Reads a 16-bit unsigned integer from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readuint16
     */
    ReadUInt16() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadUInt16()
    }

    /**
     * Reads a 32-bit unsigned integer from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readuint32
     */
    ReadUInt32() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadUInt32()
    }

    /**
     * Reads a 64-bit unsigned integer from the input stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readuint64
     */
    ReadUInt64() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadUInt64()
    }

    /**
     * Reads a floating-point value from the input stream.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readsingle
     */
    ReadSingle() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadSingle()
    }

    /**
     * Reads a floating-point value from the input stream.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readdouble
     */
    ReadDouble() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadDouble()
    }

    /**
     * Reads a string value from the input stream.
     * @param {Integer} codeUnitCount The length of the string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readstring
     */
    ReadString(codeUnitCount) {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadString(codeUnitCount)
    }

    /**
     * Reads a date and time value from the input stream.
     * @returns {DateTime} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readdatetime
     */
    ReadDateTime() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadDateTime()
    }

    /**
     * Reads a time-interval value from the input stream.
     * @returns {TimeSpan} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.readtimespan
     */
    ReadTimeSpan() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.ReadTimeSpan()
    }

    /**
     * Loads data from the input stream.
     * @remarks
     * The read operation can get more or fewer bytes depending on how the [InputStreamOptions](datareader_inputstreamoptions.md) property is set.
     * 
     * You will need to call this method to load the data before the data can be read from DataReader.
     * @param {Integer} count The count of bytes to load into the intermediate buffer.
     * @returns {DataReaderLoadOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.loadasync
     */
    LoadAsync(count) {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.LoadAsync(count)
    }

    /**
     * Detaches the buffer that is associated with the data reader. This is useful if you want to retain the buffer after you dispose the data reader.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.detachbuffer
     */
    DetachBuffer() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.DetachBuffer()
    }

    /**
     * Detaches the stream that is associated with the data reader.
     * @remarks
     * If a read operation is in progress when an application attempts to detach the stream, the call will fail with the error HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION).
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.detachstream
     */
    DetachStream() {
        if (!this.HasProp("__IDataReader")) {
            if ((queryResult := this.QueryInterface(IDataReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataReader := IDataReader(outPtr)
        }

        return this.__IDataReader.DetachStream()
    }

    /**
     * Closes the current stream and releases system resources.
     * @remarks
     * [DataReader](datareader.md) takes ownership of the stream that is passed to its constructor. Calling this method also calls  on the associated stream. After calling this method, calls to most other [DataReader](datareader.md) methods will fail.
     * 
     * If you do not want the associated stream to be closed when the reader closes, call [DataReader.DetachStream](datareader_detachstream_464403539.md) before calling this method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareader.close
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
