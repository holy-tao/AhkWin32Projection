#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateActionResult extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * @type {Integer (Int32)}
     */
    static Continue => 1

    /**
     * @type {Integer (Int32)}
     */
    static Failed => 2

    /**
     * @type {Integer (Int32)}
     */
    static Canceled => 3

    /**
     * @type {Integer (Int32)}
     */
    static Removed => 4
}
