#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IRQ_PRIORITY extends Win32Enum {

    /**
     * Native name: IrqPriorityUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: IrqPriorityLow
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Native name: IrqPriorityNormal
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * Native name: IrqPriorityHigh
     * @type {Integer (Int32)}
     */
    static High => 3
}
