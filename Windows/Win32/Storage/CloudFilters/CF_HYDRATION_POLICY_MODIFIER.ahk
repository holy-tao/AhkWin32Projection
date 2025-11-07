#Requires AutoHotkey v2.0.0 64-bit

/**
 * Allows a sync provider to control how placeholder files should be hydrated by the platform. This is a modifier that can be used with the primary policy:\_CF_HYDRATION_POLICY_PRIMARY.
 * @remarks
 * 
 * In general, modifiers can be mixed and matched with any primary policy (<a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ne-cfapi-cf_hydration_policy_primary">CF_HYDRATION_POLICY_PRIMARY</a>) and other policy modifiers so long as the combination is not self-conflicting.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_hydration_policy_modifier
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_HYDRATION_POLICY_MODIFIER{

    /**
     * No policy modifier.
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_MODIFIER_NONE => 0

    /**
     * This policy modifier offers two guarantees to a sync provider. First, it guarantees that the data returned by the sync provider is always persisted to the disk prior to it being returned to the user application. Second, it allows the sync provider to retrieve the same data it has returned previously to the platform and validate its integrity. Only upon a successful confirmation of the integrity by the sync provider will the platform complete the user I/O request. This modifier helps support end-to-end data integrity at the cost of extra disk I/Os.
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_MODIFIER_VALIDATION_REQUIRED => 1

    /**
     * This policy modifier grants the platform the permission to not store any data returned by a sync provider on local disks. This policy modifier is ineffective when being combined with <b>CF_HYDRATION_POLICY_MODIFIER_VALIDATION_REQUIRED</b>.
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_MODIFIER_STREAMING_ALLOWED => 2

    /**
     * <b>Note</b>  This value is new for Windows 10, version 1803.
 * 
 * This policy modifier grants the platform the permission to dehydrate in-sync cloud file placeholders without the help of sync providers. Without this flag, the platform is not allowed to call <a href="https://docs.microsoft.com/previous-versions/mt827480(v=vs.85)">CfDehydratePlaceholder</a> directly. Instead, the only supported way to dehydrate a cloud file placeholder is to clear the file’s pinned attribute and set the file’s unpinned attribute. At that point, the actual dehydration will be performed asynchronously by the sync engine after it receives the directory change notification on the two attributes. When this flag is specified, the platform will be allowed to invoke <b>CfDehydratePlaceholder</b> directly on any in-sync cloud file placeholder. It is recommended for sync providers to support auto-dehydration.
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_MODIFIER_AUTO_DEHYDRATION_ALLOWED => 4

    /**
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_MODIFIER_ALLOW_FULL_RESTART_HYDRATION => 8
}
