#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TAPI_TONEMODE enum is used to describe the different selections that are used when generating line tones.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-tapi_tonemode
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct TAPI_TONEMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The tone is a ringback tone. Exact definition is service-provider defined.
     * @type {Integer (Int32)}
     */
    static TTM_RINGBACK => 2

    /**
     * The tone is a busy tone. Exact definition is service-provider defined.
     * @type {Integer (Int32)}
     */
    static TTM_BUSY => 4

    /**
     * The tone is a beep, such as that used to announce the beginning of a recording. Exact definition is service-provider defined.
     * @type {Integer (Int32)}
     */
    static TTM_BEEP => 8

    /**
     * The tone is a billing information tone, such as a credit card prompt tone. Exact definition is service-provider defined.
     * @type {Integer (Int32)}
     */
    static TTM_BILLING => 16
}
