#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct INPUT_TYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static INPUT_MOUSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INPUT_KEYBOARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INPUT_HARDWARE => 2
}
