#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TCITEMHEADERA_MASK {
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
    static TCIF_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TCIF_RTLREADING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TCIF_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TCIF_PARAM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TCIF_STATE => 16
}
