#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_INDICATOR_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IndicatorOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static IndicatorBlink => 2

    /**
     * @type {Integer (Int32)}
     */
    static IndicatorOff => 3
}
