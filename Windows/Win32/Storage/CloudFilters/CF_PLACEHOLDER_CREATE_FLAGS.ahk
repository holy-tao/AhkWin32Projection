#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags for creating a placeholder on a per-placeholder basis.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_placeholder_create_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_CREATE_FLAGS{

    /**
     * No placeholder create flags.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_NONE => 0

    /**
     * When the flag is present, the newly created child placeholder directory is considered to have all of its children present locally hence accessing it in the future will not trigger any **FETCH_PLACEHOLDERS** callback on it. When the flag is absent, the newly created placeholder directory is considered partial and future access will trigger **FETCH_PLACEHOLDERS**. This flag is applicable to a child placeholder directory only.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_DISABLE_ON_DEMAND_POPULATION => 1

    /**
     * The newly created placeholder is marked as in-sync as part of the **TRANSFER_PLACEHOLDERS** operation. This is applicable to both placeholder files and directories.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_MARK_IN_SYNC => 2

    /**
     * The newly created placeholder will supercede/overwrite the an existing placeholder.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_SUPERSEDE => 4

    /**
     * When this flag is present, the newly created placeholder will be marked as always full. Once hydrated, any attempt to dehydrate such a (file) placeholder will fail with error code **ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED**. This flag is enforced on a placeholder file only. It can be set on a placeholder directory, but it has no effect.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_ALWAYS_FULL => 8
}
