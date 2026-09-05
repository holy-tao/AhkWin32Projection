#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * THE MBN_SIGNAL_CONSTANTS enumerated type contains specific values used by IMbnSignal interface operations.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_signal_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_SIGNAL_CONSTANTS extends Win32Enum {

    /**
     * Use the default value for signal state reporting.
     * Native name: MBN_RSSI_DEFAULT
     * @type {Integer (Int32)}
     */
    static RSSI_DEFAULT => -1

    /**
     * Disable signal state reporting.
     * Native name: MBN_RSSI_DISABLE
     * @type {Integer (Int32)}
     */
    static RSSI_DISABLE => 0

    /**
     * Signal strength is unknown.
     * Native name: MBN_RSSI_UNKNOWN
     * @type {Integer (Int32)}
     */
    static RSSI_UNKNOWN => 99

    /**
     * Signal error rate is unknown.
     * Native name: MBN_ERROR_RATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static ERROR_RATE_UNKNOWN => 99
}
