#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_INTERRUPT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeFixed => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeLowestPriority => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeNmi => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeInit => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeSipi => 6

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeLocalInt1 => 9
}
