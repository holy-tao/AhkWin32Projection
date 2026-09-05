#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Current status of a sync provider.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_sync_provider_status
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_SYNC_PROVIDER_STATUS extends Win32BitflagEnum {

    /**
     * The sync provider is disconnected.
     * Native name: CF_PROVIDER_STATUS_DISCONNECTED
     * @type {Integer (UInt32)}
     */
    static DISCONNECTED => 0

    /**
     * The sync provider is idle.
     * Native name: CF_PROVIDER_STATUS_IDLE
     * @type {Integer (UInt32)}
     */
    static IDLE => 1

    /**
     * The sync provider is populating a namespace.
     * Native name: CF_PROVIDER_STATUS_POPULATE_NAMESPACE
     * @type {Integer (UInt32)}
     */
    static POPULATE_NAMESPACE => 2

    /**
     * The sync provider is populating placeholder metadata.
     * Native name: CF_PROVIDER_STATUS_POPULATE_METADATA
     * @type {Integer (UInt32)}
     */
    static POPULATE_METADATA => 4

    /**
     * The sync provider is populating placeholder content.
     * Native name: CF_PROVIDER_STATUS_POPULATE_CONTENT
     * @type {Integer (UInt32)}
     */
    static POPULATE_CONTENT => 8

    /**
     * The sync provider is incrementally syncing placeholder content.
     * Native name: CF_PROVIDER_STATUS_SYNC_INCREMENTAL
     * @type {Integer (UInt32)}
     */
    static SYNC_INCREMENTAL => 16

    /**
     * The sync provider has fully synced placeholder file data.
     * Native name: CF_PROVIDER_STATUS_SYNC_FULL
     * @type {Integer (UInt32)}
     */
    static SYNC_FULL => 32

    /**
     * The sync provider has lost connectivity.
     * Native name: CF_PROVIDER_STATUS_CONNECTIVITY_LOST
     * @type {Integer (UInt32)}
     */
    static CONNECTIVITY_LOST => 64

    /**
     * Clears the flags of the sync provider.
     * Native name: CF_PROVIDER_STATUS_CLEAR_FLAGS
     * @type {Integer (UInt32)}
     */
    static CLEAR_FLAGS => 2147483648

    /**
     * The sync provider has been terminated.
     * Native name: CF_PROVIDER_STATUS_TERMINATED
     * @type {Integer (UInt32)}
     */
    static TERMINATED => 3221225473

    /**
     * There was an error with the sync provider.
     * Native name: CF_PROVIDER_STATUS_ERROR
     * @type {Integer (UInt32)}
     */
    static ERROR => 3221225474
}
