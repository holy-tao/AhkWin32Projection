#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class KBUGCHECK_BUFFER_DUMP_STATE extends Win32Enum {

    /**
     * Native name: BufferEmpty
     * @type {Integer (Int32)}
     */
    static Empty => 0

    /**
     * Native name: BufferInserted
     * @type {Integer (Int32)}
     */
    static Inserted => 1

    /**
     * Native name: BufferStarted
     * @type {Integer (Int32)}
     */
    static Started => 2

    /**
     * Native name: BufferFinished
     * @type {Integer (Int32)}
     */
    static Finished => 3

    /**
     * Native name: BufferIncomplete
     * @type {Integer (Int32)}
     */
    static Incomplete => 4
}
