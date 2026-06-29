#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct CDS_TYPE {
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
    static CDS_FULLSCREEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_GLOBAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_NORESET => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_RESET => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_SET_PRIMARY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_TEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_UPDATEREGISTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_VIDEOPARAMETERS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_ENABLE_UNSAFE_MODES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_DISABLE_UNSAFE_MODES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_RESET_EX => 536870912
}
