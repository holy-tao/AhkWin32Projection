#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class DEV_CONSOLE_MESSAGE_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DCML_INFORMATIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DCML_WARNING => 1

    /**
     * @type {Integer (Int32)}
     */
    static DCML_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEV_CONSOLE_MESSAGE_LEVEL_Max => 2147483647
}
