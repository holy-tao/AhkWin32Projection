#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class PID_INTSITE extends Win32Enum {

    /**
     * Native name: PID_INTSITE_WHATSNEW
     * @type {Integer (Int32)}
     */
    static WHATSNEW => 2

    /**
     * Native name: PID_INTSITE_AUTHOR
     * @type {Integer (Int32)}
     */
    static AUTHOR => 3

    /**
     * Native name: PID_INTSITE_LASTVISIT
     * @type {Integer (Int32)}
     */
    static LASTVISIT => 4

    /**
     * Native name: PID_INTSITE_LASTMOD
     * @type {Integer (Int32)}
     */
    static LASTMOD => 5

    /**
     * Native name: PID_INTSITE_VISITCOUNT
     * @type {Integer (Int32)}
     */
    static VISITCOUNT => 6

    /**
     * Native name: PID_INTSITE_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 7

    /**
     * Native name: PID_INTSITE_COMMENT
     * @type {Integer (Int32)}
     */
    static COMMENT => 8

    /**
     * Native name: PID_INTSITE_FLAGS
     * @type {Integer (Int32)}
     */
    static FLAGS => 9

    /**
     * Native name: PID_INTSITE_CONTENTLEN
     * @type {Integer (Int32)}
     */
    static CONTENTLEN => 10

    /**
     * Native name: PID_INTSITE_CONTENTCODE
     * @type {Integer (Int32)}
     */
    static CONTENTCODE => 11

    /**
     * Native name: PID_INTSITE_RECURSE
     * @type {Integer (Int32)}
     */
    static RECURSE => 12

    /**
     * Native name: PID_INTSITE_WATCH
     * @type {Integer (Int32)}
     */
    static WATCH => 13

    /**
     * Native name: PID_INTSITE_SUBSCRIPTION
     * @type {Integer (Int32)}
     */
    static SUBSCRIPTION => 14

    /**
     * Native name: PID_INTSITE_URL
     * @type {Integer (Int32)}
     */
    static URL => 15

    /**
     * Native name: PID_INTSITE_TITLE
     * @type {Integer (Int32)}
     */
    static TITLE => 16

    /**
     * Native name: PID_INTSITE_CODEPAGE
     * @type {Integer (Int32)}
     */
    static CODEPAGE => 18

    /**
     * Native name: PID_INTSITE_TRACKING
     * @type {Integer (Int32)}
     */
    static TRACKING => 19

    /**
     * Native name: PID_INTSITE_ICONINDEX
     * @type {Integer (Int32)}
     */
    static ICONINDEX => 20

    /**
     * Native name: PID_INTSITE_ICONFILE
     * @type {Integer (Int32)}
     */
    static ICONFILE => 21

    /**
     * Native name: PID_INTSITE_ROAMED
     * @type {Integer (Int32)}
     */
    static ROAMED => 34
}
