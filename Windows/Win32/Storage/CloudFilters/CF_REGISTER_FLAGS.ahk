#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags for registering and updating a sync root.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_register_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_REGISTER_FLAGS extends Win32BitflagEnum{

    /**
     * No registration flags.
     * @type {Integer (Int32)}
     */
    static CF_REGISTER_FLAG_NONE => 0

    /**
     * Use this flag for modifying previously registered sync root identities and policies.
     * @type {Integer (Int32)}
     */
    static CF_REGISTER_FLAG_UPDATE => 1

    /**
     * The on-demand directory/folder population behavior is globally controlled by the population policy. This flag allows a sync provider to opt out of the on-demand population behavior just for the sync root itself while keeping on-demand population on for all other directories under the sync root. This is useful when the sync provider would like to pre-populate the immediate child files/directories of the sync root.
     * @type {Integer (Int32)}
     */
    static CF_REGISTER_FLAG_DISABLE_ON_DEMAND_POPULATION_ON_ROOT => 2

    /**
     * This flag allows a sync provider to mark the sync root to be registered in-sync simultaneously at the registration time. An alternative is to call [CfSetInSyncState](nf-cfapi-cfsetinsyncstate.md) on the sync root later.
     * @type {Integer (Int32)}
     */
    static CF_REGISTER_FLAG_MARK_IN_SYNC_ON_ROOT => 4
}
