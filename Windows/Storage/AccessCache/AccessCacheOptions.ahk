#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the behavior to use when the app accesses an item in a list.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.accesscacheoptions
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class AccessCacheOptions extends Win32BitflagEnum{

    /**
     * Default.
     * 
     * When the app accesses the item, the app retrieves the most current version of the item from any available location and, if necessary, the user can enter additional information.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * When the app accesses the item, the user is prevented from entering information.
     * 
     * For example, if the app accesses a file that is stored using this option and the file normally triggers a request for the user to enter credentials, the request is suppressed.
     * @type {Integer (UInt32)}
     */
    static DisallowUserInput => 1

    /**
     * When the app accesses the item, it is retrieved from a fast location like the local file system.
     * 
     * For example, if the app accesses a file that is stored using this option and a version of the file is only available remotely, the file will not be accessed.
     * @type {Integer (UInt32)}
     */
    static FastLocationsOnly => 2

    /**
     * When the app accesses the item, the app retrieves a cached, read-only version of the file. This version of the file might not be the most recent.
     * @type {Integer (UInt32)}
     */
    static UseReadOnlyCachedCopy => 4

    /**
     * When the app accesses the item in the [StorageItemMostRecentlyUsedList](storageitemmostrecentlyusedlist.md), Windows preserves the item's current position in the most recently used (MRU) and does not update the access time of the item.
     * @type {Integer (UInt32)}
     */
    static SuppressAccessTimeUpdate => 8
}
