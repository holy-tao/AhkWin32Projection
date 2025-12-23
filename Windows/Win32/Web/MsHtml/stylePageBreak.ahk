#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class stylePageBreak extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakAlways => 2

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakLeft => 3

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakAvoid => 5

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreak_Max => 2147483647
}
