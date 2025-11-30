#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-dispid_inkeditevents
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkEditEvents extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeChange => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeSelChange => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeKeyDown => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeKeyUp => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeMouseUp => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeMouseDown => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeKeyPress => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeDblClick => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeClick => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeMouseMove => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeCursorDown => 21

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeStroke => 22

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeGesture => 23

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IeeRecognitionResult => 24
}
