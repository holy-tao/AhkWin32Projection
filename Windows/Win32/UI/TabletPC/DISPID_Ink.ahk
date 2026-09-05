#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_Ink extends Win32Enum {

    /**
     * Native name: DISPID_IStrokes
     * @type {Integer (Int32)}
     */
    static IStrokes => 1

    /**
     * Native name: DISPID_IExtendedProperties
     * @type {Integer (Int32)}
     */
    static IExtendedProperties => 2

    /**
     * Native name: DISPID_IGetBoundingBox
     * @type {Integer (Int32)}
     */
    static IGetBoundingBox => 3

    /**
     * Native name: DISPID_IDeleteStrokes
     * @type {Integer (Int32)}
     */
    static IDeleteStrokes => 4

    /**
     * Native name: DISPID_IDeleteStroke
     * @type {Integer (Int32)}
     */
    static IDeleteStroke => 5

    /**
     * Native name: DISPID_IExtractStrokes
     * @type {Integer (Int32)}
     */
    static IExtractStrokes => 6

    /**
     * Native name: DISPID_IExtractWithRectangle
     * @type {Integer (Int32)}
     */
    static IExtractWithRectangle => 7

    /**
     * Native name: DISPID_IDirty
     * @type {Integer (Int32)}
     */
    static IDirty => 8

    /**
     * Native name: DISPID_ICustomStrokes
     * @type {Integer (Int32)}
     */
    static ICustomStrokes => 9

    /**
     * Native name: DISPID_IClone
     * @type {Integer (Int32)}
     */
    static IClone => 10

    /**
     * Native name: DISPID_IHitTestCircle
     * @type {Integer (Int32)}
     */
    static IHitTestCircle => 11

    /**
     * Native name: DISPID_IHitTestWithRectangle
     * @type {Integer (Int32)}
     */
    static IHitTestWithRectangle => 12

    /**
     * Native name: DISPID_IHitTestWithLasso
     * @type {Integer (Int32)}
     */
    static IHitTestWithLasso => 13

    /**
     * Native name: DISPID_INearestPoint
     * @type {Integer (Int32)}
     */
    static INearestPoint => 14

    /**
     * Native name: DISPID_ICreateStrokes
     * @type {Integer (Int32)}
     */
    static ICreateStrokes => 15

    /**
     * Native name: DISPID_ICreateStroke
     * @type {Integer (Int32)}
     */
    static ICreateStroke => 16

    /**
     * Native name: DISPID_IAddStrokesAtRectangle
     * @type {Integer (Int32)}
     */
    static IAddStrokesAtRectangle => 17

    /**
     * Native name: DISPID_IClip
     * @type {Integer (Int32)}
     */
    static IClip => 18

    /**
     * Native name: DISPID_ISave
     * @type {Integer (Int32)}
     */
    static ISave => 19

    /**
     * Native name: DISPID_ILoad
     * @type {Integer (Int32)}
     */
    static ILoad => 20

    /**
     * Native name: DISPID_ICreateStrokeFromPoints
     * @type {Integer (Int32)}
     */
    static ICreateStrokeFromPoints => 21

    /**
     * Native name: DISPID_IClipboardCopyWithRectangle
     * @type {Integer (Int32)}
     */
    static IClipboardCopyWithRectangle => 22

    /**
     * Native name: DISPID_IClipboardCopy
     * @type {Integer (Int32)}
     */
    static IClipboardCopy => 23

    /**
     * Native name: DISPID_ICanPaste
     * @type {Integer (Int32)}
     */
    static ICanPaste => 24

    /**
     * Native name: DISPID_IClipboardPaste
     * @type {Integer (Int32)}
     */
    static IClipboardPaste => 25
}
