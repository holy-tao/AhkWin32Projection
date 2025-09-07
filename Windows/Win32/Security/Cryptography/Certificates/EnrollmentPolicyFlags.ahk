#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies group policy flags.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentpolicyflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class EnrollmentPolicyFlags{

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
