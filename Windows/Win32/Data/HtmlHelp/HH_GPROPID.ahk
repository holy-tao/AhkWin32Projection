#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
class HH_GPROPID extends Win32Enum {

    /**
     * Native name: HH_GPROPID_SINGLETHREAD
     * @type {Integer (Int32)}
     */
    static SINGLETHREAD => 1

    /**
     * Native name: HH_GPROPID_TOOLBAR_MARGIN
     * @type {Integer (Int32)}
     */
    static TOOLBAR_MARGIN => 2

    /**
     * Native name: HH_GPROPID_UI_LANGUAGE
     * @type {Integer (Int32)}
     */
    static UI_LANGUAGE => 3

    /**
     * Native name: HH_GPROPID_CURRENT_SUBSET
     * @type {Integer (Int32)}
     */
    static CURRENT_SUBSET => 4

    /**
     * Native name: HH_GPROPID_CONTENT_LANGUAGE
     * @type {Integer (Int32)}
     */
    static CONTENT_LANGUAGE => 5
}
