#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct WORKER_THREAD_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEDEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINIOTHREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINPERSISTENTTHREAD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINWAITTHREAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTELONGFUNCTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEONLYONCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WT_TRANSFER_IMPERSONATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINTIMERTHREAD => 32
}
