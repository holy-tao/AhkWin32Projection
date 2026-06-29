#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates flags used by ISyncMgrControl::StartHandlerSync and ISyncMgrControl::StartItemSync.
 * @remarks
 * Typically, sync requests are queued if a synchronization is currently in progress. An item might be in both the ongoing synchronization and the queued synchronization. These flags specify whether such an item should be resynched when the queued synchronization is performed.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_sync_control_flags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGR_SYNC_CONTROL_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Sync all items, regardless of whether they were just synced.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_SCF_NONE => 0

    /**
     * Sync only items that are not currently syncing.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_SCF_IGNORE_IF_ALREADY_SYNCING => 1

    /**
     * A mask used to retrieve or verify valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_sync_control_flags">SYNCMGR_SYNC_CONTROL_FLAGS</a> flags.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_SCF_VALID => 1
}
