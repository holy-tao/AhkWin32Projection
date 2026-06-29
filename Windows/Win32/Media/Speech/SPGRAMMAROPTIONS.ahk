#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPGRAMMAROPTIONS {
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
    static SPGO_SAPI => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_UPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS_MS_SCRIPT => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS_W3C_SCRIPT => 256

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS_STG_SCRIPT => 512

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS_SCRIPT => 778

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_FILE => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_HTTP => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_RES => 64

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_OBJECT => 128

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_DEFAULT => 1019

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_ALL => 1023
}
