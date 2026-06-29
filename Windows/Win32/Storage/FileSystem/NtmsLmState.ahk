#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsLmState {
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
    static NTMS_LM_QUEUED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_INPROCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_PASSED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_FAILED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_INVALID => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_WAITING => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DEFERRED => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DEFFERED => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_CANCELLED => 7

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_STOPPED => 8
}
