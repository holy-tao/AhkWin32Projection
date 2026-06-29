#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsAsyncStatus {
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
    static NTMS_ASYNCSTATE_QUEUED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_WAIT_RESOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_WAIT_OPERATOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_INPROCESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_COMPLETE => 4
}
