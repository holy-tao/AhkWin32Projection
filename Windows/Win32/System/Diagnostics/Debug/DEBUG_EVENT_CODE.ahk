#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DEBUG_EVENT_CODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_PROCESS_DEBUG_EVENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_THREAD_DEBUG_EVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_DEBUG_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXIT_PROCESS_DEBUG_EVENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EXIT_THREAD_DEBUG_EVENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_DLL_DEBUG_EVENT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static OUTPUT_DEBUG_STRING_EVENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RIP_EVENT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static UNLOAD_DLL_DEBUG_EVENT => 7
}
