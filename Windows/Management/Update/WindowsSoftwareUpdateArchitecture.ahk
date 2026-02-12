#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateArchitecture extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Neutral => 0

    /**
     * @type {Integer (Int32)}
     */
    static X86 => 1

    /**
     * @type {Integer (Int32)}
     */
    static X64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Arm => 3

    /**
     * @type {Integer (Int32)}
     */
    static Arm64 => 4
}
