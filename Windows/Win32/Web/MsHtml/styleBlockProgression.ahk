#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBlockProgression extends Win32Enum {

    /**
     * Native name: styleBlockProgressionTb
     * @type {Integer (Int32)}
     */
    static Tb => 0

    /**
     * Native name: styleBlockProgressionRl
     * @type {Integer (Int32)}
     */
    static Rl => 1

    /**
     * Native name: styleBlockProgressionBt
     * @type {Integer (Int32)}
     */
    static Bt => 2

    /**
     * Native name: styleBlockProgressionLr
     * @type {Integer (Int32)}
     */
    static Lr => 3

    /**
     * Native name: styleBlockProgressionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleBlockProgression_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
