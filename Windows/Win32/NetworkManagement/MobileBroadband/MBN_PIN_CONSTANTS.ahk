#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_PIN_CONSTANTS enumerated type defines constant values used by the MBN_PIN_INFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_pin_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_PIN_CONSTANTS{

    /**
     * Indicates that there is no available information available on the number of attempts remaining to enter a valid PIN.
     * @type {Integer (Int32)}
     */
    static MBN_ATTEMPTS_REMAINING_UNKNOWN => -1

    /**
     * Indicates that there is no available information on the length of the PIN.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_LENGTH_UNKNOWN => -1
}
