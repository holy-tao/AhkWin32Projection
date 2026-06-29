#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates information about the type of logoff method used.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpcflag_logoff_type
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPCFLAG_LOGOFF_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The user logged off by logging off the computer.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_LOGOFF_TYPE_LOGOUT => 0

    /**
     * The user logged off by restarting the computer.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_LOGOFF_TYPE_RESTART => 1

    /**
     * The user logged off by shutting down the computer.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_LOGOFF_TYPE_SHUTDOWN => 2

    /**
     * The user logged off by using fast user switching.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_LOGOFF_TYPE_FUS => 4

    /**
     * The user was forced to log off by fast user switching.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_LOGOFF_TYPE_FORCEDFUS => 8
}
