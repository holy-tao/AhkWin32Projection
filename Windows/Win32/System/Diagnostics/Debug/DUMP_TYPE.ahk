#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DUMP_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_INVALID => -1

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_FULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_SUMMARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_HEADER => 3

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_TRIAGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_BITMAP_FULL => 5

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_BITMAP_KERNEL => 6

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_AUTOMATIC => 7
}
