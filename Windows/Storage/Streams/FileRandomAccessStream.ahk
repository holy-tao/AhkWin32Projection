#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRandomAccessStream.ahk
#Include .\IOutputStream.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IInputStream.ahk
#Include .\IFileRandomAccessStreamStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports reading and writing to a file at a specified position.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class FileRandomAccessStream extends IInspectable {
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

;@region Static Methods
    /**
     * Opens a stream to an existing file given the file's path.
     * @param {HSTRING} filePath A path to the file to be opened.
     * @param {Integer} accessMode The permissions level to open the stream with.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.openasync
     */
    static OpenAsync(filePath, accessMode) {
        if (!FileRandomAccessStream.HasProp("__IFileRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.FileRandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRandomAccessStreamStatics.IID)
            FileRandomAccessStream.__IFileRandomAccessStreamStatics := IFileRandomAccessStreamStatics(factoryPtr)
        }

        return FileRandomAccessStream.__IFileRandomAccessStreamStatics.OpenAsync(filePath, accessMode)
    }

    /**
     * Opens a stream to an existing file given the file's path.
     * @param {HSTRING} filePath A path to the file to be opened.
     * @param {Integer} accessMode The permissions level to open the stream with.
     * @param {Integer} sharingOptions 
     * @param {Integer} openDisposition 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.openasync
     */
    static OpenWithOptionsAsync(filePath, accessMode, sharingOptions, openDisposition) {
        if (!FileRandomAccessStream.HasProp("__IFileRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.FileRandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRandomAccessStreamStatics.IID)
            FileRandomAccessStream.__IFileRandomAccessStreamStatics := IFileRandomAccessStreamStatics(factoryPtr)
        }

        return FileRandomAccessStream.__IFileRandomAccessStreamStatics.OpenWithOptionsAsync(filePath, accessMode, sharingOptions, openDisposition)
    }

    /**
     * Opens a stream for writing to an existing file given the file's path.
     * @param {HSTRING} filePath A path to the file to be opened.
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.opentransactedwriteasync
     */
    static OpenTransactedWriteAsync(filePath) {
        if (!FileRandomAccessStream.HasProp("__IFileRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.FileRandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRandomAccessStreamStatics.IID)
            FileRandomAccessStream.__IFileRandomAccessStreamStatics := IFileRandomAccessStreamStatics(factoryPtr)
        }

        return FileRandomAccessStream.__IFileRandomAccessStreamStatics.OpenTransactedWriteAsync(filePath)
    }

    /**
     * Opens a stream for writing to an existing file given the file's path.
     * @param {HSTRING} filePath A path to the file to be opened.
     * @param {Integer} openOptions 
     * @param {Integer} openDisposition 
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.opentransactedwriteasync
     */
    static OpenTransactedWriteWithOptionsAsync(filePath, openOptions, openDisposition) {
        if (!FileRandomAccessStream.HasProp("__IFileRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.FileRandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRandomAccessStreamStatics.IID)
            FileRandomAccessStream.__IFileRandomAccessStreamStatics := IFileRandomAccessStreamStatics(factoryPtr)
        }

        return FileRandomAccessStream.__IFileRandomAccessStreamStatics.OpenTransactedWriteWithOptionsAsync(filePath, openOptions, openDisposition)
    }

    /**
     * Opens a stream for a user to an existing file given the file path and the user's information.
     * @param {User} user_ The user account for opening the stream.
     * @param {HSTRING} filePath A path to the file to be opened.
     * @param {Integer} accessMode The permissions level to open the stream with.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.openforuserasync
     */
    static OpenForUserAsync(user_, filePath, accessMode) {
        if (!FileRandomAccessStream.HasProp("__IFileRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.FileRandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRandomAccessStreamStatics.IID)
            FileRandomAccessStream.__IFileRandomAccessStreamStatics := IFileRandomAccessStreamStatics(factoryPtr)
        }

        return FileRandomAccessStream.__IFileRandomAccessStreamStatics.OpenForUserAsync(user_, filePath, accessMode)
    }

    /**
     * Opens a stream for a user to an existing file given the file path and the user's information.
     * @param {User} user_ The user account for opening the stream.
     * @param {HSTRING} filePath A path to the file to be opened.
     * @param {Integer} accessMode The permissions level to open the stream with.
     * @param {Integer} sharingOptions 
     * @param {Integer} openDisposition 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.openforuserasync
     */
    static OpenForUserWithOptionsAsync(user_, filePath, accessMode, sharingOptions, openDisposition) {
        if (!FileRandomAccessStream.HasProp("__IFileRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.FileRandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRandomAccessStreamStatics.IID)
            FileRandomAccessStream.__IFileRandomAccessStreamStatics := IFileRandomAccessStreamStatics(factoryPtr)
        }

        return FileRandomAccessStream.__IFileRandomAccessStreamStatics.OpenForUserWithOptionsAsync(user_, filePath, accessMode, sharingOptions, openDisposition)
    }

    /**
     * Opens a writable stream for a user to an existing file given the file's path and the user's information.
     * @param {User} user_ The user account for opening the stream.
     * @param {HSTRING} filePath A path to the file to be opened.
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.opentransactedwriteforuserasync
     */
    static OpenTransactedWriteForUserAsync(user_, filePath) {
        if (!FileRandomAccessStream.HasProp("__IFileRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.FileRandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRandomAccessStreamStatics.IID)
            FileRandomAccessStream.__IFileRandomAccessStreamStatics := IFileRandomAccessStreamStatics(factoryPtr)
        }

        return FileRandomAccessStream.__IFileRandomAccessStreamStatics.OpenTransactedWriteForUserAsync(user_, filePath)
    }

    /**
     * Opens a writable stream for a user to an existing file given the file's path and the user's information.
     * @param {User} user_ The user account for opening the stream.
     * @param {HSTRING} filePath A path to the file to be opened.
     * @param {Integer} openOptions 
     * @param {Integer} openDisposition 
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.opentransactedwriteforuserasync
     */
    static OpenTransactedWriteForUserWithOptionsAsync(user_, filePath, openOptions, openDisposition) {
        if (!FileRandomAccessStream.HasProp("__IFileRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.FileRandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileRandomAccessStreamStatics.IID)
            FileRandomAccessStream.__IFileRandomAccessStreamStatics := IFileRandomAccessStreamStatics(factoryPtr)
        }

        return FileRandomAccessStream.__IFileRandomAccessStreamStatics.OpenTransactedWriteForUserWithOptionsAsync(user_, filePath, openOptions, openDisposition)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the size of the random access stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets the byte offset of the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.position
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a value that indicates whether the stream can be read from.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.canread
     * @type {Boolean} 
     */
    CanRead {
        get => this.get_CanRead()
    }

    /**
     * Gets a value that indicates whether the file can be written to.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.canwrite
     * @type {Boolean} 
     */
    CanWrite {
        get => this.get_CanWrite()
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.getinputstreamat
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.getoutputstreamat
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
     * @param {Integer} position The new position of the stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.seek
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.clonestream
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
     * Writes data asynchronously to a file.
     * @param {IBuffer} buffer_ The buffer into which the asynchronous writer operation writes.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.writeasync
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
     * @remarks
     * The FlushAsync method may produce latencies and does not always guarantee durable and coherent storage of data. It's generally recommended to avoid this method if possible.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.flushasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.close
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.filerandomaccessstream.readasync
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
