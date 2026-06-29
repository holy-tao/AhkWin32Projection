#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLBWIF_FLAGS {
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
    static HLBWIF_HASFRAMEWNDINFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLBWIF_HASDOCWNDINFO => 2

    /**
     * @type {Integer (Int32)}
     */
    static HLBWIF_FRAMEWNDMAXIMIZED => 4

    /**
     * @type {Integer (Int32)}
     */
    static HLBWIF_DOCWNDMAXIMIZED => 8

    /**
     * @type {Integer (Int32)}
     */
    static HLBWIF_HASWEBTOOLBARINFO => 16

    /**
     * @type {Integer (Int32)}
     */
    static HLBWIF_WEBTOOLBARHIDDEN => 32
}
