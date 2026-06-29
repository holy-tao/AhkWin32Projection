#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ISOFLAG {
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
    static ISOFLAG_RETAIN_COMMIT_DC => 1

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_COMMIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_COMMIT_NO => 3

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_ABORT_DC => 4

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_ABORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_ABORT_NO => 12

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_DONTCARE => 5

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_BOTH => 10

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_NONE => 15

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_OPTIMISTIC => 16

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_READONLY => 32
}
