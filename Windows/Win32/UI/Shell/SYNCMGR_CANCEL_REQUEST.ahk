#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a request by the user to cancel a synchronization.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_cancel_request
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGR_CANCEL_REQUEST {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No cancelation request has been made.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CR_NONE => 0

    /**
     * Stop the synchronization of the current item, but continue the synchronization of other items.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CR_CANCEL_ITEM => 1

    /**
     * Stop the synchronization entirely.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CR_CANCEL_ALL => 2

    /**
     * The maximum valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a> value.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CR_MAX => 2
}
