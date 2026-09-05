#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class DISPLAY_MOVEUNIT extends Win32Enum {

    /**
     * Native name: DISPLAY_MOVEUNIT_PreviousLine
     * @type {Integer (Int32)}
     */
    static PreviousLine => 1

    /**
     * Native name: DISPLAY_MOVEUNIT_NextLine
     * @type {Integer (Int32)}
     */
    static NextLine => 2

    /**
     * Native name: DISPLAY_MOVEUNIT_CurrentLineStart
     * @type {Integer (Int32)}
     */
    static CurrentLineStart => 3

    /**
     * Native name: DISPLAY_MOVEUNIT_CurrentLineEnd
     * @type {Integer (Int32)}
     */
    static CurrentLineEnd => 4

    /**
     * Native name: DISPLAY_MOVEUNIT_TopOfWindow
     * @type {Integer (Int32)}
     */
    static TopOfWindow => 5

    /**
     * Native name: DISPLAY_MOVEUNIT_BottomOfWindow
     * @type {Integer (Int32)}
     */
    static BottomOfWindow => 6

    /**
     * Native name: DISPLAY_MOVEUNIT_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
