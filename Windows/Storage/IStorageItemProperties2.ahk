#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include FileProperties\StorageItemThumbnail.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to methods that get a scaled image as a thumbnail.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties2
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageItemProperties2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemProperties2
     * @type {Guid}
     */
    static IID => Guid("{8e86a951-04b9-4bd2-929d-fef3f71621d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetScaledImageAsThumbnailAsyncOverloadDefaultSizeDefaultOptions", "GetScaledImageAsThumbnailAsyncOverloadDefaultOptions", "GetScaledImageAsThumbnailAsync2"]

    /**
     * Gets a scaled image as a thumbnail, determined by the purpose of the thumbnail and the requested size.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties2.getscaledimageasthumbnailasync
     */
    GetScaledImageAsThumbnailAsyncOverloadDefaultSizeDefaultOptions(mode_) {
        result := ComCall(6, this, "int", mode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageItemThumbnail, operation)
    }

    /**
     * Gets a scaled image as a thumbnail, determined by the purpose of the thumbnail, the requested size, and the specified options
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize The requested size, in pixels, of the longest edge of the thumbnail. Windows uses the *requestedSize* as a guide and tries to scale the thumbnail image without reducing the quality of the image.
     * 
     * If Windows can't find a thumbnail image that it can scale to meet the requested size, a larger thumbnail might be returned. If no larger thumbnail is available, a thumbnail image that is smaller than the requested size might be returned.
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties2.getscaledimageasthumbnailasync
     */
    GetScaledImageAsThumbnailAsyncOverloadDefaultOptions(mode_, requestedSize) {
        result := ComCall(7, this, "int", mode_, "uint", requestedSize, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageItemThumbnail, operation)
    }

    /**
     * Gets a scaled image as a thumbnail, determined by the purpose of the thumbnail.
     * @param {Integer} mode_ The enum value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageItemThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitemproperties2.getscaledimageasthumbnailasync
     */
    GetScaledImageAsThumbnailAsync2(mode_, requestedSize, options) {
        result := ComCall(8, this, "int", mode_, "uint", requestedSize, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageItemThumbnail, operation)
    }
}
