#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMarqueeBehavior extends Win32Enum {

    /**
     * Native name: htmlMarqueeBehaviorscroll
     * @type {Integer (Int32)}
     */
    static Behaviorscroll => 1

    /**
     * Native name: htmlMarqueeBehaviorslide
     * @type {Integer (Int32)}
     */
    static Behaviorslide => 2

    /**
     * Native name: htmlMarqueeBehavioralternate
     * @type {Integer (Int32)}
     */
    static Behavioralternate => 3

    /**
     * Native name: htmlMarqueeBehavior_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
