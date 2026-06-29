#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GRADIENT_FILL {
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
    static GRADIENT_FILL_RECT_H => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_RECT_V => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_TRIANGLE => 2
}
