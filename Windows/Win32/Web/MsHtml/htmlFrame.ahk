#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlFrame extends Win32Enum {

    /**
     * Native name: htmlFrameNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlFramevoid
     * @type {Integer (Int32)}
     */
    static Framevoid => 1

    /**
     * Native name: htmlFrameabove
     * @type {Integer (Int32)}
     */
    static Frameabove => 2

    /**
     * Native name: htmlFramebelow
     * @type {Integer (Int32)}
     */
    static Framebelow => 3

    /**
     * Native name: htmlFramehsides
     * @type {Integer (Int32)}
     */
    static Framehsides => 4

    /**
     * Native name: htmlFramelhs
     * @type {Integer (Int32)}
     */
    static Framelhs => 5

    /**
     * Native name: htmlFramerhs
     * @type {Integer (Int32)}
     */
    static Framerhs => 6

    /**
     * Native name: htmlFramevsides
     * @type {Integer (Int32)}
     */
    static Framevsides => 7

    /**
     * Native name: htmlFramebox
     * @type {Integer (Int32)}
     */
    static Framebox => 8

    /**
     * Native name: htmlFrameborder
     * @type {Integer (Int32)}
     */
    static Frameborder => 9

    /**
     * Native name: htmlFrame_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
