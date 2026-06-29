#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_FAILURE_SPECIAL_REASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
