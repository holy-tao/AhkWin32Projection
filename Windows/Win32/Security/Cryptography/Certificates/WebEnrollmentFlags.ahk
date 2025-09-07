#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies web enrollment behavior.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-webenrollmentflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class WebEnrollmentFlags{

    /**
     * If this flag is set and no authentication credential is available for the certificate enrollment server, the certificate service prompts for a credential. If there is no authentication credential and this flag is not set, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmenthelper-enroll">Enroll</a> method fails.
     * @type {Integer (Int32)}
     */
    static EnrollPrompt => 1
}
