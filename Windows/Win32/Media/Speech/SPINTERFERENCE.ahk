#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPINTERFERENCE extends Win32Enum {

    /**
     * Native name: SPINTERFERENCE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SPINTERFERENCE_NOISE
     * @type {Integer (Int32)}
     */
    static NOISE => 1

    /**
     * Native name: SPINTERFERENCE_NOSIGNAL
     * @type {Integer (Int32)}
     */
    static NOSIGNAL => 2

    /**
     * Native name: SPINTERFERENCE_TOOLOUD
     * @type {Integer (Int32)}
     */
    static TOOLOUD => 3

    /**
     * Native name: SPINTERFERENCE_TOOQUIET
     * @type {Integer (Int32)}
     */
    static TOOQUIET => 4

    /**
     * Native name: SPINTERFERENCE_TOOFAST
     * @type {Integer (Int32)}
     */
    static TOOFAST => 5

    /**
     * Native name: SPINTERFERENCE_TOOSLOW
     * @type {Integer (Int32)}
     */
    static TOOSLOW => 6

    /**
     * Native name: SPINTERFERENCE_LATENCY_WARNING
     * @type {Integer (Int32)}
     */
    static LATENCY_WARNING => 7

    /**
     * Native name: SPINTERFERENCE_LATENCY_TRUNCATE_BEGIN
     * @type {Integer (Int32)}
     */
    static LATENCY_TRUNCATE_BEGIN => 8

    /**
     * Native name: SPINTERFERENCE_LATENCY_TRUNCATE_END
     * @type {Integer (Int32)}
     */
    static LATENCY_TRUNCATE_END => 9
}
