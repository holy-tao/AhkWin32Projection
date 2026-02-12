#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the behavior used to retrieve and adjust thumbnails, including the size and quality of the image and how quickly the thumbnail image is retrieved.
 * @remarks
 * This enumeration is used when you get a thumbnail image by calling one of the [getThumbnailAsync](../windows.storage/istorageitemproperties_getthumbnailasync_1511435522.md) method overloads like [storageFile.getThumbnailAsync(mode, requestedSize, options)](../windows.storage/storagefile_getthumbnailasync_91362086.md). The thumbnail image that is returned is represented by a [storageItemThumbnail](storageitemthumbnail.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.thumbnailoptions
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class ThumbnailOptions extends Win32BitflagEnum{

    /**
     * No options.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Retrieve a thumbnail only if it is cached or embedded in the file.
     * @type {Integer (UInt32)}
     */
    static ReturnOnlyIfCached => 1

    /**
     * Scale the thumbnail to the requested size.
     * @type {Integer (UInt32)}
     */
    static ResizeThumbnail => 2

    /**
     * Default. Increase requested size based on the Pixels Per Inch (PPI) of the display.
     * @type {Integer (UInt32)}
     */
    static UseCurrentScale => 4
}
