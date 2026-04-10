#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_ALLOCATION_ACTION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KeepObject => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeallocateObject => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeallocateObjectKeepRegisters => 3
}
