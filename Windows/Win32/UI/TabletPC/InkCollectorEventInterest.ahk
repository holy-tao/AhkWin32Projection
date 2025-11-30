#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used to specify whether an event occurred on an ink collector and, if so, which event fired.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkcollectoreventinterest
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkCollectorEventInterest extends Win32Enum{

    /**
     * The ink collector is interested in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-stroke">Stroke</a>, <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-cursorinrange">CursorInRange</a>, and <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-cursoroutofrange">CursorOutOfRange</a> events.
     * @type {Integer (Int32)}
     */
    static ICEI_DefaultEvents => -1

    /**
     * The ink collector detects a cursor down.
     * @type {Integer (Int32)}
     */
    static ICEI_CursorDown => 0

    /**
     * Specifies that a new stroke is drawn on a tablet.
     * @type {Integer (Int32)}
     */
    static ICEI_Stroke => 1

    /**
     * The ink collector receives a <i>packet</i>.
     * @type {Integer (Int32)}
     */
    static ICEI_NewPackets => 2

    /**
     * The ink collector detects an in-air packet.
     * @type {Integer (Int32)}
     */
    static ICEI_NewInAirPackets => 3

    /**
     * The ink collector detects a cursor button down.
     * @type {Integer (Int32)}
     */
    static ICEI_CursorButtonDown => 4

    /**
     * The ink collector detects a cursor button up.
     * @type {Integer (Int32)}
     */
    static ICEI_CursorButtonUp => 5

    /**
     * Specifies that a cursor is detected in range of a tablet.
     * @type {Integer (Int32)}
     */
    static ICEI_CursorInRange => 6

    /**
     * Specifies that a cursor is detected leaving the range of a tablet.
     * @type {Integer (Int32)}
     */
    static ICEI_CursorOutOfRange => 7

    /**
     * The ink collector recognizes a system gesture.
     * @type {Integer (Int32)}
     */
    static ICEI_SystemGesture => 8

    /**
     * Specifies that a tablet was added to the system.
     * @type {Integer (Int32)}
     */
    static ICEI_TabletAdded => 9

    /**
     * Specifies that a tablet was removed from the system.
     * @type {Integer (Int32)}
     */
    static ICEI_TabletRemoved => 10

    /**
     * The mouse pointer is over the object and a mouse button is pressed.
     * @type {Integer (Int32)}
     */
    static ICEI_MouseDown => 11

    /**
     * The mouse pointer is moved over the object.
     * @type {Integer (Int32)}
     */
    static ICEI_MouseMove => 12

    /**
     * The mouse pointer is over the object and a mouse button is released.
     * @type {Integer (Int32)}
     */
    static ICEI_MouseUp => 13

    /**
     * The mouse wheel moves while the object has focus.
     * @type {Integer (Int32)}
     */
    static ICEI_MouseWheel => 14

    /**
     * The object was double-clicked.
     * @type {Integer (Int32)}
     */
    static ICEI_DblClick => 15

    /**
     * The ink collector recognizes all events.
     * @type {Integer (Int32)}
     */
    static ICEI_AllEvents => 16
}
