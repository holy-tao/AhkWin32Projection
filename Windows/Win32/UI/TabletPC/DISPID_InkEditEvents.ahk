#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies various ink editor events.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-dispid_inkeditevents
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkEditEvents extends Win32Enum {

    /**
     * Content changed.
     * Native name: DISPID_IeeChange
     * @type {Integer (Int32)}
     */
    static IeeChange => 1

    /**
     * Selection changed.
     * Native name: DISPID_IeeSelChange
     * @type {Integer (Int32)}
     */
    static IeeSelChange => 2

    /**
     * Key down.
     * Native name: DISPID_IeeKeyDown
     * @type {Integer (Int32)}
     */
    static IeeKeyDown => 3

    /**
     * Key up.
     * Native name: DISPID_IeeKeyUp
     * @type {Integer (Int32)}
     */
    static IeeKeyUp => 4

    /**
     * Mouse button up.
     * Native name: DISPID_IeeMouseUp
     * @type {Integer (Int32)}
     */
    static IeeMouseUp => 5

    /**
     * Mouse button down.
     * Native name: DISPID_IeeMouseDown
     * @type {Integer (Int32)}
     */
    static IeeMouseDown => 6

    /**
     * Key press and release.
     * Native name: DISPID_IeeKeyPress
     * @type {Integer (Int32)}
     */
    static IeeKeyPress => 7

    /**
     * Double click.
     * Native name: DISPID_IeeDblClick
     * @type {Integer (Int32)}
     */
    static IeeDblClick => 8

    /**
     * Single click.
     * Native name: DISPID_IeeClick
     * @type {Integer (Int32)}
     */
    static IeeClick => 9

    /**
     * Mouse move.
     * Native name: DISPID_IeeMouseMove
     * @type {Integer (Int32)}
     */
    static IeeMouseMove => 10

    /**
     * Cursor down.
     * Native name: DISPID_IeeCursorDown
     * @type {Integer (Int32)}
     */
    static IeeCursorDown => 21

    /**
     * Ink stroke.
     * Native name: DISPID_IeeStroke
     * @type {Integer (Int32)}
     */
    static IeeStroke => 22

    /**
     * Ink gesture.
     * Native name: DISPID_IeeGesture
     * @type {Integer (Int32)}
     */
    static IeeGesture => 23

    /**
     * Recognition result.
     * Native name: DISPID_IeeRecognitionResult
     * @type {Integer (Int32)}
     */
    static IeeRecognitionResult => 24
}
