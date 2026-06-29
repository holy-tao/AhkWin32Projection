#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_HARDLINK_POLICY.ahk" { CF_HARDLINK_POLICY }
#Import ".\CF_HYDRATION_POLICY_PRIMARY.ahk" { CF_HYDRATION_POLICY_PRIMARY }
#Import ".\CF_HYDRATION_POLICY.ahk" { CF_HYDRATION_POLICY }
#Import ".\CF_POPULATION_POLICY.ahk" { CF_POPULATION_POLICY }
#Import ".\CF_POPULATION_POLICY_MODIFIER.ahk" { CF_POPULATION_POLICY_MODIFIER }
#Import ".\CF_SYNC_PROVIDER_STATUS.ahk" { CF_SYNC_PROVIDER_STATUS }
#Import ".\CF_INSYNC_POLICY.ahk" { CF_INSYNC_POLICY }
#Import ".\CF_POPULATION_POLICY_PRIMARY.ahk" { CF_POPULATION_POLICY_PRIMARY }
#Import ".\CF_HYDRATION_POLICY_MODIFIER.ahk" { CF_HYDRATION_POLICY_MODIFIER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Standard sync root information.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_sync_root_standard_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_SYNC_ROOT_STANDARD_INFO {
    #StructPack 8

    /**
     * File ID of the sync root.
     */
    SyncRootFileId : Int64

    /**
     * Hydration policy of the sync root. See [CF_HYDRATION_POLICY_PRIMARY](ne-cfapi-cf_hydration_policy_primary.md) for more information.
     */
    HydrationPolicy : CF_HYDRATION_POLICY

    /**
     * Population policy of the sync root. See [CF_POPULATION_POLICY_PRIMARY](ne-cfapi-cf_population_policy_primary.md) for more information.
     */
    PopulationPolicy : CF_POPULATION_POLICY

    /**
     * In-sync policy of the sync root. See [CF_INSYNC_POLICY](ne-cfapi-cf_insync_policy.md) for possible values.
     */
    InSyncPolicy : CF_INSYNC_POLICY

    /**
     * Sync root hard linking policy. See [CF_HARDLINK_POLICY](ne-cfapi-cf_hardlink_policy.md) for possible values.
     */
    HardLinkPolicy : CF_HARDLINK_POLICY

    /**
     * Status of the sync root provider. See [CF_SYNC_PROVIDER_STATUS](ne-cfapi-cf_sync_provider_status.md) for possible values.
     */
    ProviderStatus : CF_SYNC_PROVIDER_STATUS

    /**
     * Name of the sync root. *ProviderName* is an end-user facing string with a maximum length of **CF_MAX_PROVIDER_NAME_LENGTH** (255 characters).
     */
    ProviderName : WCHAR[256]

    /**
     * Version of the sync root. *ProviderVersion* is an end-user facing string with a maximum length of **CF_MAX_PROVIDER_VERSION_LENGTH** (255 characters).
     */
    ProviderVersion : WCHAR[256]

    /**
     * Length, in bytes, of the *SyncRootIdentity*.
     */
    SyncRootIdentityLength : UInt32

    /**
     * The identity of the sync root directory.
     */
    SyncRootIdentity : Int8[1]

}
