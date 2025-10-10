#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of authentication method used by Internet Key Exchange (IKE), Authenticated Internet Protocol (AuthIP), or IKEv2.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ne-iketypes-ikeext_authentication_method_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_AUTHENTICATION_METHOD_TYPE{

    /**
     * Specifies pre-shared key authentication method. Available only for IKE.
     * @type {Integer (Int32)}
     */
    static IKEEXT_PRESHARED_KEY => 0

    /**
     * Specifies certificate authentication method. Available only for IKE and IKEv2.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERTIFICATE => 1

    /**
     * Specifies Kerberos authentication method.
     * @type {Integer (Int32)}
     */
    static IKEEXT_KERBEROS => 2

    /**
     * Specifies anonymous authentication method. Available only for AuthIP.
     * @type {Integer (Int32)}
     */
    static IKEEXT_ANONYMOUS => 3

    /**
     * Specifies Secure Sockets Layer (SSL) authentication method. Available only for AuthIP.
     * @type {Integer (Int32)}
     */
    static IKEEXT_SSL => 4

    /**
     * Specifies Microsoft Windows NT LAN Manager (NTLM) V2 authentication method. Available only for AuthIP.
     * @type {Integer (Int32)}
     */
    static IKEEXT_NTLM_V2 => 5

    /**
     * Specifies IPv6 Cryptographically Generated Addresses (CGA) authentication method. Available only for IKE.
     * @type {Integer (Int32)}
     */
    static IKEEXT_IPV6_CGA => 6

    /**
     * Specifies Elliptic Curve Digital Signature Algorithm (ECDSA) 256 certificate authentication method. Available only for IKE and IKEv2.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERTIFICATE_ECDSA_P256 => 7

    /**
     * Specifies ECDSA-384 certificate authentication method. Available only for IKE and IKEv2.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERTIFICATE_ECDSA_P384 => 8

    /**
     * Specifies ECDSA-256 SSL authentication method. Available only for AuthIP.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_SSL_ECDSA_P256 => 9

    /**
     * Specifies ECDSA-384 SSL authentication method. Available only for AuthIP.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_SSL_ECDSA_P384 => 10

    /**
     * Specifies Extensible Authentication Protocol (EAP) authentication method. Available only for IKEv2.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2008 R2, Windows 7, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_EAP => 11

    /**
     * Reserved. Do not use.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2012, Windows 8, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_RESERVED => 12

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_AUTHENTICATION_METHOD_TYPE_MAX => 13
}
