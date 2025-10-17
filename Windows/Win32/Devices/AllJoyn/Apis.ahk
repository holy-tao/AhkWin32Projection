#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class AllJoyn {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static QCC_TRUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QCC_FALSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_NO_REPLY_EXPECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_AUTO_START => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_ALLOW_REMOTE_MSG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_SESSIONLESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_GLOBAL_BROADCAST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_FLAG_ENCRYPTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_TRAFFIC_TYPE_MESSAGES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_TRAFFIC_TYPE_RAW_UNRELIABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_TRAFFIC_TYPE_RAW_RELIABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_PROXIMITY_ANY => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_PROXIMITY_PHYSICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_PROXIMITY_NETWORK => 2

    /**
     * @type {String}
     */
    static ALLJOYN_NAMED_PIPE_CONNECT_SPEC => "npipe:"

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_READ_READY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_WRITE_READY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_DISCONNECTED => 4

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_LITTLE_ENDIAN => 0x6C

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_BIG_ENDIAN => 0x42

    /**
     * @type {Integer (UInt32)}
     */
    static ALLJOYN_MESSAGE_DEFAULT_TIMEOUT => 25000

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_PASSWORD => 1

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_USER_NAME => 2

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_CERT_CHAIN => 4

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_PRIVATE_KEY => 8

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_LOGON_ENTRY => 16

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_EXPIRATION => 32

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_NEW_PASSWORD => 4097

    /**
     * @type {Integer (UInt16)}
     */
    static ALLJOYN_CRED_ONE_TIME_PWD => 8193

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_PROP_ACCESS_READ => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_PROP_ACCESS_WRITE => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_PROP_ACCESS_RW => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_NO_REPLY => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_DEPRECATED => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_SESSIONCAST => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_SESSIONLESS => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_UNICAST => 0x10

    /**
     * @type {Integer (Byte)}
     */
    static ALLJOYN_MEMBER_ANNOTATE_GLOBAL_BROADCAST => 0x20
;@endregion Constants

;@region Methods
;@endregion Methods
}
