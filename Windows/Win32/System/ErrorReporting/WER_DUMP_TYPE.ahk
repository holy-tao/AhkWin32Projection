#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_DUMP_TYPE extends Win32Enum {

    /**
     * Native name: WerDumpTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: WerDumpTypeMicroDump
     * @type {Integer (Int32)}
     */
    static MicroDump => 1

    /**
     * Native name: WerDumpTypeMiniDump
     * @type {Integer (Int32)}
     */
    static MiniDump => 2

    /**
     * Native name: WerDumpTypeHeapDump
     * @type {Integer (Int32)}
     */
    static HeapDump => 3

    /**
     * Native name: WerDumpTypeTriageDump
     * @type {Integer (Int32)}
     */
    static TriageDump => 4

    /**
     * Native name: WerDumpTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 5
}
