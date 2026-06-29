#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct RGN_COMBINE_MODE {
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
    static RGN_AND => 1

    /**
     * @type {Integer (Int32)}
     */
    static RGN_OR => 2

    /**
     * @type {Integer (Int32)}
     */
    static RGN_XOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static RGN_DIFF => 4

    /**
     * @type {Integer (Int32)}
     */
    static RGN_COPY => 5

    /**
     * @type {Integer (Int32)}
     */
    static RGN_MIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static RGN_MAX => 5
}
