#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\StorageFolder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IKnownFoldersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownFoldersStatics
     * @type {Guid}
     */
    static IID => Guid("{5a2a7520-4802-452d-9ad9-4351ada7ec35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MusicLibrary", "get_PicturesLibrary", "get_VideosLibrary", "get_DocumentsLibrary", "get_HomeGroup", "get_RemovableDevices", "get_MediaServerDevices"]

    /**
     * @type {StorageFolder} 
     */
    MusicLibrary {
        get => this.get_MusicLibrary()
    }

    /**
     * @type {StorageFolder} 
     */
    PicturesLibrary {
        get => this.get_PicturesLibrary()
    }

    /**
     * @type {StorageFolder} 
     */
    VideosLibrary {
        get => this.get_VideosLibrary()
    }

    /**
     * @type {StorageFolder} 
     */
    DocumentsLibrary {
        get => this.get_DocumentsLibrary()
    }

    /**
     * @type {StorageFolder} 
     */
    HomeGroup {
        get => this.get_HomeGroup()
    }

    /**
     * @type {StorageFolder} 
     */
    RemovableDevices {
        get => this.get_RemovableDevices()
    }

    /**
     * @type {StorageFolder} 
     */
    MediaServerDevices {
        get => this.get_MediaServerDevices()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_MusicLibrary() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_PicturesLibrary() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_VideosLibrary() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_DocumentsLibrary() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_HomeGroup() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_RemovableDevices() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_MediaServerDevices() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }
}
