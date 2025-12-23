#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MISC_INFO_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC1_PROCESS_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC1_PROCESS_TIMES => 2
}
