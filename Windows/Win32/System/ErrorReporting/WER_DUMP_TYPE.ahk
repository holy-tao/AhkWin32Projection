#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_DUMP_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WerDumpTypeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WerDumpTypeMicroDump => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerDumpTypeMiniDump => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerDumpTypeHeapDump => 3

    /**
     * @type {Integer (Int32)}
     */
    static WerDumpTypeTriageDump => 4

    /**
     * @type {Integer (Int32)}
     */
    static WerDumpTypeMax => 5
}
