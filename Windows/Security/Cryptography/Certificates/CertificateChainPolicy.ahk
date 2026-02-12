#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the policy to use when performing a certificate chain validation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatechainpolicy
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateChainPolicy extends Win32Enum{

    /**
     * Use the base chain policy verification checks.
     * @type {Integer (Int32)}
     */
    static Base => 0

    /**
     * Use the SSL client/server chain policy verification checks.
     * @type {Integer (Int32)}
     */
    static Ssl => 1

    /**
     * Use the Windows NT Authentication chain policy checks.
     * @type {Integer (Int32)}
     */
    static NTAuthentication => 2

    /**
     * Check the last element of the first simple chain for a Microsoft root public key.
     * @type {Integer (Int32)}
     */
    static MicrosoftRoot => 3
}
