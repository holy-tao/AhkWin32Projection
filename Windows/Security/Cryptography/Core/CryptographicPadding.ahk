#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a padding mode for asymmetric algorithm signature or encryption operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicpadding
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class CryptographicPadding extends Win32Enum{

    /**
     * Do not use padding.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Use the Optimal Asymmetric Encryption Padding (OAEP) scheme.
     * @type {Integer (Int32)}
     */
    static RsaOaep => 1

    /**
     * Use the standard padding scheme for public-key cryptography based on the RSA algorithm as defined in [RFC 3447](https://www.ietf.org/rfc/rfc3447.txt).
     * @type {Integer (Int32)}
     */
    static RsaPkcs1V15 => 2

    /**
     * Use the Probabilistic Signature Scheme (PSS) scheme.
     * @type {Integer (Int32)}
     */
    static RsaPss => 3
}
