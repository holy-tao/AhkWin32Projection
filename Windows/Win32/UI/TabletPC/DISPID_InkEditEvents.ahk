#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies various ink editor events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-dispid_inkeditevents
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkEditEvents extends Win32Enum{

    /**
     * Content changed.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeChange => 1

    /**
     * Selection changed.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeSelChange => 2

    /**
     * Key down.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeKeyDown => 3

    /**
     * Key up.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeKeyUp => 4

    /**
     * Mouse button up.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeMouseUp => 5

    /**
     * Mouse button down.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeMouseDown => 6

    /**
     * Key press and release.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeKeyPress => 7

    /**
     * Double click.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeDblClick => 8

    /**
     * Single click.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeClick => 9

    /**
     * Mouse move.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeMouseMove => 10

    /**
     * Cursor down.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeCursorDown => 21

    /**
     * Ink stroke.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeStroke => 22

    /**
     * Ink gesture.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeGesture => 23

    /**
     * Recognition result.
     * @type {Integer (Int32)}
     */
    static DISPID_IeeRecognitionResult => 24
}
