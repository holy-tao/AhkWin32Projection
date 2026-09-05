#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used in the ISyncMgrSynchronize::SetItemStatus method to specify the updated status for the item.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrstatus
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGRSTATUS extends Win32Enum {

    /**
     * Synchronization has been stopped.
     * Native name: SYNCMGRSTATUS_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 0

    /**
     * Indicates that this item should be skipped.
     * Native name: SYNCMGRSTATUS_SKIPPED
     * @type {Integer (Int32)}
     */
    static SKIPPED => 1

    /**
     * Synchronization for the item is pending.
     * Native name: SYNCMGRSTATUS_PENDING
     * @type {Integer (Int32)}
     */
    static PENDING => 2

    /**
     * The item is currently being synchronized.
     * Native name: SYNCMGRSTATUS_UPDATING
     * @type {Integer (Int32)}
     */
    static UPDATING => 3

    /**
     * The synchronization for the item succeeded.
     * Native name: SYNCMGRSTATUS_SUCCEEDED
     * @type {Integer (Int32)}
     */
    static SUCCEEDED => 4

    /**
     * Synchronization for the item failed.
     * Native name: SYNCMGRSTATUS_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 5

    /**
     * Synchronization for the item paused.
     * Native name: SYNCMGRSTATUS_PAUSED
     * @type {Integer (Int32)}
     */
    static PAUSED => 6

    /**
     * Synchronization for the item is resuming.
     * Native name: SYNCMGRSTATUS_RESUMING
     * @type {Integer (Int32)}
     */
    static RESUMING => 7

    /**
     * <b>Windows Vista and later</b>. Shows marquee progress for the synchronized item. Sets the progress bar in the folder to marquee the synchronization progress.
     * Native name: SYNCMGRSTATUS_UPDATING_INDETERMINATE
     * @type {Integer (Int32)}
     */
    static UPDATING_INDETERMINATE => 8

    /**
     * The item has been deleted. This value has been deprecated for Windows Vista and later.
     * Native name: SYNCMGRSTATUS_DELETED
     * @type {Integer (Int32)}
     */
    static DELETED => 256
}
