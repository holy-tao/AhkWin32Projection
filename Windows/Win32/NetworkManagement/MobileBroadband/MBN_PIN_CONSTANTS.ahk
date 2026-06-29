#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_PIN_CONSTANTS enumerated type defines constant values used by the MBN_PIN_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_pin_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_PIN_CONSTANTS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
