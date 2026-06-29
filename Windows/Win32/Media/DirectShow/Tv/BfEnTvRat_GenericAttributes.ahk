#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BfEnTvRat_GenericAttributes {
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
    static BfAttrNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static BfIsBlocked => 1

    /**
     * @type {Integer (Int32)}
     */
    static BfIsAttr_1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static BfIsAttr_2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static BfIsAttr_3 => 8

    /**
     * @type {Integer (Int32)}
     */
    static BfIsAttr_4 => 16

    /**
     * @type {Integer (Int32)}
     */
    static BfIsAttr_5 => 32

    /**
     * @type {Integer (Int32)}
     */
    static BfIsAttr_6 => 64

    /**
     * @type {Integer (Int32)}
     */
    static BfIsAttr_7 => 128

    /**
     * @type {Integer (Int32)}
     */
    static BfValidAttrSubmask => 255
}
