#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRandomAccessStream.ahk
#Include .\IOutputStream.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IInputStream.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides random access of data in input and output streams that are stored in memory instead of on disk.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class InMemoryRandomAccessStream extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRandomAccessStream

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRandomAccessStream.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the size of the random access stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets the byte offset of the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.position
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a value that indicates whether the stream can be read from.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.canread
     * @type {Boolean} 
     */
    CanRead {
        get => this.get_CanRead()
    }

    /**
     * Gets a value that indicates whether the stream can be written to.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.canwrite
     * @type {Boolean} 
     */
    CanWrite {
        get => this.get_CanWrite()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the InMemoryRandomAccessStream class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.InMemoryRandomAccessStream")
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
    get_Size() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.get_Size()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.put_Size(value)
    }

    /**
     * Returns an input stream at a specified location in a stream.
     * @param {Integer} position The location in the stream at which to begin.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.getinputstreamat
     */
    GetInputStreamAt(position) {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.GetInputStreamAt(position)
    }

    /**
     * Returns an output stream at a specified location in a stream.
     * @param {Integer} position The location in the output stream at which to begin.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.getoutputstreamat
     */
    GetOutputStreamAt(position) {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.GetOutputStreamAt(position)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Position() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.get_Position()
    }

    /**
     * Sets the position of the stream to the specified value.
     * @remarks
     * > [!WARNING]
     * > This method does not check the position to make sure the value is valid for the stream. If the position is invalid for the stream, the [ReadAsync](iinputstream_readasync_1012630619.md) and [WriteAsync](ioutputstream_writeasync_897036872.md) methods will return an error if you call them.
     * @param {Integer} position The new position of the stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.seek
     */
    Seek(position) {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.Seek(position)
    }

    /**
     * Creates a new instance of a [IRandomAccessStream](irandomaccessstream.md) over the same resource as the current stream.
     * @returns {IRandomAccessStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.clonestream
     */
    CloneStream() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.CloneStream()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRead() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.get_CanRead()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanWrite() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.get_CanWrite()
    }

    /**
     * Writes data asynchronously in a sequential stream.
     * @param {IBuffer} buffer_ The buffer into which the asynchronous writer operation writes.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.writeasync
     */
    WriteAsync(buffer_) {
        if (!this.HasProp("__IOutputStream")) {
            if ((queryResult := this.QueryInterface(IOutputStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOutputStream := IOutputStream(outPtr)
        }

        return this.__IOutputStream.WriteAsync(buffer_)
    }

    /**
     * Flushes data asynchronously in a sequential stream.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.flushasync
     */
    FlushAsync() {
        if (!this.HasProp("__IOutputStream")) {
            if ((queryResult := this.QueryInterface(IOutputStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOutputStream := IOutputStream(outPtr)
        }

        return this.__IOutputStream.FlushAsync()
    }

    /**
     * Closes the current stream and releases system resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.close
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
     * Returns an asynchronous byte reader object.
     * @param {IBuffer} buffer_ The buffer into which the asynchronous read operation places the bytes that are read.
     * @param {Integer} count The number of bytes to read that is less than or equal to the [Capacity](ibuffer_capacity.md) value.
     * @param {Integer} options Specifies the type of the asynchronous read operation.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inmemoryrandomaccessstream.readasync
     */
    ReadAsync(buffer_, count, options) {
        if (!this.HasProp("__IInputStream")) {
            if ((queryResult := this.QueryInterface(IInputStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputStream := IInputStream(outPtr)
        }

        return this.__IInputStream.ReadAsync(buffer_, count, options)
    }

;@endregion Instance Methods
}
