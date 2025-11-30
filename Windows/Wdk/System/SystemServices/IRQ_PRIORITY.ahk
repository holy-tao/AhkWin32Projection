#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IRQ_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IrqPriorityUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static IrqPriorityLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static IrqPriorityNormal => 2

    /**
     * @type {Integer (Int32)}
     */
    static IrqPriorityHigh => 3
}
