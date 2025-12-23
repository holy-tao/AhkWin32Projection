#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class FA_ENTRY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_NO_TYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ULONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ULONG64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_INSTRUCTION_OFFSET => 3

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_POINTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ANSI_STRING => 5

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ANSI_STRINGs => 6

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_EXTENSION_CMD => 7

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_STRUCTURED_DATA => 8

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_UNICODE_STRING => 9

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ARRAY => 32768
}
