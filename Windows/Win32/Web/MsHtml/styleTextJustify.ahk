#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextJustify extends Win32Enum {

    /**
     * Native name: styleTextJustifyNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleTextJustifyInterWord
     * @type {Integer (Int32)}
     */
    static InterWord => 1

    /**
     * Native name: styleTextJustifyNewspaper
     * @type {Integer (Int32)}
     */
    static Newspaper => 2

    /**
     * Native name: styleTextJustifyDistribute
     * @type {Integer (Int32)}
     */
    static Distribute => 3

    /**
     * Native name: styleTextJustifyDistributeAllLines
     * @type {Integer (Int32)}
     */
    static DistributeAllLines => 4

    /**
     * Native name: styleTextJustifyInterIdeograph
     * @type {Integer (Int32)}
     */
    static InterIdeograph => 5

    /**
     * Native name: styleTextJustifyInterCluster
     * @type {Integer (Int32)}
     */
    static InterCluster => 6

    /**
     * Native name: styleTextJustifyKashida
     * @type {Integer (Int32)}
     */
    static Kashida => 7

    /**
     * Native name: styleTextJustifyAuto
     * @type {Integer (Int32)}
     */
    static Auto => 8

    /**
     * Native name: styleTextJustify_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
