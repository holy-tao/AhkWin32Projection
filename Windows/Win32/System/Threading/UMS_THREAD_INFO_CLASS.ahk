#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct UMS_THREAD_INFO_CLASS {
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
    static UmsThreadInvalidInfoClass => 0

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadUserContext => 1

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadPriority => 2

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadAffinity => 3

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadTeb => 4

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadIsSuspended => 5

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadIsTerminated => 6

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadMaxInfoClass => 7
}
