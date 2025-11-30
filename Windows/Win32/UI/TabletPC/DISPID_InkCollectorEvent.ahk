#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkCollectorEvent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICEStroke => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICECursorDown => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICENewPackets => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICENewInAirPackets => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICECursorButtonDown => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICECursorButtonUp => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICECursorInRange => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICECursorOutOfRange => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICESystemGesture => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICEGesture => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICETabletAdded => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICETabletRemoved => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOEPainting => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOEPainted => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOESelectionChanging => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOESelectionChanged => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOESelectionMoving => 17

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOESelectionMoved => 18

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOESelectionResizing => 19

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOESelectionResized => 20

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOEStrokesDeleting => 21

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IOEStrokesDeleted => 22

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEChangeUICues => 23

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEClick => 24

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEDblClick => 25

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEInvalidated => 26

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEMouseDown => 27

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEMouseEnter => 28

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEMouseHover => 29

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEMouseLeave => 30

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEMouseMove => 31

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEMouseUp => 32

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEMouseWheel => 33

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPESizeModeChanged => 34

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEStyleChanged => 35

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPESystemColorsChanged => 36

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEKeyDown => 37

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEKeyPress => 38

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEKeyUp => 39

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPEResize => 40

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IPESizeChanged => 41
}
