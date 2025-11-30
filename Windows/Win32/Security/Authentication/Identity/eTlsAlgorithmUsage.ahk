#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the algorithm being used to disable cryptographic settings.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ne-schannel-etlsalgorithmusage
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class eTlsAlgorithmUsage extends Win32Enum{

    /**
     * Key exchange algorithm. (*e.g. RSA, ECDHE, DHE*)
     * @type {Integer (Int32)}
     */
    static TlsParametersCngAlgUsageKeyExchange => 0

    /**
     * Signature algorithm. (*e.g. RSA, DSA, ECDSA*)
     * @type {Integer (Int32)}
     */
    static TlsParametersCngAlgUsageSignature => 1

    /**
     * Encryption algorithm. (*e.g. AES, DES, RC4*)
     * @type {Integer (Int32)}
     */
    static TlsParametersCngAlgUsageCipher => 2

    /**
     * Digest of cipher suite. (*e.g. SHA1, SHA256, SHA384*)
     * @type {Integer (Int32)}
     */
    static TlsParametersCngAlgUsageDigest => 3

    /**
     * Signature and/or hash used to sign certificate. (*e.g. RSA, DSA, ECDSA, SHA1, SHA256*)
     * @type {Integer (Int32)}
     */
    static TlsParametersCngAlgUsageCertSig => 4
}
