#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct TOUCH_FEEDBACK_MODE {
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
    static TOUCH_FEEDBACK_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCH_FEEDBACK_INDIRECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCH_FEEDBACK_NONE => 3
}
