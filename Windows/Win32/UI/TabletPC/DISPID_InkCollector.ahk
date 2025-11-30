#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkCollector extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICEnabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICHwnd => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICPaint => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICText => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICDefaultDrawingAttributes => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICRenderer => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICInk => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICAutoRedraw => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICCollectingInk => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICSetEventInterest => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICGetEventInterest => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOEditingMode => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOSelection => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOAttachMode => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOHitTestSelection => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IODraw => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPPicture => 17

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPSizeMode => 18

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPBackColor => 19

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICCursors => 20

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICMarginX => 21

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICMarginY => 22

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICSetWindowInputRectangle => 23

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICGetWindowInputRectangle => 24

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICTablet => 25

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICSetAllTabletsMode => 26

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICSetSingleTabletIntegratedMode => 27

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICCollectionMode => 28

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICSetGestureStatus => 29

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICGetGestureStatus => 30

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICDynamicRendering => 31

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICDesiredPacketDescription => 32

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOEraserMode => 33

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOEraserWidth => 34

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICMouseIcon => 35

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICMousePointer => 36

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPInkEnabled => 37

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICSupportHighContrastInk => 38

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOSupportHighContrastSelectionUI => 39
}
