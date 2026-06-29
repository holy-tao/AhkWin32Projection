#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct DDE_CLIENT_TRANSACTION_TYPE {
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
    static XTYP_ADVSTART => 4144

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_ADVSTOP => 32832

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_EXECUTE => 16464

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_POKE => 16528

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_REQUEST => 8368

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_ADVDATA => 16400

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_ADVREQ => 8226

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_CONNECT => 4194

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_CONNECT_CONFIRM => 32882

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_DISCONNECT => 32962

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_MONITOR => 33010

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_REGISTER => 32930

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_UNREGISTER => 32978

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_WILDCONNECT => 8418

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_XACT_COMPLETE => 32896
}
