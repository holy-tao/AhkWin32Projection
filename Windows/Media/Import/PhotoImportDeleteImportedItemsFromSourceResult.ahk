#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportDeleteImportedItemsFromSourceResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a operation that deletes imported media items from the source.
 * @remarks
 * Get an instance of this class by calling [PhotoImportOperation.ContinueDeletingImportedItemsFromSourceAsync](photoimportoperation_continuedeletingimporteditemsfromsourceasync.md) or [PhotoImportItemsResult.DeleteImportedItemsFromSourceAsync](photoimportimportitemsresult_deleteimporteditemsfromsourceasync_1949343605.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportDeleteImportedItemsFromSourceResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportDeleteImportedItemsFromSourceResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportDeleteImportedItemsFromSourceResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the photo import session associated with the delete operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.session
     * @type {PhotoImportSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Gets a value indicating whether the delete operation has succeeded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.hassucceeded
     * @type {Boolean} 
     */
    HasSucceeded {
        get => this.get_HasSucceeded()
    }

    /**
     * Gets a list of items that were deleted from the source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.deleteditems
     * @type {IVectorView<PhotoImportItem>} 
     */
    DeletedItems {
        get => this.get_DeletedItems()
    }

    /**
     * Gets the number of photos deleted in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.photoscount
     * @type {Integer} 
     */
    PhotosCount {
        get => this.get_PhotosCount()
    }

    /**
     * Gets the size of the deleted photos, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.photossizeinbytes
     * @type {Integer} 
     */
    PhotosSizeInBytes {
        get => this.get_PhotosSizeInBytes()
    }

    /**
     * Gets the number of videos deleted in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.videoscount
     * @type {Integer} 
     */
    VideosCount {
        get => this.get_VideosCount()
    }

    /**
     * Gets the size of the deleted videos, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.videossizeinbytes
     * @type {Integer} 
     */
    VideosSizeInBytes {
        get => this.get_VideosSizeInBytes()
    }

    /**
     * Gets the number of sidecar files deleted in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.sidecarscount
     * @type {Integer} 
     */
    SidecarsCount {
        get => this.get_SidecarsCount()
    }

    /**
     * Gets the size of the deleted sidecar files, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.sidecarssizeinbytes
     * @type {Integer} 
     */
    SidecarsSizeInBytes {
        get => this.get_SidecarsSizeInBytes()
    }

    /**
     * Gets the number of sibling files deleted in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.siblingscount
     * @type {Integer} 
     */
    SiblingsCount {
        get => this.get_SiblingsCount()
    }

    /**
     * Gets the size of the deleted sibling files, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.siblingssizeinbytes
     * @type {Integer} 
     */
    SiblingsSizeInBytes {
        get => this.get_SiblingsSizeInBytes()
    }

    /**
     * Gets the total number of items deleted in the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.totalcount
     * @type {Integer} 
     */
    TotalCount {
        get => this.get_TotalCount()
    }

    /**
     * Gets the total size of the all deleted items, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportdeleteimporteditemsfromsourceresult.totalsizeinbytes
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
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_Session()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasSucceeded() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_HasSucceeded()
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportItem>} 
     */
    get_DeletedItems() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_DeletedItems()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotosCount() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_PhotosCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotosSizeInBytes() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_PhotosSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideosCount() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_VideosCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideosSizeInBytes() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_VideosSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidecarsCount() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_SidecarsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidecarsSizeInBytes() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_SidecarsSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SiblingsCount() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_SiblingsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SiblingsSizeInBytes() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_SiblingsSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalCount() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_TotalCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalSizeInBytes() {
        if (!this.HasProp("__IPhotoImportDeleteImportedItemsFromSourceResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportDeleteImportedItemsFromSourceResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportDeleteImportedItemsFromSourceResult := IPhotoImportDeleteImportedItemsFromSourceResult(outPtr)
        }

        return this.__IPhotoImportDeleteImportedItemsFromSourceResult.get_TotalSizeInBytes()
    }

;@endregion Instance Methods
}
