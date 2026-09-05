#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWebkitBoxDirection extends Win32Enum {

    /**
     * Native name: styleWebkitBoxDirectionNormal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: styleWebkitBoxDirectionReverse
     * @type {Integer (Int32)}
     */
    static Reverse => 1

    /**
     * Native name: styleWebkitBoxDirectionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleWebkitBoxDirection_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
