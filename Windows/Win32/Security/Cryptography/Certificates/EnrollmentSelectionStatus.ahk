#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the enrollment status of an object will be monitored during the enrollment process.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentselectionstatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct EnrollmentSelectionStatus {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The enrollment status is not monitored.
     * @type {Integer (Int32)}
     */
    static SelectedNo => 0

    /**
     * The enrollment status is monitored.
     * @type {Integer (Int32)}
     */
    static SelectedYes => 1
}
