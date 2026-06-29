#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQCALG {
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
    static MQMSG_CALG_MD2 => 32769

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_MD4 => 32770

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_MD5 => 32771

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_SHA => 32772

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_SHA1 => 32772

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_MAC => 32773

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_RSA_SIGN => 9216

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_DSS_SIGN => 8704

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_RSA_KEYX => 41984

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_DES => 26113

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_RC2 => 26114

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_RC4 => 26625

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CALG_SEAL => 26626
}
