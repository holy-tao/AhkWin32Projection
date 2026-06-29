#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct CPEventBitShift {
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
    static CPEVENT_BITSHIFT_RATINGS => 0

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_COPP => 1

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_LICENSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_ROLLBACK => 3

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_SAC => 4

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_DOWNRES => 5

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_STUBLIB => 6

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_UNTRUSTEDGRAPH => 7

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_PENDING_CERTIFICATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_BITSHIFT_NO_PLAYREADY => 9
}
