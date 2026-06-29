#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\KERB_LOGON_SUBMIT_TYPE.ahk" { KERB_LOGON_SUBMIT_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a smart card logon session. (KERB_CERTIFICATE_LOGON)
 * @remarks
 * This structure, along with the data pointed to by the <b>DomainName</b>, <b>UserName</b>, <b>Pin</b>, and <b>CspData</b> members, is contained in a single block of contiguous memory. When this structure is serialized, the offsets specified by each of these members must be multiples of two.
 * 
 * The pointers stored in the members of <b>UNICODE_STRING</b> type are relative to the beginning of the structure and are not absolute memory pointers.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CERTIFICATE_LOGON {
    #StructPack 8

    MessageType : KERB_LOGON_SUBMIT_TYPE

    /**
     * The domain name of the user to authenticate. The value of this member can be empty. If the value is not empty, <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> uses the value to locate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Key Distribution Center</a> (KDC). If the value is empty, <b>LsaLogonUser</b> attempts to authenticate against the domain to which the computer is joined.  The pointer is relative to the beginning of the structure and is not an absolute memory pointer.
     */
    DomainName : LSA_UNICODE_STRING

    /**
     * The user name of the user to authenticate. The value of this member can be empty. If the value is not empty, <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> uses the value to locate the user account to authenticate.  The pointer is relative to the beginning of the structure and is not an absolute memory pointer.
     */
    UserName : LSA_UNICODE_STRING

    /**
     * The PIN to use to authenticate the user. The <b>Length</b> member of this structure does not include the terminating null character of the PIN. The pointer is relative to the beginning of the structure and is not an absolute memory pointer.
     * 
     * The PIN can be protected by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credprotecta">CredProtect</a> function.
     */
    Pin : LSA_UNICODE_STRING

    /**
     * Optional flags that control the behavior of the authentication. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES"></a><a id="kerb_certificate_logon_flag_check_duplicates"></a><dl>
     * <dt><b>KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The KDC checks the certificate for multiple account mappings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO"></a><a id="kerb_certificate_logon_flag_use_certificate_info"></a><dl>
     * <dt><b>KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The KDC uses the certificate information for authentication.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This flag is not available.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * The length, in characters, of the <b>CspData</b> member.
     */
    CspDataLength : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/kerb-smartcard-csp-info">KERB_SMARTCARD_CSP_INFO</a> structure that contains information about the smart card <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) ) or a pointer to a marshaled <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_info">KERB_CERTIFICATE_INFO</a> structure when updating certificate credentials.
     */
    CspData : IntPtr

}
