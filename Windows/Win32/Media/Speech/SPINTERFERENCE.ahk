#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPINTERFERENCE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
