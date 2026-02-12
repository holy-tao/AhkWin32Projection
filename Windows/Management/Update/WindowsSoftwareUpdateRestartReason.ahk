#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateRestartReason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static System => 1

    /**
     * @type {Integer (Int32)}
     */
    static AppClose => 2

    /**
     * @type {Integer (Int32)}
     */
    static AppRestart => 3
}
