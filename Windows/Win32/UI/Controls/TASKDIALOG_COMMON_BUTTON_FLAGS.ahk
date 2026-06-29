#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TASKDIALOG_COMMON_BUTTON_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_OK_BUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_YES_BUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_NO_BUTTON => 4

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_CANCEL_BUTTON => 8

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_RETRY_BUTTON => 16

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_CLOSE_BUTTON => 32

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_ABORT_BUTTON => 65536

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_IGNORE_BUTTON => 131072

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_TRYAGAIN_BUTTON => 262144

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_CONTINUE_BUTTON => 524288

    /**
     * @type {Integer (Int32)}
     */
    static TDCBF_HELP_BUTTON => 1048576
}
