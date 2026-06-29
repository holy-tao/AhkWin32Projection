#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct POINTER_INPUT_TYPE {
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
    static PT_POINTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PT_TOUCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static PT_PEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static PT_MOUSE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PT_TOUCHPAD => 5
}
