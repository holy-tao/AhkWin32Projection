#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HTML_HELP_COMMAND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HH_DISPLAY_TOPIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static HH_HELP_FINDER => 0

    /**
     * @type {Integer (Int32)}
     */
    static HH_DISPLAY_TOC => 1

    /**
     * @type {Integer (Int32)}
     */
    static HH_DISPLAY_INDEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static HH_DISPLAY_SEARCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static HH_SET_WIN_TYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static HH_GET_WIN_TYPE => 5

    /**
     * @type {Integer (Int32)}
     */
    static HH_GET_WIN_HANDLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static HH_ENUM_INFO_TYPE => 7

    /**
     * @type {Integer (Int32)}
     */
    static HH_SET_INFO_TYPE => 8

    /**
     * @type {Integer (Int32)}
     */
    static HH_SYNC => 9

    /**
     * @type {Integer (Int32)}
     */
    static HH_RESERVED1 => 10

    /**
     * @type {Integer (Int32)}
     */
    static HH_RESERVED2 => 11

    /**
     * @type {Integer (Int32)}
     */
    static HH_RESERVED3 => 12

    /**
     * @type {Integer (Int32)}
     */
    static HH_KEYWORD_LOOKUP => 13

    /**
     * @type {Integer (Int32)}
     */
    static HH_DISPLAY_TEXT_POPUP => 14

    /**
     * @type {Integer (Int32)}
     */
    static HH_HELP_CONTEXT => 15

    /**
     * @type {Integer (Int32)}
     */
    static HH_TP_HELP_CONTEXTMENU => 16

    /**
     * @type {Integer (Int32)}
     */
    static HH_TP_HELP_WM_HELP => 17

    /**
     * @type {Integer (Int32)}
     */
    static HH_CLOSE_ALL => 18

    /**
     * @type {Integer (Int32)}
     */
    static HH_ALINK_LOOKUP => 19

    /**
     * @type {Integer (Int32)}
     */
    static HH_GET_LAST_ERROR => 20

    /**
     * @type {Integer (Int32)}
     */
    static HH_ENUM_CATEGORY => 21

    /**
     * @type {Integer (Int32)}
     */
    static HH_ENUM_CATEGORY_IT => 22

    /**
     * @type {Integer (Int32)}
     */
    static HH_RESET_IT_FILTER => 23

    /**
     * @type {Integer (Int32)}
     */
    static HH_SET_INCLUSIVE_FILTER => 24

    /**
     * @type {Integer (Int32)}
     */
    static HH_SET_EXCLUSIVE_FILTER => 25

    /**
     * @type {Integer (Int32)}
     */
    static HH_INITIALIZE => 28

    /**
     * @type {Integer (Int32)}
     */
    static HH_UNINITIALIZE => 29

    /**
     * @type {Integer (Int32)}
     */
    static HH_SET_QUERYSERVICE => 30

    /**
     * @type {Integer (Int32)}
     */
    static HH_PRETRANSLATEMESSAGE => 253

    /**
     * @type {Integer (Int32)}
     */
    static HH_SET_GLOBAL_PROPERTY => 252

    /**
     * @type {Integer (Int32)}
     */
    static HH_SAFE_DISPLAY_TOPIC => 32

    /**
     * @type {Integer (Int32)}
     */
    static HH_MAX_TABS => 19

    /**
     * @type {Integer (Int32)}
     */
    static HH_MAX_TABS_CUSTOM => 9

    /**
     * @type {Integer (Int32)}
     */
    static HH_FTS_DEFAULT_PROXIMITY => -1
}
