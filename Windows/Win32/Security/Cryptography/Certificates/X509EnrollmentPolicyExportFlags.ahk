#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used by the Export method on the IX509EnrollmentPolicyServer interface to specify what items to export from the policy server.
 * @remarks
 * To export both templates and object identifiers, specify a bitwise <b>OR</b> of the <b>ExportTemplates</b> and <b>ExportOIDs</b> values.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509enrollmentpolicyexportflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct X509EnrollmentPolicyExportFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Export templates.
     * @type {Integer (Int32)}
     */
    static ExportTemplates => 1

    /**
     * Export custom object identifiers.
     * @type {Integer (Int32)}
     */
    static ExportOIDs => 2

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static ExportCAs => 4
}
