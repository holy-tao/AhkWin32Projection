#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPIN_COMMUNICATION {
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
    static KSPIN_COMMUNICATION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_COMMUNICATION_SINK => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_COMMUNICATION_SOURCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_COMMUNICATION_BOTH => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_COMMUNICATION_BRIDGE => 4
}
