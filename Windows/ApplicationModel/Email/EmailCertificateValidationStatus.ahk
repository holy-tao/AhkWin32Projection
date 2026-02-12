#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the result of an attempt to validate a certificate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailcertificatevalidationstatus
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailCertificateValidationStatus extends Win32Enum{

    /**
     * Success. Certificate validated.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Validation failed. No matching certificate found.
     * @type {Integer (Int32)}
     */
    static NoMatch => 1

    /**
     * Validation failed. Invalid usage of certificate.
     * @type {Integer (Int32)}
     */
    static InvalidUsage => 2

    /**
     * Validation failed. Certificate is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidCertificate => 3

    /**
     * Validation failed. Certificate revoked.
     * @type {Integer (Int32)}
     */
    static Revoked => 4

    /**
     * Validation failed. One or more certificates in the chain, other than the current certificate, have been revoked.
     * @type {Integer (Int32)}
     */
    static ChainRevoked => 5

    /**
     * Validation failed. Revocation server failure.
     * @type {Integer (Int32)}
     */
    static RevocationServerFailure => 6

    /**
     * Validation failed. Certificate expired.
     * @type {Integer (Int32)}
     */
    static Expired => 7

    /**
     * Validation failed. Certificate untrusted.
     * @type {Integer (Int32)}
     */
    static Untrusted => 8

    /**
     * Validation failed. Server failure.
     * @type {Integer (Int32)}
     */
    static ServerError => 9

    /**
     * Validation failed. Unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 10
}
