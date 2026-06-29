#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DRAW_EDGE_FLAGS {
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
    static BF_ADJUST => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static BF_BOTTOM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BF_BOTTOMLEFT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static BF_BOTTOMRIGHT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BF_DIAGONAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BF_DIAGONAL_ENDBOTTOMLEFT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static BF_DIAGONAL_ENDBOTTOMRIGHT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static BF_DIAGONAL_ENDTOPLEFT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static BF_DIAGONAL_ENDTOPRIGHT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static BF_FLAT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static BF_LEFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BF_MIDDLE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static BF_MONO => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static BF_RECT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static BF_RIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BF_SOFT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static BF_TOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BF_TOPLEFT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BF_TOPRIGHT => 6
}
