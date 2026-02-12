#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include FileProperties\StorageItemThumbnail.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include FileProperties\StorageItemContentProperties.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to common and content properties on items (like files and folders).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageItemProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemProperties
     * @type {Guid}
     */
    static IID => Guid("{86664478-8029-46fe-a789-1c2f3e2ffb5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThumbnailAsyncOverloadDefaultSizeDefaultOptions", "GetThumbnailAsyncOverloadDefaultOptions", "GetThumbnailAsync2", "get_DisplayName", "get_DisplayType", "get_FolderRelativeId", "get_Properties"]

    /**
     * Gets the user-friendly name of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the user-friendly type of the item.
     * @remarks
     * If the item is an image file, for example, it might have a user-friendly type of "JPG File".
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties.displaytype
     * @type {HSTRING} 
     */
    DisplayType {
        get => this.get_DisplayType()
    }

    /**
     * Gets an identifier for the current item. This ID is unique for the query result or [StorageFolder](storagefolder.md) that contains the item and can be used to distinguish between items that have the same name.
     * @remarks
     * The current item could be a file, folder, or file group.
     * 
     * You create a query result object when you create a query using one of the methods on a [StorageFolder](storagefolder.md) object. Depending on the method you call, your query result object could be a [StorageFileQueryResult](../windows.storage.search/storagefilequeryresult.md), a [StorageFolderQueryResult](../windows.storage.search/storagefolderqueryresult.md), or a [StorageItemQueryResult](../windows.storage.search/storageitemqueryresult.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties.folderrelativeid
     * @type {HSTRING} 
     */
    FolderRelativeId {
        get => this.get_FolderRelativeId()
    }

    /**
     * Gets an object that provides access to the content-related properties of the item.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties.properties
     * @type {StorageItemContentProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Retrieves an adjusted thumbnail image for the item, determined by the purpose of the thumbnail and the requested size.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties.getthumbnailasync
     */
    GetThumbnailAsyncOverloadDefaultSizeDefaultOptions(mode_) {
        result := ComCall(6, this, "int", mode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageItemThumbnail, operation)
    }

    /**
     * Retrieves an adjusted thumbnail image for the item, determined by the purpose of the thumbnail, the requested size, and the specified options.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * @param {Integer} requestedSize The requested size, in pixels, of the longest edge of the thumbnail. Windows uses the *requestedSize* as a guide and tries to scale the thumbnail image without reducing the quality of the image.
     * 
     * If Windows can't find a thumbnail image that it can scale to meet the requested size, a larger thumbnail might be returned. If no larger thumbnail is available, a thumbnail image that is smaller than the requested size might be returned.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties.getthumbnailasync
     */
    GetThumbnailAsyncOverloadDefaultOptions(mode_, requestedSize) {
        result := ComCall(7, this, "int", mode_, "uint", requestedSize, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageItemThumbnail, operation)
    }

    /**
     * Retrieves an adjusted thumbnail image for the item, determined by the purpose of the thumbnail.
     * @remarks
     * In Windows 8, the [GetThumbnailAsync](istorageitemproperties_getthumbnailasync_1511435522.md) method has just one immersive monitor at a time that can show the UWP app user interface. In Windows 8.1, the UWP app user interface can appear on multiple monitors, with the option to show a single app on multiple monitors simultaneously. For scaling, consider multiple scale factors at once.
     * 
     * In Windows 8.1, the [GetThumbnailAsync](istorageitemproperties_getthumbnailasync_1511435522.md) method can return any size thumbnail. Therefore, apps that display local pictures should call this method to get the scaled image they want to display. This ensures that apps benefit from all cache and performance optimizations, including a special mechanism to obtain thumbnails from the cloud without downloading the full file.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties.getthumbnailasync
     */
    GetThumbnailAsync2(mode_, requestedSize, options) {
        result := ComCall(8, this, "int", mode_, "uint", requestedSize, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageItemThumbnail, operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayType() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FolderRelativeId() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {StorageItemContentProperties} 
     */
    get_Properties() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemContentProperties(value)
    }
}
