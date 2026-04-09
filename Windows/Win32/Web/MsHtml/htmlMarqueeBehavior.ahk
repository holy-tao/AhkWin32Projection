#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMarqueeBehavior extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeBehaviorscroll => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeBehaviorslide => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeBehavioralternate => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlMarqueeBehavior_Max => 2147483647
}
