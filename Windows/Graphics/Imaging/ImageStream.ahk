#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamWithContentType.ahk
#Include ..\..\Storage\Streams\IContentTypeProvider.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\..\Guid.ahk

/**
 * An implementation of [IRandomAccessStreamWithContent](../windows.storage.streams/irandomaccessstreamwithcontenttype.md) type used in the Imaging namespace.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class ImageStream extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRandomAccessStreamWithContentType

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRandomAccessStreamWithContentType.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the data format of the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets or sets the size of the random access stream.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets the byte offset of the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.position
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Indicates if you can read the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.canread
     * @type {Boolean} 
     */
    CanRead {
        get => this.get_CanRead()
    }

    /**
     * Indicates if you can write to the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.canwrite
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
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__IContentTypeProvider")) {
            if ((queryResult := this.QueryInterface(IContentTypeProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentTypeProvider := IContentTypeProvider(outPtr)
        }

        return this.__IContentTypeProvider.get_ContentType()
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
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.getinputstreamat
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
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.getoutputstreamat
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
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.seek
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
     * Returns the file stream for the [ImageStream](imagestream.md).
     * @returns {IRandomAccessStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.clonestream
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
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.writeasync
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
     * Asynchronously commits the current frame data and flushes all of the data on the image stream.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.flushasync
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
     * Closes the [ImageStream](imagestream.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.close
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
     * Reads data asynchronously from a sequential stream.
     * @param {IBuffer} buffer_ The buffer into which the asynchronous read operation stores the data.
     * @param {Integer} count The size of the buffer.
     * @param {Integer} options The options for the stream to be read.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.imagestream.readasync
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
