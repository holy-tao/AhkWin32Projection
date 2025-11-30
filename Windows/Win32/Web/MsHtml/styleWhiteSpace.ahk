#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleWhiteSpace extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleWhiteSpaceNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWhiteSpaceNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWhiteSpacePre => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWhiteSpaceNowrap => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWhiteSpacePreline => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleWhiteSpacePrewrap => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleWhiteSpace_Max => 2147483647
}
