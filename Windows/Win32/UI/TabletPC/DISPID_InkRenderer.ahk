#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkRenderer {
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
    static DISPID_IRGetViewTransform => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRSetViewTransform => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRGetObjectTransform => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRSetObjectTransform => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRDraw => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRDrawStroke => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRPixelToInkSpace => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRInkSpaceToPixel => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRPixelToInkSpaceFromPoints => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRInkSpaceToPixelFromPoints => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRMeasure => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRMeasureStroke => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRMove => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRRotate => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRScale => 15
}
