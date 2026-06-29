#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the current state of the filter engine.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_service_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SERVICE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The filter engine is not running.
     * @type {Integer (Int32)}
     */
    static FWPM_SERVICE_STOPPED => 0

    /**
     * The filter engine is starting.
     * @type {Integer (Int32)}
     */
    static FWPM_SERVICE_START_PENDING => 1

    /**
     * The filter engine is stopping.
     * @type {Integer (Int32)}
     */
    static FWPM_SERVICE_STOP_PENDING => 2

    /**
     * The filter engine is running.
     * @type {Integer (Int32)}
     */
    static FWPM_SERVICE_RUNNING => 3

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_SERVICE_STATE_MAX => 4
}
