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
 * Represents the thumbnail image for a device.
 * @remarks
 * Call [DeviceInformation.GetThumbnailAsync](deviceinformation_getthumbnailasync_241227233.md) and handle the completion event as shown in the example.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceThumbnail extends IInspectable {
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
     * Returns the content type of the thumbnail image.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets or sets the size of the device thumbnail image.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets the byte offset of the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.position
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a value that indicates whether the stream can be read from.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.canread
     * @type {Boolean} 
     */
    CanRead {
        get => this.get_CanRead()
    }

    /**
     * Gets a value that indicates whether the stream can be written to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.canwrite
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
     * Returns a pointer to an input stream starting at the specified location.
     * @param {Integer} position The position in the input stream.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.getinputstreamat
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
     * Returns a pointer to an output stream starting at the specified location.
     * @param {Integer} position The position in the output stream.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.getoutputstreamat
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.seek
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
     * Creates a new instance of a [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) over the same resource as the current stream.
     * @returns {IRandomAccessStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.clonestream
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.writeasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.flushasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.close
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
     * @param {Integer} count The number of bytes to read.
     * @param {Integer} options Specifies the type of the asynchronous read operation.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicethumbnail.readasync
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
