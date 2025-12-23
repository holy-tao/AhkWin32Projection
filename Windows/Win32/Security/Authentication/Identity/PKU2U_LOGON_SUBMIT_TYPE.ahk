#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of logon message passed in a PKU2U_CERTIFICATE_S4U_LOGON structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-pku2u_logon_submit_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PKU2U_LOGON_SUBMIT_TYPE extends Win32Enum{

    /**
     * The logon message is a PKU2U certificate.
     * @type {Integer (Int32)}
     */
    static Pku2uCertificateS4ULogon => 14
}
