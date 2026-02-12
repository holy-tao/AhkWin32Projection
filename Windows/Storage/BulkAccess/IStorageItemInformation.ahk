#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\FileProperties\MusicProperties.ahk
#Include ..\FileProperties\VideoProperties.ahk
#Include ..\FileProperties\ImageProperties.ahk
#Include ..\FileProperties\DocumentProperties.ahk
#Include ..\FileProperties\BasicProperties.ahk
#Include ..\FileProperties\StorageItemThumbnail.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides synchronous access to the properties of a file or folder in the file system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.istorageiteminformation
 * @namespace Windows.Storage.BulkAccess
 * @version WindowsRuntime 1.4
 */
class IStorageItemInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemInformation
     * @type {Guid}
     */
    static IID => Guid("{87a5cb8b-8972-4f40-8de0-d86fb179d8fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MusicProperties", "get_VideoProperties", "get_ImageProperties", "get_DocumentProperties", "get_BasicProperties", "get_Thumbnail", "add_ThumbnailUpdated", "remove_ThumbnailUpdated", "add_PropertiesUpdated", "remove_PropertiesUpdated"]

    /**
     * Gets an object that provides access to the music properties of the item, such as the album name, artist name, bit rate, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.istorageiteminformation.musicproperties
     * @type {MusicProperties} 
     */
    MusicProperties {
        get => this.get_MusicProperties()
    }

    /**
     * Gets an object that provides access to the video properties of the item, such as the duration, rating, date released, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.istorageiteminformation.videoproperties
     * @type {VideoProperties} 
     */
    VideoProperties {
        get => this.get_VideoProperties()
    }

    /**
     * Gets an object that provides access to the image properties of the item, such as the title, rating, date that the image was taken, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.istorageiteminformation.imageproperties
     * @type {ImageProperties} 
     */
    ImageProperties {
        get => this.get_ImageProperties()
    }

    /**
     * Gets an object that provides access to the document properties of the item, such as the title, author name, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.istorageiteminformation.documentproperties
     * @type {DocumentProperties} 
     */
    DocumentProperties {
        get => this.get_DocumentProperties()
    }

    /**
     * Gets an object that contains the basic properties information of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.istorageiteminformation.basicproperties
     * @type {BasicProperties} 
     */
    BasicProperties {
        get => this.get_BasicProperties()
    }

    /**
     * Gets the thumbnail associated with the item.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.bulkaccess.istorageiteminformation.thumbnail
     * @type {StorageItemThumbnail} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * 
     * @returns {MusicProperties} 
     */
    get_MusicProperties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MusicProperties(value)
    }

    /**
     * 
     * @returns {VideoProperties} 
     */
    get_VideoProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoProperties(value)
    }

    /**
     * 
     * @returns {ImageProperties} 
     */
    get_ImageProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageProperties(value)
    }

    /**
     * 
     * @returns {DocumentProperties} 
     */
    get_DocumentProperties() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DocumentProperties(value)
    }

    /**
     * 
     * @returns {BasicProperties} 
     */
    get_BasicProperties() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BasicProperties(value)
    }

    /**
     * 
     * @returns {StorageItemThumbnail} 
     */
    get_Thumbnail() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemThumbnail(value)
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageItemInformation, IInspectable>} changedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ThumbnailUpdated(changedHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(12, this, "ptr", changedHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ThumbnailUpdated(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(13, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageItemInformation, IInspectable>} changedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertiesUpdated(changedHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(14, this, "ptr", changedHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_PropertiesUpdated(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(15, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
