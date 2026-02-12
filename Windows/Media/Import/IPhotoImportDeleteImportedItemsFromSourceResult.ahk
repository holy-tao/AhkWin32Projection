#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PhotoImportSession.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PhotoImportItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportDeleteImportedItemsFromSourceResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportDeleteImportedItemsFromSourceResult
     * @type {Guid}
     */
    static IID => Guid("{f4e112f8-843d-428a-a1a6-81510292b0ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_HasSucceeded", "get_DeletedItems", "get_PhotosCount", "get_PhotosSizeInBytes", "get_VideosCount", "get_VideosSizeInBytes", "get_SidecarsCount", "get_SidecarsSizeInBytes", "get_SiblingsCount", "get_SiblingsSizeInBytes", "get_TotalCount", "get_TotalSizeInBytes"]

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
    DeletedItems {
        get => this.get_DeletedItems()
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
    get_DeletedItems() {
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
}
