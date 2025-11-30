#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminServiceStatusOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminServiceStopped => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminServiceStartPending => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminServiceStopPending => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminServiceRunning => 3

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminServiceContinuePending => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminServicePausePending => 5

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminServicePaused => 6

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminServiceUnknownState => 7
}
