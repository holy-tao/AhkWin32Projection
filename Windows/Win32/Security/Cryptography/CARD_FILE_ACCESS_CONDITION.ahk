#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies access control permissions for a file on a smart card.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/card-file-access-condition
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_FILE_ACCESS_CONDITION {
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
    static InvalidAc => 0

    /**
     * @type {Integer (Int32)}
     */
    static EveryoneReadUserWriteAc => 1

    /**
     * @type {Integer (Int32)}
     */
    static UserWriteExecuteAc => 2

    /**
     * @type {Integer (Int32)}
     */
    static EveryoneReadAdminWriteAc => 3

    /**
     * @type {Integer (Int32)}
     */
    static UnknownAc => 4

    /**
     * @type {Integer (Int32)}
     */
    static UserReadWriteAc => 5

    /**
     * @type {Integer (Int32)}
     */
    static AdminReadWriteAc => 6
}
