#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies group policy flags.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentpolicyflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct EnrollmentPolicyFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Ignore policy servers configured in group policy.
     * @type {Integer (Int32)}
     */
    static DisableGroupPolicyList => 2

    /**
     * Ignore user configured policy servers.
     * @type {Integer (Int32)}
     */
    static DisableUserServerList => 4
}
