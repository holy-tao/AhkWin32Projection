#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct GET_MOUSE_MOVE_POINTS_EX_RESOLUTION {
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
    static GMMP_USE_DISPLAY_POINTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GMMP_USE_HIGH_RESOLUTION_POINTS => 2
}
