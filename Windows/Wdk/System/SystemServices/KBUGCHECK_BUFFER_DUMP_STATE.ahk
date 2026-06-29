#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_BUFFER_DUMP_STATE {
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
    static BufferEmpty => 0

    /**
     * @type {Integer (Int32)}
     */
    static BufferInserted => 1

    /**
     * @type {Integer (Int32)}
     */
    static BufferStarted => 2

    /**
     * @type {Integer (Int32)}
     */
    static BufferFinished => 3

    /**
     * @type {Integer (Int32)}
     */
    static BufferIncomplete => 4
}
