#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to display enrollment status information in a user interface.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentdisplaystatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct EnrollmentDisplayStatus {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Status is not displayed.
     * @type {Integer (Int32)}
     */
    static DisplayNo => 0

    /**
     * Status is displayed.
     * @type {Integer (Int32)}
     */
    static DisplayYes => 1
}
