#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERT_EXIT_EVENT_MASK{

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_CERTDENIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_CERTISSUED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_CERTPENDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_CERTRETRIEVEPENDING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_CERTREVOKED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_CRLISSUED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_SHUTDOWN => 64
}
