#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used in the ISyncMgrSynchronize::SetItemStatus method to specify the updated status for the item.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrstatus
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGRSTATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Synchronization has been stopped.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_STOPPED => 0

    /**
     * Indicates that this item should be skipped.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_SKIPPED => 1

    /**
     * Synchronization for the item is pending.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_PENDING => 2

    /**
     * The item is currently being synchronized.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_UPDATING => 3

    /**
     * The synchronization for the item succeeded.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_SUCCEEDED => 4

    /**
     * Synchronization for the item failed.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_FAILED => 5

    /**
     * Synchronization for the item paused.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_PAUSED => 6

    /**
     * Synchronization for the item is resuming.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_RESUMING => 7

    /**
     * <b>Windows Vista and later</b>. Shows marquee progress for the synchronized item. Sets the progress bar in the folder to marquee the synchronization progress.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_UPDATING_INDETERMINATE => 8

    /**
     * The item has been deleted. This value has been deprecated for Windows Vista and later.
     * @type {Integer (Int32)}
     */
    static SYNCMGRSTATUS_DELETED => 256
}
