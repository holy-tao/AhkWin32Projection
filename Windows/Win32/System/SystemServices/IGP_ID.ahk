#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IGP_ID {
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
    static IGP_GETIMEVERSION => 4294967292

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_PROPERTY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_CONVERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_SENTENCE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_UI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_SETCOMPSTR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_SELECT => 24
}
