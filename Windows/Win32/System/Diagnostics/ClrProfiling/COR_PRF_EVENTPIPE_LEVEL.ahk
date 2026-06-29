#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_EVENTPIPE_LEVEL {
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
    static COR_PRF_EVENTPIPE_LOGALWAYS => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_CRITICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_WARNING => 3

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_INFORMATIONAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_EVENTPIPE_VERBOSE => 5
}
