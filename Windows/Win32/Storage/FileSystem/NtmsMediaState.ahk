#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsMediaState {
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
    static NTMS_MEDIASTATE_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_INUSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_MOUNTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_LOADED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_UNLOADED => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_OPERROR => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_OPREQ => 6
}
