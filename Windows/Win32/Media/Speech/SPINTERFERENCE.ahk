#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPINTERFERENCE{

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_NOISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_NOSIGNAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_TOOLOUD => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_TOOQUIET => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_TOOFAST => 5

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_TOOSLOW => 6

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_LATENCY_WARNING => 7

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_LATENCY_TRUNCATE_BEGIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPINTERFERENCE_LATENCY_TRUNCATE_END => 9
}
