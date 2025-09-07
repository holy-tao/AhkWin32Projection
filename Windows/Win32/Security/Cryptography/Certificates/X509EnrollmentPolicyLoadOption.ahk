#Requires AutoHotkey v2.0.0 64-bit

/**
 * Is used by the LoadPolicy method on the IX509EnrollmentPolicyServer interface to specify how to retrieve policy from the policy server.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509enrollmentpolicyloadoption
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509EnrollmentPolicyLoadOption{

    /**
     * Reload if the cache has expired.
     * @type {Integer (Int32)}
     */
    static LoadOptionDefault => 0

    /**
     * Always load from the cache even if it has expired.
     * @type {Integer (Int32)}
     */
    static LoadOptionCacheOnly => 1

    /**
     * Always reload.
     * @type {Integer (Int32)}
     */
    static LoadOptionReload => 2

    /**
     * Registers a thread to update a sequence number if there are changes to the template or the certification authority container. This value applies only to an Active Directory policy server.
     * @type {Integer (Int32)}
     */
    static LoadOptionRegisterForADChanges => 4
}
