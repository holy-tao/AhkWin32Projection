#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the nature of an SCEP certificate enrollment failure.
 * @see https://learn.microsoft.com/windows/win32/api/certpol/ne-certpol-x509scepfailinfo
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509SCEPFailInfo{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCEPFailUnknown => -1

    /**
     * Failure due to an unrecognized or unsupported algorithm.
     * @type {Integer (Int32)}
     */
    static SCEPFailBadAlgorithm => 0

    /**
     * The integrity check failed.
     * @type {Integer (Int32)}
     */
    static SCEPFailBadMessageCheck => 1

    /**
     * The transaction was not permitted or was not supported.
     * @type {Integer (Int32)}
     */
    static SCEPFailBadRequest => 2

    /**
     * The signing time attribute from the PKCS7 authenticated attributes was not sufficiently close to the system time.
     * @type {Integer (Int32)}
     */
    static SCEPFailBadTime => 3

    /**
     * No certificate could be identified.
     * @type {Integer (Int32)}
     */
    static SCEPFailBadCertId => 4
}
