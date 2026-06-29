#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPIN_MDL_CACHING_EVENT {
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
    static KSPIN_MDL_CACHING_NOTIFY_CLEANUP => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_MDL_CACHING_NOTIFY_CLEANALL_WAIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_MDL_CACHING_NOTIFY_CLEANALL_NOWAIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_MDL_CACHING_NOTIFY_ADDSAMPLE => 3
}
