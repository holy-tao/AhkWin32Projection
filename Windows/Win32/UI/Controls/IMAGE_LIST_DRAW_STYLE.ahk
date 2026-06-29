#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct IMAGE_LIST_DRAW_STYLE {
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
    static ILD_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_TRANSPARENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_BLEND25 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_FOCUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_BLEND50 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_SELECTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_BLEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_MASK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_IMAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_ROP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_OVERLAYMASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_PRESERVEALPHA => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_SCALE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_DPISCALE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ILD_ASYNC => 32768
}
