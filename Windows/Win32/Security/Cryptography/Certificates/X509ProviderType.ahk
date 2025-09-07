#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of cryptographic provider.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509providertype
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509ProviderType{

    /**
     * No provider is identified.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_NONE => 0

    /**
     * Supports the following algorithms:
 * 
 * <ul>
 * <li>Encryption: <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RC2</a> and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RC4</a></li>
 * <li>Hashing: <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">MD5</a> and SHA</li>
 * <li>Key Exchange: <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RSA</a></li>
 * <li>Signatures: RSA</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_RSA_FULL => 1

    /**
     * Supports the following algorithms:
 * 
 * <ul>
 * <li>Hashing: MD5 and SHA</li>
 * <li>Signatures: RSA</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_RSA_SIG => 2

    /**
     * Supports the following algorithms. This is a subset of the XCN_PROV_DSS_DH provider type.
 * 
 * <ul>
 * <li>Hashing: MD5 and SHA</li>
 * <li>Signatures: <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Digital Signature Standard</a> (DSS)</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_DSS => 3

    /**
     * Supports the Fortezza cryptographic card developed by NSA. This includes support for the following algorithms:
 * 
 * <ul>
 * <li>Encryption: Skipjack</li>
 * <li>Hashing: SHA</li>
 * <li>Key Exchange: KEA</li>
 * <li>Signatures: DSS</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_FORTEZZA => 4

    /**
     * Supports cryptographic algorithms used by the Microsoft Exchange mail application and other applications compatible with Microsoft Mail.
 * This includes the following:
 * 
 * <ul>
 * <li>Encryption: <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CAST</a></li>
 * <li>Hashing: MD5</li>
 * <li>Key Exchange: RSA</li>
 * <li>Signatures: RSA</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_MS_EXCHANGE => 5

    /**
     * Supports the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Secure Sockets Layer protocol</a>. This includes the following algorithms:
 * 
 * <ul>
 * <li>Encryption: variable</li>
 * <li>Hashing: variable</li>
 * <li>Key Exchange: RSA</li>
 * <li>Signatures: RSA</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_SSL => 6

    /**
     * Supports RSA and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Schannel</a> protocols. This includes the following algorithms:
 * 
 * <ul>
 * <li>Encryption: RC4, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Data Encryption Standard</a> (DES), 3DES</li>
 * <li>Hashing: MD5, SHA</li>
 * <li>Key Exchange: RSA</li>
 * <li>Signatures: RSA</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_RSA_SCHANNEL => 12

    /**
     * Supports the following algorithms:
 * 
 * <ul>
 * <li>Encryption: <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CYLINK_MEK</a></li>
 * <li>Hashing: MD5, SHA</li>
 * <li>Key Exchange: <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Diffie-Hellman algorithm</a></li>
 * <li>Signatures: DSS</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_DSS_DH => 13

    /**
     * Microsoft currently does not provide a CSP of this type.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_EC_ECDSA_SIG => 14

    /**
     * Microsoft currently does not provide a CSP of this type.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_EC_ECNRA_SIG => 15

    /**
     * Microsoft currently does not provide a CSP of this type.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_EC_ECDSA_FULL => 16

    /**
     * Microsoft currently does not provide a CSP of this type.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_EC_ECNRA_FULL => 17

    /**
     * Supports the Diffie-Hellman and Schannel protocols. This includes the following algorithms:
 * 
 * <ul>
 * <li>Encryption: DES, 3DES</li>
 * <li>Hashing: MD5, SHA</li>
 * <li>Key Exchange: Diffie-Hellman algorithm</li>
 * <li>Signatures: DSS</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_DH_SCHANNEL => 18

    /**
     * Microsoft currently does not provide a CSP of this type.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_SPYRUS_LYNKS => 20

    /**
     * Microsoft currently does not provide a CSP of this type.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_RNG => 21

    /**
     * Microsoft currently does not provide a CSP of this type.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_INTEL_SEC => 22

    /**
     * Microsoft currently does not provide a CSP of this type.
     * @type {Integer (Int32)}
     */
    static XCN_PROV_REPLACE_OWF => 23

    /**
     * Supports the following algorithms:
 * 
 * <ul>
 * <li>Encryption: RC2, RC4, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">AES</a></li>
 * <li>Hashing: MD5, SHA</li>
 * <li>Key Exchange: RSA</li>
 * <li>Signatures: RSA</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_PROV_RSA_AES => 24
}
