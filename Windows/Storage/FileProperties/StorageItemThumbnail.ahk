#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\Streams\IRandomAccessStreamWithContentType.ahk
#Include ..\Streams\IContentTypeProvider.ahk
#Include ..\Streams\IRandomAccessStream.ahk
#Include ..\Streams\IOutputStream.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\Streams\IInputStream.ahk
#Include .\IThumbnailProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the thumbnail image associated with a system resource (like a file or folder).
 * @remarks
 * You can get thumbnails for many file system resources through the Windows Runtime objects that represent them. Many of these objects have methods or properties that let you get (and sometimes set) a StorageItemThumbnail that represents the thumbnail associated with a particular resource.
 * 
 * To find out how to get thumbnail for a particular Windows Runtime object, see the documentation for that object. For example, to get a thumbnail for a file you can call one of the [StorageFile.getThumbnailAsync](../windows.storage/storagefile_getthumbnailasync_1511435522.md) methods, or to get a thumbnail for a contact you can use the [Contact.thumbnail](../windows.applicationmodel.contacts/contact_thumbnail.md) property.
 * 
 * For more code samples about retrieving thumbnails, see the [Folder enumeration sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/FolderEnumeration) and the [File thumbnails sample](https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/FileThumbnails).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class StorageItemThumbnail extends IInspectable {
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
     * Gets the MIME content type of the thumbnail image.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets or sets the size of the thumbnail image.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets the byte offset of the thumbnail stream.
     * @remarks
     * The initial offset of a thumbnail stream is 0.
     * 
     * The offset of the thumbnail stream is changed by both read and write operations.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.position
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a value that indicates whether the thumbnail stream can be read from.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.canread
     * @type {Boolean} 
     */
    CanRead {
        get => this.get_CanRead()
    }

    /**
     * Gets a value that indicates whether the thumbnail stream can be written to.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.canwrite
     * @type {Boolean} 
     */
    CanWrite {
        get => this.get_CanWrite()
    }

    /**
     * Gets the original (not scaled) width of the thumbnail image.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.originalwidth
     * @type {Integer} 
     */
    OriginalWidth {
        get => this.get_OriginalWidth()
    }

    /**
     * Gets the original (not scaled) height of the thumbnail image.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.originalheight
     * @type {Integer} 
     */
    OriginalHeight {
        get => this.get_OriginalHeight()
    }

    /**
     * Gets a value that indicates whether the thumbnail image returned was a cached version with a smaller size.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.returnedsmallercachedsize
     * @type {Boolean} 
     */
    ReturnedSmallerCachedSize {
        get => this.get_ReturnedSmallerCachedSize()
    }

    /**
     * Gets a value that indicates if the thumbnail is an icon or an image.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
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
     * Retrieves the thumbnail image data as an undecoded stream.
     * @param {Integer} position The position in the storage item to start reading thumbnail image data.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.getinputstreamat
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
     * Retrieves an output stream object for writing thumbnail image data to a storage item.
     * @param {Integer} position The position in the storage item to start writing thumbnail image data.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.getoutputstreamat
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
     * Sets the offset of the thumbnail stream to the specified value.
     * @remarks
     * > [!WARNING]
     * > This method does not check *position* to make sure the value is valid. If the value is invalid for the stream, the [readAsync](storageitemthumbnail_readasync_1012630619.md) and [writeAsync](storageitemthumbnail_writeasync_897036872.md) methods will return error if they are called.
     * @param {Integer} position The number of bytes from the start of the thumbnail stream where the position of the thumbnail stream is set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.seek
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
     * Creates a new stream over the thumbnail that is represented by the current [storageItemThumbnail](storageitemthumbnail.md) object.
     * @returns {IRandomAccessStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.clonestream
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.writeasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.flushasync
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
     * Releases system resources that are exposed by a Windows Runtime object.
     * @remarks
     * Use this method to release the exclusive system resources that are in use, such as file handles, streams, and network sockets. The method should also release other resources that are in use, including object references and memory, to prepare them for reuse.
     * 
     * This method must call the [Close](../windows.foundation/iclosable_close_811482585.md) method of any object it holds that implements [IClosable](../windows.foundation/iclosable.md).
     * 
     * The [Close](../windows.foundation/iclosable_close_811482585.md) method should release system resources as quickly as possible, without blocking for asynchronous operations to complete. To ensure that all resources are completely released, the caller must wait for all outstanding asynchronous operations to complete before calling [Close](../windows.foundation/iclosable_close_811482585.md).
     * 
     * After [Close](../windows.foundation/iclosable_close_811482585.md) returns, the object is still in memory but without the system resources it needs; therefore, most of its members are not usable. A member that depends on a released system resource can return **RO_E_CLOSED** to indicate that the object is closed and it cannot complete the requested operation.
     * 
     * If you call [Close](../windows.foundation/iclosable_close_811482585.md) multiple times, there is no effect; the method returns **S_OK**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.close
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
     * @param {Integer} count The number of bytes to read that is less than or equal to the [Capacity](../windows.storage.streams/ibuffer_capacity.md) value.
     * @param {Integer} options Specifies the type of the asynchronous read operation.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.storageitemthumbnail.readasync
     */
    ReadAsync(buffer_, count, options) {
        if (!this.HasProp("__IInputStream")) {
            if ((queryResult := this.QueryInterface(IInputStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputStream := IInputStream(outPtr)
        }

        return this.__IInputStream.ReadAsync(buffer_, count, options)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginalWidth() {
        if (!this.HasProp("__IThumbnailProperties")) {
            if ((queryResult := this.QueryInterface(IThumbnailProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumbnailProperties := IThumbnailProperties(outPtr)
        }

        return this.__IThumbnailProperties.get_OriginalWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginalHeight() {
        if (!this.HasProp("__IThumbnailProperties")) {
            if ((queryResult := this.QueryInterface(IThumbnailProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumbnailProperties := IThumbnailProperties(outPtr)
        }

        return this.__IThumbnailProperties.get_OriginalHeight()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReturnedSmallerCachedSize() {
        if (!this.HasProp("__IThumbnailProperties")) {
            if ((queryResult := this.QueryInterface(IThumbnailProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumbnailProperties := IThumbnailProperties(outPtr)
        }

        return this.__IThumbnailProperties.get_ReturnedSmallerCachedSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IThumbnailProperties")) {
            if ((queryResult := this.QueryInterface(IThumbnailProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumbnailProperties := IThumbnailProperties(outPtr)
        }

        return this.__IThumbnailProperties.get_Type()
    }

;@endregion Instance Methods
}
