#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MSV1_0_LOGON_SUBMIT_TYPE.ahk" { MSV1_0_LOGON_SUBMIT_TYPE }

/**
 * Contains information about an interactive logon.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_interactive_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_INTERACTIVE_LOGON {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_logon_submit_type">MSV1_0_LOGON_SUBMIT_TYPE</a> value that specifies the type of logon being requested. This member must be set to <b>MsV1_0InteractiveLogon</b>.
     */
    MessageType : MSV1_0_LOGON_SUBMIT_TYPE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the logon domain. The specified domain name must be a Windows domain or mixed domain that is trusted by this machine.
     * 
     * The <b>Buffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> is relative to the KERB_INTERACTIVE_LOGON structure and must point to memory that is contiguous to the MSV1_0_INTERACTIVE_LOGON structure.
     */
    LogonDomainName : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that represents the user's account name. The name can be up to 255 bytes long. The name is treated as case-insensitive. The specified <b>UserName</b> must have an account in domain <b>LogonDomainName</b>.
     * 
     * The <b>Buffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> is relative to the KERB_INTERACTIVE_LOGON structure and must point to memory that is contiguous to the MSV1_0_INTERACTIVE_LOGON structure.
     */
    UserName : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the user's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a> password. The password may be up to 255 bytes long and contain any Unicode value. When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information on protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * 
     * The <b>Buffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> is relative to the KERB_INTERACTIVE_LOGON structure and must point to memory that is contiguous to the MSV1_0_INTERACTIVE_LOGON structure.
     */
    Password : LSA_UNICODE_STRING

}
