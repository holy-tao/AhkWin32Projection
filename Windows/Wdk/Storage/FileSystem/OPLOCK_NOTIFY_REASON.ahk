#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct OPLOCK_NOTIFY_REASON {
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
    static OPLOCK_NOTIFY_BREAK_WAIT_INTERIM_TIMEOUT => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPLOCK_NOTIFY_BREAK_WAIT_TERMINATED => 1
}
