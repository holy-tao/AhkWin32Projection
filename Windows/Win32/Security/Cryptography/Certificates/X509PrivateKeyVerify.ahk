#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a user interface is displayed during private key verification and whether verification can proceed if the cryptographic provider is a smart card provider.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509privatekeyverify
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509PrivateKeyVerify extends Win32Enum {

    /**
     * No option is identified.
     * Native name: VerifyNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The method does not display a user interface.
     * Native name: VerifySilent
     * @type {Integer (Int32)}
     */
    static Silent => 1

    /**
     * No verification occurs if the key is stored on a smart card (the CSP or KSP is a smart card provider).
     * Native name: VerifySmartCardNone
     * @type {Integer (Int32)}
     */
    static SmartCardNone => 2

    /**
     * The method does not display a user interface if the key is stored on a smart card (the CSP or KSP is a smart card provider).
     * Native name: VerifySmartCardSilent
     * @type {Integer (Int32)}
     */
    static SmartCardSilent => 3

    /**
     * The method displays a user interface.
     * Native name: VerifyAllowUI
     * @type {Integer (Int32)}
     */
    static AllowUI => 4
}
