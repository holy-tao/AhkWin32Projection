#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * An enumeration containing 4 levels of app memory usage: low, medium, high, and overlimit.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryusagelevel
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppMemoryUsageLevel extends Win32Enum{

    /**
     * Low app memory usage.
     * @type {Integer (Int32)}
     */
    static Low => 0

    /**
     * Medium app memory usage.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * High app memory usage.
     * @type {Integer (Int32)}
     */
    static High => 2

    /**
     * App memory usage is over the limit.
     * @type {Integer (Int32)}
     */
    static OverLimit => 3
}
