#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleBlockProgression extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleBlockProgressionTb => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBlockProgressionRl => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBlockProgressionBt => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBlockProgressionLr => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBlockProgressionNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleBlockProgression_Max => 2147483647
}
