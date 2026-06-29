#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct WAIT_EVENT {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static WAIT_OBJECT_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WAIT_ABANDONED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WAIT_ABANDONED_0 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WAIT_IO_COMPLETION => 192

    /**
     * @type {Integer (UInt32)}
     */
    static WAIT_TIMEOUT => 258

    /**
     * @type {Integer (UInt32)}
     */
    static WAIT_FAILED => 4294967295
}
