#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class DUMP_TYPE extends Win32Enum {

    /**
     * Native name: DUMP_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => -1

    /**
     * Native name: DUMP_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: DUMP_TYPE_FULL
     * @type {Integer (Int32)}
     */
    static FULL => 1

    /**
     * Native name: DUMP_TYPE_SUMMARY
     * @type {Integer (Int32)}
     */
    static SUMMARY => 2

    /**
     * Native name: DUMP_TYPE_HEADER
     * @type {Integer (Int32)}
     */
    static HEADER => 3

    /**
     * Native name: DUMP_TYPE_TRIAGE
     * @type {Integer (Int32)}
     */
    static TRIAGE => 4

    /**
     * Native name: DUMP_TYPE_BITMAP_FULL
     * @type {Integer (Int32)}
     */
    static BITMAP_FULL => 5

    /**
     * Native name: DUMP_TYPE_BITMAP_KERNEL
     * @type {Integer (Int32)}
     */
    static BITMAP_KERNEL => 6

    /**
     * Native name: DUMP_TYPE_AUTOMATIC
     * @type {Integer (Int32)}
     */
    static AUTOMATIC => 7
}
