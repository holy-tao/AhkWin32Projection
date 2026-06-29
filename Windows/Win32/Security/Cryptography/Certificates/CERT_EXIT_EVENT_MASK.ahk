#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERT_EXIT_EVENT_MASK {
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
