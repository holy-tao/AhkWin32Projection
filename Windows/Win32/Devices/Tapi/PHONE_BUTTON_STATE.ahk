#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PHONE_BUTTON_STATE enum describes the state of a phone button.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_button_state
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONE_BUTTON_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * State of the button is up.
     * @type {Integer (Int32)}
     */
    static PBS_UP => 1

    /**
     * State of the button is down.
     * @type {Integer (Int32)}
     */
    static PBS_DOWN => 2

    /**
     * State of the button is not known.
     * @type {Integer (Int32)}
     */
    static PBS_UNKNOWN => 4

    /**
     * State of the button is not available.
     * @type {Integer (Int32)}
     */
    static PBS_UNAVAIL => 8
}
