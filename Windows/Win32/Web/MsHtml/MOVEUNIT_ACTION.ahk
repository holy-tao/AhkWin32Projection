#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class MOVEUNIT_ACTION extends Win32Enum {

    /**
     * Native name: MOVEUNIT_PREVCHAR
     * @type {Integer (Int32)}
     */
    static PREVCHAR => 0

    /**
     * Native name: MOVEUNIT_NEXTCHAR
     * @type {Integer (Int32)}
     */
    static NEXTCHAR => 1

    /**
     * Native name: MOVEUNIT_PREVCLUSTERBEGIN
     * @type {Integer (Int32)}
     */
    static PREVCLUSTERBEGIN => 2

    /**
     * Native name: MOVEUNIT_NEXTCLUSTERBEGIN
     * @type {Integer (Int32)}
     */
    static NEXTCLUSTERBEGIN => 3

    /**
     * Native name: MOVEUNIT_PREVCLUSTEREND
     * @type {Integer (Int32)}
     */
    static PREVCLUSTEREND => 4

    /**
     * Native name: MOVEUNIT_NEXTCLUSTEREND
     * @type {Integer (Int32)}
     */
    static NEXTCLUSTEREND => 5

    /**
     * Native name: MOVEUNIT_PREVWORDBEGIN
     * @type {Integer (Int32)}
     */
    static PREVWORDBEGIN => 6

    /**
     * Native name: MOVEUNIT_NEXTWORDBEGIN
     * @type {Integer (Int32)}
     */
    static NEXTWORDBEGIN => 7

    /**
     * Native name: MOVEUNIT_PREVWORDEND
     * @type {Integer (Int32)}
     */
    static PREVWORDEND => 8

    /**
     * Native name: MOVEUNIT_NEXTWORDEND
     * @type {Integer (Int32)}
     */
    static NEXTWORDEND => 9

    /**
     * Native name: MOVEUNIT_PREVPROOFWORD
     * @type {Integer (Int32)}
     */
    static PREVPROOFWORD => 10

    /**
     * Native name: MOVEUNIT_NEXTPROOFWORD
     * @type {Integer (Int32)}
     */
    static NEXTPROOFWORD => 11

    /**
     * Native name: MOVEUNIT_NEXTURLBEGIN
     * @type {Integer (Int32)}
     */
    static NEXTURLBEGIN => 12

    /**
     * Native name: MOVEUNIT_PREVURLBEGIN
     * @type {Integer (Int32)}
     */
    static PREVURLBEGIN => 13

    /**
     * Native name: MOVEUNIT_NEXTURLEND
     * @type {Integer (Int32)}
     */
    static NEXTURLEND => 14

    /**
     * Native name: MOVEUNIT_PREVURLEND
     * @type {Integer (Int32)}
     */
    static PREVURLEND => 15

    /**
     * Native name: MOVEUNIT_PREVSENTENCE
     * @type {Integer (Int32)}
     */
    static PREVSENTENCE => 16

    /**
     * Native name: MOVEUNIT_NEXTSENTENCE
     * @type {Integer (Int32)}
     */
    static NEXTSENTENCE => 17

    /**
     * Native name: MOVEUNIT_PREVBLOCK
     * @type {Integer (Int32)}
     */
    static PREVBLOCK => 18

    /**
     * Native name: MOVEUNIT_NEXTBLOCK
     * @type {Integer (Int32)}
     */
    static NEXTBLOCK => 19

    /**
     * Native name: MOVEUNIT_ACTION_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
