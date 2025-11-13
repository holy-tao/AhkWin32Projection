#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_FAILURE_SPECIAL_REASON{

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_NoFailure => 1

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_LocalAccount => 2

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_DomainAccount => 3

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_CloudAccount => 4

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_NullTarget => 5

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_UnknownTarget => 6

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_IpAddress => 7

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_DupTarget => 8

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_NoLineOfSight => 9

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_Loopback => 10

    /**
     * @type {Integer (Int32)}
     */
    static SecpkgFailureReason_NullSession => 11
}
