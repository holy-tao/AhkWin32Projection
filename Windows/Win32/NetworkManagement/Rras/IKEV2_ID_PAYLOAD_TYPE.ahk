#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class IKEV2_ID_PAYLOAD_TYPE extends Win32Enum {

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_IPV4_ADDR
     * @type {Integer (Int32)}
     */
    static IPV4_ADDR => 1

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_FQDN
     * @type {Integer (Int32)}
     */
    static FQDN => 2

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_RFC822_ADDR
     * @type {Integer (Int32)}
     */
    static RFC822_ADDR => 3

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_RESERVED1
     * @type {Integer (Int32)}
     */
    static RESERVED1 => 4

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_ID_IPV6_ADDR
     * @type {Integer (Int32)}
     */
    static ID_IPV6_ADDR => 5

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_RESERVED2
     * @type {Integer (Int32)}
     */
    static RESERVED2 => 6

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_RESERVED3
     * @type {Integer (Int32)}
     */
    static RESERVED3 => 7

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_RESERVED4
     * @type {Integer (Int32)}
     */
    static RESERVED4 => 8

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_DER_ASN1_DN
     * @type {Integer (Int32)}
     */
    static DER_ASN1_DN => 9

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_DER_ASN1_GN
     * @type {Integer (Int32)}
     */
    static DER_ASN1_GN => 10

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_KEY_ID
     * @type {Integer (Int32)}
     */
    static KEY_ID => 11

    /**
     * Native name: IKEV2_ID_PAYLOAD_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 12
}
