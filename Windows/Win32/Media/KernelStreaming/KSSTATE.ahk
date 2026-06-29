#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSSTATE {
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
    static KSSTATE_STOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSSTATE_ACQUIRE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSSTATE_PAUSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSSTATE_RUN => 3
}
