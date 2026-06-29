#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TEXT_ALIGN_OPTIONS {
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
    static TA_NOUPDATECP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TA_UPDATECP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TA_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TA_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TA_CENTER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TA_TOP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TA_BOTTOM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TA_BASELINE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static TA_RTLREADING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TA_MASK => 287

    /**
     * @type {Integer (UInt32)}
     */
    static VTA_BASELINE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static VTA_LEFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VTA_RIGHT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VTA_CENTER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static VTA_BOTTOM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VTA_TOP => 0
}
