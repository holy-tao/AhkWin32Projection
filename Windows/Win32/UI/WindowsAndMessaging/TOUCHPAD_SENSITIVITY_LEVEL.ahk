#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct TOUCHPAD_SENSITIVITY_LEVEL {
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
    static TOUCHPAD_SENSITIVITY_LEVEL_MOST_SENSITIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TOUCHPAD_SENSITIVITY_LEVEL_HIGH_SENSITIVITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static TOUCHPAD_SENSITIVITY_LEVEL_MEDIUM_SENSITIVITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static TOUCHPAD_SENSITIVITY_LEVEL_LOW_SENSITIVITY => 3

    /**
     * @type {Integer (Int32)}
     */
    static TOUCHPAD_SENSITIVITY_LEVEL_LEAST_SENSITIVE => 4
}
