#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class stylePointerEvents extends Win32Enum {

    /**
     * Native name: stylePointerEventsNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: stylePointerEventsVisiblePainted
     * @type {Integer (Int32)}
     */
    static VisiblePainted => 1

    /**
     * Native name: stylePointerEventsVisibleFill
     * @type {Integer (Int32)}
     */
    static VisibleFill => 2

    /**
     * Native name: stylePointerEventsVisibleStroke
     * @type {Integer (Int32)}
     */
    static VisibleStroke => 3

    /**
     * Native name: stylePointerEventsVisible
     * @type {Integer (Int32)}
     */
    static Visible => 4

    /**
     * Native name: stylePointerEventsPainted
     * @type {Integer (Int32)}
     */
    static Painted => 5

    /**
     * Native name: stylePointerEventsFill
     * @type {Integer (Int32)}
     */
    static Fill => 6

    /**
     * Native name: stylePointerEventsStroke
     * @type {Integer (Int32)}
     */
    static Stroke => 7

    /**
     * Native name: stylePointerEventsAll
     * @type {Integer (Int32)}
     */
    static All => 8

    /**
     * Native name: stylePointerEventsNone
     * @type {Integer (Int32)}
     */
    static None => 9

    /**
     * Native name: stylePointerEventsInitial
     * @type {Integer (Int32)}
     */
    static Initial => 10

    /**
     * Native name: stylePointerEventsAuto
     * @type {Integer (Int32)}
     */
    static Auto => 11

    /**
     * Native name: stylePointerEvents_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
