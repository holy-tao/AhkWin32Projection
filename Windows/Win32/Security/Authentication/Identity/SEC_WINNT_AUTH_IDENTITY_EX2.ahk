#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about an authentication identity.
 * @remarks
 * This authentication identity buffer can be returned from several credential APIs, for example, the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getserialization">GetSerialization</a> method and the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredential</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspipromptforcredentialsa">SspiPromptForCredentials</a> functions.
 * 
 * The structure describes a header of the authentication identity buffer and the data is appended at the end of the structure. Although the buffer size is specified by the <b>cbStructureLength</b> member, the actual buffer size can be larger or smaller than <b>cbStructureLength</b>. Some functions, such as <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspivalidateauthidentity">SspiValidateAuthIdentity</a>, take a pointer, but not the buffer size, to the identity structure as input. As a result, those functions can validate the internal buffer data but cannot verify the buffer size. This can result in reading or writing data outside of the buffer range. To avoid buffer overruns when handling an untrusted identity buffer, applications should call <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiunmarshalauthidentity">SspiUnmarshalAuthIdentity</a> to obtain a pointer to an identity structure with a validated size and then pass that pointer to the functions.
 * 
 * The <b>SEC_WINNT_AUTH_IDENTITY_EX2</b> structure can be returned by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes(CredSSP)</a> and consumed by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle(CredSSP)</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a>, and other identity provider interfaces.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_packed_credentials">SEC_WINNT_AUTH_PACKED_CREDENTIALS</a> can contain a password credential type, defined as SEC_WINNT_AUTH_DATA_TYPE_PASSWORD. This credential type describes password credentials of a domain user as well as other online identities. Applications must define _SEC_WINNT_AUTH_TYPES to compile code that references this credential type as well as other definitions of the <b>SEC_WINNT_AUTH_PACKED_CREDENTIALS</b> structure.
 * 
 * Applications should not query or set the <b>Flags</b> member directly. Use the   <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiisauthidentityencrypted">SspiIsAuthIdentityEncrypted</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a>, and  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspidecryptauthidentityex">SspiDecryptAuthIdentityEx</a> functions to manage the encryption and decryption of the <b>SEC_WINNT_AUTH_IDENTITY_EX2</b> structure.
 * 
 * Identity providers must explicitly check or set SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER and the domain name fields to differentiate their password credential from a domain password and another identity provider's password.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credpackauthenticationbuffera">CredPackAuthenticationBuffer</a> function  can be called with the CRED_PACK_ID_PROVIDER_CREDENTIALS option to create a <b>SEC_WINNT_AUTH_IDENTITY_EX2</b> structure with the authentication data of SEC_WINNT_AUTH_DATA_TYPE_PASSWORD credential type, a <b>Flags</b> member that contains the SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER value, and a <b>DomainOffset</b> member set to the provider name.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_WINNT_AUTH_IDENTITY_EX2 {
    #StructPack 4

    /**
     * The version number of the structure. This must be <b>SEC_WINNT_AUTH_IDENTITY_VERSION_2</b>.
     */
    Version : UInt32

    /**
     * The size, in bytes, of the structure header.
     */
    cbHeaderLength : UInt16

    /**
     * The size, in bytes, of the structure.
     */
    cbStructureLength : UInt32

    /**
     * The offset from the beginning of the structure to the beginning of the user name string.
     */
    UserOffset : UInt32

    /**
     * The size, in bytes, of the user name string.
     */
    UserLength : UInt16

    /**
     * The offset from the beginning of the structure to the beginning of the domain name string. 
     * 
     * An identity credential should contain the identity provider name instead of the domain name.
     */
    DomainOffset : UInt32

    /**
     * The size, in bytes, of the domain name string.
     */
    DomainLength : UInt16

    /**
     * The offset from the beginning of the structure to the beginning of the packed credentials.
     * 
     * The packed credential is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_packed_credentials">SEC_WINNT_AUTH_PACKED_CREDENTIALS</a> structure that contains a credential type that uniquely specifies the credential type.
     */
    PackedCredentialsOffset : UInt32

    /**
     * The size, in bytes, of the packed credentials string.
     */
    PackedCredentialsLength : UInt16

    /**
     * An <b>unsigned long</b> flag that indicates the type used by negotiable <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security packages</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_MARSHALLED"></a><a id="sec_winnt_auth_identity_marshalled"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_MARSHALLED</b></dt>
     * <dt>4 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All data is in one buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_ONLY"></a><a id="sec_winnt_auth_identity_only"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_ONLY</b></dt>
     * <dt>8 (0x8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP). Credentials are for identity only. The Kerberos package is directed to not include authorization data in the ticket.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_ANSI"></a><a id="sec_winnt_auth_identity_ansi"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_ANSI</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Credentials are in ANSI form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_UNICODE"></a><a id="sec_winnt_auth_identity_unicode"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_UNICODE</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Credentials are in Unicode form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER"></a><a id="sec_winnt_auth_identity_flags_id_provider"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER</b></dt>
     * <dt>524288 (0x80000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the credential type is password, the presence of this flag specifies that the structure is an online ID credential.  The <b>DomainOffset</b> and <b>DomainLength</b> members correspond to the online ID provider name.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED"></a><a id="sec_winnt_auth_identity_flags_process_encrypted"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED</b></dt>
     * <dt>16 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The structure is encrypted by the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentity">SspiEncryptAuthIdentity</a> function or by  the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a> function with the SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_PROCESS option. It can only be decrypted by the same process.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_PROTECTED"></a><a id="sec_winnt_auth_identity_flags_system_protected"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_PROTECTED</b></dt>
     * <dt>32 (0x20)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The structure is encrypted by the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a> function with the SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON option under the SYSTEM security context. It can only be decrypted by a thread running as SYSTEM.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_FLAGS_USER_PROTECTED"></a><a id="sec_winnt_auth_identity_flags_user_protected"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_FLAGS_USER_PROTECTED</b></dt>
     * <dt>64 (0x40)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The structure is encrypted by the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a> function with the SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON option under a non-SYSTEM security context. It can only be decrypted by a thread running in the same logon session in which it was encrypted.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SEC_WINNT_AUTH_IDENTITY_FLAGS_RESERVED"></a><a id="sec_winnt_auth_identity_flags_reserved"></a><dl>
     * <dt><b>SEC_WINNT_AUTH_IDENTITY_FLAGS_RESERVED</b></dt>
     * <dt>65536 (0x10000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication identity buffer is <b>cbStructureLength</b> + 8 padding bytes that are necessary for in-place encryption or decryption of the identity.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * The offset from the beginning of the structure to the beginning of the list of supported packages.
     */
    PackageListOffset : UInt32

    /**
     * The size, in bytes, of the supported package list.
     */
    PackageListLength : UInt16

}
