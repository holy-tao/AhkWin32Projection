#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Provides policy modifiers to be used with the primary [StorageProviderHydrationPolicy](StorageProviderHydrationPolicy.md).
 * @remarks
 * ValidationRequired and StreamingAllowed are mutually exclusive fields.
 * 
 * **ValidationRequired** offers two guarantees to a sync provider. First, it guarantees that the data returned by the sync provider is always persisted to the disk prior to it being returned to the user application; second, it allows the sync provider to retrieve the same data it has returned previously to the platform and validate its integrity. Only upon a successful confirmation of the integrity by the sync provider will the platform complete the user IO request. This modifier helps support end-to-end data integrity at the cost of extra disk IOs.
 * 
 * **StreamingAllowed** grants the platform the permission to not store any data returned by a sync provider on local disks. This policy modifier is mutually exclusive with ValidationRequired. The API fails with *ERROR_INVALID_PARAMETER* when both flags are specified.
 * 
 * **AutoDehydrationAllowed** grants the platform the permission to dehydrate in-sync cloud file placeholders without the help of sync providers. Without this flag, the platform is not allowed to call CfDehydratePlaceholder directly. Instead, the only supported way to dehydrate a cloud file placeholder is to clear the file’s pinned attribute and set the file’s unpinned attribute and then the actual dehydration will be performed asynchronously by the sync engine after it receives the directory change notification on the two attributes. When this flag is specified, the platform will be allowed to invoke *CfDehydratePlaceholder* directly on any in-sync cloud file placeholder. It is recommended for sync providers to support auto dehydration.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderhydrationpolicymodifier
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderHydrationPolicyModifier extends Win32BitflagEnum{

    /**
     * No modifiers.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Once the data is hydrated into the file, it will be validated.
     * @type {Integer (UInt32)}
     */
    static ValidationRequired => 1

    /**
     * This modifier does not allow the platform to store any data on disk returned by a sync provider.
     * @type {Integer (UInt32)}
     */
    static StreamingAllowed => 2

    /**
     * Automatic file dehydration is allowed.
     * @type {Integer (UInt32)}
     */
    static AutoDehydrationAllowed => 4

    /**
     * This policy modifier grants the platform permission to fully hydrate a file synchronously when it intercepts an attempt by an AV Filter to scan the file. Sync providers that wish to use RestartHydration to change the fileSize from a FetchData Callback must opt-in for the FULL_RESTART_HYDRATION_REQUIRED ALLOW_FULL_RESTART_HYDRATION policy to avoid possible deadlocks with anti-virus and anti-malware software trying to scan the file and the provider trying to change fileSize using RestartHydration.
     * @type {Integer (UInt32)}
     */
    static AllowFullRestartHydration => 8
}
