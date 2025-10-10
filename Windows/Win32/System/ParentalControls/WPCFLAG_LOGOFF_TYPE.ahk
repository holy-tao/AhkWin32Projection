#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about the type of logoff method used.
 * @see https://docs.microsoft.com/windows/win32/api//wpcevent/ne-wpcevent-wpcflag_logoff_type
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPCFLAG_LOGOFF_TYPE{

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
