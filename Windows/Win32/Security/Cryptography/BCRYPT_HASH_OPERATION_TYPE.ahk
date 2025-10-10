#Requires AutoHotkey v2.0.0 64-bit

/**
 * The BCRYPT_HASH_OPERATION_TYPE enumeration specifies the hash operation type.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ne-bcrypt-bcrypt_hash_operation_type
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_HASH_OPERATION_TYPE{

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
