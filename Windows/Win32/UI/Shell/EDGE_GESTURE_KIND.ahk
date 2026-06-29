#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct EDGE_GESTURE_KIND {
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
    static EGK_TOUCH => 0

    /**
     * @type {Integer (Int32)}
     */
    static EGK_KEYBOARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static EGK_MOUSE => 2
}
