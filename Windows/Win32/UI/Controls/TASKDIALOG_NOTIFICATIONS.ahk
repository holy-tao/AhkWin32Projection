#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TASKDIALOG_NOTIFICATIONS {
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
    static TDN_CREATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static TDN_NAVIGATED => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDN_BUTTON_CLICKED => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDN_HYPERLINK_CLICKED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TDN_TIMER => 4

    /**
     * @type {Integer (Int32)}
     */
    static TDN_DESTROYED => 5

    /**
     * @type {Integer (Int32)}
     */
    static TDN_RADIO_BUTTON_CLICKED => 6

    /**
     * @type {Integer (Int32)}
     */
    static TDN_DIALOG_CONSTRUCTED => 7

    /**
     * @type {Integer (Int32)}
     */
    static TDN_VERIFICATION_CLICKED => 8

    /**
     * @type {Integer (Int32)}
     */
    static TDN_HELP => 9

    /**
     * @type {Integer (Int32)}
     */
    static TDN_EXPANDO_BUTTON_CLICKED => 10
}
