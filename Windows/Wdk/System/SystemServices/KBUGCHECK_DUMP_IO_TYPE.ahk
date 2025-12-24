#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KBUGCHECK_DUMP_IO_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoHeader => 1

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoBody => 2

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoSecondaryData => 3

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoComplete => 4
}
