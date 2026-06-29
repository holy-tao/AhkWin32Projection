#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct TransmissionMode {
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
    static BDA_XMIT_MODE_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_2K => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_8K => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_4K => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_2K_INTERLEAVED => 4

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_4K_INTERLEAVED => 5

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_1K => 6

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_16K => 7

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_32K => 8

    /**
     * @type {Integer (Int32)}
     */
    static BDA_XMIT_MODE_MAX => 9
}
