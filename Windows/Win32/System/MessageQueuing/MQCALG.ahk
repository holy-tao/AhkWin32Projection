#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQCALG extends Win32Enum{

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
