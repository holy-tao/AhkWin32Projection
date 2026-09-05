#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkStrokes extends Win32Enum {

    /**
     * Native name: DISPID_ISs_NewEnum
     * @type {Integer (Int32)}
     */
    static ISs_NewEnum => -4

    /**
     * Native name: DISPID_ISsItem
     * @type {Integer (Int32)}
     */
    static ISsItem => 0

    /**
     * Native name: DISPID_ISsCount
     * @type {Integer (Int32)}
     */
    static ISsCount => 1

    /**
     * Native name: DISPID_ISsValid
     * @type {Integer (Int32)}
     */
    static ISsValid => 2

    /**
     * Native name: DISPID_ISsInk
     * @type {Integer (Int32)}
     */
    static ISsInk => 3

    /**
     * Native name: DISPID_ISsAdd
     * @type {Integer (Int32)}
     */
    static ISsAdd => 4

    /**
     * Native name: DISPID_ISsAddStrokes
     * @type {Integer (Int32)}
     */
    static ISsAddStrokes => 5

    /**
     * Native name: DISPID_ISsRemove
     * @type {Integer (Int32)}
     */
    static ISsRemove => 6

    /**
     * Native name: DISPID_ISsRemoveStrokes
     * @type {Integer (Int32)}
     */
    static ISsRemoveStrokes => 7

    /**
     * Native name: DISPID_ISsToString
     * @type {Integer (Int32)}
     */
    static ISsToString => 8

    /**
     * Native name: DISPID_ISsModifyDrawingAttributes
     * @type {Integer (Int32)}
     */
    static ISsModifyDrawingAttributes => 9

    /**
     * Native name: DISPID_ISsGetBoundingBox
     * @type {Integer (Int32)}
     */
    static ISsGetBoundingBox => 10

    /**
     * Native name: DISPID_ISsScaleToRectangle
     * @type {Integer (Int32)}
     */
    static ISsScaleToRectangle => 11

    /**
     * Native name: DISPID_ISsTransform
     * @type {Integer (Int32)}
     */
    static ISsTransform => 12

    /**
     * Native name: DISPID_ISsMove
     * @type {Integer (Int32)}
     */
    static ISsMove => 13

    /**
     * Native name: DISPID_ISsRotate
     * @type {Integer (Int32)}
     */
    static ISsRotate => 14

    /**
     * Native name: DISPID_ISsShear
     * @type {Integer (Int32)}
     */
    static ISsShear => 15

    /**
     * Native name: DISPID_ISsScale
     * @type {Integer (Int32)}
     */
    static ISsScale => 16

    /**
     * Native name: DISPID_ISsClip
     * @type {Integer (Int32)}
     */
    static ISsClip => 17

    /**
     * Native name: DISPID_ISsRecognitionResult
     * @type {Integer (Int32)}
     */
    static ISsRecognitionResult => 18

    /**
     * Native name: DISPID_ISsRemoveRecognitionResult
     * @type {Integer (Int32)}
     */
    static ISsRemoveRecognitionResult => 19
}
