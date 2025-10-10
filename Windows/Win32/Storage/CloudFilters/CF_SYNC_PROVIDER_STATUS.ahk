#Requires AutoHotkey v2.0.0 64-bit

/**
 * Current status of a sync provider.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_sync_provider_status
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_PROVIDER_STATUS{

    /**
     * The sync provider is disconnected.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_DISCONNECTED => 0

    /**
     * The sync provider is idle.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_IDLE => 1

    /**
     * The sync provider is populating a namespace.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_POPULATE_NAMESPACE => 2

    /**
     * The sync provider is populating placeholder metadata.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_POPULATE_METADATA => 4

    /**
     * The sync provider is populating placeholder content.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_POPULATE_CONTENT => 8

    /**
     * The sync provider is incrementally syncing placeholder content.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_SYNC_INCREMENTAL => 16

    /**
     * The sync provider has fully synced placeholder file data.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_SYNC_FULL => 32

    /**
     * The sync provider has lost connectivity.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_CONNECTIVITY_LOST => 64

    /**
     * Clears the flags of the sync provider.
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_CLEAR_FLAGS => 2147483648

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_TERMINATED => 3221225473

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static CF_PROVIDER_STATUS_ERROR => 3221225474
}
