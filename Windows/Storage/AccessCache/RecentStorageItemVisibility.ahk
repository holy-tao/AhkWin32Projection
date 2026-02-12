#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the extent of the visibility of a storage item added to the most recently used (MRU) list.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.recentstorageitemvisibility
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class RecentStorageItemVisibility extends Win32Enum{

    /**
     * The storage item is visible in the most recently used (MRU) list for the app only.
     * @type {Integer (Int32)}
     */
    static AppOnly => 0

    /**
     * The storage item is visible in the most recently used (MRU) list for the app and the system.
     * @type {Integer (Int32)}
     */
    static AppAndSystem => 1
}
