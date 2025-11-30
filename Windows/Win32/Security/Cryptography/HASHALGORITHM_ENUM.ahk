#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies signing and hashing algorithms.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ne-bcrypt-hashalgorithm_enum
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class HASHALGORITHM_ENUM extends Win32Enum{

    /**
     * Represents a Digital Signature Algorithm (DSA) that uses the Secure Hashing Algorithm 1 (SHA1) to hash the message contents before signing.
     * @type {Integer (Int32)}
     */
    static DSA_HASH_ALGORITHM_SHA1 => 0

    /**
     * Represents a Digital Signature Algorithm (DSA) that uses the Secure Hashing Algorithm 256 (SHA256) to hash the message contents before signing.
     * @type {Integer (Int32)}
     */
    static DSA_HASH_ALGORITHM_SHA256 => 1

    /**
     * Represents a Digital Signature Algorithm (DSA) that uses the Secure Hashing Algorithm 512 (SHA512) to hash the message contents before signing.
     * @type {Integer (Int32)}
     */
    static DSA_HASH_ALGORITHM_SHA512 => 2
}
