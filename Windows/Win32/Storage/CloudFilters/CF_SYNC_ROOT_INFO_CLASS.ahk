#Requires AutoHotkey v2.0.0 64-bit

/**
 * Types of sync root information.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_sync_root_info_class
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_ROOT_INFO_CLASS{

    /**
     * Basic sync root information is provided. See [CF_SYNC_ROOT_BASIC_INFO](ns-cfapi-cf_sync_root_basic_info.md).
     * @type {Integer (Int32)}
     */
    static CF_SYNC_ROOT_INFO_BASIC => 0

    /**
     * Standard sync root information is provided. See [CF_SYNC_ROOT_STANDARD_INFO](ns-cfapi-cf_sync_root_standard_info.md).
     * @type {Integer (Int32)}
     */
    static CF_SYNC_ROOT_INFO_STANDARD => 1

    /**
     * Sync root provider information is being provided. See [CF_SYNC_ROOT_PROVIDER_INFO](ns-cfapi-cf_sync_root_provider_info.md).
     * @type {Integer (Int32)}
     */
    static CF_SYNC_ROOT_INFO_PROVIDER => 2
}
