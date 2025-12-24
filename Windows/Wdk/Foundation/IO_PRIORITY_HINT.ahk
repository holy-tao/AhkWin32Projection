#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class IO_PRIORITY_HINT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityVeryLow => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityNormal => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityHigh => 3

    /**
     * @type {Integer (Int32)}
     */
    static IoPriorityCritical => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaxIoPriorityTypes => 5
}
