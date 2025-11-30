#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_THREAD_INFO_DUMP_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_ERROR_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_EXITED_THREAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_INVALID_CONTEXT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_INVALID_INFO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_INVALID_TEB => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_THREAD_INFO_WRITING_THREAD => 2
}
