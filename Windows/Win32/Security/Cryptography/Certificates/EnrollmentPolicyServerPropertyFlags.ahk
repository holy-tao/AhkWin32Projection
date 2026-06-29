#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the default policy server.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentpolicyserverpropertyflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct EnrollmentPolicyServerPropertyFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
