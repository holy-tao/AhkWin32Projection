#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkCollectorEvent extends Win32Enum {

    /**
     * Native name: DISPID_ICEStroke
     * @type {Integer (Int32)}
     */
    static ICEStroke => 1

    /**
     * Native name: DISPID_ICECursorDown
     * @type {Integer (Int32)}
     */
    static ICECursorDown => 2

    /**
     * Native name: DISPID_ICENewPackets
     * @type {Integer (Int32)}
     */
    static ICENewPackets => 3

    /**
     * Native name: DISPID_ICENewInAirPackets
     * @type {Integer (Int32)}
     */
    static ICENewInAirPackets => 4

    /**
     * Native name: DISPID_ICECursorButtonDown
     * @type {Integer (Int32)}
     */
    static ICECursorButtonDown => 5

    /**
     * Native name: DISPID_ICECursorButtonUp
     * @type {Integer (Int32)}
     */
    static ICECursorButtonUp => 6

    /**
     * Native name: DISPID_ICECursorInRange
     * @type {Integer (Int32)}
     */
    static ICECursorInRange => 7

    /**
     * Native name: DISPID_ICECursorOutOfRange
     * @type {Integer (Int32)}
     */
    static ICECursorOutOfRange => 8

    /**
     * Native name: DISPID_ICESystemGesture
     * @type {Integer (Int32)}
     */
    static ICESystemGesture => 9

    /**
     * Native name: DISPID_ICEGesture
     * @type {Integer (Int32)}
     */
    static ICEGesture => 10

    /**
     * Native name: DISPID_ICETabletAdded
     * @type {Integer (Int32)}
     */
    static ICETabletAdded => 11

    /**
     * Native name: DISPID_ICETabletRemoved
     * @type {Integer (Int32)}
     */
    static ICETabletRemoved => 12

    /**
     * Native name: DISPID_IOEPainting
     * @type {Integer (Int32)}
     */
    static IOEPainting => 13

    /**
     * Native name: DISPID_IOEPainted
     * @type {Integer (Int32)}
     */
    static IOEPainted => 14

    /**
     * Native name: DISPID_IOESelectionChanging
     * @type {Integer (Int32)}
     */
    static IOESelectionChanging => 15

    /**
     * Native name: DISPID_IOESelectionChanged
     * @type {Integer (Int32)}
     */
    static IOESelectionChanged => 16

    /**
     * Native name: DISPID_IOESelectionMoving
     * @type {Integer (Int32)}
     */
    static IOESelectionMoving => 17

    /**
     * Native name: DISPID_IOESelectionMoved
     * @type {Integer (Int32)}
     */
    static IOESelectionMoved => 18

    /**
     * Native name: DISPID_IOESelectionResizing
     * @type {Integer (Int32)}
     */
    static IOESelectionResizing => 19

    /**
     * Native name: DISPID_IOESelectionResized
     * @type {Integer (Int32)}
     */
    static IOESelectionResized => 20

    /**
     * Native name: DISPID_IOEStrokesDeleting
     * @type {Integer (Int32)}
     */
    static IOEStrokesDeleting => 21

    /**
     * Native name: DISPID_IOEStrokesDeleted
     * @type {Integer (Int32)}
     */
    static IOEStrokesDeleted => 22

    /**
     * Native name: DISPID_IPEChangeUICues
     * @type {Integer (Int32)}
     */
    static IPEChangeUICues => 23

    /**
     * Native name: DISPID_IPEClick
     * @type {Integer (Int32)}
     */
    static IPEClick => 24

    /**
     * Native name: DISPID_IPEDblClick
     * @type {Integer (Int32)}
     */
    static IPEDblClick => 25

    /**
     * Native name: DISPID_IPEInvalidated
     * @type {Integer (Int32)}
     */
    static IPEInvalidated => 26

    /**
     * Native name: DISPID_IPEMouseDown
     * @type {Integer (Int32)}
     */
    static IPEMouseDown => 27

    /**
     * Native name: DISPID_IPEMouseEnter
     * @type {Integer (Int32)}
     */
    static IPEMouseEnter => 28

    /**
     * Native name: DISPID_IPEMouseHover
     * @type {Integer (Int32)}
     */
    static IPEMouseHover => 29

    /**
     * Native name: DISPID_IPEMouseLeave
     * @type {Integer (Int32)}
     */
    static IPEMouseLeave => 30

    /**
     * Native name: DISPID_IPEMouseMove
     * @type {Integer (Int32)}
     */
    static IPEMouseMove => 31

    /**
     * Native name: DISPID_IPEMouseUp
     * @type {Integer (Int32)}
     */
    static IPEMouseUp => 32

    /**
     * Native name: DISPID_IPEMouseWheel
     * @type {Integer (Int32)}
     */
    static IPEMouseWheel => 33

    /**
     * Native name: DISPID_IPESizeModeChanged
     * @type {Integer (Int32)}
     */
    static IPESizeModeChanged => 34

    /**
     * Native name: DISPID_IPEStyleChanged
     * @type {Integer (Int32)}
     */
    static IPEStyleChanged => 35

    /**
     * Native name: DISPID_IPESystemColorsChanged
     * @type {Integer (Int32)}
     */
    static IPESystemColorsChanged => 36

    /**
     * Native name: DISPID_IPEKeyDown
     * @type {Integer (Int32)}
     */
    static IPEKeyDown => 37

    /**
     * Native name: DISPID_IPEKeyPress
     * @type {Integer (Int32)}
     */
    static IPEKeyPress => 38

    /**
     * Native name: DISPID_IPEKeyUp
     * @type {Integer (Int32)}
     */
    static IPEKeyUp => 39

    /**
     * Native name: DISPID_IPEResize
     * @type {Integer (Int32)}
     */
    static IPEResize => 40

    /**
     * Native name: DISPID_IPESizeChanged
     * @type {Integer (Int32)}
     */
    static IPESizeChanged => 41
}
