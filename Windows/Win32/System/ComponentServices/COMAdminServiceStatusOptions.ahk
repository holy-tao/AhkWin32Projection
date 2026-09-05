#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminServiceStatusOptions extends Win32Enum {

    /**
     * Native name: COMAdminServiceStopped
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * Native name: COMAdminServiceStartPending
     * @type {Integer (Int32)}
     */
    static StartPending => 1

    /**
     * Native name: COMAdminServiceStopPending
     * @type {Integer (Int32)}
     */
    static StopPending => 2

    /**
     * Native name: COMAdminServiceRunning
     * @type {Integer (Int32)}
     */
    static Running => 3

    /**
     * Native name: COMAdminServiceContinuePending
     * @type {Integer (Int32)}
     */
    static ContinuePending => 4

    /**
     * Native name: COMAdminServicePausePending
     * @type {Integer (Int32)}
     */
    static PausePending => 5

    /**
     * Native name: COMAdminServicePaused
     * @type {Integer (Int32)}
     */
    static Paused => 6

    /**
     * Native name: COMAdminServiceUnknownState
     * @type {Integer (Int32)}
     */
    static UnknownState => 7
}
