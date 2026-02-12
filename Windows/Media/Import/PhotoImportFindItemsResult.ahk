#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportFindItemsResult.ahk
#Include .\IPhotoImportFindItemsResult2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PhotoImportFindItemsResult.ahk
#Include .\PhotoImportSelectionChangedEventArgs.ahk
#Include .\PhotoImportItemImportedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the result of a operation that finds media items on a source.
 * @remarks
 * Get an instance of this class by calling [PhotoImportSession.FindItemsAsync](photoimportsession_finditemsasync_1686050162.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportFindItemsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportFindItemsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportFindItemsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the photo import session associated with the find operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.session
     * @type {PhotoImportSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Gets a value indicating whether the find operation has succeeded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.hassucceeded
     * @type {Boolean} 
     */
    HasSucceeded {
        get => this.get_HasSucceeded()
    }

    /**
     * Gets a list of items that were found on the source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.founditems
     * @type {IVectorView<PhotoImportItem>} 
     */
    FoundItems {
        get => this.get_FoundItems()
    }

    /**
     * Gets the number of photos found on the source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.photoscount
     * @type {Integer} 
     */
    PhotosCount {
        get => this.get_PhotosCount()
    }

    /**
     * Gets the size of the photos found on the source, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.photossizeinbytes
     * @type {Integer} 
     */
    PhotosSizeInBytes {
        get => this.get_PhotosSizeInBytes()
    }

    /**
     * Gets the number of videos found on the source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.videoscount
     * @type {Integer} 
     */
    VideosCount {
        get => this.get_VideosCount()
    }

    /**
     * Gets the size of the videos found on the source, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.videossizeinbytes
     * @type {Integer} 
     */
    VideosSizeInBytes {
        get => this.get_VideosSizeInBytes()
    }

    /**
     * Gets the number of sidecar files found on the source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.sidecarscount
     * @type {Integer} 
     */
    SidecarsCount {
        get => this.get_SidecarsCount()
    }

    /**
     * Gets the size of the found sidecar files, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.sidecarssizeinbytes
     * @type {Integer} 
     */
    SidecarsSizeInBytes {
        get => this.get_SidecarsSizeInBytes()
    }

    /**
     * Gets the number of sibling files found on the source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.siblingscount
     * @type {Integer} 
     */
    SiblingsCount {
        get => this.get_SiblingsCount()
    }

    /**
     * Gets the size of the found sibling files, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.siblingssizeinbytes
     * @type {Integer} 
     */
    SiblingsSizeInBytes {
        get => this.get_SiblingsSizeInBytes()
    }

    /**
     * Gets the total number of items found on the source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.totalcount
     * @type {Integer} 
     */
    TotalCount {
        get => this.get_TotalCount()
    }

    /**
     * Gets the total size of all items found on the source, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.totalsizeinbytes
     * @type {Integer} 
     */
    TotalSizeInBytes {
        get => this.get_TotalSizeInBytes()
    }

    /**
     * Gets the photo import mode that determines which types of files are included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.importmode
     * @type {Integer} 
     */
    ImportMode {
        get => this.get_ImportMode()
    }

    /**
     * Gets the number of photos that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedphotoscount
     * @type {Integer} 
     */
    SelectedPhotosCount {
        get => this.get_SelectedPhotosCount()
    }

    /**
     * Gets the size of the photos that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedphotossizeinbytes
     * @type {Integer} 
     */
    SelectedPhotosSizeInBytes {
        get => this.get_SelectedPhotosSizeInBytes()
    }

    /**
     * Gets the number of videos that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedvideoscount
     * @type {Integer} 
     */
    SelectedVideosCount {
        get => this.get_SelectedVideosCount()
    }

    /**
     * Gets the size of the videos that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedvideossizeinbytes
     * @type {Integer} 
     */
    SelectedVideosSizeInBytes {
        get => this.get_SelectedVideosSizeInBytes()
    }

    /**
     * Gets the number of sidecar files that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedsidecarscount
     * @type {Integer} 
     */
    SelectedSidecarsCount {
        get => this.get_SelectedSidecarsCount()
    }

    /**
     * Gets the size of the sidecar files that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedsidecarssizeinbytes
     * @type {Integer} 
     */
    SelectedSidecarsSizeInBytes {
        get => this.get_SelectedSidecarsSizeInBytes()
    }

    /**
     * Gets the number of sibling files that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedsiblingscount
     * @type {Integer} 
     */
    SelectedSiblingsCount {
        get => this.get_SelectedSiblingsCount()
    }

    /**
     * Gets the size of the sibling files that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedsiblingssizeinbytes
     * @type {Integer} 
     */
    SelectedSiblingsSizeInBytes {
        get => this.get_SelectedSiblingsSizeInBytes()
    }

    /**
     * Gets the total number of items that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedtotalcount
     * @type {Integer} 
     */
    SelectedTotalCount {
        get => this.get_SelectedTotalCount()
    }

    /**
     * Gets the total size of the all items that are currently selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectedtotalsizeinbytes
     * @type {Integer} 
     */
    SelectedTotalSizeInBytes {
        get => this.get_SelectedTotalSizeInBytes()
    }

    /**
     * Occurs when the set of items selected to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation changes.
     * @type {TypedEventHandler<PhotoImportFindItemsResult, PhotoImportSelectionChangedEventArgs>}
    */
    OnSelectionChanged {
        get {
            if(!this.HasProp("__OnSelectionChanged")){
                this.__OnSelectionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e67279fe-692f-5602-820b-865098d9b43e}"),
                    PhotoImportFindItemsResult,
                    PhotoImportSelectionChangedEventArgs
                )
                this.__OnSelectionChangedToken := this.add_SelectionChanged(this.__OnSelectionChanged.iface)
            }
            return this.__OnSelectionChanged
        }
    }

    /**
     * Occurs when an item is imported.
     * @type {TypedEventHandler<PhotoImportFindItemsResult, PhotoImportItemImportedEventArgs>}
    */
    OnItemImported {
        get {
            if(!this.HasProp("__OnItemImported")){
                this.__OnItemImported := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a3cce94d-f26e-58d9-8138-599ad63c7069}"),
                    PhotoImportFindItemsResult,
                    PhotoImportItemImportedEventArgs
                )
                this.__OnItemImportedToken := this.add_ItemImported(this.__OnItemImported.iface)
            }
            return this.__OnItemImported
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSelectionChangedToken")) {
            this.remove_SelectionChanged(this.__OnSelectionChangedToken)
            this.__OnSelectionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnItemImportedToken")) {
            this.remove_ItemImported(this.__OnItemImportedToken)
            this.__OnItemImported.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {PhotoImportSession} 
     */
    get_Session() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_Session()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasSucceeded() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_HasSucceeded()
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportItem>} 
     */
    get_FoundItems() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_FoundItems()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotosCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_PhotosCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotosSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_PhotosSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideosCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_VideosCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideosSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_VideosSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidecarsCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SidecarsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidecarsSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SidecarsSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SiblingsCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SiblingsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SiblingsSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SiblingsSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_TotalCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_TotalSizeInBytes()
    }

    /**
     * Selects all items found on the source to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectall
     */
    SelectAll() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.SelectAll()
    }

    /**
     * Deselects all items found on the source, preventing them from being included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectnone
     */
    SelectNone() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.SelectNone()
    }

    /**
     * Selects all new items found on the source to be included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.selectnewasync
     */
    SelectNewAsync() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.SelectNewAsync()
    }

    /**
     * Sets the photo import mode that determines which types of files are included in the [ImportItemsAsync](photoimportfinditemsresult_importitemsasync_357096682.md) operation.
     * @param {Integer} value The photo import mode.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.setimportmode
     */
    SetImportMode(value) {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.SetImportMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImportMode() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_ImportMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedPhotosCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedPhotosCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedPhotosSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedPhotosSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedVideosCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedVideosCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedVideosSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedVideosSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedSidecarsCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedSidecarsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedSidecarsSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedSidecarsSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedSiblingsCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedSiblingsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedSiblingsSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedSiblingsSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedTotalCount() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedTotalCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedTotalSizeInBytes() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.get_SelectedTotalSizeInBytes()
    }

    /**
     * 
     * @param {TypedEventHandler<PhotoImportFindItemsResult, PhotoImportSelectionChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(value) {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.add_SelectionChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.remove_SelectionChanged(token)
    }

    /**
     * Asynchronously imports the selected items from the source.
     * @returns {IAsyncOperationWithProgress<PhotoImportImportItemsResult, PhotoImportProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.importitemsasync
     */
    ImportItemsAsync() {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.ImportItemsAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<PhotoImportFindItemsResult, PhotoImportItemImportedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ItemImported(value) {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.add_ItemImported(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemImported(token) {
        if (!this.HasProp("__IPhotoImportFindItemsResult")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult := IPhotoImportFindItemsResult(outPtr)
        }

        return this.__IPhotoImportFindItemsResult.remove_ItemImported(token)
    }

    /**
     * Adds all items in the specified date range to the current selection.
     * @param {DateTime} rangeStart The start of the date range.
     * @param {TimeSpan} rangeLength The length of the date range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportfinditemsresult.additemsindaterangetoselection
     */
    AddItemsInDateRangeToSelection(rangeStart, rangeLength) {
        if (!this.HasProp("__IPhotoImportFindItemsResult2")) {
            if ((queryResult := this.QueryInterface(IPhotoImportFindItemsResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportFindItemsResult2 := IPhotoImportFindItemsResult2(outPtr)
        }

        return this.__IPhotoImportFindItemsResult2.AddItemsInDateRangeToSelection(rangeStart, rangeLength)
    }

;@endregion Instance Methods
}
