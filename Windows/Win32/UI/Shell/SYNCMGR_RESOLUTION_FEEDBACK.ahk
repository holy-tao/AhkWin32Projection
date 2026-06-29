#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes Sync Manager resolution feedback. Used by ISyncMgrResolutionHandler.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGR_RESOLUTION_FEEDBACK {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Proceed to the next conflict.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RF_CONTINUE => 0

    /**
     * <b>Apply to All</b> is stopped and the dialog will be displayed for this conflict.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RF_REFRESH => 1

    /**
     * Cancels resolution of any more conflicts in the set.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RF_CANCEL => 2
}
