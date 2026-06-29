#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct CONVINFO_STATUS {
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
    static ST_ADVISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ST_BLOCKED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ST_BLOCKNEXT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ST_CLIENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ST_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ST_INLIST => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ST_ISLOCAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ST_ISSELF => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ST_TERMINATED => 32
}
