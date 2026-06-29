#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPCFLAG_RESTRICTION {
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
    static WPCFLAG_NO_RESTRICTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_LOGGING_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_WEB_FILTERED => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_HOURS_RESTRICTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_GAMES_BLOCKED => 8

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_APPS_RESTRICTED => 16

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_TIME_ALLOWANCE_RESTRICTED => 32

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_GAMES_RESTRICTED => 64
}
