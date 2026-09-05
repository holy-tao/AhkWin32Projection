#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by ISearchCatalogManager::GetCatalogStatus to determine the reason the catalog is paused.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-catalogpausedreason
 * @namespace Windows.Win32.System.Search
 */
class CatalogPausedReason extends Win32Enum {

    /**
     * Not paused.
     * Native name: CATALOG_PAUSED_REASON_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Paused due to high I/O.
     * Native name: CATALOG_PAUSED_REASON_HIGH_IO
     * @type {Integer (Int32)}
     */
    static HIGH_IO => 1

    /**
     * Paused due to high CPU usage.
     * Native name: CATALOG_PAUSED_REASON_HIGH_CPU
     * @type {Integer (Int32)}
     */
    static HIGH_CPU => 2

    /**
     * Paused due to high NTF rate.
     * Native name: CATALOG_PAUSED_REASON_HIGH_NTF_RATE
     * @type {Integer (Int32)}
     */
    static HIGH_NTF_RATE => 3

    /**
     * Paused due to low battery.
     * Native name: CATALOG_PAUSED_REASON_LOW_BATTERY
     * @type {Integer (Int32)}
     */
    static LOW_BATTERY => 4

    /**
     * Paused due to low memory.
     * Native name: CATALOG_PAUSED_REASON_LOW_MEMORY
     * @type {Integer (Int32)}
     */
    static LOW_MEMORY => 5

    /**
     * Paused due to low disk space.
     * Native name: CATALOG_PAUSED_REASON_LOW_DISK
     * @type {Integer (Int32)}
     */
    static LOW_DISK => 6

    /**
     * Paused due to need for delayed recovery.
     * Native name: CATALOG_PAUSED_REASON_DELAYED_RECOVERY
     * @type {Integer (Int32)}
     */
    static DELAYED_RECOVERY => 7

    /**
     * Paused due to user activity.
     * Native name: CATALOG_PAUSED_REASON_USER_ACTIVE
     * @type {Integer (Int32)}
     */
    static USER_ACTIVE => 8

    /**
     * Paused by external request.
     * Native name: CATALOG_PAUSED_REASON_EXTERNAL
     * @type {Integer (Int32)}
     */
    static EXTERNAL => 9

    /**
     * Paused by upgrading.
     * Native name: CATALOG_PAUSED_REASON_UPGRADING
     * @type {Integer (Int32)}
     */
    static UPGRADING => 10
}
