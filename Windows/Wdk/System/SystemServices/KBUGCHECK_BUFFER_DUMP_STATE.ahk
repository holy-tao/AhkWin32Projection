#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KBUGCHECK_BUFFER_DUMP_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BufferEmpty => 0

    /**
     * @type {Integer (Int32)}
     */
    static BufferInserted => 1

    /**
     * @type {Integer (Int32)}
     */
    static BufferStarted => 2

    /**
     * @type {Integer (Int32)}
     */
    static BufferFinished => 3

    /**
     * @type {Integer (Int32)}
     */
    static BufferIncomplete => 4
}
