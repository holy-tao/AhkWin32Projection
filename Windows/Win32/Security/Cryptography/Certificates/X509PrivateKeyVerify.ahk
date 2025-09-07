#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether a user interface is displayed during private key verification and whether verification can proceed if the cryptographic provider is a smart card provider.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509privatekeyverify
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509PrivateKeyVerify{

    /**
     * No option is identified.
     * @type {Integer (Int32)}
     */
    static VerifyNone => 0

    /**
     * The method does not display a user interface.
     * @type {Integer (Int32)}
     */
    static VerifySilent => 1

    /**
     * No verification occurs if the key is stored on a smart card (the CSP or KSP is a smart card provider).
     * @type {Integer (Int32)}
     */
    static VerifySmartCardNone => 2

    /**
     * The method does not display a user interface if the key is stored on a smart card (the CSP or KSP is a smart card provider).
     * @type {Integer (Int32)}
     */
    static VerifySmartCardSilent => 3

    /**
     * The method displays a user interface.
     * @type {Integer (Int32)}
     */
    static VerifyAllowUI => 4
}
