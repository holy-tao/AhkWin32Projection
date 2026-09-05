#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_EVENTPIPE_LEVEL extends Win32Enum {

    /**
     * Native name: COR_PRF_EVENTPIPE_LOGALWAYS
     * @type {Integer (Int32)}
     */
    static LOGALWAYS => 0

    /**
     * Native name: COR_PRF_EVENTPIPE_CRITICAL
     * @type {Integer (Int32)}
     */
    static CRITICAL => 1

    /**
     * Native name: COR_PRF_EVENTPIPE_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 2

    /**
     * Native name: COR_PRF_EVENTPIPE_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 3

    /**
     * Native name: COR_PRF_EVENTPIPE_INFORMATIONAL
     * @type {Integer (Int32)}
     */
    static INFORMATIONAL => 4

    /**
     * Native name: COR_PRF_EVENTPIPE_VERBOSE
     * @type {Integer (Int32)}
     */
    static VERBOSE => 5
}
