#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct IKEV2_ID_PAYLOAD_TYPE {
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
    static IKEV2_ID_PAYLOAD_TYPE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_IPV4_ADDR => 1

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_FQDN => 2

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_RFC822_ADDR => 3

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_RESERVED1 => 4

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_ID_IPV6_ADDR => 5

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_RESERVED2 => 6

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_RESERVED3 => 7

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_RESERVED4 => 8

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_DER_ASN1_DN => 9

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_DER_ASN1_GN => 10

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_KEY_ID => 11

    /**
     * @type {Integer (Int32)}
     */
    static IKEV2_ID_PAYLOAD_TYPE_MAX => 12
}
