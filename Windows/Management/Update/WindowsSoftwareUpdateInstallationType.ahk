#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateInstallationType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WindowsUpdate => 0

    /**
     * @type {Integer (Int32)}
     */
    static AppPackage => 1

    /**
     * @type {Integer (Int32)}
     */
    static Executable => 2

    /**
     * @type {Integer (Int32)}
     */
    static Powershell => 3
}
