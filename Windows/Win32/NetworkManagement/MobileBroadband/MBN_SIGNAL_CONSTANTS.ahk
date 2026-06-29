#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * THE MBN_SIGNAL_CONSTANTS enumerated type contains specific values used by IMbnSignal interface operations.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_signal_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_SIGNAL_CONSTANTS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use the default value for signal state reporting.
     * @type {Integer (Int32)}
     */
    static MBN_RSSI_DEFAULT => -1

    /**
     * Disable signal state reporting.
     * @type {Integer (Int32)}
     */
    static MBN_RSSI_DISABLE => 0

    /**
     * Signal strength is unknown.
     * @type {Integer (Int32)}
     */
    static MBN_RSSI_UNKNOWN => 99

    /**
     * Signal error rate is unknown.
     * @type {Integer (Int32)}
     */
    static MBN_ERROR_RATE_UNKNOWN => 99
}
