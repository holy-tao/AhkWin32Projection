#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates flags used by ISyncMgrControl::StartHandlerSync and ISyncMgrControl::StartItemSync.
 * @remarks
 * Typically, sync requests are queued if a synchronization is currently in progress. An item might be in both the ongoing synchronization and the queued synchronization. These flags specify whether such an item should be resynched when the queued synchronization is performed.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_sync_control_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_SYNC_CONTROL_FLAGS extends Win32Enum{

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
