#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WinHttpRequestSslErrorFlags extends Win32Enum {

    /**
     * Native name: SslErrorFlag_UnknownCA
     * @type {Integer (Int32)}
     */
    static Flag_UnknownCA => 256

    /**
     * Native name: SslErrorFlag_CertWrongUsage
     * @type {Integer (Int32)}
     */
    static Flag_CertWrongUsage => 512

    /**
     * Native name: SslErrorFlag_CertCNInvalid
     * @type {Integer (Int32)}
     */
    static Flag_CertCNInvalid => 4096

    /**
     * Native name: SslErrorFlag_CertDateInvalid
     * @type {Integer (Int32)}
     */
    static Flag_CertDateInvalid => 8192

    /**
     * Native name: SslErrorFlag_Ignore_All
     * @type {Integer (Int32)}
     */
    static Flag_Ignore_All => 13056
}
