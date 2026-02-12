#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the result of a signature verification operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.signaturevalidationresult
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class SignatureValidationResult extends Win32Enum{

    /**
     * The signature was verified.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * An invalid argument was encountered while verifying the signature.
     * @type {Integer (Int32)}
     */
    static InvalidParameter => 1

    /**
     * A severe error occurred such as missing key provider information or an incorrect algorithm id.
     * @type {Integer (Int32)}
     */
    static BadMessage => 2

    /**
     * The signature was not verified.
     * @type {Integer (Int32)}
     */
    static InvalidSignature => 3

    /**
     * Additional errors were encountered.
     * @type {Integer (Int32)}
     */
    static OtherErrors => 4
}
