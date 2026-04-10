#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class LoadHintEnum extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static LoadDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static LoadAlways => 1

    /**
     * @type {Integer (Int32)}
     */
    static LoadSometimes => 2

    /**
     * @type {Integer (Int32)}
     */
    static LoadNever => 3
}
