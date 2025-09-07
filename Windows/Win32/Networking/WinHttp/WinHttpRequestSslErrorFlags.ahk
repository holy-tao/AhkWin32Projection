#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WinHttpRequestSslErrorFlags{

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_UnknownCA => 256

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_CertWrongUsage => 512

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_CertCNInvalid => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_CertDateInvalid => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_Ignore_All => 13056
}
