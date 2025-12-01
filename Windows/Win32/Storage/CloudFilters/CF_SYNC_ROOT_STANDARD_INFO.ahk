#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CF_HYDRATION_POLICY.ahk
#Include .\CF_POPULATION_POLICY.ahk

/**
 * Standard sync root information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_sync_root_standard_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_ROOT_STANDARD_INFO extends Win32Struct
{
    static sizeof => 1064

    static packingSize => 8

    /**
     * File ID of the sync root.
     * @type {Integer}
     */
    SyncRootFileId {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Hydration policy of the sync root. See [CF_HYDRATION_POLICY_PRIMARY](ne-cfapi-cf_hydration_policy_primary.md) for more information.
     * @type {CF_HYDRATION_POLICY}
     */
    HydrationPolicy{
        get {
            if(!this.HasProp("__HydrationPolicy"))
                this.__HydrationPolicy := CF_HYDRATION_POLICY(8, this)
            return this.__HydrationPolicy
        }
    }

    /**
     * Population policy of the sync root. See [CF_POPULATION_POLICY_PRIMARY](ne-cfapi-cf_population_policy_primary.md) for more information.
     * @type {CF_POPULATION_POLICY}
     */
    PopulationPolicy{
        get {
            if(!this.HasProp("__PopulationPolicy"))
                this.__PopulationPolicy := CF_POPULATION_POLICY(12, this)
            return this.__PopulationPolicy
        }
    }

    /**
     * In-sync policy of the sync root. See [CF_INSYNC_POLICY](ne-cfapi-cf_insync_policy.md) for possible values.
     * @type {Integer}
     */
    InSyncPolicy {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Sync root hard linking policy. See [CF_HARDLINK_POLICY](ne-cfapi-cf_hardlink_policy.md) for possible values.
     * @type {Integer}
     */
    HardLinkPolicy {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Status of the sync root provider. See [CF_SYNC_PROVIDER_STATUS](ne-cfapi-cf_sync_provider_status.md) for possible values.
     * @type {Integer}
     */
    ProviderStatus {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Name of the sync root. *ProviderName* is an end-user facing string with a maximum length of **CF_MAX_PROVIDER_NAME_LENGTH** (255 characters).
     * @type {String}
     */
    ProviderName {
        get => StrGet(this.ptr + 28, 255, "UTF-16")
        set => StrPut(value, this.ptr + 28, 255, "UTF-16")
    }

    /**
     * Version of the sync root. *ProviderVersion* is an end-user facing string with a maximum length of **CF_MAX_PROVIDER_VERSION_LENGTH** (255 characters).
     * @type {String}
     */
    ProviderVersion {
        get => StrGet(this.ptr + 540, 255, "UTF-16")
        set => StrPut(value, this.ptr + 540, 255, "UTF-16")
    }

    /**
     * Length, in bytes, of the *SyncRootIdentity*.
     * @type {Integer}
     */
    SyncRootIdentityLength {
        get => NumGet(this, 1052, "uint")
        set => NumPut("uint", value, this, 1052)
    }

    /**
     * The identity of the sync root directory.
     * @type {Array<Byte>}
     */
    SyncRootIdentity{
        get {
            if(!this.HasProp("__SyncRootIdentityProxyArray"))
                this.__SyncRootIdentityProxyArray := Win32FixedArray(this.ptr + 1056, 1, Primitive, "char")
            return this.__SyncRootIdentityProxyArray
        }
    }
}
