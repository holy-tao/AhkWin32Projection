#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_EVENTPIPE_PARAM_TYPE extends Win32Enum {

    /**
     * Native name: COR_PRF_EVENTPIPE_OBJECT
     * @type {Integer (Int32)}
     */
    static OBJECT => 1

    /**
     * Native name: COR_PRF_EVENTPIPE_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 3

    /**
     * Native name: COR_PRF_EVENTPIPE_CHAR
     * @type {Integer (Int32)}
     */
    static CHAR => 4

    /**
     * Native name: COR_PRF_EVENTPIPE_SBYTE
     * @type {Integer (Int32)}
     */
    static SBYTE => 5

    /**
     * Native name: COR_PRF_EVENTPIPE_BYTE
     * @type {Integer (Int32)}
     */
    static BYTE => 6

    /**
     * Native name: COR_PRF_EVENTPIPE_INT16
     * @type {Integer (Int32)}
     */
    static INT16 => 7

    /**
     * Native name: COR_PRF_EVENTPIPE_UINT16
     * @type {Integer (Int32)}
     */
    static UINT16 => 8

    /**
     * Native name: COR_PRF_EVENTPIPE_INT32
     * @type {Integer (Int32)}
     */
    static INT32 => 9

    /**
     * Native name: COR_PRF_EVENTPIPE_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 10

    /**
     * Native name: COR_PRF_EVENTPIPE_INT64
     * @type {Integer (Int32)}
     */
    static INT64 => 11

    /**
     * Native name: COR_PRF_EVENTPIPE_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 12

    /**
     * Native name: COR_PRF_EVENTPIPE_SINGLE
     * @type {Integer (Int32)}
     */
    static SINGLE => 13

    /**
     * Native name: COR_PRF_EVENTPIPE_DOUBLE
     * @type {Integer (Int32)}
     */
    static DOUBLE => 14

    /**
     * Native name: COR_PRF_EVENTPIPE_DECIMAL
     * @type {Integer (Int32)}
     */
    static DECIMAL => 15

    /**
     * Native name: COR_PRF_EVENTPIPE_DATETIME
     * @type {Integer (Int32)}
     */
    static DATETIME => 16

    /**
     * Native name: COR_PRF_EVENTPIPE_GUID
     * @type {Integer (Int32)}
     */
    static GUID => 17

    /**
     * Native name: COR_PRF_EVENTPIPE_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 18

    /**
     * Native name: COR_PRF_EVENTPIPE_ARRAY
     * @type {Integer (Int32)}
     */
    static ARRAY => 19
}
