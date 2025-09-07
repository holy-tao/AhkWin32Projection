#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which time value associated with the cache item is to be used.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_item_time
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_ITEM_TIME{

    /**
     * Use the item's creation time.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_TIME_CREATION => 0

    /**
     * Use the item's last-access time.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_TIME_LASTACCESS => 1

    /**
     * Use the item's last-write time.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_TIME_LASTWRITE => 2
}
