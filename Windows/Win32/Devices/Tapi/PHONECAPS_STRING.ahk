#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PHONECAPS_STRING enum is used by methods that set or get phone capabilities described by a string.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phonecaps_string
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONECAPS_STRING {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Name of the phone.
     * @type {Integer (Int32)}
     */
    static PCS_PHONENAME => 0

    /**
     * Phone information string.
     * @type {Integer (Int32)}
     */
    static PCS_PHONEINFO => 1

    /**
     * Phone provider string.
     * @type {Integer (Int32)}
     */
    static PCS_PROVIDERINFO => 2
}
