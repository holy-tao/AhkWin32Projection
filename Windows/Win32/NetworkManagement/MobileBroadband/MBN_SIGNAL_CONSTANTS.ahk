#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * THE MBN_SIGNAL_CONSTANTS enumerated type contains specific values used by IMbnSignal interface operations.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_signal_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_SIGNAL_CONSTANTS extends Win32Enum{

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
