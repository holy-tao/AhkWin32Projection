#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SECRET_PURPOSE {
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
    static AuthenticationPin => 0

    /**
     * @type {Integer (Int32)}
     */
    static DigitalSignaturePin => 1

    /**
     * @type {Integer (Int32)}
     */
    static EncryptionPin => 2

    /**
     * @type {Integer (Int32)}
     */
    static NonRepudiationPin => 3

    /**
     * @type {Integer (Int32)}
     */
    static AdministratorPin => 4

    /**
     * @type {Integer (Int32)}
     */
    static PrimaryCardPin => 5

    /**
     * @type {Integer (Int32)}
     */
    static UnblockOnlyPin => 6
}
