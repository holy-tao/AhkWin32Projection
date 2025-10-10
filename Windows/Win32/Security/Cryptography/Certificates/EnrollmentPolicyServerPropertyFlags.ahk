#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the default policy server.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-enrollmentpolicyserverpropertyflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class EnrollmentPolicyServerPropertyFlags{

    /**
     * No default policy server URL has been specified.
     * @type {Integer (Int32)}
     */
    static DefaultNone => 0

    /**
     * The policy server URL returned by <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpolicyserverurl">GetPolicyServerUrl</a> is the default value when an URL has not been specified.
     * @type {Integer (Int32)}
     */
    static DefaultPolicyServer => 1
}
