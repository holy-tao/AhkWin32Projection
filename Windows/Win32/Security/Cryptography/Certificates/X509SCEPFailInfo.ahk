#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes the nature of an SCEP certificate enrollment failure.
 * @see https://learn.microsoft.com/windows/win32/api/certpol/ne-certpol-x509scepfailinfo
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509SCEPFailInfo extends Win32Enum {

    /**
     * Native name: SCEPFailUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * Failure due to an unrecognized or unsupported algorithm.
     * Native name: SCEPFailBadAlgorithm
     * @type {Integer (Int32)}
     */
    static BadAlgorithm => 0

    /**
     * The integrity check failed.
     * Native name: SCEPFailBadMessageCheck
     * @type {Integer (Int32)}
     */
    static BadMessageCheck => 1

    /**
     * The transaction was not permitted or was not supported.
     * Native name: SCEPFailBadRequest
     * @type {Integer (Int32)}
     */
    static BadRequest => 2

    /**
     * The signing time attribute from the PKCS7 authenticated attributes was not sufficiently close to the system time.
     * Native name: SCEPFailBadTime
     * @type {Integer (Int32)}
     */
    static BadTime => 3

    /**
     * No certificate could be identified.
     * Native name: SCEPFailBadCertId
     * @type {Integer (Int32)}
     */
    static BadCertId => 4
}
