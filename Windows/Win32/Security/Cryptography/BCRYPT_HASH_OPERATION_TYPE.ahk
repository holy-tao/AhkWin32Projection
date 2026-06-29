#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BCRYPT_HASH_OPERATION_TYPE enumeration specifies the hash operation type.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ne-bcrypt-bcrypt_hash_operation_type
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_HASH_OPERATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcrypthashdata">BCryptHashData</a> function.
     * @type {Integer (Int32)}
     */
    static BCRYPT_HASH_OPERATION_HASH_DATA => 1

    /**
     * Equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptfinishhash">BCryptFinishHash</a> function.
     * @type {Integer (Int32)}
     */
    static BCRYPT_HASH_OPERATION_FINISH_HASH => 2
}
