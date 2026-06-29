#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct HOLD_PARAMETER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_MIN_CONTACT_COUNT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_MAX_CONTACT_COUNT => 1

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_THRESHOLD_RADIUS => 2

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_THRESHOLD_START_DELAY => 3

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_MAX => -1
}
