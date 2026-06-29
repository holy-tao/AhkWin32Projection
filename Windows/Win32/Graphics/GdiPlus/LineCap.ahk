#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct LineCap {
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
    static LineCapFlat => 0

    /**
     * @type {Integer (Int32)}
     */
    static LineCapSquare => 1

    /**
     * @type {Integer (Int32)}
     */
    static LineCapRound => 2

    /**
     * @type {Integer (Int32)}
     */
    static LineCapTriangle => 3

    /**
     * @type {Integer (Int32)}
     */
    static LineCapNoAnchor => 16

    /**
     * @type {Integer (Int32)}
     */
    static LineCapSquareAnchor => 17

    /**
     * @type {Integer (Int32)}
     */
    static LineCapRoundAnchor => 18

    /**
     * @type {Integer (Int32)}
     */
    static LineCapDiamondAnchor => 19

    /**
     * @type {Integer (Int32)}
     */
    static LineCapArrowAnchor => 20

    /**
     * @type {Integer (Int32)}
     */
    static LineCapCustom => 255

    /**
     * @type {Integer (Int32)}
     */
    static LineCapAnchorMask => 240
}
