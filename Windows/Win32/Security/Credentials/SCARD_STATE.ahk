#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SCARD_STATE {
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
    static SCARD_STATE_UNAWARE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_IGNORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_UNAVAILABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_EMPTY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_PRESENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_ATRMATCH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_EXCLUSIVE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_INUSE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_MUTE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_CHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_UNKNOWN => 4
}
