#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct NUMPARSE_FLAGS {
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
    static NUMPRS_LEADING_WHITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_TRAILING_WHITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_LEADING_PLUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_TRAILING_PLUS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_LEADING_MINUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_TRAILING_MINUS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_HEX_OCT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_PARENS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_DECIMAL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_THOUSANDS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_CURRENCY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_EXPONENT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_USE_ALL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_STD => 8191

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_NEG => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NUMPRS_INEXACT => 131072
}
