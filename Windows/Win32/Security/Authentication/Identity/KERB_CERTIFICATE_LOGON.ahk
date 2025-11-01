#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information about a smart card logon session.
 * @remarks
 * 
  * This structure, along with the data pointed to by the <b>DomainName</b>, <b>UserName</b>, <b>Pin</b>, and <b>CspData</b> members, is contained in a single block of contiguous memory. When this structure is serialized, the offsets specified by each of these members must be multiples of two.
  * 
  * The pointers stored in the members of <b>UNICODE_STRING</b> type are relative to the beginning of the structure and are not absolute memory pointers.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_certificate_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CERTIFICATE_LOGON extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The domain name of the user to authenticate. The value of this member can be empty. If the value is not empty, <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> uses the value to locate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Key Distribution Center</a> (KDC). If the value is empty, <b>LsaLogonUser</b> attempts to authenticate against the domain to which the computer is joined.  The pointer is relative to the beginning of the structure and is not an absolute memory pointer.
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(8, this)
            return this.__DomainName
        }
    }

    /**
     * The user name of the user to authenticate. The value of this member can be empty. If the value is not empty, <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> uses the value to locate the user account to authenticate.  The pointer is relative to the beginning of the structure and is not an absolute memory pointer.
     * @type {LSA_UNICODE_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := LSA_UNICODE_STRING(24, this)
            return this.__UserName
        }
    }

    /**
     * The PIN to use to authenticate the user. The <b>Length</b> member of this structure does not include the terminating null character of the PIN. The pointer is relative to the beginning of the structure and is not an absolute memory pointer.
     * 
     * The PIN can be protected by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credprotecta">CredProtect</a> function.
     * @type {LSA_UNICODE_STRING}
     */
    Pin{
        get {
            if(!this.HasProp("__Pin"))
                this.__Pin := LSA_UNICODE_STRING(40, this)
            return this.__Pin
        }
    }

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The length, in characters, of the <b>CspData</b> member.
     * @type {Integer}
     */
    CspDataLength {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/kerb-smartcard-csp-info">KERB_SMARTCARD_CSP_INFO</a> structure that contains information about the smart card <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) ) or a pointer to a marshaled <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_info">KERB_CERTIFICATE_INFO</a> structure when updating certificate credentials.
     * @type {Pointer<Integer>}
     */
    CspData {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
