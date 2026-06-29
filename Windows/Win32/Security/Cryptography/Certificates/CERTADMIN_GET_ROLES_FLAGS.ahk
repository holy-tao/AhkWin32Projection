#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERTADMIN_GET_ROLES_FLAGS {
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
    static CA_ACCESS_ADMIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_AUDITOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_ENROLL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_OFFICER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_OPERATOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_READ => 256
}
