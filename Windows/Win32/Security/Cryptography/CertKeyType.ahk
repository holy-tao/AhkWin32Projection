#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CertKeyType {
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
    static KeyTypeOther => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeVirtualSmartCard => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypePhysicalSmartCard => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypePassport => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypePassportRemote => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypePassportSmartCard => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeHardware => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeSoftware => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeSelfSigned => 8
}
