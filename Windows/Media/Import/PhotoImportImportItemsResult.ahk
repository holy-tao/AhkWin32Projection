#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportImportItemsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a operation that imports media items from the source.
 * @remarks
 * Get an instance of this class by calling [PhotoImportFindItemsResult.ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) or [PhotoImportOperation.ContinueImportingItemsAsync](photoimportoperation_continueimportingitemsasync.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportImportItemsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportImportItemsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportImportItemsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the photo import session associated with the import operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.session
     * @type {PhotoImportSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Gets a value indicating whether the import operation has succeeded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.hassucceeded
     * @type {Boolean} 
     */
    HasSucceeded {
        get => this.get_HasSucceeded()
    }

    /**
     * Gets a list of items that were imported from the source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.importeditems
     * @type {IVectorView<PhotoImportItem>} 
     */
    ImportedItems {
        get => this.get_ImportedItems()
    }

    /**
     * Gets the number of photos imported in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.photoscount
     * @type {Integer} 
     */
    PhotosCount {
        get => this.get_PhotosCount()
    }

    /**
     * Gets the size of the imported photos, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.photossizeinbytes
     * @type {Integer} 
     */
    PhotosSizeInBytes {
        get => this.get_PhotosSizeInBytes()
    }

    /**
     * Gets the number of videos imported in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.videoscount
     * @type {Integer} 
     */
    VideosCount {
        get => this.get_VideosCount()
    }

    /**
     * Gets the size of the imported videos, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.videossizeinbytes
     * @type {Integer} 
     */
    VideosSizeInBytes {
        get => this.get_VideosSizeInBytes()
    }

    /**
     * Gets the number of sidecar files imported in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.sidecarscount
     * @type {Integer} 
     */
    SidecarsCount {
        get => this.get_SidecarsCount()
    }

    /**
     * Gets the size of the imported sidecar files, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.sidecarssizeinbytes
     * @type {Integer} 
     */
    SidecarsSizeInBytes {
        get => this.get_SidecarsSizeInBytes()
    }

    /**
     * Gets the number of sibling files imported in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.siblingscount
     * @type {Integer} 
     */
    SiblingsCount {
        get => this.get_SiblingsCount()
    }

    /**
     * Gets the size of the imported sidecar files, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.siblingssizeinbytes
     * @type {Integer} 
     */
    SiblingsSizeInBytes {
        get => this.get_SiblingsSizeInBytes()
    }

    /**
     * Gets the total number of items imported in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.totalcount
     * @type {Integer} 
     */
    TotalCount {
        get => this.get_TotalCount()
    }

    /**
     * Gets the total size of the all imported items, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.totalsizeinbytes
     * @type {Integer} 
     */
    TotalSizeInBytes {
        get => this.get_TotalSizeInBytes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PhotoImportSession} 
     */
    get_Session() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_Session()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasSucceeded() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_HasSucceeded()
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportItem>} 
     */
    get_ImportedItems() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_ImportedItems()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotosCount() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_PhotosCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotosSizeInBytes() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_PhotosSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideosCount() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_VideosCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideosSizeInBytes() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_VideosSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidecarsCount() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_SidecarsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidecarsSizeInBytes() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_SidecarsSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SiblingsCount() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_SiblingsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SiblingsSizeInBytes() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_SiblingsSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalCount() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_TotalCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalSizeInBytes() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.get_TotalSizeInBytes()
    }

    /**
     * Asynchronously deletes the items that were imported from the source.
     * @returns {IAsyncOperationWithProgress<PhotoImportDeleteImportedItemsFromSourceResult, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportitemsresult.deleteimporteditemsfromsourceasync
     */
    DeleteImportedItemsFromSourceAsync() {
        if (!this.HasProp("__IPhotoImportImportItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportImportItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportImportItemsResult := IPhotoImportImportItemsResult(outPtr)
        }

        return this.__IPhotoImportImportItemsResult.DeleteImportedItemsFromSourceAsync()
    }

;@endregion Instance Methods
}
