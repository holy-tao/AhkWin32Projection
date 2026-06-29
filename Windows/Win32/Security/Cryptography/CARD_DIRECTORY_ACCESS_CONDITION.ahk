#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies access control permissions for a directory on a smart card.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/card-directory-access-condition
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_DIRECTORY_ACCESS_CONDITION {
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
    static InvalidDirAc => 0

    /**
     * @type {Integer (Int32)}
     */
    static UserCreateDeleteDirAc => 1

    /**
     * @type {Integer (Int32)}
     */
    static AdminCreateDeleteDirAc => 2
}
