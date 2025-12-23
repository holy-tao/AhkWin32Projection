#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleColumnSpan extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnSpanNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnSpanAll => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnSpanOne => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnSpanNotSet => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnSpan_Max => 2147483647
}
