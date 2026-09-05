#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class IO_PRIORITY_HINT extends Win32Enum {

    /**
     * Native name: IoPriorityVeryLow
     * @type {Integer (Int32)}
     */
    static VeryLow => 0

    /**
     * Native name: IoPriorityLow
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Native name: IoPriorityNormal
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * Native name: IoPriorityHigh
     * @type {Integer (Int32)}
     */
    static High => 3

    /**
     * Native name: IoPriorityCritical
     * @type {Integer (Int32)}
     */
    static Critical => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaxIoPriorityTypes => 5
}
