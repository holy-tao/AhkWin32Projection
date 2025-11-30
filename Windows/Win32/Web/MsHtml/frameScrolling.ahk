#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class frameScrolling extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static frameScrollingyes => 1

    /**
     * @type {Integer (Int32)}
     */
    static frameScrollingno => 2

    /**
     * @type {Integer (Int32)}
     */
    static frameScrollingauto => 4

    /**
     * @type {Integer (Int32)}
     */
    static frameScrolling_Max => 2147483647
}
