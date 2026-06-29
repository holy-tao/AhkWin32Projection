#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HIT_TEST_BACKGROUND_OPTIONS {
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
    static HTTB_BACKGROUNDSEG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_FIXEDBORDER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_CAPTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER_LEFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER_TOP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER_RIGHT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER_BOTTOM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER => 240

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_SIZINGTEMPLATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_SYSTEMSIZINGMARGINS => 512
}
