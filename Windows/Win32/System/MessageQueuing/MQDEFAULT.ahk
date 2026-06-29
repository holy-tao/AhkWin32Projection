#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQDEFAULT {
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
    static DEFAULT_M_PRIORITY => 3

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_M_DELIVERY => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_M_ACKNOWLEDGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_M_JOURNAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_M_APPSPECIFIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_M_PRIV_LEVEL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_M_AUTH_LEVEL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_M_SENDERID_TYPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_Q_JOURNAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_Q_BASEPRIORITY => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_Q_QUOTA => -1

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_Q_JOURNAL_QUOTA => -1

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_Q_TRANSACTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_Q_AUTHENTICATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_Q_PRIV_LEVEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_M_LOOKUPID => 0
}
