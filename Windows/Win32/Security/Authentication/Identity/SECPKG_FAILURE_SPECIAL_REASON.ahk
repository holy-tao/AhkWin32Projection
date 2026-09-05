#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SECPKG_FAILURE_SPECIAL_REASON extends Win32Enum {

    /**
     * Native name: SecpkgFailureReason_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: SecpkgFailureReason_NoFailure
     * @type {Integer (Int32)}
     */
    static NoFailure => 1

    /**
     * Native name: SecpkgFailureReason_LocalAccount
     * @type {Integer (Int32)}
     */
    static LocalAccount => 2

    /**
     * Native name: SecpkgFailureReason_DomainAccount
     * @type {Integer (Int32)}
     */
    static DomainAccount => 3

    /**
     * Native name: SecpkgFailureReason_CloudAccount
     * @type {Integer (Int32)}
     */
    static CloudAccount => 4

    /**
     * Native name: SecpkgFailureReason_NullTarget
     * @type {Integer (Int32)}
     */
    static NullTarget => 5

    /**
     * Native name: SecpkgFailureReason_UnknownTarget
     * @type {Integer (Int32)}
     */
    static UnknownTarget => 6

    /**
     * Native name: SecpkgFailureReason_IpAddress
     * @type {Integer (Int32)}
     */
    static IpAddress => 7

    /**
     * Native name: SecpkgFailureReason_DupTarget
     * @type {Integer (Int32)}
     */
    static DupTarget => 8

    /**
     * Native name: SecpkgFailureReason_NoLineOfSight
     * @type {Integer (Int32)}
     */
    static NoLineOfSight => 9

    /**
     * Native name: SecpkgFailureReason_Loopback
     * @type {Integer (Int32)}
     */
    static Loopback => 10

    /**
     * Native name: SecpkgFailureReason_NullSession
     * @type {Integer (Int32)}
     */
    static NullSession => 11
}
