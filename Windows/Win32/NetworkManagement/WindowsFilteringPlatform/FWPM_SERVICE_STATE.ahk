#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the current state of the filter engine.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_service_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_SERVICE_STATE extends Win32Enum {

    /**
     * The filter engine is not running.
     * Native name: FWPM_SERVICE_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 0

    /**
     * The filter engine is starting.
     * Native name: FWPM_SERVICE_START_PENDING
     * @type {Integer (Int32)}
     */
    static START_PENDING => 1

    /**
     * The filter engine is stopping.
     * Native name: FWPM_SERVICE_STOP_PENDING
     * @type {Integer (Int32)}
     */
    static STOP_PENDING => 2

    /**
     * The filter engine is running.
     * Native name: FWPM_SERVICE_RUNNING
     * @type {Integer (Int32)}
     */
    static RUNNING => 3

    /**
     * Maximum value for testing purposes.
     * Native name: FWPM_SERVICE_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 4
}
