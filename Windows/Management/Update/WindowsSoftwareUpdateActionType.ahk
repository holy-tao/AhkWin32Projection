#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateActionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Download => 0

    /**
     * @type {Integer (Int32)}
     */
    static Install => 1

    /**
     * @type {Integer (Int32)}
     */
    static Deploy => 2

    /**
     * @type {Integer (Int32)}
     */
    static Reboot => 3

    /**
     * @type {Integer (Int32)}
     */
    static AppRestart => 4
}
