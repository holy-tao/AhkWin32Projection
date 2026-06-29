#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSEVENT_CONNECTION {
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
    static KSEVENT_CONNECTION_POSITIONUPDATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_DATADISCONTINUITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_TIMEDISCONTINUITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_PRIORITY => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CONNECTION_ENDOFSTREAM => 4
}
