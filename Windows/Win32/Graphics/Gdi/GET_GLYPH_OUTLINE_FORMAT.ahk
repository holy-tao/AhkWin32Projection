#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GET_GLYPH_OUTLINE_FORMAT {
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
    static GGO_BEZIER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GGO_BITMAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GGO_GLYPH_INDEX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GGO_GRAY2_BITMAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GGO_GRAY4_BITMAP => 5

    /**
     * @type {Integer (UInt32)}
     */
    static GGO_GRAY8_BITMAP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static GGO_METRICS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GGO_NATIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GGO_UNHINTED => 256
}
