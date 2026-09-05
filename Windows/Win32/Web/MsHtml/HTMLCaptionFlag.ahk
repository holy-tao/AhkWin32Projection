#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLCaptionFlag extends Win32Enum {

    /**
     * Native name: HTMLCaptionFlagNo
     * @type {Integer (Int32)}
     */
    static No => 0

    /**
     * Native name: HTMLCaptionFlagYes
     * @type {Integer (Int32)}
     */
    static Yes => 12582912

    /**
     * Native name: HTMLCaptionFlag_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
