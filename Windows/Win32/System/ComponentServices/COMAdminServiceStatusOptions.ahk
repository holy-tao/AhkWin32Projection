#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminServiceStatusOptions {
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
