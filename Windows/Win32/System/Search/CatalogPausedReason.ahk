#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by ISearchCatalogManager::GetCatalogStatus to determine the reason the catalog is paused.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-catalogpausedreason
 * @namespace Windows.Win32.System.Search
 */
export default struct CatalogPausedReason {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not paused.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_NONE => 0

    /**
     * Paused due to high I/O.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_HIGH_IO => 1

    /**
     * Paused due to high CPU usage.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_HIGH_CPU => 2

    /**
     * Paused due to high NTF rate.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_HIGH_NTF_RATE => 3

    /**
     * Paused due to low battery.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_LOW_BATTERY => 4

    /**
     * Paused due to low memory.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_LOW_MEMORY => 5

    /**
     * Paused due to low disk space.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_LOW_DISK => 6

    /**
     * Paused due to need for delayed recovery.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_DELAYED_RECOVERY => 7

    /**
     * Paused due to user activity.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_USER_ACTIVE => 8

    /**
     * Paused by external request.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_EXTERNAL => 9

    /**
     * Paused by upgrading.
     * @type {Integer (Int32)}
     */
    static CATALOG_PAUSED_REASON_UPGRADING => 10
}
