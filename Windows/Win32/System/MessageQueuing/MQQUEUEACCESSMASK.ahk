#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQQUEUEACCESSMASK {
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
    static MQSEC_DELETE_QUEUE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_GET_QUEUE_PERMISSIONS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_CHANGE_QUEUE_PERMISSIONS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_TAKE_QUEUE_OWNERSHIP => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_RECEIVE_MESSAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_RECEIVE_JOURNAL_MESSAGE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_QUEUE_GENERIC_READ => 131115

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_QUEUE_GENERIC_WRITE => 131108

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_QUEUE_GENERIC_ALL => 983103

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_DELETE_MESSAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_PEEK_MESSAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_WRITE_MESSAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_DELETE_JOURNAL_MESSAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_SET_QUEUE_PROPERTIES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_GET_QUEUE_PROPERTIES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_QUEUE_GENERIC_EXECUTE => 0
}
