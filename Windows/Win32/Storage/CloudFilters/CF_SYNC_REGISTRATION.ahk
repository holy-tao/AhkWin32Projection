#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The details of the sync provider and sync root to be registered.
 * @remarks
 * *SyncRootIdentity* and *SyncRootIdentityLength* are optional members. If not used, set *SyncRootIdentity* to `nullptr` and *SyncRootIdentityLength* to `0`. *FileIdentity* and *FileIdentityLength* are also optional and if not used should be set to `nullptr` and `0`, respectively.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_sync_registration
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_SYNC_REGISTRATION {
    #StructPack 8

    /**
     * The size of the **CF_SYNC_REGISTRATION** structure.
     */
    StructSize : UInt32

    /**
     * The name of the sync provider. This is a user friendly string with a maximum length of 255 characters.
     */
    ProviderName : PWSTR

    /**
     * The version of the sync provider. This is a user friendly string with a maximum length of 255 characters.
     */
    ProviderVersion : PWSTR

    /**
     * The sync root identity used by the provider. This member is optional with a maximum size of 64 KB. The API fails with **ERROR_INVALID_PARAMETER** when the maximum length is exceeded. The platform will provide *SyncRootIdentity* back to the sync provider in any callbacks to the sync provider.
     */
    SyncRootIdentity : IntPtr

    /**
     * The length of the *SyncRootIdentity*. This member is optional and is only used if a *SyncRootIdentity* is provided.
     */
    SyncRootIdentityLength : UInt32

    /**
     * An optional file identity. This member has a maximum size of 4 KB. The API fails with **ERROR_INVALID_PARAMETER** when the maximum length is exceeded. The sync root *FileIdentity* blob will be provided only when the subject of the callback is the sync root itself.
     */
    FileIdentity : IntPtr

    /**
     * The length of the *FileIdentity*. This member is optional and is only used if a *FileIdentity* is provided.
     */
    FileIdentityLength : UInt32

    /**
     * This is a GUID that is meant to identify a specific sync provider. It is optional. If not provided, the platform generates a GUID using the MD5 hash of the *ProviderName* string. The information is used for telemetry only such that the platform can better correlate activities from the same sync provider more efficiently and more accurately even if the sync provider registers sync roots with different *ProviderName* strings. It is recommended that a sync provider always supply the same GUID for all versions of its sync product(s). On the other hand, sync providers are free to choose different *ProviderName* strings for the sake of the best user experience.
     */
    ProviderId : Guid

}
