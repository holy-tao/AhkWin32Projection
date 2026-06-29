#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ETaskType {
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
    static TT_DEBUGGERHELPER => 1

    /**
     * @type {Integer (Int32)}
     */
    static TT_GC => 2

    /**
     * @type {Integer (Int32)}
     */
    static TT_FINALIZER => 4

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_TIMER => 8

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_GATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_WORKER => 32

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_IOCOMPLETION => 64

    /**
     * @type {Integer (Int32)}
     */
    static TT_ADUNLOAD => 128

    /**
     * @type {Integer (Int32)}
     */
    static TT_USER => 256

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_WAIT => 512

    /**
     * @type {Integer (Int32)}
     */
    static TT_UNKNOWN => -2147483648
}
