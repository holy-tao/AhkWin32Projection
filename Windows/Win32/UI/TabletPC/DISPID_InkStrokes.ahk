#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkStrokes {
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
    static DISPID_ISs_NewEnum => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsValid => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsInk => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsAdd => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsAddStrokes => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsRemove => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsRemoveStrokes => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsToString => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsModifyDrawingAttributes => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsGetBoundingBox => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsScaleToRectangle => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsTransform => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsMove => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsRotate => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsShear => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsScale => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsClip => 17

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsRecognitionResult => 18

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ISsRemoveRecognitionResult => 19
}
