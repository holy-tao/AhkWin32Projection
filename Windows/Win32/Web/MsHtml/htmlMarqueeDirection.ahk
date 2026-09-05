#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMarqueeDirection extends Win32Enum {

    /**
     * Native name: htmlMarqueeDirectionleft
     * @type {Integer (Int32)}
     */
    static Directionleft => 1

    /**
     * Native name: htmlMarqueeDirectionright
     * @type {Integer (Int32)}
     */
    static Directionright => 3

    /**
     * Native name: htmlMarqueeDirectionup
     * @type {Integer (Int32)}
     */
    static Directionup => 5

    /**
     * Native name: htmlMarqueeDirectiondown
     * @type {Integer (Int32)}
     */
    static Directiondown => 7

    /**
     * Native name: htmlMarqueeDirection_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
