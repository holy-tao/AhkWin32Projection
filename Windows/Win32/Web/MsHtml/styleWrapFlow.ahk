#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWrapFlow extends Win32Enum {

    /**
     * Native name: styleWrapFlowNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleWrapFlowAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleWrapFlowBoth
     * @type {Integer (Int32)}
     */
    static Both => 2

    /**
     * Native name: styleWrapFlowStart
     * @type {Integer (Int32)}
     */
    static Start => 3

    /**
     * Native name: styleWrapFlowEnd
     * @type {Integer (Int32)}
     */
    static End => 4

    /**
     * Native name: styleWrapFlowClear
     * @type {Integer (Int32)}
     */
    static Clear => 5

    /**
     * Native name: styleWrapFlowMinimum
     * @type {Integer (Int32)}
     */
    static Minimum => 6

    /**
     * Native name: styleWrapFlowMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 7

    /**
     * Native name: styleWrapFlow_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
