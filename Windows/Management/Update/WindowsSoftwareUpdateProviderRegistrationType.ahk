#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateProviderRegistrationType extends Win32Enum{

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
    static Windows => 2

    /**
     * @type {Integer (Int32)}
     */
    static Pending => 3

    /**
     * @type {Integer (Int32)}
     */
    static Registered => 4

    /**
     * @type {Integer (Int32)}
     */
    static Unregistered => 5
}
