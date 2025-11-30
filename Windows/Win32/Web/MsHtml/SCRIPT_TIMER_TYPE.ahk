#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class SCRIPT_TIMER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static STT_TIMEOUT => 0

    /**
     * @type {Integer (Int32)}
     */
    static STT_INTERVAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static STT_IMMEDIATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static STT_ANIMATION_FRAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPT_TIMER_TYPE_Max => 2147483647
}
