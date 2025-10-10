#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags for creating a placeholder on a per-placeholder basis.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_placeholder_create_flags
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
     * The newly created child placeholder directory is considered to have all of its children present locally.
 * 
 * Applicable to a child placeholder directory only.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_DISABLE_ON_DEMAND_POPULATION => 1

    /**
     * The newly created placeholder is marked as in-sync. Applicable to both placeholder files and directories.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_MARK_IN_SYNC => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_SUPERSEDE => 4

    /**
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_CREATE_FLAG_ALWAYS_FULL => 8
}
