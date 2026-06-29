#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_PIN_MODE enumerated type indicates if the PIN type is enabled.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_pin_mode
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_PIN_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The PIN type is currently enabled.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_MODE_ENABLED => 1

    /**
     * The PIN type is currently disabled.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_MODE_DISABLED => 2
}
