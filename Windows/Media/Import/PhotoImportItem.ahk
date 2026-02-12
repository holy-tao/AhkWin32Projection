#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportItem.ahk
#Include .\IPhotoImportItem2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an media item that has been imported from a source.
 * @remarks
 * Get an instance of this class by calling one of the following methods.
 * 
 * + [PhotoImportSession.FindItemsAsync](photoimportsession_finditemsasync_1686050162.md)
 * + [PhotoImportFindItemsResult.ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md)
 * + [DeleteImportedItemsFromSourceAsync](photoimportimportitemsresult_deleteimporteditemsfromsourceasync_1949343605.md)
 * Or, handle the [PhotoImportFindItemsResult.ItemImported](photoimportfinditemsresult_itemimported.md) event.
 * 
 * For how-to guidance for adding media import to your app, see [Import media from a device](/windows/uwp/audio-video-camera/import-media-from-a-device).
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the key used to identify the item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.itemkey
     * @type {Integer} 
     */
    ItemKey {
        get => this.get_ItemKey()
    }

    /**
     * Gets the content type of the imported item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.contenttype
     * @type {Integer} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets the size of the item, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.sizeinbytes
     * @type {Integer} 
     */
    SizeInBytes {
        get => this.get_SizeInBytes()
    }

    /**
     * Gets the creation date of the imported item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.date
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * Gets the sibling file associated with the item, if one exists.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.sibling
     * @type {PhotoImportSidecar} 
     */
    Sibling {
        get => this.get_Sibling()
    }

    /**
     * Gets the list of sidecar files associated with the item, if any exists.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.sidecars
     * @type {IVectorView<PhotoImportSidecar>} 
     */
    Sidecars {
        get => this.get_Sidecars()
    }

    /**
     * Gets the list of video segments associated with the item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.videosegments
     * @type {IVectorView<PhotoImportVideoSegment>} 
     */
    VideoSegments {
        get => this.get_VideoSegments()
    }

    /**
     * Gets a value indicating whether the item is currently selected for import.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
        set => this.put_IsSelected(value)
    }

    /**
     * Gets a random access stream containing the thumbnail image associated with the item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.thumbnail
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * Gets a list of the names of files associated with this item that were imported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.importedfilenames
     * @type {IVectorView<HSTRING>} 
     */
    ImportedFileNames {
        get => this.get_ImportedFileNames()
    }

    /**
     * Gets a list of the names of files associated with this item that were deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.deletedfilenames
     * @type {IVectorView<HSTRING>} 
     */
    DeletedFileNames {
        get => this.get_DeletedFileNames()
    }

    /**
     * Gets the file system path of the [PhotoImportItem](photoimportitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitem.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemKey() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_ItemKey()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentType() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_ContentType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SizeInBytes() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_SizeInBytes()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_Date()
    }

    /**
     * 
     * @returns {PhotoImportSidecar} 
     */
    get_Sibling() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_Sibling()
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportSidecar>} 
     */
    get_Sidecars() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_Sidecars()
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportVideoSegment>} 
     */
    get_VideoSegments() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_VideoSegments()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_IsSelected()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSelected(value) {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.put_IsSelected(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_Thumbnail()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ImportedFileNames() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_ImportedFileNames()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DeletedFileNames() {
        if (!this.HasProp("__IPhotoImportItem")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem := IPhotoImportItem(outPtr)
        }

        return this.__IPhotoImportItem.get_DeletedFileNames()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__IPhotoImportItem2")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItem2 := IPhotoImportItem2(outPtr)
        }

        return this.__IPhotoImportItem2.get_Path()
    }

;@endregion Instance Methods
}
