#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_TINT_PROP {
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
    static D2D1_TINT_PROP_COLOR => 0

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_TINT_PROP_CLAMP_OUTPUT => 1
}
