#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRenderer extends Win32Enum {

    /**
     * Native name: DISPID_IRGetViewTransform
     * @type {Integer (Int32)}
     */
    static IRGetViewTransform => 1

    /**
     * Native name: DISPID_IRSetViewTransform
     * @type {Integer (Int32)}
     */
    static IRSetViewTransform => 2

    /**
     * Native name: DISPID_IRGetObjectTransform
     * @type {Integer (Int32)}
     */
    static IRGetObjectTransform => 3

    /**
     * Native name: DISPID_IRSetObjectTransform
     * @type {Integer (Int32)}
     */
    static IRSetObjectTransform => 4

    /**
     * Native name: DISPID_IRDraw
     * @type {Integer (Int32)}
     */
    static IRDraw => 5

    /**
     * Native name: DISPID_IRDrawStroke
     * @type {Integer (Int32)}
     */
    static IRDrawStroke => 6

    /**
     * Native name: DISPID_IRPixelToInkSpace
     * @type {Integer (Int32)}
     */
    static IRPixelToInkSpace => 7

    /**
     * Native name: DISPID_IRInkSpaceToPixel
     * @type {Integer (Int32)}
     */
    static IRInkSpaceToPixel => 8

    /**
     * Native name: DISPID_IRPixelToInkSpaceFromPoints
     * @type {Integer (Int32)}
     */
    static IRPixelToInkSpaceFromPoints => 9

    /**
     * Native name: DISPID_IRInkSpaceToPixelFromPoints
     * @type {Integer (Int32)}
     */
    static IRInkSpaceToPixelFromPoints => 10

    /**
     * Native name: DISPID_IRMeasure
     * @type {Integer (Int32)}
     */
    static IRMeasure => 11

    /**
     * Native name: DISPID_IRMeasureStroke
     * @type {Integer (Int32)}
     */
    static IRMeasureStroke => 12

    /**
     * Native name: DISPID_IRMove
     * @type {Integer (Int32)}
     */
    static IRMove => 13

    /**
     * Native name: DISPID_IRRotate
     * @type {Integer (Int32)}
     */
    static IRRotate => 14

    /**
     * Native name: DISPID_IRScale
     * @type {Integer (Int32)}
     */
    static IRScale => 15
}
