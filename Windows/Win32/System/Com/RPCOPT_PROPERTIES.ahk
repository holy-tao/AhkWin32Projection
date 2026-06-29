#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct RPCOPT_PROPERTIES {
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
    static COMBND_RPCTIMEOUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_SERVER_LOCALITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RESERVED1 => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RESERVED2 => 5

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RESERVED3 => 8

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RESERVED4 => 16
}
