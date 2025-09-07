#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the in-sync state for placeholder files and folders.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_in_sync_state
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_IN_SYNC_STATE{

    /**
     * The platform clears the placeholder’s in-sync state upon a successful return from the [CfSetInSyncState](nf-cfapi-cfsetinsyncstate.md) call.
     * @type {Integer (Int32)}
     */
    static CF_IN_SYNC_STATE_NOT_IN_SYNC => 0

    /**
     * The platform sets the placeholder’s in-sync state upon a successful return from the [CfSetInSyncState](nf-cfapi-cfsetinsyncstate.md) call.
     * @type {Integer (Int32)}
     */
    static CF_IN_SYNC_STATE_IN_SYNC => 1
}
