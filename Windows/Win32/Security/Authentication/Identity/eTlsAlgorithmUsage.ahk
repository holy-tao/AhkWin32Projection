#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the algorithm being used to disable cryptographic settings.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ne-schannel-etlsalgorithmusage
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class eTlsAlgorithmUsage extends Win32Enum {

    /**
     * Key exchange algorithm. (*e.g. RSA, ECDHE, DHE*)
     * Native name: TlsParametersCngAlgUsageKeyExchange
     * @type {Integer (Int32)}
     */
    static ParametersCngAlgUsageKeyExchange => 0

    /**
     * Signature algorithm. (*e.g. RSA, DSA, ECDSA*)
     * Native name: TlsParametersCngAlgUsageSignature
     * @type {Integer (Int32)}
     */
    static ParametersCngAlgUsageSignature => 1

    /**
     * Encryption algorithm. (*e.g. AES, DES, RC4*)
     * Native name: TlsParametersCngAlgUsageCipher
     * @type {Integer (Int32)}
     */
    static ParametersCngAlgUsageCipher => 2

    /**
     * Digest of cipher suite. (*e.g. SHA1, SHA256, SHA384*)
     * Native name: TlsParametersCngAlgUsageDigest
     * @type {Integer (Int32)}
     */
    static ParametersCngAlgUsageDigest => 3

    /**
     * Signature and/or hash used to sign certificate. (*e.g. RSA, DSA, ECDSA, SHA1, SHA256*)
     * Native name: TlsParametersCngAlgUsageCertSig
     * @type {Integer (Int32)}
     */
    static ParametersCngAlgUsageCertSig => 4
}
