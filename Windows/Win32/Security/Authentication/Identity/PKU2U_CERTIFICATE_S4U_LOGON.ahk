#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PKU2U_LOGON_SUBMIT_TYPE.ahk" { PKU2U_LOGON_SUBMIT_TYPE }

/**
 * Specifies a certificate used for S4U logon.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-pku2u_certificate_s4u_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKU2U_CERTIFICATE_S4U_LOGON {
    #StructPack 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-pku2u_logon_submit_type">PKU2U_LOGON_SUBMIT_TYPE</a> enumeration that indicates the logon type.
     */
    MessageType : PKU2U_LOGON_SUBMIT_TYPE

    /**
     * This member is reserved. Do not use it.
     */
    Flags : UInt32

    /**
     * The name of the user who is attempting to authenticate.
     */
    UserPrincipalName : LSA_UNICODE_STRING

    /**
     * This member is reserved. Do not use it.
     */
    DomainName : LSA_UNICODE_STRING

    /**
     * The size, in bytes, of the <b>Certificate</b> buffer.
     */
    CertificateLength : UInt32

    /**
     * The certificate data.
     */
    Certificate : IntPtr

}
