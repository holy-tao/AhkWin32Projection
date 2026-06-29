#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_SYNC_PROVIDER_STATUS.ahk" { CF_SYNC_PROVIDER_STATUS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Sync root provider information.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_sync_root_provider_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_SYNC_ROOT_PROVIDER_INFO {
    #StructPack 4

    /**
     * Status of the sync root provider. See [CF_SYNC_PROVIDER_STATUS](ne-cfapi-cf_sync_provider_status.md) for possible values.
     */
    ProviderStatus : CF_SYNC_PROVIDER_STATUS

    /**
     * Name of the sync root provider. *ProviderName* is an end-user facing string with a maximum length of **CF_MAX_PROVIDER_NAME_LENGTH** (255 characters).
     */
    ProviderName : WCHAR[256]

    /**
     * Version of the sync root provider. *ProviderVersion* is an end-user facing string with a maximum length of **CF_MAX_PROVIDER_VERSION_LENGTH** (255 characters).
     */
    ProviderVersion : WCHAR[256]

}
