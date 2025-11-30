#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the enrollment status of an object will be monitored during the enrollment process.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-enrollmentselectionstatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class EnrollmentSelectionStatus extends Win32Enum{

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
