#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HH_GPROPID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_SINGLETHREAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_TOOLBAR_MARGIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_UI_LANGUAGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_CURRENT_SUBSET => 4

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_CONTENT_LANGUAGE => 5
}
