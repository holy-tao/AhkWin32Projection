#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to display enrollment status information in a user interface.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentdisplaystatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class EnrollmentDisplayStatus extends Win32Enum{

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
