#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleWrapFlow extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowBoth => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowStart => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowEnd => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowClear => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowMinimum => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowMaximum => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlow_Max => 2147483647
}
