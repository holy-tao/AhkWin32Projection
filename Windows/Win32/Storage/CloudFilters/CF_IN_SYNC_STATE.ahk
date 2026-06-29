#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the in-sync state for placeholder files and folders.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_in_sync_state
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_IN_SYNC_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
