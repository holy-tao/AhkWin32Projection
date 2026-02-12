#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PhotoImportSession.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PhotoImportItem.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\PhotoImportImportItemsResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportFindItemsResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportFindItemsResult
     * @type {Guid}
     */
    static IID => Guid("{3915e647-6c78-492b-844e-8fe5e8f6bfb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_HasSucceeded", "get_FoundItems", "get_PhotosCount", "get_PhotosSizeInBytes", "get_VideosCount", "get_VideosSizeInBytes", "get_SidecarsCount", "get_SidecarsSizeInBytes", "get_SiblingsCount", "get_SiblingsSizeInBytes", "get_TotalCount", "get_TotalSizeInBytes", "SelectAll", "SelectNone", "SelectNewAsync", "SetImportMode", "get_ImportMode", "get_SelectedPhotosCount", "get_SelectedPhotosSizeInBytes", "get_SelectedVideosCount", "get_SelectedVideosSizeInBytes", "get_SelectedSidecarsCount", "get_SelectedSidecarsSizeInBytes", "get_SelectedSiblingsCount", "get_SelectedSiblingsSizeInBytes", "get_SelectedTotalCount", "get_SelectedTotalSizeInBytes", "add_SelectionChanged", "remove_SelectionChanged", "ImportItemsAsync", "add_ItemImported", "remove_ItemImported"]

    /**
     * @type {PhotoImportSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {Boolean} 
     */
    HasSucceeded {
        get => this.get_HasSucceeded()
    }

    /**
     * @type {IVectorView<PhotoImportItem>} 
     */
    FoundItems {
        get => this.get_FoundItems()
    }

    /**
     * @type {Integer} 
     */
    PhotosCount {
        get => this.get_PhotosCount()
    }

    /**
     * @type {Integer} 
     */
    PhotosSizeInBytes {
        get => this.get_PhotosSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    VideosCount {
        get => this.get_VideosCount()
    }

    /**
     * @type {Integer} 
     */
    VideosSizeInBytes {
        get => this.get_VideosSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    SidecarsCount {
        get => this.get_SidecarsCount()
    }

    /**
     * @type {Integer} 
     */
    SidecarsSizeInBytes {
        get => this.get_SidecarsSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    SiblingsCount {
        get => this.get_SiblingsCount()
    }

    /**
     * @type {Integer} 
     */
    SiblingsSizeInBytes {
        get => this.get_SiblingsSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    TotalCount {
        get => this.get_TotalCount()
    }

    /**
     * @type {Integer} 
     */
    TotalSizeInBytes {
        get => this.get_TotalSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    ImportMode {
        get => this.get_ImportMode()
    }

    /**
     * @type {Integer} 
     */
    SelectedPhotosCount {
        get => this.get_SelectedPhotosCount()
    }

    /**
     * @type {Integer} 
     */
    SelectedPhotosSizeInBytes {
        get => this.get_SelectedPhotosSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    SelectedVideosCount {
        get => this.get_SelectedVideosCount()
    }

    /**
     * @type {Integer} 
     */
    SelectedVideosSizeInBytes {
        get => this.get_SelectedVideosSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    SelectedSidecarsCount {
        get => this.get_SelectedSidecarsCount()
    }

    /**
     * @type {Integer} 
     */
    SelectedSidecarsSizeInBytes {
        get => this.get_SelectedSidecarsSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    SelectedSiblingsCount {
        get => this.get_SelectedSiblingsCount()
    }

    /**
     * @type {Integer} 
     */
    SelectedSiblingsSizeInBytes {
        get => this.get_SelectedSiblingsSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    SelectedTotalCount {
        get => this.get_SelectedTotalCount()
    }

    /**
     * @type {Integer} 
     */
    SelectedTotalSizeInBytes {
        get => this.get_SelectedTotalSizeInBytes()
    }

    /**
     * 
     * @returns {PhotoImportSession} 
     */
    get_Session() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhotoImportSession(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasSucceeded() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportItem>} 
     */
    get_FoundItems() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PhotoImportItem, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotosCount() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotosSizeInBytes() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideosCount() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideosSizeInBytes() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidecarsCount() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SidecarsSizeInBytes() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SiblingsCount() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SiblingsSizeInBytes() {
        result := ComCall(16, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalCount() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalSizeInBytes() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectAll() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectNone() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SelectNewAsync() {
        result := ComCall(21, this, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetImportMode(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImportMode() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedPhotosCount() {
        result := ComCall(24, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedPhotosSizeInBytes() {
        result := ComCall(25, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedVideosCount() {
        result := ComCall(26, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedVideosSizeInBytes() {
        result := ComCall(27, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedSidecarsCount() {
        result := ComCall(28, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedSidecarsSizeInBytes() {
        result := ComCall(29, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedSiblingsCount() {
        result := ComCall(30, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedSiblingsSizeInBytes() {
        result := ComCall(31, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedTotalCount() {
        result := ComCall(32, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedTotalSizeInBytes() {
        result := ComCall(33, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<PhotoImportFindItemsResult, PhotoImportSelectionChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(34, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(35, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<PhotoImportImportItemsResult, PhotoImportProgress>} 
     */
    ImportItemsAsync() {
        result := ComCall(36, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(PhotoImportImportItemsResult, (ptr) => IPropertyValue(ptr).GetPhotoImportProgress(), operation)
    }

    /**
     * 
     * @param {TypedEventHandler<PhotoImportFindItemsResult, PhotoImportItemImportedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ItemImported(value) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemImported(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
