#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_STRONG_SIGN_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CERT_STRONG_SIGN_ENABLE_CRL_CHECK
     * @type {Integer (UInt32)}
     */
    static ENABLE_CRL_CHECK => 1

    /**
     * Native name: CERT_STRONG_SIGN_ENABLE_OCSP_CHECK
     * @type {Integer (UInt32)}
     */
    static ENABLE_OCSP_CHECK => 2
}
