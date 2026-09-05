#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class MINIDUMP_THREAD_INFO_DUMP_FLAGS extends Win32Enum {

    /**
     * Native name: MINIDUMP_THREAD_INFO_ERROR_THREAD
     * @type {Integer (UInt32)}
     */
    static ERROR_THREAD => 1

    /**
     * Native name: MINIDUMP_THREAD_INFO_EXITED_THREAD
     * @type {Integer (UInt32)}
     */
    static EXITED_THREAD => 4

    /**
     * Native name: MINIDUMP_THREAD_INFO_INVALID_CONTEXT
     * @type {Integer (UInt32)}
     */
    static INVALID_CONTEXT => 16

    /**
     * Native name: MINIDUMP_THREAD_INFO_INVALID_INFO
     * @type {Integer (UInt32)}
     */
    static INVALID_INFO => 8

    /**
     * Native name: MINIDUMP_THREAD_INFO_INVALID_TEB
     * @type {Integer (UInt32)}
     */
    static INVALID_TEB => 32

    /**
     * Native name: MINIDUMP_THREAD_INFO_WRITING_THREAD
     * @type {Integer (UInt32)}
     */
    static WRITING_THREAD => 2
}
