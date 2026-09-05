#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class LoadHintEnum extends Win32Enum {

    /**
     * Native name: LoadDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: LoadAlways
     * @type {Integer (Int32)}
     */
    static Always => 1

    /**
     * Native name: LoadSometimes
     * @type {Integer (Int32)}
     */
    static Sometimes => 2

    /**
     * Native name: LoadNever
     * @type {Integer (Int32)}
     */
    static Never => 3
}
