#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class ENUM_PROCESS_MODULES_EX_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LIST_MODULES_ALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LIST_MODULES_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LIST_MODULES_32BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIST_MODULES_64BIT => 2
}
