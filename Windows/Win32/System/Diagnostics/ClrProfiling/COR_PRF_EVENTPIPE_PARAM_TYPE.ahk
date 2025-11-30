#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_EVENTPIPE_PARAM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_OBJECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_BOOLEAN => 3

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_CHAR => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_SBYTE => 5

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_BYTE => 6

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_INT16 => 7

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_UINT16 => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_INT32 => 9

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_UINT32 => 10

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_INT64 => 11

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_UINT64 => 12

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_SINGLE => 13

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_DOUBLE => 14

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_DECIMAL => 15

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_DATETIME => 16

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_GUID => 17

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_STRING => 18

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_ARRAY => 19
}
