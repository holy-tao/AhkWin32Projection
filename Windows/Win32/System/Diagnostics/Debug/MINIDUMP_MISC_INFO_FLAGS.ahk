#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class MINIDUMP_MISC_INFO_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: MINIDUMP_MISC1_PROCESS_ID
     * @type {Integer (UInt32)}
     */
    static MISC1_PROCESS_ID => 1

    /**
     * Native name: MINIDUMP_MISC1_PROCESS_TIMES
     * @type {Integer (UInt32)}
     */
    static MISC1_PROCESS_TIMES => 2
}
