#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMarqueeDirection extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirectionleft => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirectionright => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirectionup => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirectiondown => 7

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeDirection_Max => 2147483647
}
