#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Types of sync root information.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_sync_root_info_class
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_ROOT_INFO_CLASS extends Win32Enum{

    /**
     * Basic sync root information. See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_sync_root_basic_info">CF_SYNC_ROOT_BASIC_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CF_SYNC_ROOT_INFO_BASIC => 0

    /**
     * Standard sync root information. See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_sync_root_standard_info">CF_SYNC_ROOT_STANDARD_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CF_SYNC_ROOT_INFO_STANDARD => 1

    /**
     * Sync root provider information. See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_sync_root_provider_info">CF_SYNC_ROOT_PROVIDER_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CF_SYNC_ROOT_INFO_PROVIDER => 2
}
