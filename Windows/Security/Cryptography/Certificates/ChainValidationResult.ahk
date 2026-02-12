#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the result of a certificate chain verification operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainvalidationresult
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ChainValidationResult extends Win32Enum{

    /**
     * The certificate chain was verified.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * A certificate in the chain is not trusted.
     * @type {Integer (Int32)}
     */
    static Untrusted => 1

    /**
     * A certificate in the chain has been revoked.
     * @type {Integer (Int32)}
     */
    static Revoked => 2

    /**
     * A certificate in the chain has expired.
     * @type {Integer (Int32)}
     */
    static Expired => 3

    /**
     * The certificate chain is missing one or more certificates.
     * @type {Integer (Int32)}
     */
    static IncompleteChain => 4

    /**
     * The signature of a certificate in the chain cannot be verified.
     * @type {Integer (Int32)}
     */
    static InvalidSignature => 5

    /**
     * A certificate in the chain is being used for a purpose other than one specified by its CA.
     * @type {Integer (Int32)}
     */
    static WrongUsage => 6

    /**
     * A certificate in the chain has a name that is not valid. The name is either not included in the permitted list or is explicitly excluded.
     * @type {Integer (Int32)}
     */
    static InvalidName => 7

    /**
     * A certificate in the chain has a policy that is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidCertificateAuthorityPolicy => 8

    /**
     * The basic constraint extension of a certificate in the chain has not been observed.
     * @type {Integer (Int32)}
     */
    static BasicConstraintsError => 9

    /**
     * A certificate in the chain contains an unknown extension that is marked "critical".
     * @type {Integer (Int32)}
     */
    static UnknownCriticalExtension => 10

    /**
     * No installed or registered DLL was found to verify revocation.
     * @type {Integer (Int32)}
     */
    static RevocationInformationMissing => 11

    /**
     * Unable to connect to the revocation server.
     * @type {Integer (Int32)}
     */
    static RevocationFailure => 12

    /**
     * An unexpected error occurred while validating the certificate chain.
     * @type {Integer (Int32)}
     */
    static OtherErrors => 13
}
