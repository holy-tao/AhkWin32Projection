#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_SEEKING_CAPABILITIES {
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
    static KS_SEEKING_CanSeekAbsolute => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanSeekForwards => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanSeekBackwards => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanGetCurrentPos => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanGetStopPos => 16

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanGetDuration => 32

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_CanPlayBackwards => 64
}
