#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\SLDATATYPE.ahk" { SLDATATYPE }
#Import ".\SecurityFunctionTableA.ahk" { SecurityFunctionTableA }
#Import ".\CENTRAL_ACCESS_POLICY.ahk" { CENTRAL_ACCESS_POLICY }
#Import ".\SCH_EXTENSION_DATA.ahk" { SCH_EXTENSION_DATA }
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }
#Import ".\TRUSTED_INFORMATION_CLASS.ahk" { TRUSTED_INFORMATION_CLASS }
#Import ".\SL_ACTIVATION_INFO_HEADER.ahk" { SL_ACTIVATION_INFO_HEADER }
#Import ".\SECURITY_PACKAGE_OPTIONS.ahk" { SECURITY_PACKAGE_OPTIONS }
#Import ".\LSA_TRANSLATED_SID.ahk" { LSA_TRANSLATED_SID }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\ASC_REQ_FLAGS.ahk" { ASC_REQ_FLAGS }
#Import ".\POLICY_NOTIFICATION_INFORMATION_CLASS.ahk" { POLICY_NOTIFICATION_INFORMATION_CLASS }
#Import ".\TRUSTED_DOMAIN_INFORMATION_EX.ahk" { TRUSTED_DOMAIN_INFORMATION_EX }
#Import ".\LSA_REFERENCED_DOMAIN_LIST.ahk" { LSA_REFERENCED_DOMAIN_LIST }
#Import ".\ISC_REQ_FLAGS.ahk" { ISC_REQ_FLAGS }
#Import ".\POLICY_INFORMATION_CLASS.ahk" { POLICY_INFORMATION_CLASS }
#Import ".\SecurityFunctionTableW.ahk" { SecurityFunctionTableW }
#Import "..\..\Credentials\CREDENTIAL_TARGET_INFORMATIONW.ahk" { CREDENTIAL_TARGET_INFORMATIONW }
#Import ".\X509Certificate.ahk" { X509Certificate }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SecPkgInfoA.ahk" { SecPkgInfoA }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\TOKENBINDING_EXTENSION_FORMAT.ahk" { TOKENBINDING_EXTENSION_FORMAT }
#Import ".\TOKENBINDING_KEY_TYPES.ahk" { TOKENBINDING_KEY_TYPES }
#Import ".\TRUSTED_DOMAIN_AUTH_INFORMATION.ahk" { TRUSTED_DOMAIN_AUTH_INFORMATION }
#Import ".\SECPKG_ATTR.ahk" { SECPKG_ATTR }
#Import ".\SLREFERRALTYPE.ahk" { SLREFERRALTYPE }
#Import ".\TOKENBINDING_RESULT_LIST.ahk" { TOKENBINDING_RESULT_LIST }
#Import "..\..\QUOTA_LIMITS.ahk" { QUOTA_LIMITS }
#Import "..\..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\SLIDTYPE.ahk" { SLIDTYPE }
#Import ".\EXPORT_SECURITY_CONTEXT_FLAGS.ahk" { EXPORT_SECURITY_CONTEXT_FLAGS }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import ".\LSA_HANDLE.ahk" { LSA_HANDLE }
#Import ".\SL_NONGENUINE_UI_OPTIONS.ahk" { SL_NONGENUINE_UI_OPTIONS }
#Import "..\..\PSID.ahk" { PSID }
#Import ".\SecPkgContext_Bindings.ahk" { SecPkgContext_Bindings }
#Import ".\SECPKG_CRED.ahk" { SECPKG_CRED }
#Import ".\EXTENDED_NAME_FORMAT.ahk" { EXTENDED_NAME_FORMAT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\LSA_FOREST_TRUST_INFORMATION2.ahk" { LSA_FOREST_TRUST_INFORMATION2 }
#Import "..\..\TOKEN_SOURCE.ahk" { TOKEN_SOURCE }
#Import ".\LSA_FOREST_TRUST_INFORMATION.ahk" { LSA_FOREST_TRUST_INFORMATION }
#Import "..\..\TOKEN_GROUPS.ahk" { TOKEN_GROUPS }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\AUDIT_POLICY_INFORMATION.ahk" { AUDIT_POLICY_INFORMATION }
#Import ".\LSA_TRANSLATED_NAME.ahk" { LSA_TRANSLATED_NAME }
#Import ".\POLICY_AUDIT_SID_ARRAY.ahk" { POLICY_AUDIT_SID_ARRAY }
#Import ".\LSA_FOREST_TRUST_RECORD_TYPE.ahk" { LSA_FOREST_TRUST_RECORD_TYPE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\SecPkgInfoW.ahk" { SecPkgInfoW }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import ".\TOKENBINDING_KEY_PARAMETERS_TYPE.ahk" { TOKENBINDING_KEY_PARAMETERS_TYPE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\POLICY_DOMAIN_INFORMATION_CLASS.ahk" { POLICY_DOMAIN_INFORMATION_CLASS }
#Import "..\..\OBJECT_SECURITY_INFORMATION.ahk" { OBJECT_SECURITY_INFORMATION }
#Import ".\SecBuffer.ahk" { SecBuffer }
#Import ".\SECURITY_LOGON_SESSION_DATA.ahk" { SECURITY_LOGON_SESSION_DATA }
#Import ".\TOKENBINDING_RESULT_DATA.ahk" { TOKENBINDING_RESULT_DATA }
#Import ".\TOKENBINDING_TYPE.ahk" { TOKENBINDING_TYPE }
#Import ".\POLICY_AUDIT_EVENT_TYPE.ahk" { POLICY_AUDIT_EVENT_TYPE }
#Import ".\LSA_TRANSLATED_SID2.ahk" { LSA_TRANSLATED_SID2 }
#Import ".\SL_LICENSING_STATUS.ahk" { SL_LICENSING_STATUS }
#Import ".\LSA_OBJECT_ATTRIBUTES.ahk" { LSA_OBJECT_ATTRIBUTES }
#Import ".\LSA_FOREST_TRUST_COLLISION_INFORMATION.ahk" { LSA_FOREST_TRUST_COLLISION_INFORMATION }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LSA_STRING.ahk" { LSA_STRING }
#Import ".\SchGetExtensionsOptions.ahk" { SchGetExtensionsOptions }
#Import "..\..\ACL.ahk" { ACL }
#Import "..\..\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import ".\SL_GENUINE_STATE.ahk" { SL_GENUINE_STATE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */

;@region Functions
/**
 * Generates a pseudo-random number.
 * @remarks
 * When you have finished using the random number, free the <i>RandomBuffer</i> buffer by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function.
 * @param {Integer} RandomBuffer A pointer to a buffer that receives the random number as binary data. The size of this buffer is specified by the <i>RandomBufferLength</i> parameter.
 * @param {Integer} RandomBufferLength The length, in bytes, of the <i>RandomBuffer</i> buffer.
 * @returns {BOOLEAN} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-rtlgenrandom
 */
export RtlGenRandom(RandomBuffer, RandomBufferLength) {
    result := DllCall("ADVAPI32.dll\SystemFunction036", "ptr", RandomBuffer, "uint", RandomBufferLength, BOOLEAN)
    return result
}

/**
 * Encrypts memory contents.
 * @param {Integer} Memory A pointer to the memory to encrypt. The size of the memory must be a multiple of the RTL_ENCRYPT_MEMORY_SIZE constant.
 * @param {Integer} MemorySize Number of bytes to which <i>Memory</i> points. The number of bytes must be a multiple of the RTL_ENCRYPT_MEMORY_SIZE constant.
 * @param {Integer} OptionFlags 
 * @returns {NTSTATUS} If the function is successful, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an <b>NTSTATUS</b> code that indicates the error.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-rtlencryptmemory
 */
export RtlEncryptMemory(Memory, MemorySize, OptionFlags) {
    result := DllCall("ADVAPI32.dll\SystemFunction040", "ptr", Memory, "uint", MemorySize, "uint", OptionFlags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Decrypts memory contents previously encrypted by the RtlEncryptMemory function.
 * @param {Integer} Memory A pointer to the memory to encrypt. The size of the memory must be a multiple of the RTL_ENCRYPT_MEMORY_SIZE constant.
 * @param {Integer} MemorySize Number of bytes to which <i>Memory</i> points. The number of bytes must be a multiple of the RTL_ENCRYPT_MEMORY_SIZE constant.
 * @param {Integer} OptionFlags 
 * @returns {NTSTATUS} If the function is successful, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an <b>NTSTATUS</b> code that indicates the error.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-rtldecryptmemory
 */
export RtlDecryptMemory(Memory, MemorySize, OptionFlags) {
    result := DllCall("ADVAPI32.dll\SystemFunction041", "ptr", Memory, "uint", MemorySize, "uint", OptionFlags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Establishes a connection to the LSA server and verifies that the caller is a logon application.
 * @remarks
 * This function must be called before a logon process may use any other logon authentication functions provided by the LSA.
 * 
 * The <b>LsaRegisterLogonProcess</b> function verifies that the application making the function call is a logon process by checking that it has the SeTcbPrivilege privilege set. It also opens the application's process for PROCESS_DUP_HANDLE access in anticipation of future LSA authentication calls. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a>.
 * 
 * When you have finished using the connection to the LSA server, delete the caller's logon application context and close the connection by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaderegisterlogonprocess">LsaDeregisterLogonProcess</a> function.
 * @param {Pointer<LSA_STRING>} LogonProcessName Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_string">LSA_STRING</a> structure identifying the logon application. This should be a printable name suitable for display to administrators. For example, the Windows logon application might use the name "User32LogonProcess". This name is used by the LSA during auditing. <b>LsaRegisterLogonProcess</b> does not check whether the name is already in use. 
 * 
 * 
 * 
 * 
 * This string must not exceed 127 bytes.
 * @param {Pointer<HANDLE>} LsaHandle Pointer that receives a handle used in future authentication function calls.
 * @param {Pointer<Integer>} SecurityMode The value returned is not meaningful and should be ignored.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. The following are possible error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_PORT_CONNECTION_REFUSED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the SeTcbPrivilege privilege, which is required to call this function. 
 * 
 * 
 * 
 * 
 * You can set this privilege by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaaddaccountrights">LsaAddAccountRights</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NAME_TOO_LONG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified logon process name exceeds 127 bytes.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess
 * @since windows5.1.2600
 */
export LsaRegisterLogonProcess(LogonProcessName, LsaHandle, SecurityMode) {
    SecurityModeMarshal := SecurityMode is VarRef ? "uint*" : "ptr"

    result := DllCall("SECUR32.dll\LsaRegisterLogonProcess", LSA_STRING.Ptr, LogonProcessName, HANDLE.Ptr, LsaHandle, SecurityModeMarshal, SecurityMode, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Authenticates a security principal's logon data by using stored credentials information.
 * @remarks
 * The <i>OriginName</i> parameter should specify meaningful information. For example, it might contain "TTY1" to indicate terminal one or "NTLM - remote node JAZZ" to indicate a network logon that uses NTLM through a remote node called "JAZZ".
 * 
 * You must call <b>LsaLogonUser</b> separately to update PKINIT device credentials for LOCAL_SYSTEM and NETWORK_SERVICE. When there is no PKINIT device credential, a successful call does no operation. When there is a PKINIT device credential, a successful call cleans up the PKINIT device credential so that only the password credential remains.
 * @param {HANDLE} LsaHandle A handle obtained from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a>.
 * 
 * The caller is required to have <b>SeTcbPrivilege</b> only if one or more of the following is true:
 * 
 * <ul>
 * <li>A Subauthentication package is used.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon">KERB_S4U_LOGON</a> is used, and the caller requests an impersonation token.</li>
 * <li>The <i>LocalGroups</i> parameter is not <b>NULL</b>.</li>
 * </ul>
 *  If <b>SeTcbPrivilege</b> is not required, call <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted">LsaConnectUntrusted</a> to obtain the handle.
 * @param {Pointer<LSA_STRING>} OriginName A string that identifies the origin of the logon attempt. For more information, see Remarks.
 * @param {SECURITY_LOGON_TYPE} LogonType A 
 * value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-security_logon_type">SECURITY_LOGON_TYPE</a> enumeration that specifies the type of logon requested. If <i>LogonType</i> is Interactive or Batch, a primary token is generated to represent the new user. If <i>LogonType</i> is Network, an impersonation token is generated.
 * @param {Integer} AuthenticationPackage An identifier of the authentication package to use for the authentication. You can obtain this value by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage">LsaLookupAuthenticationPackage</a>.
 * @param {Integer} AuthenticationInformation A pointer to an input buffer that contains authentication information, such as user name and password. The format and content of this buffer are determined by the authentication package.
 * 
 * This parameter can be one of the following input buffer structures for the MSV1_0 and Kerberos authentication packages.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MSV1_0_INTERACTIVE_LOGON"></a><a id="msv1_0_interactive_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-msv1_0_interactive_logon">MSV1_0_INTERACTIVE_LOGON</a></b></dt>
 * <dt>MSV1_0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating an interactive user logon.
 * 
 * The <b>LogonDomainName</b>,  <b>UserName</b>, and <b>Password </b> members of the <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_interactive_logon">MSV1_0_INTERACTIVE_LOGON</a> structure must point to buffers in memory that are contiguous to the structure itself. The value of the <i>AuthenticationInformationLength</i> parameter must take into account the length of these buffers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_INTERACTIVE_LOGON"></a><a id="kerb_interactive_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_interactive_logon">KERB_INTERACTIVE_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating an interactive user logon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_TICKET_LOGON"></a><a id="kerb_ticket_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_ticket_logon">KERB_TICKET_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user on initial network logon or disconnect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_TICKET_UNLOCK_LOGON"></a><a id="kerb_ticket_unlock_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_ticket_unlock_logon">KERB_TICKET_UNLOCK_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user on ticket refresh, a variation of the normal workstation unlock logon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_CERTIFICATE_LOGON"></a><a id="kerb_certificate_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon">KERB_CERTIFICATE_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user using an interactive smart card logon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_CERTIFICATE_S4U_LOGON"></a><a id="kerb_certificate_s4u_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_s4u_logon">KERB_CERTIFICATE_S4U_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user using a service for user (S4U) logon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_CERTIFICATE_UNLOCK_LOGON"></a><a id="kerb_certificate_unlock_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_unlock_logon">KERB_CERTIFICATE_UNLOCK_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user to unlock a workstation that has been locked during an interactive smart card logon session.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_SMARTCARD_LOGON"></a><a id="kerb_smartcard_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_smart_card_logon">KERB_SMARTCARD_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user smart card logon using LOGON32_PROVIDER_WINNT50 or LOGON32_PROVIDER_DEFAULT.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_SMARTCARD_UNLOCK_LOGON"></a><a id="kerb_smartcard_unlock_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_smart_card_unlock_logon">KERB_SMARTCARD_UNLOCK_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user to unlock a workstation that has been locked during a smart card logon session.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_S4U_LOGON"></a><a id="kerb_s4u_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon">KERB_S4U_LOGON</a></b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user using S4U client requests. For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">constrained delegation</a>, a call to LsaLogonUser is not necessary if the client logged on using an LSA-mode authentication package. On Windows operating systems, these include <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-kerberos">Kerberos</a>, <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-ntlm">NTLM</a>, <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/secure-channel">Secure Channel</a>, and <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/microsoft-digest-ssp">Digest</a>. For this call to succeed, the following must be true:
 * 
 * <ul>
 * <li>The caller must be a domain account (this includes LOCAL_SYSTEM if the computer is a domain member).</li>
 * <li>If using a service account, the account must have <b>SeTcbPrivilege</b> set on the local computer to get an impersonation token. Otherwise, the identity token is used.</li>
 * <li>The caller must be a member of the <b>Pre-Windows 2000 Compatible Access</b> or have read access to the group memberships of the client. Membership in the Windows Authorization Access group guarantees read access to group membership of the client. For information about how to configure the Windows Authorization Access group, see the Microsoft Knowledge Base.</li>
 * </ul>
 * The <b>ClientUpn</b> and <b>ClientRealm</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_s4u_logon">KERB_S4U_LOGON</a> structure must point to buffers in memory that are contiguous to the structure itself. The value of the <i>AuthenticationInformationLength</i> parameter must take into account the length of these buffers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MSV1_0_LM20_LOGON"></a><a id="msv1_0_lm20_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-msv1_0_lm20_logon">MSV1_0_LM20_LOGON</a></b></dt>
 * <dt>MSV1_0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Processing the second half of an NTLM 2.0 protocol logon. The first half of this type of logon is performed by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> with the <b>MsV1_0Lm20ChallengeRequest</b> message. For more information, see the description of <b>MsV1_0Lm20ChallengeRequest</b> in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a>.
 * 
 * This type of logon can use a subauthentication package.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MSV1_0_SUBAUTH_LOGON"></a><a id="msv1_0_subauth_logon"></a><dl>
 * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_logon">MSV1_0_SUBAUTH_LOGON</a></b></dt>
 * <dt>MSV1_0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authenticating a user with subauthentication.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information about the buffer used by other authentication packages, see the documentation for those authentication packages.
 * @param {Integer} AuthenticationInformationLength The length, in bytes, of the <i>AuthenticationInformation</i> buffer.
 * @param {Pointer<TOKEN_GROUPS>} LocalGroups A list of additional group identifiers to add to the token of the authenticated user. These group identifiers will be added, along with the default group WORLD and the logon type group (Interactive, Batch, or Network), which are automatically included in every user token.
 * @param {Pointer<TOKEN_SOURCE>} SourceContext A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_source">TOKEN_SOURCE</a> structure that identifies the source module—for example, the session manager—and the context that may be useful to that module. This information is included in the user token and can be retrieved by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a>.
 * @param {Pointer<Pointer<Void>>} ProfileBuffer A pointer to a void pointer that receives the address of an output buffer that contains authentication information, such as the logon shell and home directory.
 * 
 * This parameter can be one of the following output buffer structures for the MSV1_0 and Kerberos authentication packages.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MSV1_0_INTERACTIVE_PROFILE"></a><a id="msv1_0_interactive_profile"></a><dl>
 * <dt><b>MSV1_0_INTERACTIVE_PROFILE</b></dt>
 * <dt>MSV1_0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An interactive user's logon profile.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KERB_TICKET_PROFILE"></a><a id="kerb_ticket_profile"></a><dl>
 * <dt><b>KERB_TICKET_PROFILE</b></dt>
 * <dt>Kerberos</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Logon, disconnect, and ticket refresh authentication output.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MSV1_0_LM20_LOGON"></a><a id="msv1_0_lm20_logon"></a><dl>
 * <dt><b>MSV1_0_LM20_LOGON</b></dt>
 * <dt>MSV1_0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Output when processing the second half of a NTLM 2.0 protocol logon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MSV1_0_LM20_LOGON_PROFILE"></a><a id="msv1_0_lm20_logon_profile"></a><dl>
 * <dt><b>MSV1_0_LM20_LOGON_PROFILE</b></dt>
 * <dt>MSV1_0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Output when using authentication with subauthentication.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information about the buffer used by other authentication packages, see the documentation for that authentication package.
 * 
 * When this buffer is no longer needed, the calling application must free this buffer by calling 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LsaFreeReturnBuffer</a> function.
 * @param {Pointer<Integer>} ProfileBufferLength A pointer to a <b>ULONG</b> that receives the length, in bytes, of the returned profile buffer.
 * @param {Pointer<LUID>} LogonId A pointer to a buffer that receives an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> that uniquely identifies the logon session. This <b>LUID</b> is assigned by the domain controller that authenticated the logon information.
 * @param {Pointer<HANDLE>} Token A pointer to a handle that receives the new user token created for this session. When you have finished using the token, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
 * @param {Pointer<QUOTA_LIMITS>} Quotas When a primary token is returned, this parameter receives a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-quota_limits">QUOTA_LIMITS</a> structure that contains the process quota limits assigned to the newly logged on user's initial process.
 * @param {Pointer<Integer>} SubStatus If the logon failed due to account restrictions, this parameter receives information about why the logon failed. This value is set only if the account information of the user is valid and the logon is rejected.
 * 
 * This parameter can be one of the following <i>SubStatus</i> values for the MSV1_0 authentication package.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="STATUS_INVALID_LOGON_HOURS"></a><a id="status_invalid_logon_hours"></a><dl>
 * <dt><b>STATUS_INVALID_LOGON_HOURS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user account has time restrictions and cannot be used to log on at this time.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="STATUS_INVALID_WORKSTATION"></a><a id="status_invalid_workstation"></a><dl>
 * <dt><b>STATUS_INVALID_WORKSTATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user account has workstation restrictions and cannot be used to log on from the current workstation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="STATUS_PASSWORD_EXPIRED"></a><a id="status_password_expired"></a><dl>
 * <dt><b>STATUS_PASSWORD_EXPIRED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user-account password has expired.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="STATUS_ACCOUNT_DISABLED"></a><a id="status_account_disabled"></a><dl>
 * <dt><b>STATUS_ACCOUNT_DISABLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user account is currently disabled and cannot be used to log on.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {NTSTATUS} If the function succeeds, the function returns  STATUS_SUCCESS.
 * 
 * If the function fails, it returns  an <b>NTSTATUS</b> code, which can be one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_QUOTA_EXCEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller's memory quota is insufficient to allocate the output buffer returned by the authentication package.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_ACCOUNT_RESTRICTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user account and password are legitimate, but the user account has a restriction that prevents logon at this time. For more information, see the value stored in the <i>SubStatus</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_BAD_VALIDATION_CLASS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The authentication information provided is not recognized by the authentication package.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_LOGON_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The logon attempt failed. The reason for the failure is not specified, but typical reasons include misspelled user names and misspelled passwords.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_LOGON_SERVERS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No domain controllers are available to service the authentication request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_SUCH_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified authentication package is not recognized by the LSA.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_PKINIT_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Kerberos client received a KDC certificate that is not valid. For device logon, strict KDC validation is required, so the KDC must have certificates that use the "Kerberos Authentication" template or equivalent. Also, the KDC certificate could be expired, revoked, or the client is under active attack of sending requests to the wrong server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_PKINIT_CLIENT_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Kerberos client is using a system certificate that is not valid. For device logon, there must be a DNS name. Also, the system certificate could be expired or the wrong one could be selected.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsalogonuser
 * @since windows5.1.2600
 */
export LsaLogonUser(LsaHandle, OriginName, LogonType, AuthenticationPackage, AuthenticationInformation, AuthenticationInformationLength, LocalGroups, SourceContext, ProfileBuffer, ProfileBufferLength, LogonId, Token, Quotas, SubStatus) {
    ProfileBufferMarshal := ProfileBuffer is VarRef ? "ptr*" : "ptr"
    ProfileBufferLengthMarshal := ProfileBufferLength is VarRef ? "uint*" : "ptr"
    SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"

    result := DllCall("SECUR32.dll\LsaLogonUser", HANDLE, LsaHandle, LSA_STRING.Ptr, OriginName, SECURITY_LOGON_TYPE, LogonType, "uint", AuthenticationPackage, "ptr", AuthenticationInformation, "uint", AuthenticationInformationLength, TOKEN_GROUPS.Ptr, LocalGroups, TOKEN_SOURCE.Ptr, SourceContext, ProfileBufferMarshal, ProfileBuffer, ProfileBufferLengthMarshal, ProfileBufferLength, LUID.Ptr, LogonId, HANDLE.Ptr, Token, QUOTA_LIMITS.Ptr, Quotas, SubStatusMarshal, SubStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Obtains the unique identifier of an authentication package.
 * @remarks
 * The authentication package identifier is used in calls to authentication functions such as 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a>.
 * @param {HANDLE} LsaHandle Handle obtained from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted">LsaConnectUntrusted</a>.
 * @param {Pointer<LSA_STRING>} PackageName Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_string">LSA_STRING</a> structure that specifies the name of the authentication package. The package name must not exceed 127 bytes in length. The following table lists the names of the Microsoft-provided authentication packages.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MSV1_0_PACKAGE_NAME"></a><a id="msv1_0_package_name"></a><dl>
 * <dt><b>MSV1_0_PACKAGE_NAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * ANSI version of the MSV1_0 authentication package name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="MICROSOFT_KERBEROS_NAME_A"></a><a id="microsoft_kerberos_name_a"></a><dl>
 * <dt><b>MICROSOFT_KERBEROS_NAME_A</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * ANSI version of the Kerberos authentication package name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="NEGOSSP_NAME_A"></a><a id="negossp_name_a"></a><dl>
 * <dt><b>NEGOSSP_NAME_A</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * ANSI version of the Negotiate authentication package name.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} AuthenticationPackage Pointer to a <b>ULONG</b> that receives the authentication package identifier.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. The following are possible error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_SUCH_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified authentication package is unknown to the LSA.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NAME_TOO_LONG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The authentication package name exceeds 127 bytes.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage
 * @since windows5.1.2600
 */
export LsaLookupAuthenticationPackage(LsaHandle, PackageName, AuthenticationPackage) {
    AuthenticationPackageMarshal := AuthenticationPackage is VarRef ? "uint*" : "ptr"

    result := DllCall("SECUR32.dll\LsaLookupAuthenticationPackage", HANDLE, LsaHandle, LSA_STRING.Ptr, PackageName, AuthenticationPackageMarshal, AuthenticationPackage, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees the memory used by a buffer previously allocated by the LSA.
 * @remarks
 * Some of the LSA authentication functions allocate memory buffers to hold returned information, for example, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a>. Your application should call <b>LsaFreeReturnBuffer</b> to free these buffers when they are no longer needed.
 * @param {Pointer<Void>} _Buffer Pointer to the buffer to be freed.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer
 * @since windows5.1.2600
 */
export LsaFreeReturnBuffer(_Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\LsaFreeReturnBuffer", _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Used by a logon application to communicate with an authentication package.
 * @remarks
 * Logon applications can call <b>LsaCallAuthenticationPackage</b> to communicate with an authentication package. There are several reasons why an application may do this:
 * 
 * <ul>
 * <li>To implement multiple-message authentication protocols, such as the NTLM Challenge-Response protocol.</li>
 * <li>To pass state change information to the authentication package. For example, the NTLM might notify the MSV1_0 package that a previously unreachable domain controller is now reachable. The authentication package would then re-logon any users logged on to that domain controller.</li>
 * </ul>
 * Typically, this function is used to exchange information with a custom authentication package. This function is not needed by an application that is using one of the authentication packages supplied with Windows, such as MSV1_0 or Kerberos.
 * 
 * You must call <b>LsaCallAuthenticationPackage</b> to clean up PKINIT device credentials for LOCAL_SYSTEM and NETWORK_SERVICE. When there is no PKINIT device credential, a successful call does no operation. When there is a PKINIT device credential, a successful call cleans up the PKINIT device credential so that only the password credential remains.
 * @param {HANDLE} LsaHandle A handle obtained from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted">LsaConnectUntrusted</a>.
 * @param {Integer} AuthenticationPackage Supplies the identifier of the authentication package. This value is obtained by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage">LsaLookupAuthenticationPackage</a>.
 * @param {Integer} ProtocolSubmitBuffer An authentication package–specific message buffer passed to the authentication package.
 * 
 * For information about the format and content of this buffer, see the documentation for the individual authentication package.
 * @param {Integer} SubmitBufferLength Indicates the length, in bytes, of the <i>ProtocolSubmitBuffer</i> buffer.
 * @param {Pointer<Pointer<Void>>} ProtocolReturnBuffer A pointer that receives the address of the buffer returned by the authentication package.
 * 
 * For information about the format and content of this buffer, see the documentation for the individual authentication package.
 * 
 * This buffer is allocated by this function. When you have finished using this buffer, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LsaFreeReturnBuffer</a> function.
 * @param {Pointer<Integer>} ReturnBufferLength A pointer to a <b>ULONG</b> that receives the length of the returned buffer, in bytes.
 * @param {Pointer<Integer>} ProtocolStatus If the function succeeds, this parameter receives an <b>NTSTATUS</b> code that indicates the completion status of the authentication package.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS. Check the <i>ProtocolStatus</i> parameter to obtain the status returned by the authentication package.
 * 
 * If the function fails, the return value is an <b>NTSTATUS</b> code. The following are possible error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_QUOTA_EXCEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The call could not be completed because the client's memory quota is not sufficient to allocate the return buffer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_SUCH_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified authentication package is not recognized by the LSA.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_PKINIT_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Kerberos client received a KDC certificate that is not valid. For device logon, strict KDC validation is required, so the KDC must have certificates that use the "Kerberos Authentication" template or equivalent. Also the KDC certificate could be expired, revoked, or the client is under active attack of sending requests to the wrong server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_PKINIT_CLIENT_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Kerberos client is using a system certificate that is not valid. For device logon, there must be a DNS name. Also, the system certificate could be expired or the wrong one could be selected.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage
 * @since windows5.1.2600
 */
export LsaCallAuthenticationPackage(LsaHandle, AuthenticationPackage, ProtocolSubmitBuffer, SubmitBufferLength, ProtocolReturnBuffer, ReturnBufferLength, ProtocolStatus) {
    ProtocolReturnBufferMarshal := ProtocolReturnBuffer is VarRef ? "ptr*" : "ptr"
    ReturnBufferLengthMarshal := ReturnBufferLength is VarRef ? "uint*" : "ptr"
    ProtocolStatusMarshal := ProtocolStatus is VarRef ? "int*" : "ptr"

    result := DllCall("SECUR32.dll\LsaCallAuthenticationPackage", HANDLE, LsaHandle, "uint", AuthenticationPackage, "ptr", ProtocolSubmitBuffer, "uint", SubmitBufferLength, ProtocolReturnBufferMarshal, ProtocolReturnBuffer, ReturnBufferLengthMarshal, ReturnBufferLength, ProtocolStatusMarshal, ProtocolStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Deletes the caller's logon application context and closes the connection to the LSA server.
 * @remarks
 * If your logon application references the connection handle after calling the <b>LsaDeregisterLogonProcess</b> function, unexpected behavior can result.
 * @param {HANDLE} LsaHandle Handle obtained from a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted">LsaConnectUntrusted</a> call.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaderegisterlogonprocess
 * @since windows5.1.2600
 */
export LsaDeregisterLogonProcess(LsaHandle) {
    result := DllCall("SECUR32.dll\LsaDeregisterLogonProcess", HANDLE, LsaHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Establishes an untrusted connection to the LSA server.
 * @remarks
 * <b>LsaConnectUntrusted</b> returns a handle to an untrusted connection; it does not verify any information about the caller. The handle should be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaderegisterlogonprocess">LsaDeregisterLogonProcess</a> function.
 * 
 * If your application simply needs to query information from authentication packages, you can use the handle returned by this function in calls to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage">LsaLookupAuthenticationPackage</a>.
 * 
 * Applications with the SeTcbPrivilege privilege may create a trusted connection by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaregisterlogonprocess">LsaRegisterLogonProcess</a>.
 * @param {Pointer<HANDLE>} LsaHandle Pointer to a handle that receives the connection handle, which must be provided in future authentication services.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function converts an NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted
 * @since windows5.1.2600
 */
export LsaConnectUntrusted(LsaHandle) {
    result := DllCall("SECUR32.dll\LsaConnectUntrusted", HANDLE.Ptr, LsaHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaFreeMemory function frees memory allocated for an output buffer by an LSA function call.
 * @param {Pointer<Void>} _Buffer Pointer to memory buffer that was allocated by an LSA function call. If <b>LsaFreeMemory</b> is successful, this buffer is freed.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be the following value or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_UNSUCCESSFUL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Memory could not be freed because it was not allocated by an LSA function call.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsafreememory
 * @since windows5.1.2600
 */
export LsaFreeMemory(_Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaFreeMemory", _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaClose function closes a handle to a Policy or TrustedDomain object.
 * @param {LSA_HANDLE} ObjectHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaopenpolicy">LsaOpenPolicy</a> function or to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaopentrusteddomainbyname">LsaOpenTrustedDomainByName</a> function. Following the completion of this call, the handle is no longer valid.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaclose
 * @since windows5.1.2600
 */
export LsaClose(ObjectHandle) {
    result := DllCall("ADVAPI32.dll\LsaClose", LSA_HANDLE, ObjectHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves the set of existing logon session identifiers (LUIDs) and the number of sessions.
 * @remarks
 * To retrieve information about the logon sessions returned by <b>LsaEnumerateLogonSessions</b>, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsagetlogonsessiondata">LsaGetLogonSessionData</a> function.
 * @param {Pointer<Integer>} LogonSessionCount Pointer to a long integer that receives the number of elements returned in the array returned in <i>LogonSessionList</i> parameter.
 * @param {Pointer<Pointer<LUID>>} LogonSessionList Address of a pointer to a LUID. The pointer receives the first element of an array of logon session identifiers. The memory used by the array is allocated by the LSA. When the array is no longer needed, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LSAFreeReturnBuffer</a> function to free it.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code indicating the reason.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaenumeratelogonsessions
 * @since windows5.1.2600
 */
export LsaEnumerateLogonSessions(LogonSessionCount, LogonSessionList) {
    LogonSessionCountMarshal := LogonSessionCount is VarRef ? "uint*" : "ptr"
    LogonSessionListMarshal := LogonSessionList is VarRef ? "ptr*" : "ptr"

    result := DllCall("SECUR32.dll\LsaEnumerateLogonSessions", LogonSessionCountMarshal, LogonSessionCount, LogonSessionListMarshal, LogonSessionList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves information about a specified logon session.
 * @remarks
 * To obtain valid logon session identifiers that may be passed to this function's <i>LogonId</i> parameter, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratelogonsessions">LsaEnumerateLogonSessions</a> function.
 * 
 * If  <i>LogonID</i> specifies the LocalSystem account (0x0:0x3e7), then this function returns zero for the logon session data retrieved in <i>ppLogonSessionData</i>. The reason is that the LocalSystem account does not get logged on in the typical logon manner. Rather, the LocalSystem account is active after the system starts.
 * @param {Pointer<LUID>} LogonId Specifies a pointer to a <b>LUID</b> that identifies the logon session whose information will be retrieved. For information about valid values for this parameter, see Remarks.
 * @param {Pointer<Pointer<SECURITY_LOGON_SESSION_DATA>>} ppLogonSessionData Address of a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-security_logon_session_data">SECURITY_LOGON_SESSION_DATA</a> structure containing information on the logon session specified by <i>LogonId</i>. This structure is allocated by the LSA. When the information is no longer needed, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LsaFreeReturnBuffer</a> function to free the memory used by this structure.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an <b>NTSTATUS</b> code indicating the reason.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsagetlogonsessiondata
 * @since windows5.1.2600
 */
export LsaGetLogonSessionData(LogonId, ppLogonSessionData) {
    ppLogonSessionDataMarshal := ppLogonSessionData is VarRef ? "ptr*" : "ptr"

    result := DllCall("SECUR32.dll\LsaGetLogonSessionData", LUID.Ptr, LogonId, ppLogonSessionDataMarshal, ppLogonSessionData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Opens a handle to the Policy object on a local or remote system.
 * @remarks
 * To administer the local security policy of a local or remote system, you must call the <b>LsaOpenPolicy</b> function to establish a session with that system's LSA subsystem. <b>LsaOpenPolicy</b> connects to the LSA of the target system and returns a handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object of that system. You can use this handle in subsequent LSA function calls to administer the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/local-security-policy">local security policy</a> information of the target system.
 * 
 * For an example that demonstrates calling this function see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<LSA_UNICODE_STRING>} SystemName A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the target system. The name can have the form "<i>ComputerName</i>" or "&#92;&#92;<i>ComputerName</i>". If this parameter is <b>NULL</b>, the function opens the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object on the local system.
 * @param {Pointer<LSA_OBJECT_ATTRIBUTES>} ObjectAttributes A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_object_attributes">LSA_OBJECT_ATTRIBUTES</a> structure that specifies the connection attributes. The structure members are not used; initialize them to <b>NULL</b> or zero.
 * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> that specifies the requested access rights. The function fails if the DACL of the target system does not allow the caller the requested access. To determine the access rights that you need, see the documentation for the LSA functions with which you want to use the policy handle.
 * @param {Pointer<LSA_HANDLE>} PolicyHandle A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/lsa-handle">LSA_HANDLE</a> variable that receives a handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object.
 * 
 * When you no longer need this handle, pass it to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaclose">LsaClose</a> function to close it.
 * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
 * 
 * If the function fails, it returns an <b>NTSTATUS</b> code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaopenpolicy
 * @since windows5.1.2600
 */
export LsaOpenPolicy(SystemName, ObjectAttributes, DesiredAccess, PolicyHandle) {
    result := DllCall("ADVAPI32.dll\LsaOpenPolicy", LSA_UNICODE_STRING.Ptr, SystemName, LSA_OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", DesiredAccess, LSA_HANDLE.Ptr, PolicyHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<LSA_UNICODE_STRING>} CAPDNs 
 * @param {Integer} CAPDNCount 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export LsaSetCAPs(CAPDNs, CAPDNCount, Flags) {
    result := DllCall("ADVAPI32.dll\LsaSetCAPs", LSA_UNICODE_STRING.Ptr, CAPDNs, "uint", CAPDNCount, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns an array of central access policies (CAPs) identifiers (CAPIDs) of all the CAPs applied on a specific computer.
 * @remarks
 * For specific details about the central access policies, you can query the attributes of the central access policy object in the Active Directory on the specified computer's domain controller.  Look for the object whose <b>msAuthz-CentralAccessPolicyID</b> attribute matches one of the returned CAPIDs.
 * @param {Pointer<LSA_UNICODE_STRING>} SystemName A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the specific computer. The name can have the form of "ComputerName" or "\\ComputerName". If this parameter is <b>NULL</b>, then the function returns the CAPIDs of the local computer.
 * @param {Pointer<Pointer<PSID>>} CAPIDs A pointer to a variable that receives an array of pointers to CAPIDs that identify the CAPs available on the specified computer. When you have finished using the CAPIDs, call the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function on each element in the array and the entire array.
 * @param {Pointer<Integer>} CAPIDCount A pointer to a variable that receives the number of CAPs that are available on the specified computer. The array returned in the <i>CAPIDs</i> parameter contains the same number of elements as the <i>CAPIDCount</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is one of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to  convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntlsa/nf-ntlsa-lsagetappliedcapids
 * @since windows8.0
 */
export LsaGetAppliedCAPIDs(SystemName, CAPIDs, CAPIDCount) {
    CAPIDsMarshal := CAPIDs is VarRef ? "ptr*" : "ptr"
    CAPIDCountMarshal := CAPIDCount is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaGetAppliedCAPIDs", LSA_UNICODE_STRING.Ptr, SystemName, CAPIDsMarshal, CAPIDs, CAPIDCountMarshal, CAPIDCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the Central Access Policies (CAPs) for the specified IDs.
 * @param {Pointer<PSID>} CAPIDs A pointer to a variable that contains an array of pointers to CAPIDs that identify the CAPs being queried.
 * @param {Integer} CAPIDCount The number of IDs in the <i>CAPIDs</i> parameter.
 * @param {Pointer<Pointer<CENTRAL_ACCESS_POLICY>>} CAPs Receives a pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/ns-ntlsa-central_access_policy">CENTRAL_ACCESS_POLICY</a> structures representing the queried CAPs.
 * @param {Pointer<Integer>} CAPCount The number of <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/ns-ntlsa-central_access_policy">CENTRAL_ACCESS_POLICY</a> structure pointers returned in the <i>CAPs</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be one of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntlsa/nf-ntlsa-lsaquerycaps
 * @since windows8.0
 */
export LsaQueryCAPs(CAPIDs, CAPIDCount, CAPs, CAPCount) {
    CAPIDsMarshal := CAPIDs is VarRef ? "ptr*" : "ptr"
    CAPsMarshal := CAPs is VarRef ? "ptr*" : "ptr"
    CAPCountMarshal := CAPCount is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaQueryCAPs", CAPIDsMarshal, CAPIDs, "uint", CAPIDCount, CAPsMarshal, CAPs, CAPCountMarshal, CAPCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves information about a Policy object.
 * @remarks
 * For an example that demonstrates calling this function see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/managing-policy-information">Managing Policy Information</a>.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The required access rights for this handle depend on the value of the <i>InformationClass</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {POLICY_INFORMATION_CLASS} InformationClass 
 * @param {Pointer<Pointer<Void>>} _Buffer Pointer to a variable that receives a pointer to a structure containing the requested information. The type of structure depends on the value of the <i>InformationClass</i> parameter. 
 * 
 * 
 * 
 * 
 * When you no longer need the information, pass the returned pointer to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
 * @returns {NTSTATUS} If the <b>LsaQueryInformationPolicy</b> function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaqueryinformationpolicy
 * @since windows5.1.2600
 */
export LsaQueryInformationPolicy(PolicyHandle, InformationClass, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaQueryInformationPolicy", LSA_HANDLE, PolicyHandle, POLICY_INFORMATION_CLASS, InformationClass, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Modifies information in a Policy object.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The required access rights for this handle depend on the value of the <i>InformationClass</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {POLICY_INFORMATION_CLASS} InformationClass 
 * @param {Pointer<Void>} _Buffer Pointer to a structure containing the information to set. The type of structure depends on the value of the <i>InformationClass</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsasetinformationpolicy
 * @since windows5.1.2600
 */
export LsaSetInformationPolicy(PolicyHandle, InformationClass, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaSetInformationPolicy", LSA_HANDLE, PolicyHandle, POLICY_INFORMATION_CLASS, InformationClass, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves domain information from the Policyobject.
 * @remarks
 * The POLICY_VIEW_LOCAL_INFORMATION access type is required to retrieve domain information from the  <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object-access-rights">Policy Object Access Rights</a>.
 * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object for the system.
 * @param {POLICY_DOMAIN_INFORMATION_CLASS} InformationClass <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_domain_information_class">POLICY_DOMAIN_INFORMATION_CLASS</a> enumeration that specifies the information to be returned from the  <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PolicyDomainEfsInformation"></a><a id="policydomainefsinformation"></a><a id="POLICYDOMAINEFSINFORMATION"></a><dl>
 * <dt><b>PolicyDomainEfsInformation</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The information is for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">Encrypting File System</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PolicyDomainKerberosTicketInformation"></a><a id="policydomainkerberosticketinformation"></a><a id="POLICYDOMAINKERBEROSTICKETINFORMATION"></a><dl>
 * <dt><b>PolicyDomainKerberosTicketInformation</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The information is for a Kerberos ticket.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Pointer<Void>>} _Buffer Pointer to a buffer that receives the requested information.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be the following value or one of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INTERNAL_DB_CORRUPTION</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The policy database is 
 *             corrupt.  The returned policy information is  not valid for
 *             the given class.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaquerydomaininformationpolicy
 * @since windows5.1.2600
 */
export LsaQueryDomainInformationPolicy(PolicyHandle, InformationClass, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaQueryDomainInformationPolicy", LSA_HANDLE, PolicyHandle, POLICY_DOMAIN_INFORMATION_CLASS, InformationClass, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets domain information to the Policyobject.
 * @remarks
 * The POLICY_TRUST_ADMIN access type is required to set domain information to the  <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object-access-rights">Policy Object Access Rights</a>.
 * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object for the system.
 * @param {POLICY_DOMAIN_INFORMATION_CLASS} InformationClass <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_domain_information_class">POLICY_DOMAIN_INFORMATION_CLASS</a> enumeration that specifies the information to be set to the  <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PolicyDomainEfsInformation"></a><a id="policydomainefsinformation"></a><a id="POLICYDOMAINEFSINFORMATION"></a><dl>
 * <dt><b>PolicyDomainEfsInformation</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The information is for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">Encrypting File System</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PolicyDomainKerberosTicketInformation"></a><a id="policydomainkerberosticketinformation"></a><a id="POLICYDOMAINKERBEROSTICKETINFORMATION"></a><dl>
 * <dt><b>PolicyDomainKerberosTicketInformation</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The information is for a Kerberos ticket.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} _Buffer Pointer to a buffer that contains  the  information to set to the  <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be the following value or one of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INTERNAL_DB_CORRUPTION</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The policy database is 
 *             corrupt.  The returned policy information is  not valid for
 *             the given class.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsasetdomaininformationpolicy
 * @since windows5.1.2600
 */
export LsaSetDomainInformationPolicy(PolicyHandle, InformationClass, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaSetDomainInformationPolicy", LSA_HANDLE, PolicyHandle, POLICY_DOMAIN_INFORMATION_CLASS, InformationClass, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaRegisterPolicyChangeNotification function registers an event handle with the local security authority (LSA). This event handle is signaled whenever the indicated LSA policy is modified.
 * @remarks
 * When you have finished using a notification event that has been registered by the <b>LsaRegisterPolicyChangeNotification</b> function, unregister it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaunregisterpolicychangenotification">LsaUnregisterPolicyChangeNotification</a> function.
 * 
 * For an example that demonstrates calling this function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/receiving-policy-change-events">Receiving Policy Change Events</a>.
 * @param {POLICY_NOTIFICATION_INFORMATION_CLASS} InformationClass A
 * @param {HANDLE} NotificationEventHandle A handle to an event obtained by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function. The event can be either named or unnamed.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaregisterpolicychangenotification
 * @since windows5.1.2600
 */
export LsaRegisterPolicyChangeNotification(InformationClass, NotificationEventHandle) {
    result := DllCall("SECUR32.dll\LsaRegisterPolicyChangeNotification", POLICY_NOTIFICATION_INFORMATION_CLASS, InformationClass, HANDLE, NotificationEventHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaUnregisterPolicyChangeNotification function disables a previously registered notification event.
 * @remarks
 * For an example that demonstrates calling this function see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/receiving-policy-change-events">Receiving Policy Change Events</a>.
 * @param {POLICY_NOTIFICATION_INFORMATION_CLASS} InformationClass A
 * @param {HANDLE} NotificationEventHandle A handle to the notification event to unregister.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaunregisterpolicychangenotification
 * @since windows5.1.2600
 */
export LsaUnregisterPolicyChangeNotification(InformationClass, NotificationEventHandle) {
    result := DllCall("SECUR32.dll\LsaUnregisterPolicyChangeNotification", POLICY_NOTIFICATION_INFORMATION_CLASS, InformationClass, HANDLE, NotificationEventHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaEnumerateTrustedDomains function retrieves the names and SIDs of domains trusted to authenticate logon credentials.
 * @remarks
 * For domains with domain controllers running only Windows NT 4.0 or earlier versions of Windows NT, <b>LsaEnumerateTrustedDomains</b> returns a list of all trusted domains. In releases of Windows NT up to and including release 4.0, all trusted domains are directly trusted.
 * 
 * In Windows XP and Windows 2000 mixed-mode domains, domain controllers may be running Windows XP, Windows 2000, or Windows NT. Therefore, in mixed-mode domains, some trusted domains are directly trusted and others are indirectly trusted. When enumerating the trusted domains of a system in a mixed-mode domain, <b>LsaEnumerateTrustedDomains</b> returns only directly trusted domains.
 * 
 * In contrast, Windows XP and Windows 2000 native-mode domains contain only Windows 2000 domain controllers, even though there may be members in the domain running Windows NT 4.0 or earlier versions. When enumerating the trusted domains of a system in a native-mode Windows XP and Windows 2000 domain, <b>LsaEnumerateTrustedDomains</b> returns both directly trusted and indirectly trusted domains.
 * 
 * Retrieving all trust information may require more than a single <b>LsaEnumerateTrustedDomains</b> call. You can use the <i>EnumerationContext</i> parameter to make multiple calls, as follows: On the first call, set the variable pointed to by <i>EnumerationContext</i> to zero. If <b>LsaEnumerateTrustedDomains</b> returns STATUS_SUCCESS or STATUS_MORE_ENTRIES, call the function again, passing in the <i>EnumerationContext</i> value returned by the previous call. The enumeration is complete when the function returns STATUS_NO_MORE_ENTRIES.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<Integer>} EnumerationContext Pointer to an enumeration handle that enables you to make multiple calls to enumerate all the trusted domains. On the first call to <b>LsaEnumerateTrustedDomains</b>, <i>EnumerationContext</i> must point to a variable that has been initialized to zero. On subsequent calls to <b>LsaEnumerateTrustedDomains</b>, <i>EnumerationContext</i> must point to the enumeration handle returned by the previous call.
 * @param {Pointer<Pointer<Void>>} _Buffer Receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_trust_information">LSA_TRUST_INFORMATION</a> structures that contain the names and SIDs of one or more trusted domains. 
 * 
 * 
 * 
 * 
 * When you no longer need the information, pass the returned pointer to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
 * @param {Integer} PreferedMaximumLength Specifies the preferred maximum size, in bytes, of the returned buffer. This information is approximate; the actual number of bytes returned may be greater than this value.
 * @param {Pointer<Integer>} CountReturned Pointer to a variable that receives the number of elements returned in the <i>Buffer</i> parameter.
 * @returns {NTSTATUS} If the function is successful, the return value is one of the following NTSTATUS values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration has been successfully completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_MORE_ENTRIES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The call was successful, but there are more trusted domains to be enumerated. Call <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomains">LsaEnumerateTrustedDomains</a> again, passing the value returned in the <i>EnumerationContext</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_MORE_ENTRIES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are no more trusted domains to enumerate.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomains
 * @since windows5.1.2600
 */
export LsaEnumerateTrustedDomains(PolicyHandle, EnumerationContext, _Buffer, PreferedMaximumLength, CountReturned) {
    EnumerationContextMarshal := EnumerationContext is VarRef ? "uint*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"
    CountReturnedMarshal := CountReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaEnumerateTrustedDomains", LSA_HANDLE, PolicyHandle, EnumerationContextMarshal, EnumerationContext, _BufferMarshal, _Buffer, "uint", PreferedMaximumLength, CountReturnedMarshal, CountReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves the security identifiers (SIDs) that correspond to an array of user, group, or local group names.
 * @remarks
 * > [!WARNING]
 * >Use fully qualified account names (for example, domain_name\user_name) instead of isolated names (for example, user_name). Fully qualified names are unambiguous and provide better performance when the lookup is performed. This function also supports fully qualified DNS names (for example, example.example.com\user_name) and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal names</a> (UPN) (for example, someone@example.com).
 * 
 * > [!WARNING]
 * >For more information about the limitations of isolated names, please refer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupnames2">LsaLookupNames2</a> documentation.
 * 
 * The <b>LsaLookupNames</b> function uses the following algorithm to translate account names.
 * 
 * <p class="proch"><b>To translate names</b>
 * 
 * <ol>
 * <li>If the name is a well-known name, such as Local or Interactive, the function returns the corresponding well-known <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).</li>
 * <li>If the name is the name of the built-in domain, the function returns the SID of that domain.</li>
 * <li>If the name is the name of the account domain, the function returns the SID of that domain.</li>
 * <li>If the name is the name of the primary domain, the function returns the SID of that domain.</li>
 * <li>If the name is one of the names of the trusted domain, the function returns the SID of that domain.</li>
 * <li>If the name is a user, group, or local group account in the built-in domain, the function returns the SID of that account.</li>
 * <li>If the name is a user, group, or local group account in the account domain on the local system, the function returns the SID of that account.</li>
 * <li>If the name is found in the cache, the function returns the SID of that account.
 * <li>If the name is a user, group, or a local group in the primary domain, the function returns the SID of that account.</li>
 * <li>After looking in the primary domain, the primary domain looks in each of its trusted domains.</li>
 * <li>Otherwise, the name is not translated.</li>
 * </ol>
 * 
 * In addition to looking up local accounts, local domain accounts, and explicitly trusted domain accounts, <b>LsaLookupNames</b> can look up the name of any account in any domain in the Windows forest.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Integer} Count Specifies the number of names in the <i>Names</i> array. This is also the number of entries returned in the <i>Sids</i> array. This value must be less than or equal to 1000.
 * @param {Pointer<LSA_UNICODE_STRING>} Names Pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures that contain the names to look up. The strings in these structures can be the names of user, group, or local group accounts, or the names of domains. Domain names can be DNS domain names or NetBIOS domain names. 
 * 
 * 
 * 
 * 
 * For more information about the format of the name strings, see Remarks.
 * @param {Pointer<Pointer<LSA_REFERENCED_DOMAIN_LIST>>} ReferencedDomains Receives a pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure. The <b>Domains</b> member of this structure is an array that contains an entry for each domain in which a name was found. The <b>DomainIndex</b> member of each entry in the <i>Sids</i> array is the index of the <b>Domains</b> array entry for the domain in which the name was found. 
 * 
 * 
 * 
 * 
 * When you have finished using the returned pointer, free the memory by calling the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
 * @param {Pointer<Pointer<LSA_TRANSLATED_SID>>} Sids Receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_translated_sid">LSA_TRANSLATED_SID</a> structures. Each entry in the <i>Sids</i> array contains the SID information for the corresponding entry in the <i>Names</i> array.  
 * 
 * 
 * 
 * 
 * When you have finished using the returned pointer, free the memory by calling the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
 * @returns {NTSTATUS} If the function succeeds, the function returns  one of the following <b>NTSTATUS</b> values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SOME_NOT_MAPPED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Some of the names could not be translated. This is an informational-level return value.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * All of the names were found and successfully translated.
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * If the function fails, the return value is the following <b>NTSTATUS</b> value or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NONE_MAPPED</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * None of the names were translated.
 * </td>
 * </tr>
 * 
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_TOO_MANY_NAMES</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Names array parameter was too large.
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsalookupnames
 * @since windows5.1.2600
 */
export LsaLookupNames(PolicyHandle, Count, Names, ReferencedDomains, Sids) {
    ReferencedDomainsMarshal := ReferencedDomains is VarRef ? "ptr*" : "ptr"
    SidsMarshal := Sids is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaLookupNames", LSA_HANDLE, PolicyHandle, "uint", Count, LSA_UNICODE_STRING.Ptr, Names, ReferencedDomainsMarshal, ReferencedDomains, SidsMarshal, Sids, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves the security identifiers (SIDs) for specified account names. LsaLookupNames2 can look up the SID for any account in any domain in a Windows forest.
 * @remarks
 * Use fully qualified account names (for example, <i>DomainName</i>&#92;<i>UserName</i>) instead of isolated names (for example, <i>UserName</i>). Fully qualified names are unambiguous and provide better performance when the lookup is performed. This function also supports fully qualified DNS names (for example, <i>Example</i>.<i>Example</i>.com&#92;<i>UserName</i>) and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal names</a> (UPN) (for example, <i>Someone</i>@<i>Example</i>.com).
 * 
 * Translation of isolated names introduces the possibility of name collisions because the same name may be used in multiple domains. The <b>LsaLookupNames2</b> function uses the following algorithm to translate isolated names.
 * 
 * <p class="proch"><b>To translate isolated names</b>
 * 
 * <ol>
 * <li>If the name is a well-known name, such as Local or Interactive, the function returns the corresponding well-known <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).</li>
 * <li>If the name is the name of the built-in domain, the function returns the SID of that domain.</li>
 * <li>If the name is the name of the account domain, the function returns the SID of that domain.</li>
 * <li>If the name is the name of the primary domain, the function returns the SID of that domain.</li>
 * <li>If the name is one of the names of the trusted domain, the function returns the SID of that domain.</li>
 * <li>If the name is a user, group, or local group account in the built-in domain, the function returns the SID of that account.</li>
 * <li>If the name is a user, group, or local group account in the account domain on the local system, the function returns the SID of that account.</li>
 * <li>If the name is a user, group, or a local group in the primary domain, the function returns the SID of that account.</li>
 * <li>After looking in the primary domain, the function looks in each of the primary domain's trusted domains.</li>
 * <li>Otherwise, the name is not translated.</li>
 * </ol>
 * @param {LSA_HANDLE} PolicyHandle A handle to a 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Integer} Flags Values that control the behavior of this function. The following value is currently defined.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="LSA_LOOKUP_ISOLATED_AS_LOCAL"></a><a id="lsa_lookup_isolated_as_local"></a><dl>
 * <dt><b>LSA_LOOKUP_ISOLATED_AS_LOCAL</b></dt>
 * <dt>0x80000000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function searches only on the local systems for names that do not specify a domain. The function does search on remote systems for names that do specify a domain.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} Count Specifies the number of names in the <i>Names</i> array. This is also the number of entries returned in the <i>Sids</i> array.
 * @param {Pointer<LSA_UNICODE_STRING>} Names Pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures that contain the names to look up. These strings can be the names of user, group, or local group accounts, or the names of domains. Domain names can be DNS domain names or NetBIOS domain names. 
 * 
 * 
 * 
 * 
 * For more information about the format of the name strings, see Remarks.
 * @param {Pointer<Pointer<LSA_REFERENCED_DOMAIN_LIST>>} ReferencedDomains Receives a pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure. The <b>Domains</b> member of this structure is an array that contains an entry for each domain in which a name was found. The <b>DomainIndex</b> member of each entry in the <i>Sids</i> array is the index of the <b>Domains</b> array entry for the domain in which the name was found.
 * 
 * When you have finished using the returned pointer, free it by calling the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
 * @param {Pointer<Pointer<LSA_TRANSLATED_SID2>>} Sids Receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_translated_sid2">LSA_TRANSLATED_SID2</a> structures. Each entry in the <i>Sids</i> array contains the SID information for the corresponding entry in the <i>Names</i> array. 
 * 
 * 
 * 
 * 
 * When you have finished using the returned pointer, free it by calling the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
 * @returns {NTSTATUS} If the function succeeds, the function returns one of the following <b>NTSTATUS</b> values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SOME_NOT_MAPPED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Some of the names could not be translated. This is an informational-level return value.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * All of the names were found and successfully translated.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If the function fails, the return value is the following <b>NTSTATUS</b> value or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NONE_MAPPED</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * None of the names were translated.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsalookupnames2
 * @since windows5.1.2600
 */
export LsaLookupNames2(PolicyHandle, Flags, Count, Names, ReferencedDomains, Sids) {
    ReferencedDomainsMarshal := ReferencedDomains is VarRef ? "ptr*" : "ptr"
    SidsMarshal := Sids is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaLookupNames2", LSA_HANDLE, PolicyHandle, "uint", Flags, "uint", Count, LSA_UNICODE_STRING.Ptr, Names, ReferencedDomainsMarshal, ReferencedDomains, SidsMarshal, Sids, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Looks up the names that correspond to an array of security identifiers (SIDs). If LsaLookupSids cannot find a name that corresponds to a SID, the function returns the SID in character form.
 * @remarks
 * For account SIDs, the string returned in the <b>Name</b> member is the isolated name of the account (for example, user_name). If you need the composite name of the account (for example, Acctg\user_name), get the domain name from the <i>ReferencedDomains</i> buffer and append a backslash and the isolated name.
 * 
 * If the <b>LsaLookupSids</b> function cannot translate a SID, the function uses the following algorithm:
 * 
 * <ol>
 * <li>If the SID's domain is known, the <i>ReferencedDomains</i> buffer contains an entry for the domain, and the string returned in the <i>Names</i> parameter is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> representation of the account's relative identifier (RID) from the SID.</li>
 * <li>If the SID's domain is not known, the string returned in the <i>Names</i> parameter is a Unicode representation of the entire SID, and there is no domain record for this SID in the <i>ReferencedDomains</i> buffer.</li>
 * </ol>
 * In addition to looking up SIDs for local accounts, local domain accounts, and explicitly trusted domain accounts, <b>LsaLookupSids</b> can look up SIDs for any account in any domain in the Windows forest, including SIDs that appear only in the <b>SIDhistory</b> field of an account in the forest. The <b>SIDhistory</b> field stores the former SIDs of an account that has been moved from another domain. To perform these searches, the function queries the global catalog of the forest.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Integer} Count Specifies the number of SIDs in the <i>Sids</i> array. This is also the number of entries returned in the <i>Names</i> array. This value must be less than or equal to 20480.
 * @param {Pointer<PSID>} Sids Pointer to an array of SID pointers to look up. The SIDs can be well-known SIDs, user, group, or local group account SIDs, or domain SIDs.
 * @param {Pointer<Pointer<LSA_REFERENCED_DOMAIN_LIST>>} ReferencedDomains Receives a pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure. The <b>Domains</b> member of this structure is an array that contains an entry for each domain in which a SID was found. The entry for each domain contains the SID and flat name of the domain. For Windows domains, the flat name is the NetBIOS name. For links with non–Windows domains, the flat name is the identifying name of that domain, or it is <b>NULL</b>. 
 * 
 * 
 * 
 * 
 * When you no longer need the information, pass the returned pointer to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
 * @param {Pointer<Pointer<LSA_TRANSLATED_NAME>>} Names Receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_translated_name">LSA_TRANSLATED_NAME</a> structures. Each entry in the <i>Names</i> array contains the name information for the corresponding entry in the <i>Sids</i> array. For account SIDs, the <b>Name</b> member of each structure contains the isolated name of the account. For domain SIDs, the <b>Name</b> member is not valid. 
 * 
 * 
 * 
 * 
 * The <b>DomainIndex</b> member of each entry in the <i>Names</i> array is the index of an entry in the <b>Domains</b> array returned in the <i>ReferencedDomains</i> parameter. The index identifies the <b>Domains</b> array for the domain in which the SID was found.
 * 
 * When you no longer need the information, pass the returned pointer to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
 * @returns {NTSTATUS} If the function succeeds, the return value is one of the following <b>NTSTATUS</b> values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SOME_NOT_MAPPED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Some of the SIDs could not be translated. This is an informational-level return value.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * All of the SIDs were found and successfully translated.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If the function fails, the return value is an <b>NTSTATUS</b> code, which can be one of the following values or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NONE_MAPPED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * None of the SIDs were translated. This is an error-level return value.
 * 
 * </td>
 * </tr>
 * 
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_TOO_MANY_SIDS</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Sids array parameter was too large.
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsalookupsids
 * @since windows5.1.2600
 */
export LsaLookupSids(PolicyHandle, Count, Sids, ReferencedDomains, Names) {
    SidsMarshal := Sids is VarRef ? "ptr*" : "ptr"
    ReferencedDomainsMarshal := ReferencedDomains is VarRef ? "ptr*" : "ptr"
    NamesMarshal := Names is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaLookupSids", LSA_HANDLE, PolicyHandle, "uint", Count, SidsMarshal, Sids, ReferencedDomainsMarshal, ReferencedDomains, NamesMarshal, Names, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Looks up the names that correspond to an array of security identifiers (SIDs) and supports Internet provider identities. If LsaLookupSids2 cannot find a name that corresponds to a SID, the function returns the SID in character form.
 * @remarks
 * The flag LSA_LOOKUP_PREFER_INTERNET_NAMES  should be used for internet accounts such as MicrosoftAccount and Azure Active Directory accounts.
 * When this flag is specified then SID-Name lookup returns the UPN of the account in the form MicrosoftAccount\foo@outlook.com or AzureAD\foo@contoso.com. 
 * For Microsoft Accounts both the local SAM SID and the internet SID result in the UPN being returned if this flag is specified.
 * If LSA_LOOKUP_PREFER_INTERNET_NAMES is not specified then for AAD accounts the NT4 style name of the form AzureAD\foo is returned. The NT4 style name is machine specific and its usage should be carefully evaluated and if possible should be avoided.
 * For MicrosoftAccounts if LSA_LOOKUP_PREFER_INTERNET_NAMES is not specified then the local SID of the account translates to the local SAM name, and the internet SID translates to the UPN name.
 * 
 * For account SIDs, the string returned in the <b>Name</b> member is the isolated name of the account (for example, user_name). If you need the composite name of the account (for example, Acctg\user_name), get the domain name from the <i>ReferencedDomains</i> buffer and append a backslash and the isolated name.
 * 
 * If the <b>LsaLookupSids2</b> function cannot translate a SID, the function uses the following algorithm:
 * 
 * <ol>
 * <li>If the SID's domain is known, the <i>ReferencedDomains</i> buffer contains an entry for the domain, and the string returned in the <i>Names</i> parameter is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> representation of the account's relative identifier (RID) from the SID.</li>
 * <li>If the SID's domain is not known, the string returned in the <i>Names</i> parameter is a Unicode representation of the entire SID, and there is no domain record for this SID in the <i>ReferencedDomains</i> buffer.</li>
 * </ol>
 * In addition to looking up SIDs for local accounts, local domain accounts, and explicitly trusted domain accounts, <b>LsaLookupSids2</b> can look up SIDs for any account in any domain in the Windows forest, including SIDs that appear only in the <b>SIDhistory</b> field of an account in the forest. The <b>SIDhistory</b> field stores the former SIDs of an account that has been moved from another domain. To perform these searches, the function queries the global catalog of the forest.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Integer} LookupOptions Flags that modify the lookup behavior. 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID"></a><a id="lsa_lookup_disallow_connected_account_internet_sid"></a><dl>
 * <dt><b>LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Internet SIDs from identity providers for connected accounts are disallowed. Connected accounts are those accounts which have a corresponding shadow account in the local SAM database connected to an online identity provider.  For example, MicrosoftAccount is a connected account.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="LSA_LOOKUP_PREFER_INTERNET_NAMES"></a><a id="lsa_lookup_prefer_internet_names"></a><dl>
 * <dt><b>LSA_LOOKUP_PREFER_INTERNET_NAMES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 *  Returns the internet names. Otherwise the NT4 style name (domain\username) is returned. The exception is if the Microsoft Account internet SID is specified, in which case the internet name is returned unless <b>LSA_LOOKUP_DISALLOW_NON_WINDOWS_INTERNET_SID</b>  is specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="LSA_LOOKUP_RETURN_LOCAL_NAMES"></a><a id="lsa_lookup_return_local_names"></a><dl>
 * <dt><b>LSA_LOOKUP_RETURN_LOCAL_NAMES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Always returns local SAM account names even for Internet provider identities.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} Count Specifies the number of SIDs in the <i>Sids</i> array. This is also the number of entries returned in the <i>Names</i> array. This value must be less than or equal to 20480.
 * @param {Pointer<PSID>} Sids Pointer to an array of SID pointers to look up. The SIDs can be well-known SIDs, user, group, or local group account SIDs, or domain SIDs.
 * @param {Pointer<Pointer<LSA_REFERENCED_DOMAIN_LIST>>} ReferencedDomains Receives a pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure. The <b>Domains</b> member of this structure is an array that contains an entry for each domain in which a SID was found. The entry for each domain contains the SID and flat name of the domain. For Windows domains, the flat name is the NetBIOS name. For links with non–Windows domains, the flat name is the identifying name of that domain, or it is <b>NULL</b>. 
 * 
 * 
 * 
 * 
 * When you no longer need the information, pass the returned pointer to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
 * @param {Pointer<Pointer<LSA_TRANSLATED_NAME>>} Names Receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_translated_name">LSA_TRANSLATED_NAME</a> structures. Each entry in the <i>Names</i> array contains the name information for the corresponding entry in the <i>Sids</i> array. For account SIDs, the <b>Name</b> member of each structure contains the isolated name of the account. For domain SIDs, the <b>Name</b> member is not valid. 
 * 
 * 
 * 
 * 
 * The <b>DomainIndex</b> member of each entry in the <i>Names</i> array is the index of an entry in the <b>Domains</b> array returned in the <i>ReferencedDomains</i> parameter. The index identifies the <b>Domains</b> array for the domain in which the SID was found.
 * 
 * When you no longer need the information, pass the returned pointer to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>. This memory must be freed even when the function fails with the either of the error codes <b>STATUS_NONE_MAPPED</b> or <b>STATUS_SOME_NOT_MAPPED</b>
 * @returns {NTSTATUS} If the function succeeds, the return value is one of the following <b>NTSTATUS</b> values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SOME_NOT_MAPPED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Some of the SIDs could not be translated. This is an informational-level return value.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * All of the SIDs were found and successfully translated.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If the function fails, the return value is an <b>NTSTATUS</b> code, which can be one of the following values or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NONE_MAPPED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * None of the SIDs were translated. This is an error-level return value.
 * 
 * </td>
 * </tr>
 * 
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_TOO_MANY_SIDS</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Sids array parameter was too large.
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsalookupsids2
 * @since windows8.0
 */
export LsaLookupSids2(PolicyHandle, LookupOptions, Count, Sids, ReferencedDomains, Names) {
    SidsMarshal := Sids is VarRef ? "ptr*" : "ptr"
    ReferencedDomainsMarshal := ReferencedDomains is VarRef ? "ptr*" : "ptr"
    NamesMarshal := Names is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaLookupSids2", LSA_HANDLE, PolicyHandle, "uint", LookupOptions, "uint", Count, SidsMarshal, Sids, ReferencedDomainsMarshal, ReferencedDomains, NamesMarshal, Names, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the accounts in the database of a Local Security Authority (LSA) Policy object that hold a specified privilege.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have POLICY_LOOKUP_NAMES and POLICY_VIEW_LOCAL_INFORMATION user rights. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<LSA_UNICODE_STRING>} UserRight Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the name of a privilege. For a list of privileges, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Privilege Constants</a> and 
 * Account Rights Constants. 
 * 
 * 
 * 
 * 
 * If this parameter is <b>NULL</b>, the function enumerates all accounts in the LSA database of the system associated with the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object.
 * @param {Pointer<Pointer<Void>>} _Buffer Pointer to a variable that receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_enumeration_information">LSA_ENUMERATION_INFORMATION</a> structures. The <b>Sid</b> member of each structure is a pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of an account that holds the specified privilege. 
 * 
 * 
 * 
 * 
 * When you no longer need the information, free the memory by passing the returned pointer to 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function.
 * @param {Pointer<Integer>} CountReturned Pointer to a variable that receives the number of entries returned in the <i>EnumerationBuffer</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
 * 
 * If the function fails, it returns an <b>NTSTATUS</b> code, which can be one of the following values or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_SUCH_PRIVILEGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The privilege string specified was not a valid privilege.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_MORE_ENTRIES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There were no accounts with the specified privilege.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaenumerateaccountswithuserright
 * @since windows5.1.2600
 */
export LsaEnumerateAccountsWithUserRight(PolicyHandle, UserRight, _Buffer, CountReturned) {
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"
    CountReturnedMarshal := CountReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaEnumerateAccountsWithUserRight", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, UserRight, _BufferMarshal, _Buffer, CountReturnedMarshal, CountReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaEnumerateAccountRights function enumerates the privileges assigned to an account.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {PSID} AccountSid Pointer to the SID of the account for which to enumerate privileges.
 * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} UserRights Receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures. Each structure contains the name of a privilege held by the account. For a list of privilege names, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Privilege Constants</a>
 * 
 * When you no longer need the information, pass the returned pointer to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
 * @param {Pointer<Integer>} CountOfRights Pointer to a variable that receives the number of privileges in the <i>UserRights</i> array.
 * @returns {NTSTATUS} If at least one account right is found, the function succeeds and returns STATUS_SUCCESS.
 * 
 * If no account rights are found or if the function fails for any other reason, the function returns an NTSTATUS code such as FILE_NOT_FOUND. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>. Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaenumerateaccountrights
 * @since windows5.1.2600
 */
export LsaEnumerateAccountRights(PolicyHandle, AccountSid, UserRights, CountOfRights) {
    UserRightsMarshal := UserRights is VarRef ? "ptr*" : "ptr"
    CountOfRightsMarshal := CountOfRights is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaEnumerateAccountRights", LSA_HANDLE, PolicyHandle, PSID, AccountSid, UserRightsMarshal, UserRights, CountOfRightsMarshal, CountOfRights, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Assigns one or more privileges to an account.
 * @remarks
 * If you specify privileges already granted to the account, they are ignored.
 * 
 * For an example that demonstrates calling this function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/managing-account-permissions">Managing Account Permissions</a>.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. If the account identified by the <i>AccountSid</i> parameter does not exist, the handle must have the POLICY_CREATE_ACCOUNT access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {PSID} AccountSid Pointer to the SID of the account to which the function assigns <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a>.
 * @param {Pointer<LSA_UNICODE_STRING>} UserRights Pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures. Each structure contains the name of a privilege to add to the account. For a list of privilege names, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Privilege Constants</a>.
 * @param {Integer} CountOfRights Specifies the number of elements in the <i>UserRights</i> array.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be the following value or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_SUCH_PRIVILEGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the privilege names is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaaddaccountrights
 * @since windows5.1.2600
 */
export LsaAddAccountRights(PolicyHandle, AccountSid, UserRights, CountOfRights) {
    result := DllCall("ADVAPI32.dll\LsaAddAccountRights", LSA_HANDLE, PolicyHandle, PSID, AccountSid, LSA_UNICODE_STRING.Ptr, UserRights, "uint", CountOfRights, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes one or more privileges from an account.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {PSID} AccountSid Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the account from which the privileges are removed.
 * @param {BOOLEAN} AllRights If <b>TRUE</b>, the function removes all privileges and deletes the account. In this case, the function ignores the <i>UserRights</i> parameter. If <b>FALSE</b>, the function removes the privileges specified by the <i>UserRights</i> parameter.
 * @param {Pointer<LSA_UNICODE_STRING>} UserRights Pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structures. Each structure contains the name of a privilege to be removed from the account. For a list of privilege names, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Privilege Constants</a>.
 * @param {Integer} CountOfRights Specifies the number of elements in the <i>UserRights</i> array.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be one of the following values or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_SUCH_PRIVILEGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the privilege names is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates the <i>UserRights</i> parameter was <b>NULL</b> and the <i>AllRights</i> parameter was <b>FALSE</b>.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaremoveaccountrights
 * @since windows5.1.2600
 */
export LsaRemoveAccountRights(PolicyHandle, AccountSid, AllRights, UserRights, CountOfRights) {
    result := DllCall("ADVAPI32.dll\LsaRemoveAccountRights", LSA_HANDLE, PolicyHandle, PSID, AccountSid, BOOLEAN, AllRights, LSA_UNICODE_STRING.Ptr, UserRights, "uint", CountOfRights, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaOpenTrustedDomainByName function opens the LSA policy handle of a remote trusted domain. You can pass this handle into LSA function calls in order to set or query the LSA policy of the remote machine.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This is the policy handle of the local machine. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName Name of the trusted domain. This name can be either the flat name, or the Domain Name System (DNS) domain name.
 * @param {Integer} DesiredAccess An 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that specifies the access permissions requested on the remote trusted domain object.
 * @param {Pointer<LSA_HANDLE>} TrustedDomainHandle Pointer that receives the address of the LSA policy handle of the remote trusted domain. You can pass this handle into LSA function calls in order to query and manage the LSA policy of the remote machine. 
 * 
 * 
 * 
 * 
 * When your application no longer needs this handle, it should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaclose">LsaClose</a> to delete the handle.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be one of the following values or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Caller does not have the appropriate access to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_OBJECT_NAME_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is no Trusted Domain object in the target system's LSA Database having the specified name.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaopentrusteddomainbyname
 * @since windows5.1.2600
 */
export LsaOpenTrustedDomainByName(PolicyHandle, TrustedDomainName, DesiredAccess, TrustedDomainHandle) {
    result := DllCall("ADVAPI32.dll\LsaOpenTrustedDomainByName", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, TrustedDomainName, "uint", DesiredAccess, LSA_HANDLE.Ptr, TrustedDomainHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaQueryTrustedDomainInfo function retrieves information about a trusted domain.
 * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object of a domain controller that has a trust relationship with the domain identified by the <i>TrustedDomainSid</i> parameter. The handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {PSID} TrustedDomainSid Pointer to the SID of the trusted domain to query.
 * @param {TRUSTED_INFORMATION_CLASS} InformationClass 
 * @param {Pointer<Pointer<Void>>} _Buffer A pointer to a buffer that receives a pointer to a structure that contains the requested information. The type of structure depends on the value of the <i>InformationClass</i> parameter. 
 * 
 * 
 * 
 * 
 * When you have finished using the information, free the returned pointer by passing it to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
 * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
 * 
 * If the function fails, it returns an <b>NTSTATUS</b> value that indicates the error. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> value to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaquerytrusteddomaininfo
 * @since windows5.1.2600
 */
export LsaQueryTrustedDomainInfo(PolicyHandle, TrustedDomainSid, InformationClass, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaQueryTrustedDomainInfo", LSA_HANDLE, PolicyHandle, PSID, TrustedDomainSid, TRUSTED_INFORMATION_CLASS, InformationClass, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaSetTrustedDomainInformation function modifies a Policy object's information about a trusted domain.
 * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object of a domain controller. The required user rights for this handle depend on the value of the <i>InformationClass</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {PSID} TrustedDomainSid Pointer to the SID of the trusted domain whose information is modified. If the <i>InformationClass</i> parameter is set to TrustedDomainNameInformation, this parameter must point to the SID of the domain to add to the list of trusted domains.
 * @param {TRUSTED_INFORMATION_CLASS} InformationClass 
 * @param {Pointer<Void>} _Buffer Pointer to a structure containing the information to set. The type of structure depends on the value of the <i>InformationClass</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsasettrusteddomaininformation
 * @since windows5.1.2600
 */
export LsaSetTrustedDomainInformation(PolicyHandle, TrustedDomainSid, InformationClass, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaSetTrustedDomainInformation", LSA_HANDLE, PolicyHandle, PSID, TrustedDomainSid, TRUSTED_INFORMATION_CLASS, InformationClass, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaDeleteTrustedDomain function removes a trusted domain from the list of trusted domains for a system and deletes the associated TrustedDomain object.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {PSID} TrustedDomainSid Pointer to the SID of the trusted domain to be removed.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsadeletetrusteddomain
 * @since windows5.1.2600
 */
export LsaDeleteTrustedDomain(PolicyHandle, TrustedDomainSid) {
    result := DllCall("ADVAPI32.dll\LsaDeleteTrustedDomain", LSA_HANDLE, PolicyHandle, PSID, TrustedDomainSid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaQueryTrustedDomainInfoByName function returns information about a trusted domain.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName String that contains the name of the trusted domain. This can either be the domain name or the flat name.
 * @param {TRUSTED_INFORMATION_CLASS} InformationClass 
 * @param {Pointer<Pointer<Void>>} _Buffer Receives a pointer to the returned buffer that contains the requested information. The format and content of this buffer depend on the information class. For example, if <i>InformationClass</i> is set to TrustedDomainInformationEx, <i>Buffer</i> receives a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-trusted_information_class">TRUSTED_INFORMATION_CLASS</a>. 
 * 
 * 
 * 
 * 
 * When you have finished using the buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a> function.
 * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
 * 
 * If the function fails, it returns an <b>NTSTATUS</b> value, which can be one of the following values or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Caller does not have the appropriate access to complete the operation. For a list of the required access types, see the description of the <i>InformationClass</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INSUFFICIENT_
 * RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient system resources, such as memory, to complete the call.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> value to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaquerytrusteddomaininfobyname
 * @since windows5.1.2600
 */
export LsaQueryTrustedDomainInfoByName(PolicyHandle, TrustedDomainName, InformationClass, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaQueryTrustedDomainInfoByName", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, TrustedDomainName, TRUSTED_INFORMATION_CLASS, InformationClass, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaSetTrustedDomainInfoByName function sets values for a TrustedDomain object.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> of the trusted domain object determines whether the caller's changes are accepted. For information about policy object handles, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName Name of the trusted domain to set values for. This can either be the domain name or the flat name.
 * @param {TRUSTED_INFORMATION_CLASS} InformationClass 
 * @param {Pointer<Void>} _Buffer Pointer to a structure that contains the information to set. The type of structure depends on the value of the <i>InformationClass</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * the "LSA Policy Function Return Values" section of <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">Security Management Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsasettrusteddomaininfobyname
 * @since windows5.1.2600
 */
export LsaSetTrustedDomainInfoByName(PolicyHandle, TrustedDomainName, InformationClass, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaSetTrustedDomainInfoByName", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, TrustedDomainName, TRUSTED_INFORMATION_CLASS, InformationClass, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns information about the domains trusted by the local system.
 * @remarks
 * Retrieving all trust information may require more than a single <b>LsaEnumerateTrustedDomainsEx</b> call.
 * 
 * <p class="proch"><b>To use the <i>EnumerationContext</i> parameter to make multiple calls</b>
 * 
 * <ol>
 * <li>Set the variable pointed to by <i>EnumerationContext</i> to zero.</li>
 * <li>If <b>LsaEnumerateTrustedDomainsEx</b> returns STATUS_SUCCESS or STATUS_MORE_ENTRIES, call the function again, passing in the <i>EnumerationContext</i> value returned by the previous call.</li>
 * <li>The enumeration is complete when the function returns STATUS_NO_MORE_ENTRIES.</li>
 * </ol>
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. This call requires POLICY_VIEW_LOCAL_INFORMATION access to the <b>Policy</b> object. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<Integer>} EnumerationContext A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/lsa-enumeration-handle">LSA_ENUMERATION_HANDLE</a> that you can use to make multiple calls to <b>LsaEnumerateTrustedDomainsEx</b>  to retrieve all of the trusted domain information. For more information, see Remarks.
 * @param {Pointer<Pointer<Void>>} _Buffer Pointer to a buffer that receives a list of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structures that contain information about the enumerated trusted domains. 
 * 
 * 
 * 
 * 
 * Your application should free this buffer when it is no longer needed by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
 * @param {Integer} PreferedMaximumLength Preferred maximum length, in bytes, of returned data. This is not a hard upper limit, but serves as a guide. Due to data conversion between systems with different natural data sizes, the actual amount of data returned may be greater than this value.
 * @param {Pointer<Integer>} CountReturned Pointer to a <b>LONG</b> that receives the number of trusted domain objects returned.
 * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
 * 
 * If the function fails, it returns an  <b>NTSTATUS</b> code, which can be one of the following values or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Caller does not have the appropriate access to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_MORE_ENTRIES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are no more entries. This warning is returned if no objects have been enumerated because the <i>EnumerationContext</i> value is too high.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaenumeratetrusteddomainsex
 * @since windows5.1.2600
 */
export LsaEnumerateTrustedDomainsEx(PolicyHandle, EnumerationContext, _Buffer, PreferedMaximumLength, CountReturned) {
    EnumerationContextMarshal := EnumerationContext is VarRef ? "uint*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"
    CountReturnedMarshal := CountReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaEnumerateTrustedDomainsEx", LSA_HANDLE, PolicyHandle, EnumerationContextMarshal, EnumerationContext, _BufferMarshal, _Buffer, "uint", PreferedMaximumLength, CountReturnedMarshal, CountReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaCreateTrustedDomainEx function establishes a new trusted domain by creating a new TrustedDomain object.
 * @remarks
 * <b>LsaCreateTrustedDomainEx</b> does not check whether the specified domain name matches the specified SID or whether the SID and name represent an actual domain.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. For the object to be created, the caller must have permission to create children on the <b>System</b> container. For information about policy object handles, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<TRUSTED_DOMAIN_INFORMATION_EX>} TrustedDomainInformation Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure that contains the name and SID of the new trusted domain.
 * @param {Pointer<TRUSTED_DOMAIN_AUTH_INFORMATION>} AuthenticationInformation Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_auth_information">TRUSTED_DOMAIN_AUTH_INFORMATION</a> structure that contains authentication information for the new trusted domain.
 * @param {Integer} DesiredAccess An 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that specifies the accesses to be granted for the new trusted domain.
 * @param {Pointer<LSA_HANDLE>} TrustedDomainHandle Receives the LSA policy handle of the remote trusted domain. You can pass this handle into LSA function calls to manage the LSA policy of the trusted domain. 
 * 
 * 
 * 
 * 
 * When your application no longer needs this handle, it should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaclose">LsaClose</a> to delete the handle.
 * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
 * 
 * If the function fails, it returns an <b>NTSTATUS</b> code, which can be one of the following values or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_DIRECTORY_SERVICE_REQUIRED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 *  The target system (specified in the <i>TrustedDomainInformation</i> parameter) for the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object is not a domain controller.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_SID</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified SID is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_UNSUCCESSFUL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to determine whether the target system is a domain controller.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsacreatetrusteddomainex
 * @since windows5.1.2600
 */
export LsaCreateTrustedDomainEx(PolicyHandle, TrustedDomainInformation, AuthenticationInformation, DesiredAccess, TrustedDomainHandle) {
    result := DllCall("ADVAPI32.dll\LsaCreateTrustedDomainEx", LSA_HANDLE, PolicyHandle, TRUSTED_DOMAIN_INFORMATION_EX.Ptr, TrustedDomainInformation, TRUSTED_DOMAIN_AUTH_INFORMATION.Ptr, AuthenticationInformation, "uint", DesiredAccess, LSA_HANDLE.Ptr, TrustedDomainHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves forest trust information for the specified Local Security Authority�TrustedDomain object.
 * @remarks
 * Access to this function is protected by a securable object.
 * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object for the system.
 * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object for which to retrieve forest trust information.
 * @param {Pointer<Pointer<LSA_FOREST_TRUST_INFORMATION>>} ForestTrustInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_information">LSA_FOREST_TRUST_INFORMATION</a> structure that returns the forest trust information for the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object specified by the <i>TrustedDomainName</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be one of the following values or one of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_DOMAIN_ROLE</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is legal only on the primary
 *                                     domain controller.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_DOMAIN_STATE</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is legal only on domain
 *                                     controllers in the root domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NO_SUCH_DOMAIN</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_NOT_FOUND</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object does not contain forest trust information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaqueryforesttrustinformation
 * @since windowsserver2003
 */
export LsaQueryForestTrustInformation(PolicyHandle, TrustedDomainName, ForestTrustInfo) {
    ForestTrustInfoMarshal := ForestTrustInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaQueryForestTrustInformation", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, TrustedDomainName, ForestTrustInfoMarshal, ForestTrustInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets the forest trust information for a specified Local Security Authority�TrustedDomain object.
 * @param {LSA_HANDLE} PolicyHandle A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object for the system.
 * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object to which to set the forest trust information specified by the <i>ForestTrustInfo</i> parameter.
 * @param {Pointer<LSA_FOREST_TRUST_INFORMATION>} ForestTrustInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_information">LSA_FOREST_TRUST_INFORMATION</a> structure that contains the forest trust information to set to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object specified by the <i>TrustedDomainName</i> parameter.
 * @param {BOOLEAN} CheckOnly Boolean value that specifies whether changes to the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> object are persisted. If this value is <b>TRUE</b>, this function will check for collisions with the specified parameters but will not set the  forest trust information specified by the <i>ForestTrustInfo</i> parameter to the <b>TrustedDomain</b> object specified by the <i>TrustedDomainName</i> parameter. If this value is <b>FALSE</b>, the forest trust information will be set to the  <b>TrustedDomain</b> object.
 * @param {Pointer<Pointer<LSA_FOREST_TRUST_COLLISION_INFORMATION>>} CollisionInfo Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_information">LSA_FOREST_TRUST_COLLISION_INFORMATION</a> structure that returns information about any collisions that occurred.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code, which can be one of the following values or one of the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_DOMAIN_STATE</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is legal only on domain
 *                                     controllers in the root domain.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_DOMAIN_ROLE</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation is legal only on the primary
 *                                     domain controller.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsasetforesttrustinformation
 * @since windowsserver2003
 */
export LsaSetForestTrustInformation(PolicyHandle, TrustedDomainName, ForestTrustInfo, CheckOnly, CollisionInfo) {
    CollisionInfoMarshal := CollisionInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaSetForestTrustInformation", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, TrustedDomainName, LSA_FOREST_TRUST_INFORMATION.Ptr, ForestTrustInfo, BOOLEAN, CheckOnly, CollisionInfoMarshal, CollisionInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Do not use the LSA private data functions. Instead, use the CryptProtectData and CryptUnprotectData functions. (LsaStorePrivateData)
 * @remarks
 * The <b>LsaStorePrivateData</b> function can be used by server applications to store client and machine passwords.
 * 
 * As described in 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/private-data-object">Private Data Object</a>, private data objects include three specialized types: local, global, and machine. Specialized objects are identified by a prefix in the key name: "L$" for local objects, "G$" for global objects, and "M$" for machine objects. Local objects cannot be accessed remotely. Machine objects can be accessed only by the operating system.
 * 
 * In addition to these prefixes, the following values also indicate local or machine objects. These values are supported for backward compatibility and should not be used when you create new local or machine objects. The key name of local private data objects may also be "$machine.acc", "SAC", "SAI", "SANSC", or start with "RasDialParms" or "RasCredentials". The key name for machine objects may also start with, "NL$" or "_sc_".
 * 
 * Private data objects which do not use any of the preceding key name conventions can be accessed remotely and are not replicated to other domains.
 * 
 * The data stored by the <b>LsaStorePrivateData</b> function is not absolutely protected. However, the data is encrypted before being stored, and the key has a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">DACL</a> that allows only the creator and administrators to read the data.
 * 
 * Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaretrieveprivatedata">LsaRetrievePrivateData</a> function to retrieve the value stored by <b>LsaStorePrivateData</b>.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_CREATE_SECRET access right if this is the first time data is being stored under the key specified by the <i>KeyName</i> parameter. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<LSA_UNICODE_STRING>} KeyName Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure containing the name of the key under which the private data is stored.
 * @param {Pointer<LSA_UNICODE_STRING>} _PrivateData Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure containing the private data to store. The function encrypts this data before storing it.
 * 
 * If this parameter is <b>NULL</b>, the function deletes any private data stored under the key and deletes the key. Subsequent attempts to retrieve data from the key will return the STATUS_OBJECT_NAME_NOT_FOUND error code.
 * @returns {NTSTATUS} If the function succeeds, the return value is STATUS_SUCCESS.
 * 
 * If the function fails, the return value is an NTSTATUS code. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the NTSTATUS code to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsastoreprivatedata
 * @since windows5.1.2600
 */
export LsaStorePrivateData(PolicyHandle, KeyName, _PrivateData) {
    result := DllCall("ADVAPI32.dll\LsaStorePrivateData", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, KeyName, LSA_UNICODE_STRING.Ptr, _PrivateData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Do not use the LSA private data functions. Instead, use the CryptProtectData and CryptUnprotectData functions. (LsaRetrievePrivateData)
 * @remarks
 * You must run this process "As Administrator" or the call fails with ERROR_ACCESS_DENIED.
 * @param {LSA_HANDLE} PolicyHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object. The handle must have the POLICY_GET_PRIVATE_INFORMATION access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/opening-a-policy-object-handle">Opening a Policy Object Handle</a>.
 * @param {Pointer<LSA_UNICODE_STRING>} KeyName Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the key under which the private data is stored.
 * 
 * To create a specialized object, add one of the following prefixes to the key name.
 * 
 * <table>
 * <tr>
 * <th>Prefix</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="L_"></a><a id="l_"></a><dl>
 * <dt><b>L$</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * For local objects.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="G_"></a><a id="g_"></a><dl>
 * <dt><b>G$</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * For global objects.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="M_"></a><a id="m_"></a><dl>
 * <dt><b>M$</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * For computer objects.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If you are not creating one of these specialized types, you do not need to specify a key name prefix. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/private-data-object">Private Data Object</a>.
 * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} _PrivateData Pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the private data.
 * 
 * When you no longer need the information, pass the returned pointer to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreememory">LsaFreeMemory</a>.
 * @returns {NTSTATUS} If the function succeeds, the function returns STATUS_SUCCESS.
 * 
 * If the function fails, it returns an <b>NTSTATUS</b> value, which can be the following value or one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/management-return-values">LSA Policy Function Return Values</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_OBJECT_NAME_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No private data is stored under the name specified by the <i>KeyName</i> parameter.
 * 							
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror">LsaNtStatusToWinError</a> function to convert the <b>NTSTATUS</b> value to a Windows error code.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsaretrieveprivatedata
 * @since windows5.1.2600
 */
export LsaRetrievePrivateData(PolicyHandle, KeyName, _PrivateData) {
    _PrivateDataMarshal := _PrivateData is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaRetrievePrivateData", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, KeyName, _PrivateDataMarshal, _PrivateData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The LsaNtStatusToWinError function converts an NTSTATUS code returned by an LSA function to a Windows error code.
 * @param {NTSTATUS} _Status An NTSTATUS code returned by an LSA function call. This value will be converted to a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System error code</a>.
 * @returns {Integer} The return value is the Windows error code that corresponds to the <i>Status</i> parameter. If there is no corresponding Windows error code, the return value is ERROR_MR_MID_NOT_FOUND.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-lsantstatustowinerror
 * @since windows5.1.2600
 */
export LsaNtStatusToWinError(_Status) {
    result := DllCall("ADVAPI32.dll\LsaNtStatusToWinError", NTSTATUS, _Status, UInt32)
    return result
}

/**
 * 
 * @param {LSA_HANDLE} PolicyHandle 
 * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName 
 * @param {LSA_FOREST_TRUST_RECORD_TYPE} HighestRecordType 
 * @param {Pointer<Pointer<LSA_FOREST_TRUST_INFORMATION2>>} ForestTrustInfo 
 * @returns {NTSTATUS} 
 */
export LsaQueryForestTrustInformation2(PolicyHandle, TrustedDomainName, HighestRecordType, ForestTrustInfo) {
    ForestTrustInfoMarshal := ForestTrustInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaQueryForestTrustInformation2", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, TrustedDomainName, LSA_FOREST_TRUST_RECORD_TYPE, HighestRecordType, ForestTrustInfoMarshal, ForestTrustInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {LSA_HANDLE} PolicyHandle 
 * @param {Pointer<LSA_UNICODE_STRING>} TrustedDomainName 
 * @param {LSA_FOREST_TRUST_RECORD_TYPE} HighestRecordType 
 * @param {Pointer<LSA_FOREST_TRUST_INFORMATION2>} ForestTrustInfo 
 * @param {BOOLEAN} CheckOnly 
 * @param {Pointer<Pointer<LSA_FOREST_TRUST_COLLISION_INFORMATION>>} CollisionInfo 
 * @returns {NTSTATUS} 
 */
export LsaSetForestTrustInformation2(PolicyHandle, TrustedDomainName, HighestRecordType, ForestTrustInfo, CheckOnly, CollisionInfo) {
    CollisionInfoMarshal := CollisionInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ADVAPI32.dll\LsaSetForestTrustInformation2", LSA_HANDLE, PolicyHandle, LSA_UNICODE_STRING.Ptr, TrustedDomainName, LSA_FOREST_TRUST_RECORD_TYPE, HighestRecordType, LSA_FOREST_TRUST_INFORMATION2.Ptr, ForestTrustInfo, BOOLEAN, CheckOnly, CollisionInfoMarshal, CollisionInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets system audit policy for one or more audit-policy subcategories.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b> or have <b>AUDIT_SET_SYSTEM_POLICY</b> access on the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>.
 * @param {Pointer<AUDIT_POLICY_INFORMATION>} pAuditPolicy A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures. Each structure specifies system audit policy for one audit-policy subcategory.
 * 
 * The <b>AuditCategoryGuid</b> member of these structures is ignored.
 * @param {Integer} dwPolicyCount The number of elements in the <i>pAuditPolicy</i> array.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditsetsystempolicy
 * @since windows6.0.6000
 */
export AuditSetSystemPolicy(pAuditPolicy, dwPolicyCount) {
    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditSetSystemPolicy", AUDIT_POLICY_INFORMATION.Ptr, pAuditPolicy, "uint", dwPolicyCount, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets per-user audit policy in one or more audit subcategories for the specified principal.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b> or have <b>AUDIT_SET_USER_POLICY</b> access on the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>.
 * @param {PSID} _pSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure associated with the principal for which to set  audit policy. Per-user policy for group SIDs is not currently supported.
 * @param {Pointer<AUDIT_POLICY_INFORMATION>} pAuditPolicy A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures. Each structure specifies per-user audit policy for one audit subcategory.
 * 
 * The <b>AuditCategoryGuid</b> member of these structures is ignored.
 * @param {Integer} dwPolicyCount The number of elements in the <i>pAuditPolicy</i> array.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_USER</b></dt>
 * <dt>1317</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure specified by the <i>pSID</i> parameter is not associated with an existing user.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditsetperuserpolicy
 * @since windows6.0.6000
 */
export AuditSetPerUserPolicy(_pSid, pAuditPolicy, dwPolicyCount) {
    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditSetPerUserPolicy", PSID, _pSid, AUDIT_POLICY_INFORMATION.Ptr, pAuditPolicy, "uint", dwPolicyCount, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves system audit policy for one or more audit-policy subcategories.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b> or have <b>AUDIT_QUERY_SYSTEM_POLICY</b> access on the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">audit security object</a>.
 * @param {Pointer<Guid>} pSubCategoryGuids A pointer to an array of <b>GUID</b> values that specify the subcategories for which to query audit policy. For a list of defined audit-policy subcategories, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-constants">Auditing Constants</a>.
 * @param {Integer} dwPolicyCount The number of elements in each of the <i>pSubCategoryGuids</i> and <i>ppAuditPolicy</i> arrays.
 * @param {Pointer<Pointer<AUDIT_POLICY_INFORMATION>>} ppAuditPolicy A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures and the structures themselves. The <b>AUDIT_POLICY_INFORMATION</b> structures specify the system audit policy for the subcategories specified by the <i>pSubCategoryGuids</i> array. 
 * 
 * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No per-user audit policy exists for the principal specified by the <i>pSid</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditquerysystempolicy
 * @since windows6.0.6000
 */
export AuditQuerySystemPolicy(pSubCategoryGuids, dwPolicyCount, ppAuditPolicy) {
    ppAuditPolicyMarshal := ppAuditPolicy is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditQuerySystemPolicy", Guid.Ptr, pSubCategoryGuids, "uint", dwPolicyCount, ppAuditPolicyMarshal, ppAuditPolicy, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves per-user audit policy in one or more audit-policy subcategories for the specified principal.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b> or have <b>AUDIT_QUERY_USER_POLICY</b> access on the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>.
 * @param {PSID} _pSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure associated with the principal for which to query  audit policy. Per-user policy for group SIDs is not currently supported.
 * @param {Pointer<Guid>} pSubCategoryGuids A pointer to an array of <b>GUID</b> values that specify the subcategories for which to query audit policy. For a list of defined audit-policy subcategories, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-constants">Auditing Constants</a>.
 * @param {Integer} dwPolicyCount The number of elements in each of the <i>pSubCategoryGuids</i> and <i>ppAuditPolicy</i> arrays.
 * @param {Pointer<Pointer<AUDIT_POLICY_INFORMATION>>} ppAuditPolicy A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures and the structures themselves. The <b>AUDIT_POLICY_INFORMATION</b> structures specify the per-user audit policy for the subcategories specified by the <i>pSubCategoryGuids</i> array. 
 * 
 * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No per-user audit policy exists for the principal specified by the <i>pSid</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditqueryperuserpolicy
 * @since windows6.0.6000
 */
export AuditQueryPerUserPolicy(_pSid, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy) {
    ppAuditPolicyMarshal := ppAuditPolicy is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditQueryPerUserPolicy", PSID, _pSid, Guid.Ptr, pSubCategoryGuids, "uint", dwPolicyCount, ppAuditPolicyMarshal, ppAuditPolicy, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Enumerates users for whom per-user auditing policy is specified.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b> or have <b>AUDIT_ENUMERATE_USERS</b> access on the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>.
 * @param {Pointer<Pointer<POLICY_AUDIT_SID_ARRAY>>} ppAuditSidArray A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_audit_sid_array">POLICY_AUDIT_SID_ARRAY</a> structures and the structures themselves. The <b>POLICY_AUDIT_SID_ARRAY</b> structures specify the users for whom per-user audit policy is specified. 
 * 
 * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditenumerateperuserpolicy
 * @since windows6.0.6000
 */
export AuditEnumeratePerUserPolicy(ppAuditSidArray) {
    ppAuditSidArrayMarshal := ppAuditSidArray is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditEnumeratePerUserPolicy", ppAuditSidArrayMarshal, ppAuditSidArray, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Computes the effective audit policy for one or more subcategories for the specified security principal. The function computes effective audit policy by combining system audit policy with per-user policy.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b> or have <b>AUDIT_QUERY_SYSTEM_POLICY</b> and <b>AUDIT_QUERY_USER_POLICY</b> access on the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>.
 * @param {PSID} _pSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure associated with the principal for which to compute effective audit policy. Per-user policy for group SIDs is not currently supported.
 * @param {Pointer<Guid>} pSubCategoryGuids A pointer to an array of <b>GUID</b> values that specify the subcategories for which to compute effective audit policy. For a list of defined subcategories, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-constants">Auditing Constants</a>.
 * @param {Integer} dwPolicyCount The number of elements in each of the <i>pSubCategoryGuids</i> and <i>ppAuditPolicy</i> arrays.
 * @param {Pointer<Pointer<AUDIT_POLICY_INFORMATION>>} ppAuditPolicy A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures and the structures themselves. The <b>AUDIT_POLICY_INFORMATION</b> structures specify the effective audit policy for the subcategories specified by the <i>pSubCategoryGuids</i> array. 
 * 
 * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87 (0x57)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * <dt>2 (0x2)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No per-user audit policy exists for the principal specified by the <i>pSid</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditcomputeeffectivepolicybysid
 * @since windows6.0.6000
 */
export AuditComputeEffectivePolicyBySid(_pSid, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy) {
    ppAuditPolicyMarshal := ppAuditPolicy is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditComputeEffectivePolicyBySid", PSID, _pSid, Guid.Ptr, pSubCategoryGuids, "uint", dwPolicyCount, ppAuditPolicyMarshal, ppAuditPolicy, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Computes the effective audit policy for one or more subcategories for the security principal associated with the specified token. The function computes effective audit policy by combining system audit policy with per-user policy.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b> or have both <b>AUDIT_QUERY_SYSTEM_POLICY</b> and <b>AUDIT_QUERY_USER_POLICY</b> access on the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>.
 * @param {HANDLE} hTokenHandle A handle to the access token associated with the principal for which to compute effective audit policy. The token must have been opened with <b>TOKEN_QUERY</b> access. Per-user policy for group SIDs is not currently supported.
 * @param {Pointer<Guid>} pSubCategoryGuids A pointer to an array of <b>GUID</b> values that specify the subcategories for which to compute effective audit policy. For a list of defined subcategories, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-constants">Auditing Constants</a>.
 * @param {Integer} dwPolicyCount The number of elements in each of the <i>pSubCategoryGuids</i> and <i>ppAuditPolicy</i> arrays.
 * @param {Pointer<Pointer<AUDIT_POLICY_INFORMATION>>} ppAuditPolicy A pointer to a single buffer that contains both an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-audit_policy_information">AUDIT_POLICY_INFORMATION</a> structures and the structures themselves. The <b>AUDIT_POLICY_INFORMATION</b> structures specify the effective audit policy for the subcategories specified by the <i>pSubCategoryGuids</i> array. 
 * 
 * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * <dt>2 (0x2)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No per-user audit policy exists for the principal specified by the <i>pSid</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditcomputeeffectivepolicybytoken
 * @since windows6.0.6000
 */
export AuditComputeEffectivePolicyByToken(hTokenHandle, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy) {
    ppAuditPolicyMarshal := ppAuditPolicy is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditComputeEffectivePolicyByToken", HANDLE, hTokenHandle, Guid.Ptr, pSubCategoryGuids, "uint", dwPolicyCount, ppAuditPolicyMarshal, ppAuditPolicy, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Enumerates the available audit-policy categories.
 * @param {Pointer<Pointer<Guid>>} ppAuditCategoriesArray A pointer to a single buffer that contains both an array of pointers to <b>GUID</b> structures and the structures themselves. The <b>GUID</b> structures specify the audit-policy categories available on the computer. 
 * 
 * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @param {Pointer<Integer>} pdwCountReturned A pointer to the number of elements in the <i>ppAuditCategoriesArray</i> array.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditenumeratecategories
 * @since windows6.0.6000
 */
export AuditEnumerateCategories(ppAuditCategoriesArray, pdwCountReturned) {
    ppAuditCategoriesArrayMarshal := ppAuditCategoriesArray is VarRef ? "ptr*" : "ptr"
    pdwCountReturnedMarshal := pdwCountReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditEnumerateCategories", ppAuditCategoriesArrayMarshal, ppAuditCategoriesArray, pdwCountReturnedMarshal, pdwCountReturned, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Enumerates the available audit-policy subcategories.
 * @param {Pointer<Guid>} pAuditCategoryGuid The <b>GUID</b> of an audit-policy category for which subcategories are enumerated. If the value of the <i>bRetrieveAllSubCategories</i> parameter is <b>TRUE</b>, this parameter is ignored.
 * @param {BOOLEAN} bRetrieveAllSubCategories <b>TRUE</b> to enumerate all audit-policy subcategories; <b>FALSE</b> to enumerate only the subcategories of the audit-policy category specified by the <i>pAuditCategoryGuid</i> parameter.
 * @param {Pointer<Pointer<Guid>>} ppAuditSubCategoriesArray A pointer to a single buffer that contains both an array of pointers to <b>GUID</b> structures and the structures themselves. The <b>GUID</b> structures specify the audit-policy subcategories available on the computer. 
 * 
 * When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @param {Pointer<Integer>} pdwCountReturned A pointer to the number of audit-policy subcategories returned in the <i>ppAuditSubCategoriesArray</i> array.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditenumeratesubcategories
 * @since windows6.0.6000
 */
export AuditEnumerateSubCategories(pAuditCategoryGuid, bRetrieveAllSubCategories, ppAuditSubCategoriesArray, pdwCountReturned) {
    ppAuditSubCategoriesArrayMarshal := ppAuditSubCategoriesArray is VarRef ? "ptr*" : "ptr"
    pdwCountReturnedMarshal := pdwCountReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditEnumerateSubCategories", Guid.Ptr, pAuditCategoryGuid, BOOLEAN, bRetrieveAllSubCategories, ppAuditSubCategoriesArrayMarshal, ppAuditSubCategoriesArray, pdwCountReturnedMarshal, pdwCountReturned, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the display name of the specified audit-policy category. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntsecapi.h header defines AuditLookupCategoryName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Guid>} pAuditCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy category.
 * @param {Pointer<PWSTR>} ppszCategoryName The address of a pointer to a null-terminated string that contains the display name of the audit-policy category specified by the <i>pAuditCategoryGuid</i> function.
 * 
 * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditlookupcategorynamew
 * @since windows6.0.6000
 */
export AuditLookupCategoryNameW(pAuditCategoryGuid, ppszCategoryName) {
    ppszCategoryNameMarshal := ppszCategoryName is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditLookupCategoryNameW", Guid.Ptr, pAuditCategoryGuid, ppszCategoryNameMarshal, ppszCategoryName, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the display name of the specified audit-policy category. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntsecapi.h header defines AuditLookupCategoryName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Guid>} pAuditCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy category.
 * @param {Pointer<PSTR>} ppszCategoryName The address of a pointer to a null-terminated string that contains the display name of the audit-policy category specified by the <i>pAuditCategoryGuid</i> function.
 * 
 * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditlookupcategorynamea
 * @since windows6.0.6000
 */
export AuditLookupCategoryNameA(pAuditCategoryGuid, ppszCategoryName) {
    ppszCategoryNameMarshal := ppszCategoryName is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditLookupCategoryNameA", Guid.Ptr, pAuditCategoryGuid, ppszCategoryNameMarshal, ppszCategoryName, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the display name of the specified audit-policy subcategory. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntsecapi.h header defines AuditLookupSubCategoryName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Guid>} pAuditSubCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy subcategory.
 * @param {Pointer<PWSTR>} ppszSubCategoryName The address of a pointer to a null-terminated string that contains the display name of the audit-policy subcategory specified by the <i>pAuditSubCategoryGuid</i> parameter.
 * 
 * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditlookupsubcategorynamew
 * @since windows6.0.6000
 */
export AuditLookupSubCategoryNameW(pAuditSubCategoryGuid, ppszSubCategoryName) {
    ppszSubCategoryNameMarshal := ppszSubCategoryName is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditLookupSubCategoryNameW", Guid.Ptr, pAuditSubCategoryGuid, ppszSubCategoryNameMarshal, ppszSubCategoryName, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the display name of the specified audit-policy subcategory. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The ntsecapi.h header defines AuditLookupSubCategoryName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Guid>} pAuditSubCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy subcategory.
 * @param {Pointer<PSTR>} ppszSubCategoryName The address of a pointer to a null-terminated string that contains the display name of the audit-policy subcategory specified by the <i>pAuditSubCategoryGuid</i> parameter.
 * 
 * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditfree">AuditFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditlookupsubcategorynamea
 * @since windows6.0.6000
 */
export AuditLookupSubCategoryNameA(pAuditSubCategoryGuid, ppszSubCategoryName) {
    ppszSubCategoryNameMarshal := ppszSubCategoryName is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditLookupSubCategoryNameA", Guid.Ptr, pAuditSubCategoryGuid, ppszSubCategoryNameMarshal, ppszSubCategoryName, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves an element of the POLICY_AUDIT_EVENT_TYPE enumeration that represents the specified audit-policy category.
 * @param {Pointer<Guid>} pAuditCategoryGuid A pointer to a <b>GUID</b> structure that specifies an audit-policy category.
 * @param {Pointer<POLICY_AUDIT_EVENT_TYPE>} pAuditCategoryId A pointer to an element of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_audit_event_type">POLICY_AUDIT_EVENT_TYPE</a> enumeration that represents the audit-policy category specified by the <i>pAuditCategoryGuid</i> parameter.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditlookupcategoryidfromcategoryguid
 * @since windows6.0.6000
 */
export AuditLookupCategoryIdFromCategoryGuid(pAuditCategoryGuid, pAuditCategoryId) {
    pAuditCategoryIdMarshal := pAuditCategoryId is VarRef ? "int*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditLookupCategoryIdFromCategoryGuid", Guid.Ptr, pAuditCategoryGuid, pAuditCategoryIdMarshal, pAuditCategoryId, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a GUID structure that represents the specified audit-policy category.
 * @param {POLICY_AUDIT_EVENT_TYPE} AuditCategoryId An element of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_audit_event_type">POLICY_AUDIT_EVENT_TYPE</a> enumeration that specifies an audit-policy category.
 * @param {Pointer<Guid>} pAuditCategoryGuid A pointer to a <b>GUID</b> structure that represents the audit-policy category specified by the  <i>AuditCategoryId</i>
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditlookupcategoryguidfromcategoryid
 * @since windows6.0.6000
 */
export AuditLookupCategoryGuidFromCategoryId(AuditCategoryId, pAuditCategoryGuid) {
    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditLookupCategoryGuidFromCategoryId", POLICY_AUDIT_EVENT_TYPE, AuditCategoryId, Guid.Ptr, pAuditCategoryGuid, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets a security descriptor that delegates access to audit policy.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b>.
 * @param {OBJECT_SECURITY_INFORMATION} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies which parts of the security descriptor this function sets. Only <b>SACL_SECURITY_INFORMATION</b> and <b>DACL_SECURITY_INFORMATION</b> are supported. Any other values are ignored. If neither <b>SACL_SECURITY_INFORMATION</b> nor <b>DACL_SECURITY_INFORMATION</b> is specified, this function fails and returns <b>ERROR_INVALID_PARAMETER</b>.
 * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a well-formed <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that controls access to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>. If this parameter is <b>NULL</b>, the function fails and returns <b>ERROR_INVALID_PARAMETER</b>.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditsetsecurity
 * @since windows6.0.6000
 */
export AuditSetSecurity(SecurityInformation, pSecurityDescriptor) {
    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditSetSecurity", OBJECT_SECURITY_INFORMATION, SecurityInformation, PSECURITY_DESCRIPTOR, pSecurityDescriptor, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves security descriptor that delegates access to audit policy.
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b>.
 * @param {OBJECT_SECURITY_INFORMATION} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies which parts of the security descriptor this function sets. Only <b>SACL_SECURITY_INFORMATION</b> and <b>DACL_SECURITY_INFORMATION</b> are supported. Any other values are ignored. If neither <b>SACL_SECURITY_INFORMATION</b> nor <b>DACL_SECURITY_INFORMATION</b> is specified, this function fails and returns <b>ERROR_INVALID_PARAMETER</b>.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor The address of a pointer to a well-formed <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that controls access to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Audit security object</a>.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditquerysecurity
 * @since windows6.0.6000
 */
export AuditQuerySecurity(SecurityInformation, ppSecurityDescriptor) {
    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditQuerySecurity", OBJECT_SECURITY_INFORMATION, SecurityInformation, PSECURITY_DESCRIPTOR.Ptr, ppSecurityDescriptor, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets a global system access control list (SACL) that delegates access to the audit messages. (Unicode)
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b>.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntsecapi.h header defines AuditSetGlobalSacl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being created or accessed. For setting the global SACL on files, this should be set to "File" and  for setting the global SACL on registry, this should be set to "Key". This string appears in any audit message that the function generates.
 * @param {Pointer<ACL>} _Acl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditsetglobalsaclw
 * @since windows6.1
 */
export AuditSetGlobalSaclW(ObjectTypeName, _Acl) {
    ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditSetGlobalSaclW", "ptr", ObjectTypeName, ACL.Ptr, _Acl, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets a global system access control list (SACL) that delegates access to the audit messages. (ANSI)
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b>.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntsecapi.h header defines AuditSetGlobalSacl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being created or accessed. For setting the global SACL on files, this should be set to "File" and  for setting the global SACL on registry, this should be set to "Key". This string appears in any audit message that the function generates.
 * @param {Pointer<ACL>} _Acl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditsetglobalsacla
 * @since windows6.1
 */
export AuditSetGlobalSaclA(ObjectTypeName, _Acl) {
    ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditSetGlobalSaclA", "ptr", ObjectTypeName, ACL.Ptr, _Acl, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a global system access control list (SACL) that delegates access to the audit messages. (Unicode)
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b>.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntsecapi.h header defines AuditQueryGlobalSacl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being accessed. This parameter must be either "File" or "Key", depending on whether the object is a file or registry. This string appears in any audit message that the function generates.
 * @param {Pointer<Pointer<ACL>>} _Acl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure that contains the SACL information.  This should be freed later by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditqueryglobalsaclw
 * @since windows6.1
 */
export AuditQueryGlobalSaclW(ObjectTypeName, _Acl) {
    ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName

    _AclMarshal := _Acl is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditQueryGlobalSaclW", "ptr", ObjectTypeName, _AclMarshal, _Acl, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a global system access control list (SACL) that delegates access to the audit messages. (ANSI)
 * @remarks
 * To successfully call this function, the caller must have <b>SeSecurityPrivilege</b>.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntsecapi.h header defines AuditQueryGlobalSacl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being accessed. This parameter must be either "File" or "Key", depending on whether the object is a file or registry. This string appears in any audit message that the function generates.
 * @param {Pointer<Pointer<ACL>>} _Acl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure that contains the SACL information.  This should be freed later by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {BOOLEAN} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes defined in WinError.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the privilege or access rights necessary to call this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * <dt>87</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more parameters are invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditqueryglobalsacla
 * @since windows6.1
 */
export AuditQueryGlobalSaclA(ObjectTypeName, _Acl) {
    ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName

    _AclMarshal := _Acl is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\AuditQueryGlobalSaclA", "ptr", ObjectTypeName, _AclMarshal, _Acl, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Frees the memory allocated by audit functions for the specified buffer.
 * @param {Pointer<Void>} _Buffer A pointer to the buffer to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nf-ntsecapi-auditfree
 * @since windows6.0.6000
 */
export AuditFree(_Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    DllCall("ADVAPI32.dll\AuditFree", _BufferMarshal, _Buffer)
}

/**
 * The AcquireCredentialsHandle (CredSSP) function acquires a handle to preexisting credentials of a security principal. (Unicode)
 * @remarks
 * The <b>AcquireCredentialsHandle (CredSSP)</b> function returns a handle to the credentials of a principal, such as a user or client, as used by a specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>. The function can return the handle to either preexisting credentials or  newly created credentials and return it. This handle can be used in subsequent calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (CredSSP)</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (CredSSP)</a> functions.
 * 
 * In general, <b>AcquireCredentialsHandle (CredSSP)</b> does not provide  the credentials of other users logged on to the same computer. However, a caller with SE_TCB_NAME  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privilege</a> can obtain the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> of an existing logon session by specifying the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a> (LUID) of that session. Typically, this is used by kernel-mode modules that must act on behalf of a logged-on user.
 * 
 * A package might call the function in <i>pGetKeyFn</i> provided by the RPC run-time transport. If the transport does not support the notion of callback to retrieve credentials, this parameter must be <b>NULL</b>.
 * 
 * For kernel mode callers, the following differences must be noted:
 * 
 * <ul>
 * <li>The two string parameters must be <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> strings.</li>
 * <li>The buffer values must be allocated in process virtual memory, not from the pool.</li>
 * </ul>
 * When you have finished using the returned credentials, free the memory used by the credentials by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecredentialshandle">FreeCredentialsHandle</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines AcquireCredentialsHandle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszPrincipal 
 * @param {PWSTR} pszPackage 
 * @param {SECPKG_CRED} fCredentialUse 
 * @param {Pointer<Void>} pvLogonId A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (LUID) that identifies the user. This parameter is provided for file-system processes such as network redirectors. This parameter can be <b>NULL</b>.
 * @param {Pointer<Void>} pAuthData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/credssp/ns-credssp-credssp_cred">CREDSSP_CRED</a> structure that specifies authentication data for both Schannel and Negotiate packages.
 * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn Reserved. This parameter is not used and should be set to <b>NULL</b>.
 * @param {Pointer<Void>} pvGetKeyArgument Reserved. This parameter must be set to <b>NULL</b>.
 * @param {Pointer<SecHandle>} phCredential A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CredHandle</a> structure that will receive the credential handle.
 * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the time at which the returned credentials expire. The structure value received depends on the security package, which must specify the value in local time.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-acquirecredentialshandlew
 * @since windows6.0.6000
 */
export AcquireCredentialsHandleW(pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, phCredential) {
    pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    pvLogonIdMarshal := pvLogonId is VarRef ? "ptr" : "ptr"
    pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
    pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\AcquireCredentialsHandleW", "ptr", pszPrincipal, "ptr", pszPackage, SECPKG_CRED, fCredentialUse, pvLogonIdMarshal, pvLogonId, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, SecHandle.Ptr, phCredential, "int64*", &ptsExpiry := 0, "HRESULT")
    return ptsExpiry
}

/**
 * The AcquireCredentialsHandle (CredSSP) function acquires a handle to preexisting credentials of a security principal. (ANSI)
 * @remarks
 * The <b>AcquireCredentialsHandle (CredSSP)</b> function returns a handle to the credentials of a principal, such as a user or client, as used by a specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>. The function can return the handle to either preexisting credentials or  newly created credentials and return it. This handle can be used in subsequent calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (CredSSP)</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (CredSSP)</a> functions.
 * 
 * In general, <b>AcquireCredentialsHandle (CredSSP)</b> does not provide  the credentials of other users logged on to the same computer. However, a caller with SE_TCB_NAME  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privilege</a> can obtain the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> of an existing logon session by specifying the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a> (LUID) of that session. Typically, this is used by kernel-mode modules that must act on behalf of a logged-on user.
 * 
 * A package might call the function in <i>pGetKeyFn</i> provided by the RPC run-time transport. If the transport does not support the notion of callback to retrieve credentials, this parameter must be <b>NULL</b>.
 * 
 * For kernel mode callers, the following differences must be noted:
 * 
 * <ul>
 * <li>The two string parameters must be <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> strings.</li>
 * <li>The buffer values must be allocated in process virtual memory, not from the pool.</li>
 * </ul>
 * When you have finished using the returned credentials, free the memory used by the credentials by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecredentialshandle">FreeCredentialsHandle</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines AcquireCredentialsHandle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszPrincipal A pointer to a null-terminated string that specifies the name of the principal whose credentials the handle will reference.
 * 
 * <div class="alert"><b>Note</b>  If the process that requests the handle does not have access to the credentials, the function returns an error. A null string indicates that the process requires a handle to the credentials of the user under whose <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> it is executing.</div>
 * <div> </div>
 * @param {PSTR} pszPackage A pointer to a null-terminated string that specifies the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> with which these credentials will be used. This is a security package name returned in the <b>Name</b> member of a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-enumeratesecuritypackagesa">EnumerateSecurityPackages</a> function. After a context is established, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (CredSSP)</a> can be called with <i>ulAttribute</i> set to <b>SECPKG_ATTR_PACKAGE_INFO</b> to return information on the security package in use.
 * @param {SECPKG_CRED} fCredentialUse 
 * @param {Pointer<Void>} pvLogonId A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (LUID) that identifies the user. This parameter is provided for file-system processes such as network redirectors. This parameter can be <b>NULL</b>.
 * @param {Pointer<Void>} pAuthData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/credssp/ns-credssp-credssp_cred">CREDSSP_CRED</a> structure that specifies authentication data for both Schannel and Negotiate packages.
 * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn Reserved. This parameter is not used and should be set to <b>NULL</b>.
 * @param {Pointer<Void>} pvGetKeyArgument Reserved. This parameter must be set to <b>NULL</b>.
 * @param {Pointer<SecHandle>} phCredential A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CredHandle</a> structure that will receive the credential handle.
 * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the time at which the returned credentials expire. The structure value received depends on the security package, which must specify the value in local time.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-acquirecredentialshandlea
 * @since windows6.0.6000
 */
export AcquireCredentialsHandleA(pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, phCredential) {
    pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    pvLogonIdMarshal := pvLogonId is VarRef ? "ptr" : "ptr"
    pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
    pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\AcquireCredentialsHandleA", "ptr", pszPrincipal, "ptr", pszPackage, SECPKG_CRED, fCredentialUse, pvLogonIdMarshal, pvLogonId, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, SecHandle.Ptr, phCredential, "int64*", &ptsExpiry := 0, "HRESULT")
    return ptsExpiry
}

/**
 * Notifies the security system that the credentials are no longer needed.
 * @param {Pointer<SecHandle>} phCredential A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CredHandle</a> handle obtained by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a> function.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns the following error code.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-freecredentialshandle
 * @since windows5.1.2600
 */
export FreeCredentialsHandle(phCredential) {
    result := DllCall("SECUR32.dll\FreeCredentialsHandle", SecHandle.Ptr, phCredential, "HRESULT")
    return result
}

/**
 * AddCredentialsW (Unicode) adds a credential to the list of credentials.
 * @param {Pointer<SecHandle>} hCredentials The credentials to add to the list.
 * @param {PWSTR} pszPrincipal 
 * @param {PWSTR} pszPackage 
 * @param {Integer} fCredentialUse The flags indicating credential use.
 * @param {Pointer<Void>} pAuthData The package-specific authentication data.
 * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn The pointer to the **GetKey** function to get the key for the credentials.
 * @param {Pointer<Void>} pvGetKeyArgument The value to pass to the **GetKey** function.
 * @returns {Integer} The lifetime of the credentials.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-addcredentialsw
 */
export AddCredentialsW(hCredentials, pszPrincipal, pszPackage, fCredentialUse, pAuthData, pGetKeyFn, pvGetKeyArgument) {
    pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
    pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\AddCredentialsW", SecHandle.Ptr, hCredentials, "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, "int64*", &ptsExpiry := 0, "HRESULT")
    return ptsExpiry
}

/**
 * AddCredentialsA (ANSI) adds a credential to the list of credentials.
 * @param {Pointer<SecHandle>} hCredentials The credentials to add to the list.
 * @param {PSTR} pszPrincipal The name of the principal for the credentials.
 * @param {PSTR} pszPackage The name of the package.
 * @param {Integer} fCredentialUse The flags indicating credential use.
 * @param {Pointer<Void>} pAuthData The package-specific authentication data.
 * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn The pointer to the **GetKey** function.
 * @param {Pointer<Void>} pvGetKeyArgument The value to pass to the **GetKey** function.
 * @returns {Integer} The credential lifetime.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-addcredentialsa
 */
export AddCredentialsA(hCredentials, pszPrincipal, pszPackage, fCredentialUse, pAuthData, pGetKeyFn, pvGetKeyArgument) {
    pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
    pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\AddCredentialsA", SecHandle.Ptr, hCredentials, "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, "int64*", &ptsExpiry := 0, "HRESULT")
    return ptsExpiry
}

/**
 * Changes the password for a Windows domain account by using the specified Security Support Provider. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines ChangeAccountPassword as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Integer>} pszPackageName The name of the provider to use. The value of this parameter must be either "Kerberos", "Negotiate", or "NTLM".
 * @param {Pointer<Integer>} pszDomainName The domain of the account for which to change the password.
 * @param {Pointer<Integer>} pszAccountName The user name of the account for which to change the password.
 * @param {Pointer<Integer>} pszOldPassword The old password to be changed.
 * @param {Pointer<Integer>} pszNewPassword The new password for the specified account.
 * @param {BOOLEAN} bImpersonating <b>TRUE</b> if the calling process is running as the client; otherwise, <b>FALSE</b>.
 * @param {Integer} dwReserved Reserved. Must be set to zero.
 * @param {Pointer<SecBufferDesc>} pOutput On input, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. The <b>SecBufferDesc</b> structure must contain a single buffer of type <b>SECBUFFER_CHANGE_PASS_RESPONSE</b>. On output, the <b>pvBuffer</b> member of that structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-domain_password_information">DOMAIN_PASSWORD_INFORMATION</a> structure.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-changeaccountpasswordw
 * @since windows6.0.6000
 */
export ChangeAccountPasswordW(pszPackageName, pszDomainName, pszAccountName, pszOldPassword, pszNewPassword, bImpersonating, dwReserved, pOutput) {
    pszPackageNameMarshal := pszPackageName is VarRef ? "ushort*" : "ptr"
    pszDomainNameMarshal := pszDomainName is VarRef ? "ushort*" : "ptr"
    pszAccountNameMarshal := pszAccountName is VarRef ? "ushort*" : "ptr"
    pszOldPasswordMarshal := pszOldPassword is VarRef ? "ushort*" : "ptr"
    pszNewPasswordMarshal := pszNewPassword is VarRef ? "ushort*" : "ptr"

    result := DllCall("SECUR32.dll\ChangeAccountPasswordW", pszPackageNameMarshal, pszPackageName, pszDomainNameMarshal, pszDomainName, pszAccountNameMarshal, pszAccountName, pszOldPasswordMarshal, pszOldPassword, pszNewPasswordMarshal, pszNewPassword, BOOLEAN, bImpersonating, "uint", dwReserved, SecBufferDesc.Ptr, pOutput, "HRESULT")
    return result
}

/**
 * Changes the password for a Windows domain account by using the specified Security Support Provider. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines ChangeAccountPassword as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Integer>} pszPackageName The name of the provider to use. The value of this parameter must be either "Kerberos", "Negotiate", or "NTLM".
 * @param {Pointer<Integer>} pszDomainName The domain of the account for which to change the password.
 * @param {Pointer<Integer>} pszAccountName The user name of the account for which to change the password.
 * @param {Pointer<Integer>} pszOldPassword The old password to be changed.
 * @param {Pointer<Integer>} pszNewPassword The new password for the specified account.
 * @param {BOOLEAN} bImpersonating <b>TRUE</b> if the calling process is running as the client; otherwise, <b>FALSE</b>.
 * @param {Integer} dwReserved Reserved. Must be set to zero.
 * @param {Pointer<SecBufferDesc>} pOutput On input, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. The <b>SecBufferDesc</b> structure must contain a single buffer of type <b>SECBUFFER_CHANGE_PASS_RESPONSE</b>. On output, the <b>pvBuffer</b> member of that structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-domain_password_information">DOMAIN_PASSWORD_INFORMATION</a> structure.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-changeaccountpassworda
 * @since windows6.0.6000
 */
export ChangeAccountPasswordA(pszPackageName, pszDomainName, pszAccountName, pszOldPassword, pszNewPassword, bImpersonating, dwReserved, pOutput) {
    pszPackageNameMarshal := pszPackageName is VarRef ? "char*" : "ptr"
    pszDomainNameMarshal := pszDomainName is VarRef ? "char*" : "ptr"
    pszAccountNameMarshal := pszAccountName is VarRef ? "char*" : "ptr"
    pszOldPasswordMarshal := pszOldPassword is VarRef ? "char*" : "ptr"
    pszNewPasswordMarshal := pszNewPassword is VarRef ? "char*" : "ptr"

    result := DllCall("SECUR32.dll\ChangeAccountPasswordA", pszPackageNameMarshal, pszPackageName, pszDomainNameMarshal, pszDomainName, pszAccountNameMarshal, pszAccountName, pszOldPasswordMarshal, pszOldPassword, pszNewPasswordMarshal, pszNewPassword, BOOLEAN, bImpersonating, "uint", dwReserved, SecBufferDesc.Ptr, pOutput, "HRESULT")
    return result
}

/**
 * Initiates the client side, outbound security context from a credential handle. (Unicode)
 * @remarks
 * The caller is responsible for determining whether the final context attributes are sufficient. If, for example, confidentiality was requested, but could not be established, some applications may choose to shut down the connection immediately.
 * 
 * If attributes of the security context are not sufficient, the client must free the partially created context by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
 * 
 * The <b>InitializeSecurityContext (General)</b> function is used by a client to initialize an outbound context.
 * 
 * For a two-leg security context, the calling sequence is as follows:
 * 
 * <ol>
 * <li>The client calls the function with <i>phContext</i> set to <b>NULL</b> and fills in the buffer descriptor with the input message.</li>
 * <li>The security package examines the parameters and constructs an opaque token, placing it in the TOKEN element in the buffer array. If the <i>fContextReq</i> parameter includes the ISC_REQ_ALLOCATE_MEMORY flag, the security package allocates the memory and returns the pointer in the TOKEN element.</li>
 * <li>The client sends the token returned in the <i>pOutput</i> buffer to the target server. The server then passes the token as an input argument in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> may return a token, which the server sends to the client for a second call to <b>InitializeSecurityContext (General)</b> if the first call returned SEC_I_CONTINUE_NEEDED.</li>
 * </ol>
 * For multiple-leg security contexts, such as mutual authentication, the calling sequence is as follows:
 * 
 * <ol>
 * <li>The client calls the function as described earlier, but the package returns the SEC_I_CONTINUE_NEEDED success code.</li>
 * <li>The client sends the output token to the server and waits for the server's reply.</li>
 * <li>Upon receipt of the server's response, the client calls <b>InitializeSecurityContext (General)</b> again, with <i>phContext</i> set to the handle that was returned from the last call. The token received from the server is supplied in the <i>pInput</i> parameter.</li>
 * </ol>
 * If the server has successfully responded, the security package returns SEC_E_OK and a secure session is established.
 * 
 * If the function returns one of the error responses, the server's response is not accepted, and the session is not established.
 * 
 * If the function returns SEC_I_CONTINUE_NEEDED, SEC_I_COMPLETE_NEEDED, or SEC_I_COMPLETE_AND_CONTINUE, steps 2 and 3 are repeated.
 * 
 * To initialize a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>, more than one call to this function may be required, depending on the underlying authentication mechanism as well as the choices specified in the <i>fContextReq</i> parameter.
 * 
 * The <i>fContextReq</i> and <i>pfContextAttributes</i> parameters are bitmasks that represent various context attributes. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. The <i>pfContextAttributes</i> parameter is valid on any successful return, but only on the final successful return should you examine the flags that pertain to security aspects of the context. Intermediate returns can set, for example, the ISC_RET_ALLOCATED_MEMORY flag.
 * 
 * If the ISC_REQ_USE_SUPPLIED_CREDS flag is set, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> must look for a SECBUFFER_PKG_PARAMS buffer type in the <i>pInput</i> input buffer. This is not a generic solution, but it allows for a strong pairing of security package and application when appropriate.
 * 
 * If ISC_REQ_ALLOCATE_MEMORY was specified, the caller must free the memory by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * 
 * For example, the input token could be the challenge from a LAN Manager. In this case, the output token would be the NTLM-encrypted response to the challenge.
 * 
 * The action the client takes depends on the return code from this function. If the return code is SEC_E_OK, there will be no second <b>InitializeSecurityContext (General)</b> call, and no response from the server is expected. If the return code is SEC_I_CONTINUE_NEEDED, the client expects a token in response from the server and passes it in a second call to <b>InitializeSecurityContext (General)</b>. The SEC_I_COMPLETE_NEEDED return code indicates that the client must finish building the message and call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function. The SEC_I_COMPLETE_AND_CONTINUE code incorporates both of these actions.
 * 
 * If <b>InitializeSecurityContext (General)</b> returns success on the first (or only) call, then the caller must eventually call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function on the returned handle, even if the call fails on a later leg of the authentication exchange.
 * 
 * The client may call <b>InitializeSecurityContext (General)</b> again after it has completed successfully. This indicates to the security package that a reauthentication is wanted.
 * 
 * Kernel mode callers have the following differences: the target name is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string that must be allocated in virtual memory by using <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>; it must not be allocated from the pool. Buffers passed and supplied in <i>pInput</i> and <i>pOutput</i> must be in virtual memory, not in the pool.
 * 
 * When using the Schannel SSP, if the function returns SEC_I_INCOMPLETE_CREDENTIALS, check that you specified a valid and trusted certificate in your credentials. The certificate is specified when calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a> function. The certificate must be a client authentication certificate issued by a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) trusted by the server. To obtain a list of the CAs trusted by the server, call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function and specify the SECPKG_ATTR_ISSUER_LIST_EX attribute.
 * 
 * When using the Schannel SSP, after a client application receives an authentication certificate from a CA that is trusted by the server, the application  creates a new credential by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a> function and then calling <b>InitializeSecurityContext (General)</b> again, specifying the new credential in the <i>phCredential</i> parameter.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines InitializeSecurityContext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phCredential A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a>. This handle is used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. The <b>InitializeSecurityContext (General)</b> function requires at least OUTBOUND credentials.
 * @param {Pointer<SecHandle>} phContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>InitializeSecurityContext (General)</b>, this pointer is <b>NULL</b>. On the second call, this parameter is a pointer to the handle to the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
 * 
 * This parameter is optional with the Microsoft Digest SSP and can be set to <b>NULL</b>.
 * 
 * When using the Schannel SSP, on the first call to <b>InitializeSecurityContext (General)</b>, specify <b>NULL</b>. On future calls, specify the token received in the <i>phNewContext</i> parameter after the first call to this function.
 * @param {Pointer<Integer>} pszTargetName 
 * @param {ISC_REQ_FLAGS} fContextReq Bit flags that indicate requests for the context. Not all packages can support all requirements. Flags used for this parameter are prefixed with ISC_REQ_, for example,  ISC_REQ_DELEGATE. This parameter can be one or more of the following attributes flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_ALLOCATE_MEMORY"></a><a id="isc_req_allocate_memory"></a><dl>
 * <dt><b>ISC_REQ_ALLOCATE_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security package allocates output buffers for you. When you have finished using the output buffers, free them by calling the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_CONFIDENTIALITY"></a><a id="isc_req_confidentiality"></a><dl>
 * <dt><b>ISC_REQ_CONFIDENTIALITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Encrypt messages by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_CONNECTION"></a><a id="isc_req_connection"></a><dl>
 * <dt><b>ISC_REQ_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security context will not handle formatting messages. This value is the default for the Kerberos, Negotiate, and NTLM security packages.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_DELEGATE"></a><a id="isc_req_delegate"></a><dl>
 * <dt><b>ISC_REQ_DELEGATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server can use the context to authenticate to other servers as the client. The ISC_REQ_MUTUAL_AUTH flag must be set for this flag to work. Valid for Kerberos. Ignore this flag for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">constrained delegation</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_EXTENDED_ERROR"></a><a id="isc_req_extended_error"></a><dl>
 * <dt><b>ISC_REQ_EXTENDED_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When errors occur, the remote party will be notified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_HTTP"></a><a id="isc_req_http"></a><dl>
 * <dt><b>ISC_REQ_HTTP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use Digest for HTTP. Omit this flag to use Digest as a SASL mechanism.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_INTEGRITY"></a><a id="isc_req_integrity"></a><dl>
 * <dt><b>ISC_REQ_INTEGRITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sign messages and verify signatures by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> functions.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_MANUAL_CRED_VALIDATION"></a><a id="isc_req_manual_cred_validation"></a><dl>
 * <dt><b>ISC_REQ_MANUAL_CRED_VALIDATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Schannel must not authenticate the server automatically.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_MUTUAL_AUTH"></a><a id="isc_req_mutual_auth"></a><dl>
 * <dt><b>ISC_REQ_MUTUAL_AUTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The mutual authentication policy of the service will be satisfied.
 * 
 * <div class="alert"><b>Caution</b>  This does not necessarily mean that mutual authentication is performed, only that the authentication policy of the service is satisfied. To ensure that mutual authentication is performed, call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function.</div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_NO_INTEGRITY"></a><a id="isc_req_no_integrity"></a><dl>
 * <dt><b>ISC_REQ_NO_INTEGRITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If this flag is set, the <b>ISC_REQ_INTEGRITY</b> flag is ignored.
 * 
 * This value is supported only by the Negotiate and Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security packages</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_REPLAY_DETECT"></a><a id="isc_req_replay_detect"></a><dl>
 * <dt><b>ISC_REQ_REPLAY_DETECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Detect replayed messages that have been encoded by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> functions.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_SEQUENCE_DETECT"></a><a id="isc_req_sequence_detect"></a><dl>
 * <dt><b>ISC_REQ_SEQUENCE_DETECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Detect messages received out of sequence.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_STREAM"></a><a id="isc_req_stream"></a><dl>
 * <dt><b>ISC_REQ_STREAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Support a stream-oriented connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_USE_SESSION_KEY"></a><a id="isc_req_use_session_key"></a><dl>
 * <dt><b>ISC_REQ_USE_SESSION_KEY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A new <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> must be negotiated.
 * 
 * This value is supported only by the Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_USE_SUPPLIED_CREDS"></a><a id="isc_req_use_supplied_creds"></a><dl>
 * <dt><b>ISC_REQ_USE_SUPPLIED_CREDS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Schannel must not attempt to supply credentials for the client automatically.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The requested attributes may not be supported by the client. For more information, see the <i>pfContextAttr</i> parameter.
 * 
 * For  further descriptions of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
 * @param {Integer} Reserved1 This parameter is reserved and must be set to zero.
 * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
 * 
 * This parameter is not used with Digest or Schannel. Set it to zero.
 * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the buffers supplied as input to the package. Unless the client context was initiated by the server, the value of this parameter must be <b>NULL</b> on the first call to the function. On subsequent calls to the function or when the client context was initiated by the server, the value of this parameter is a pointer to a buffer allocated with enough memory to hold the token returned by the remote computer.
 * @param {Integer} Reserved2 This parameter is reserved and must be set to zero.
 * @param {Pointer<SecHandle>} phNewContext A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>InitializeSecurityContext (General)</b>, this pointer receives the new context handle. On the second call, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
 * 
 * When using the Schannel SSP,  on calls after the first call, pass the  handle returned here as the <i>phContext</i> parameter and specify <b>NULL</b> for <i>phNewContext</i>.
 * @param {Pointer<SecBufferDesc>} pOutput A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives the output data. If a buffer was typed as SEC_READWRITE in the input, it will be there on output. The system will allocate a buffer for the security token if requested (through ISC_REQ_ALLOCATE_MEMORY) and fill in the address in the buffer descriptor for the security token.
 * 
 * When using the Microsoft Digest SSP,  this parameter receives the challenge response that must be sent to the server.
 * 
 * When using the Schannel SSP, if the ISC_REQ_ALLOCATE_MEMORY flag is specified, the Schannel SSP will allocate memory for  the buffer and put the appropriate information in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a>. In addition, the caller must pass in a buffer of type <b>SECBUFFER_ALERT</b>. On output, if an alert is generated, this buffer  contains information about that alert, and the function fails.
 * @param {Pointer<Integer>} pfContextAttr A pointer to a variable to receive a set of bit flags that indicate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> of the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. 
 * 
 * Flags used for this parameter are prefixed with ISC_RET, such as ISC_RET_DELEGATE. 
 * 
 * 
 *  For a list of valid values, see the <i>fContextReq</i> parameter.
 * 
 * Do not check for security-related attributes until the final function call returns successfully. Attribute flags that are not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
 * 
 * <div class="alert"><b>Note</b>  Particular context attributes can change during negotiation with a remote peer.</div>
 * <div> </div>
 * @param {Pointer<Integer>} ptsExpiry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. This parameter is optional and <b>NULL</b> should be passed for short-lived clients.
 * 
 * There is no expiration time for Microsoft Digest SSP security contexts or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a>.
 * @returns {HRESULT} If the function succeeds, the function returns one of the following success codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_COMPLETE_AND_CONTINUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client must call <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> and then pass the output to the server. The client then waits for a returned token and passes it, in another call, to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_COMPLETE_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client must finish building the message and then call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_CONTINUE_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client must send the output token to the server and wait for a return token. The returned token is then passed in another call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>. The output token can be empty.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_INCOMPLETE_CREDENTIALS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use with Schannel. The server has requested client authentication, and the supplied credentials either do not include a certificate or the certificate was not issued by a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> that is trusted by the server. For more information, see Remarks.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INCOMPLETE_MESSAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use with Schannel. Data for the whole message was not read from the wire.
 * 
 * When this value is returned, the <i>pInput</i> buffer contains a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure with a <b>BufferType</b> member of <b>SECBUFFER_MISSING</b>. The <b>cbBuffer</b> member of <b>SecBuffer</b> contains a value that indicates the number of additional bytes that the function must read from the client before this function succeeds. While this number is not always accurate, using it can help improve performance by avoiding multiple calls to this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> was successfully initialized. There is no need for another <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> call. If the function returns an output token, that is, if the SECBUFFER_TOKEN in <i>pOutput</i> is of nonzero length, that token must be sent to the server.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If the function fails, the function returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough memory available to complete the requested action.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred that did not map to an SSPI error code.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The error is due to a malformed input token, such as a token corrupted in transit, a token of incorrect size, or a token passed into the wrong security package. Passing a token to the wrong package can happen if the client and server did not negotiate the proper security package.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_LOGON_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The logon failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No authority could be contacted for authentication. The domain name of the authenticating party could be wrong, the domain could be unreachable, or there might have been a trust relationship failure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No credentials are available in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_TARGET_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The target was not recognized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A context attribute flag that is not valid (ISC_REQ_DELEGATE or ISC_REQ_PROMPT_FOR_CREDS) was specified in the <i>fContextReq</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_WRONG_PRINCIPAL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The principal that received the authentication request is not the same as the one passed into the <i>pszTargetName</i> parameter. This indicates a failure in mutual authentication.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-initializesecuritycontextw
 * @since windows5.1.2600
 */
export InitializeSecurityContextW(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    pszTargetNameMarshal := pszTargetName is VarRef ? "ushort*" : "ptr"
    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("SECUR32.dll\InitializeSecurityContextW", SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, pszTargetNameMarshal, pszTargetName, ISC_REQ_FLAGS, fContextReq, "uint", Reserved1, "uint", TargetDataRep, SecBufferDesc.Ptr, pInput, "uint", Reserved2, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, Int32)
    return result
}

/**
 * Initiates the client side, outbound security context from a credential handle. (ANSI)
 * @remarks
 * The caller is responsible for determining whether the final context attributes are sufficient. If, for example, confidentiality was requested, but could not be established, some applications may choose to shut down the connection immediately.
 * 
 * If attributes of the security context are not sufficient, the client must free the partially created context by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
 * 
 * The <b>InitializeSecurityContext (General)</b> function is used by a client to initialize an outbound context.
 * 
 * For a two-leg security context, the calling sequence is as follows:
 * 
 * <ol>
 * <li>The client calls the function with <i>phContext</i> set to <b>NULL</b> and fills in the buffer descriptor with the input message.</li>
 * <li>The security package examines the parameters and constructs an opaque token, placing it in the TOKEN element in the buffer array. If the <i>fContextReq</i> parameter includes the ISC_REQ_ALLOCATE_MEMORY flag, the security package allocates the memory and returns the pointer in the TOKEN element.</li>
 * <li>The client sends the token returned in the <i>pOutput</i> buffer to the target server. The server then passes the token as an input argument in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> may return a token, which the server sends to the client for a second call to <b>InitializeSecurityContext (General)</b> if the first call returned SEC_I_CONTINUE_NEEDED.</li>
 * </ol>
 * For multiple-leg security contexts, such as mutual authentication, the calling sequence is as follows:
 * 
 * <ol>
 * <li>The client calls the function as described earlier, but the package returns the SEC_I_CONTINUE_NEEDED success code.</li>
 * <li>The client sends the output token to the server and waits for the server's reply.</li>
 * <li>Upon receipt of the server's response, the client calls <b>InitializeSecurityContext (General)</b> again, with <i>phContext</i> set to the handle that was returned from the last call. The token received from the server is supplied in the <i>pInput</i> parameter.</li>
 * </ol>
 * If the server has successfully responded, the security package returns SEC_E_OK and a secure session is established.
 * 
 * If the function returns one of the error responses, the server's response is not accepted, and the session is not established.
 * 
 * If the function returns SEC_I_CONTINUE_NEEDED, SEC_I_COMPLETE_NEEDED, or SEC_I_COMPLETE_AND_CONTINUE, steps 2 and 3 are repeated.
 * 
 * To initialize a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>, more than one call to this function may be required, depending on the underlying authentication mechanism as well as the choices specified in the <i>fContextReq</i> parameter.
 * 
 * The <i>fContextReq</i> and <i>pfContextAttributes</i> parameters are bitmasks that represent various context attributes. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. The <i>pfContextAttributes</i> parameter is valid on any successful return, but only on the final successful return should you examine the flags that pertain to security aspects of the context. Intermediate returns can set, for example, the ISC_RET_ALLOCATED_MEMORY flag.
 * 
 * If the ISC_REQ_USE_SUPPLIED_CREDS flag is set, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> must look for a SECBUFFER_PKG_PARAMS buffer type in the <i>pInput</i> input buffer. This is not a generic solution, but it allows for a strong pairing of security package and application when appropriate.
 * 
 * If ISC_REQ_ALLOCATE_MEMORY was specified, the caller must free the memory by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * 
 * For example, the input token could be the challenge from a LAN Manager. In this case, the output token would be the NTLM-encrypted response to the challenge.
 * 
 * The action the client takes depends on the return code from this function. If the return code is SEC_E_OK, there will be no second <b>InitializeSecurityContext (General)</b> call, and no response from the server is expected. If the return code is SEC_I_CONTINUE_NEEDED, the client expects a token in response from the server and passes it in a second call to <b>InitializeSecurityContext (General)</b>. The SEC_I_COMPLETE_NEEDED return code indicates that the client must finish building the message and call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function. The SEC_I_COMPLETE_AND_CONTINUE code incorporates both of these actions.
 * 
 * If <b>InitializeSecurityContext (General)</b> returns success on the first (or only) call, then the caller must eventually call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function on the returned handle, even if the call fails on a later leg of the authentication exchange.
 * 
 * The client may call <b>InitializeSecurityContext (General)</b> again after it has completed successfully. This indicates to the security package that a reauthentication is wanted.
 * 
 * Kernel mode callers have the following differences: the target name is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string that must be allocated in virtual memory by using <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>; it must not be allocated from the pool. Buffers passed and supplied in <i>pInput</i> and <i>pOutput</i> must be in virtual memory, not in the pool.
 * 
 * When using the Schannel SSP, if the function returns SEC_I_INCOMPLETE_CREDENTIALS, check that you specified a valid and trusted certificate in your credentials. The certificate is specified when calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a> function. The certificate must be a client authentication certificate issued by a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) trusted by the server. To obtain a list of the CAs trusted by the server, call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function and specify the SECPKG_ATTR_ISSUER_LIST_EX attribute.
 * 
 * When using the Schannel SSP, after a client application receives an authentication certificate from a CA that is trusted by the server, the application  creates a new credential by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a> function and then calling <b>InitializeSecurityContext (General)</b> again, specifying the new credential in the <i>phCredential</i> parameter.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines InitializeSecurityContext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phCredential A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a>. This handle is used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. The <b>InitializeSecurityContext (General)</b> function requires at least OUTBOUND credentials.
 * @param {Pointer<SecHandle>} phContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>InitializeSecurityContext (General)</b>, this pointer is <b>NULL</b>. On the second call, this parameter is a pointer to the handle to the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
 * 
 * This parameter is optional with the Microsoft Digest SSP and can be set to <b>NULL</b>.
 * 
 * When using the Schannel SSP, on the first call to <b>InitializeSecurityContext (General)</b>, specify <b>NULL</b>. On future calls, specify the token received in the <i>phNewContext</i> parameter after the first call to this function.
 * @param {Pointer<Integer>} pszTargetName TBD
 * @param {ISC_REQ_FLAGS} fContextReq Bit flags that indicate requests for the context. Not all packages can support all requirements. Flags used for this parameter are prefixed with ISC_REQ_, for example,  ISC_REQ_DELEGATE. This parameter can be one or more of the following attributes flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_ALLOCATE_MEMORY"></a><a id="isc_req_allocate_memory"></a><dl>
 * <dt><b>ISC_REQ_ALLOCATE_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security package allocates output buffers for you. When you have finished using the output buffers, free them by calling the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_CONFIDENTIALITY"></a><a id="isc_req_confidentiality"></a><dl>
 * <dt><b>ISC_REQ_CONFIDENTIALITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Encrypt messages by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_CONNECTION"></a><a id="isc_req_connection"></a><dl>
 * <dt><b>ISC_REQ_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security context will not handle formatting messages. This value is the default for the Kerberos, Negotiate, and NTLM security packages.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_DELEGATE"></a><a id="isc_req_delegate"></a><dl>
 * <dt><b>ISC_REQ_DELEGATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The server can use the context to authenticate to other servers as the client. The ISC_REQ_MUTUAL_AUTH flag must be set for this flag to work. Valid for Kerberos. Ignore this flag for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">constrained delegation</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_EXTENDED_ERROR"></a><a id="isc_req_extended_error"></a><dl>
 * <dt><b>ISC_REQ_EXTENDED_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When errors occur, the remote party will be notified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_HTTP"></a><a id="isc_req_http"></a><dl>
 * <dt><b>ISC_REQ_HTTP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use Digest for HTTP. Omit this flag to use Digest as a SASL mechanism.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_INTEGRITY"></a><a id="isc_req_integrity"></a><dl>
 * <dt><b>ISC_REQ_INTEGRITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sign messages and verify signatures by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> functions.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_MANUAL_CRED_VALIDATION"></a><a id="isc_req_manual_cred_validation"></a><dl>
 * <dt><b>ISC_REQ_MANUAL_CRED_VALIDATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Schannel must not authenticate the server automatically.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_MUTUAL_AUTH"></a><a id="isc_req_mutual_auth"></a><dl>
 * <dt><b>ISC_REQ_MUTUAL_AUTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The mutual authentication policy of the service will be satisfied.
 * 
 * <div class="alert"><b>Caution</b>  This does not necessarily mean that mutual authentication is performed, only that the authentication policy of the service is satisfied. To ensure that mutual authentication is performed, call the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function.</div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_NO_INTEGRITY"></a><a id="isc_req_no_integrity"></a><dl>
 * <dt><b>ISC_REQ_NO_INTEGRITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If this flag is set, the <b>ISC_REQ_INTEGRITY</b> flag is ignored.
 * 
 * This value is supported only by the Negotiate and Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security packages</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_REPLAY_DETECT"></a><a id="isc_req_replay_detect"></a><dl>
 * <dt><b>ISC_REQ_REPLAY_DETECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Detect replayed messages that have been encoded by using the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> functions.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_SEQUENCE_DETECT"></a><a id="isc_req_sequence_detect"></a><dl>
 * <dt><b>ISC_REQ_SEQUENCE_DETECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Detect messages received out of sequence.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_STREAM"></a><a id="isc_req_stream"></a><dl>
 * <dt><b>ISC_REQ_STREAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Support a stream-oriented connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_USE_SESSION_KEY"></a><a id="isc_req_use_session_key"></a><dl>
 * <dt><b>ISC_REQ_USE_SESSION_KEY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A new <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> must be negotiated.
 * 
 * This value is supported only by the Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_USE_SUPPLIED_CREDS"></a><a id="isc_req_use_supplied_creds"></a><dl>
 * <dt><b>ISC_REQ_USE_SUPPLIED_CREDS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Schannel must not attempt to supply credentials for the client automatically.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The requested attributes may not be supported by the client. For more information, see the <i>pfContextAttr</i> parameter.
 * 
 * For  further descriptions of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
 * @param {Integer} Reserved1 This parameter is reserved and must be set to zero.
 * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
 * 
 * This parameter is not used with Digest or Schannel. Set it to zero.
 * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the buffers supplied as input to the package. Unless the client context was initiated by the server, the value of this parameter must be <b>NULL</b> on the first call to the function. On subsequent calls to the function or when the client context was initiated by the server, the value of this parameter is a pointer to a buffer allocated with enough memory to hold the token returned by the remote computer.
 * @param {Integer} Reserved2 This parameter is reserved and must be set to zero.
 * @param {Pointer<SecHandle>} phNewContext A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>InitializeSecurityContext (General)</b>, this pointer receives the new context handle. On the second call, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
 * 
 * When using the Schannel SSP,  on calls after the first call, pass the  handle returned here as the <i>phContext</i> parameter and specify <b>NULL</b> for <i>phNewContext</i>.
 * @param {Pointer<SecBufferDesc>} pOutput A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives the output data. If a buffer was typed as SEC_READWRITE in the input, it will be there on output. The system will allocate a buffer for the security token if requested (through ISC_REQ_ALLOCATE_MEMORY) and fill in the address in the buffer descriptor for the security token.
 * 
 * When using the Microsoft Digest SSP,  this parameter receives the challenge response that must be sent to the server.
 * 
 * When using the Schannel SSP, if the ISC_REQ_ALLOCATE_MEMORY flag is specified, the Schannel SSP will allocate memory for  the buffer and put the appropriate information in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a>. In addition, the caller must pass in a buffer of type <b>SECBUFFER_ALERT</b>. On output, if an alert is generated, this buffer  contains information about that alert, and the function fails.
 * @param {Pointer<Integer>} pfContextAttr A pointer to a variable to receive a set of bit flags that indicate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> of the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. 
 * 
 * Flags used for this parameter are prefixed with ISC_RET, such as ISC_RET_DELEGATE. 
 * 
 * 
 *  For a list of valid values, see the <i>fContextReq</i> parameter.
 * 
 * Do not check for security-related attributes until the final function call returns successfully. Attribute flags that are not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
 * 
 * <div class="alert"><b>Note</b>  Particular context attributes can change during negotiation with a remote peer.</div>
 * <div> </div>
 * @param {Pointer<Integer>} ptsExpiry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. This parameter is optional and <b>NULL</b> should be passed for short-lived clients.
 * 
 * There is no expiration time for Microsoft Digest SSP security contexts or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a>.
 * @returns {HRESULT} If the function succeeds, the function returns one of the following success codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_COMPLETE_AND_CONTINUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client must call <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> and then pass the output to the server. The client then waits for a returned token and passes it, in another call, to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_COMPLETE_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client must finish building the message and then call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_CONTINUE_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client must send the output token to the server and wait for a return token. The returned token is then passed in another call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>. The output token can be empty.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_INCOMPLETE_CREDENTIALS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use with Schannel. The server has requested client authentication, and the supplied credentials either do not include a certificate or the certificate was not issued by a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> that is trusted by the server. For more information, see Remarks.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INCOMPLETE_MESSAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use with Schannel. Data for the whole message was not read from the wire.
 * 
 * When this value is returned, the <i>pInput</i> buffer contains a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure with a <b>BufferType</b> member of <b>SECBUFFER_MISSING</b>. The <b>cbBuffer</b> member of <b>SecBuffer</b> contains a value that indicates the number of additional bytes that the function must read from the client before this function succeeds. While this number is not always accurate, using it can help improve performance by avoiding multiple calls to this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> was successfully initialized. There is no need for another <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> call. If the function returns an output token, that is, if the SECBUFFER_TOKEN in <i>pOutput</i> is of nonzero length, that token must be sent to the server.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If the function fails, the function returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough memory available to complete the requested action.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred that did not map to an SSPI error code.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The error is due to a malformed input token, such as a token corrupted in transit, a token of incorrect size, or a token passed into the wrong security package. Passing a token to the wrong package can happen if the client and server did not negotiate the proper security package.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_LOGON_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The logon failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No authority could be contacted for authentication. The domain name of the authenticating party could be wrong, the domain could be unreachable, or there might have been a trust relationship failure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No credentials are available in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_TARGET_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The target was not recognized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A context attribute flag that is not valid (ISC_REQ_DELEGATE or ISC_REQ_PROMPT_FOR_CREDS) was specified in the <i>fContextReq</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_WRONG_PRINCIPAL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The principal that received the authentication request is not the same as the one passed into the <i>pszTargetName</i> parameter. This indicates a failure in mutual authentication.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-initializesecuritycontexta
 * @since windows5.1.2600
 */
export InitializeSecurityContextA(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    pszTargetNameMarshal := pszTargetName is VarRef ? "char*" : "ptr"
    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("SECUR32.dll\InitializeSecurityContextA", SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, pszTargetNameMarshal, pszTargetName, ISC_REQ_FLAGS, fContextReq, "uint", Reserved1, "uint", TargetDataRep, SecBufferDesc.Ptr, pInput, "uint", Reserved2, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, Int32)
    return result
}

/**
 * Lets the server component of a transport application establish a security context between the server and a remote client.
 * @remarks
 * The <b>AcceptSecurityContext (CredSSP)</b> function is the server counterpart to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (CredSSP)</a> function.
 * 
 * When the server receives a request from a client, it uses the <i>fContextReq</i> parameter to specify what it requires of the session. In this fashion, a server can require that clients be capable of using a confidential or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">integrity</a>-checked session; it can reject clients that cannot meet that demand. Alternatively, a server can require nothing; whatever the client requires or can provide is returned in the <i>pfContextAttr</i> parameter.
 * 
 * The <i>fContextReq</i> and <i>pfContextAttr</i> parameters are bitmasks that represent various context attributes. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
 * 
 * <div class="alert"><b>Note</b>  While the <i>pfContextAttr</i> parameter is valid on any successful return, you should examine the flags pertaining to security aspects of the context only on the final successful return. Intermediate returns can set, for example, the ISC_RET_ALLOCATED_MEMORY flag.</div>
 * <div> </div>
 * The caller is responsible for determining whether the final context attributes are sufficient. For example, if confidentiality (encryption) was requested but could not be established, some applications may choose to shut down the connection immediately. If the security context cannot be established, the server must free the partially created context by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function. For information about when to call the <b>DeleteSecurityContext</b> function, see <b>DeleteSecurityContext</b>.\
 * 
 * After the security context has been established, the server application can use the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querysecuritycontexttoken">QuerySecurityContextToken</a> function to retrieve a handle to the user account to which the client certificate was mapped. Also, the server can use the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-impersonatesecuritycontext">ImpersonateSecurityContext</a> function to impersonate the user.
 * @param {Pointer<SecHandle>} phCredential A handle to the server credentials. To retrieve this handle, the server calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (CredSSP)</a> function with either the SECPKG_CRED_INBOUND or SECPKG_CRED_BOTH flag set.
 * @param {Pointer<SecHandle>} phContext A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>AcceptSecurityContext (CredSSP)</b>, this pointer is <b>NULL</b>. On subsequent calls, <i>phContext</i> specifies the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
 * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure generated by a client call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (CredSSP)</a>. The structure contains the input buffer descriptor.
 * 
 * The first buffer must be of type <b>SECBUFFER_TOKEN</b> and contain the security token received from the client. The second buffer should be of type <b>SECBUFFER_EMPTY</b>.
 * @param {ASC_REQ_FLAGS} fContextReq 
 * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either <b>SECURITY_NATIVE_DREP</b> or <b>SECURITY_NETWORK_DREP</b>.
 * @param {Pointer<SecHandle>} phNewContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <b>AcceptSecurityContext (CredSSP)</b>, this pointer receives the new context handle. On subsequent calls, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
 * @param {Pointer<SecBufferDesc>} pOutput A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the output buffer descriptor. This buffer is sent to the client for input into additional calls to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (CredSSP)</a>. An output buffer may be generated even if the function returns SEC_E_OK. Any buffer generated must be sent back to the client application.
 * 
 * On output, this buffer receives a token for the security context. The token must be sent to the client. The function can also return a buffer of type SECBUFFER_EXTRA.
 * @param {Pointer<Integer>} pfContextAttr A pointer to a set of bit flags that indicate the attributes of the established context. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. Flags used for this parameter are prefixed with ASC_RET, for example, ASC_RET_DELEGATE.
 * 
 * Do not check for security-related attributes until the final function call returns successfully. Attribute flags not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
 * @param {Pointer<Integer>} ptsExpiry A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> structure that receives the expiration time of the context. We recommend that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time.
 * 
 * <div class="alert"><b>Note</b>  Until the last call of the authentication process, the expiration time for the context can be incorrect because more information will be provided during later stages of the negotiation. Therefore, <i>ptsTimeStamp</i> must be <b>NULL</b> until the last call to the function.</div>
 * <div> </div>
 * @returns {HRESULT} This function returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INCOMPLETE_MESSAGE</b></dt>
 * <dt>0x80090318L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded. The data in the input buffer is incomplete. The application must read additional data from the client and call <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (CredSSP)</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * <dt>0x80090300L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function failed. There is not enough memory available to complete the requested action.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
 * <dt>0x80090304L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function failed. An error occurred that did not map to an SSPI error code.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * <dt>0x80100003L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function failed. The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * <dt>0x80090308L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function failed. The token passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_LOGON_DENIED</b></dt>
 * <dt>0x8009030CL</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The logon failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
 * <dt>0x80090311L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function failed. No authority could be contacted for authentication. This could be due to the following conditions:
 * 
 * <ul>
 * <li>The domain name of the authenticating party is incorrect.</li>
 * <li>The domain is unavailable.</li>
 * <li>The trust relationship has failed.</li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
 * <dt>0x8009030EL</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function failed. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> handle specified in the <i>phCredential</i> parameter is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_OK</b></dt>
 * <dt>0x00000000L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded. The security context received from the client was accepted. If the function generated an output token, the token must be sent to the client process.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * <dt>0x80090302L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function failed. The <i>fContextReq</i> parameter specified a context attribute flag (ASC_REQ_DELEGATE or ASC_REQ_PROMPT_FOR_CREDS) that was not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_COMPLETE_AND_CONTINUE</b></dt>
 * <dt>0x00090314L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded. The server must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> and pass the output token to the client. The server must then wait for a return token from the client before making another call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (CredSSP)</a>.
 * 							
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_COMPLETE_NEEDED</b></dt>
 * <dt>0x00090313L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded. The server must finish building the message from the client before calling <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_CONTINUE_NEEDED</b></dt>
 * <dt>0x00090312L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded. The server must send the output token to the client and wait for a returned token. The returned token should be passed in <i>pInput</i> for another call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (CredSSP)</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-acceptsecuritycontext
 * @since windows6.0.6000
 */
export AcceptSecurityContext(phCredential, phContext, pInput, fContextReq, TargetDataRep, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("SECUR32.dll\AcceptSecurityContext", SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pInput, ASC_REQ_FLAGS, fContextReq, "uint", TargetDataRep, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, Int32)
    return result
}

/**
 * Completes an authentication token. (CompleteAuthToken)
 * @remarks
 * The client of a transport application calls the <b>CompleteAuthToken</b> function to allow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to update a checksum or similar operation after all the protocol headers have been updated by the transport application. The client calls this function only if the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (Digest)</a> call returned SEC_I_COMPLETE_NEEDED or SEC_I_COMPLETE_AND_CONTINUE.
 * @param {Pointer<SecHandle>} phContext A handle of the context that needs to be completed.
 * @param {Pointer<SecBufferDesc>} pToken A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the buffer descriptor for the entire message.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 						
 * 
 * If the function fails, it returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle that was passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The token that was passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client's security context was located, but the message number is incorrect. This return value is used with the Digest SSP.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_MESSAGE_ALTERED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client's security context was located, but the client's message has been tampered with. This return value is used with the Digest SSP.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred that did not map to an SSPI error code.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-completeauthtoken
 * @since windows5.1.2600
 */
export CompleteAuthToken(phContext, pToken) {
    result := DllCall("SECUR32.dll\CompleteAuthToken", SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pToken, "HRESULT")
    return result
}

/**
 * Allows a server to impersonate a client by using a token previously obtained by a call to AcceptSecurityContext (General) or QuerySecurityContextToken.
 * @remarks
 * The server application calls the <b>ImpersonateSecurityContext</b> function when it needs to impersonate the client. Before doing so, the server must have obtained a valid context handle. To obtain the context handle, the server must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> to submit the client's incoming security token to the security system. The server gets a context handle if the inbound context is validated. The function creates an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a> and allows the thread or process to run with the impersonation context.
 * 
 * When using the Schannel <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP), the server application must pass the <b>ASC_REQ_MUTUAL_AUTH</b> flag when calling <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a>. This ensures that the client is asked for a client certificate during the SSL/TLS handshake. When a client certificate is received, the Schannel package verifies the client certificate and attempts to map it to a user account. When this mapping is successful, then a client user token is created and this function succeeds.
 * 
 * The application server must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-revertsecuritycontext">RevertSecurityContext</a> function when it finishes or when it needs to restore its own <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
 * 
 * <b>ImpersonateSecurityContext</b> is not available with all <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security packages</a> on all platforms. Typically, it is implemented only on platforms and with security packages that support impersonation. To learn whether a security package supports impersonation, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querysecuritypackageinfoa">QuerySecurityPackageInfo</a> function.
 * 
 * <div class="alert"><b>Note</b>  If the <b>ImpersonateSecurityContext</b> function fails, the client is not impersonated, and all subsequent client requests are made in the security context of the process that called the function. If the calling process is running as a privileged account, it can perform actions that the client would not be allowed to perform. To avoid security risks, the calling process should always check the return value. If the return value indicates that the function call failed, no client requests should be executed.</div>
 * <div> </div>
 * All impersonate functions, including <b>ImpersonateSecurityContext</b> allow the requested impersonation if one of the following is true: 
 * 
 * 
 * 
 * <ul>
 * <li>The requested impersonation level of the token is less than <b>SecurityImpersonation</b>, such as <b>SecurityIdentification</b> or <b>SecurityAnonymous</b>.</li>
 * <li>The caller has the <b>SeImpersonatePrivilege</b> privilege.</li>
 * <li>A process (or another process in the caller's logon session) created the token using explicit credentials through <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> function.</li>
 * <li>The authenticated identity is same as the caller.</li>
 * </ul>
 * <b>Windows XP with SP1 and earlier:  </b>The <b>SeImpersonatePrivilege</b> privilege is not supported.
 * 
 * <b>Windows XP:  </b>The SeImpersonatePrivilege privilege is not supported until Windows XP with Service Pack 2 (SP2).
 * @param {Pointer<SecHandle>} phContext The handle of the context to impersonate. This handle must have been obtained by a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns the following error code.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_IMPERSONATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client could not be impersonated.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This value is returned by Schannel kernel mode to indicate that this function is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-impersonatesecuritycontext
 * @since windows5.1.2600
 */
export ImpersonateSecurityContext(phContext) {
    result := DllCall("SECUR32.dll\ImpersonateSecurityContext", SecHandle.Ptr, phContext, "HRESULT")
    return result
}

/**
 * Allows a security package to discontinue the impersonation of the caller and restore its own security context.
 * @remarks
 * <b>RevertSecurityContext</b> is not available with all <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security packages</a> on all platforms. Typically, it is implemented only on platforms and with security packages for which a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querysecuritypackageinfoa">QuerySecurityPackageInfo</a> function indicates impersonation support.
 * @param {Pointer<SecHandle>} phContext Handle of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> being impersonated. This handle must have been obtained in the call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function and used in the call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-impersonatesecuritycontext">ImpersonateSecurityContext</a> function.
 * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
 * 
 * If the function fails, the return value can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-revertsecuritycontext
 * @since windows5.1.2600
 */
export RevertSecurityContext(phContext) {
    result := DllCall("SECUR32.dll\RevertSecurityContext", SecHandle.Ptr, phContext, "HRESULT")
    return result
}

/**
 * Obtains the access token for a client security context and uses it directly.
 * @remarks
 * This function is called by a server application to control impersonation outside the SSPI layer, such as when launching a child process. The handle returned must be closed with <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when the handle is no longer needed.
 * @param {Pointer<SecHandle>} phContext Handle of the context to query.
 * @returns {Pointer<Void>} Returned handle to the access token.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querysecuritycontexttoken
 * @since windows5.1.2600
 */
export QuerySecurityContextToken(phContext) {
    result := DllCall("SECUR32.dll\QuerySecurityContextToken", SecHandle.Ptr, phContext, "ptr*", &Token := 0, "HRESULT")
    return Token
}

/**
 * Deletes the local data structures associated with the specified security context initiated by a previous call to the InitializeSecurityContext (General) function or the AcceptSecurityContext (General) function.
 * @remarks
 * The <b>DeleteSecurityContext</b> function terminates a security context and frees associated resources.
 * 
 * The caller must call this function for a security context when that security context is no longer needed. This is true if the security context is partial, incomplete, rejected, or failed. After the security context is successfully deleted, further use of that security context is not permitted and the handle is no longer valid.
 * @param {Pointer<SecHandle>} phContext Handle of the security context to delete.
 * @returns {HRESULT} If the function succeeds or the handle has already been deleted, the return value is <b>SEC_E_OK</b>.
 * 
 * If the function fails, the return value can be the following error code.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-deletesecuritycontext
 * @since windows5.1.2600
 */
export DeleteSecurityContext(phContext) {
    result := DllCall("SECUR32.dll\DeleteSecurityContext", SecHandle.Ptr, phContext, "HRESULT")
    return result
}

/**
 * Provides a way to apply a control token to a security context.
 * @remarks
 * The <b>ApplyControlToken</b> function can modify the context based on this token. Among the tokens that this function can add to the client context are <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_alert_token">SCHANNEL_ALERT_TOKEN</a> and <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_session_token">SCHANNEL_SESSION_TOKEN</a>.
 * 
 * This function can be used to shut down the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> that underlies an existing Schannel connection. For information about how to do this, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/shutting-down-an-schannel-connection">Shutting Down an Schannel Connection</a>.
 * @param {Pointer<SecHandle>} phContext A handle to the context to which the token is applied.
 * 
 * For information about the way the Schannel SSP notifies the remote party of the shutdown, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-decryptmessage">DecryptMessage (Schannel)</a>. For additional information on the use of this function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/shutting-down-an-schannel-connection">Shutting Down an Schannel Connection</a>.
 * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that contains the input token to apply to the context.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes that can be returned.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This value is returned by Schannel kernel mode to indicate that this function is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-applycontroltoken
 * @since windows5.1.2600
 */
export ApplyControlToken(phContext, pInput) {
    result := DllCall("SECUR32.dll\ApplyControlToken", SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pInput, "HRESULT")
    return result
}

/**
 * Lets a transport application query the Credential Security Support Provider (CredSSP) security package for certain attributes of a security context. (Unicode)
 * @remarks
 * The structure pointed to by the <i>pBuffer</i> parameter varies depending on the attribute being queried.
 * 
 * While  the caller must allocate the <i>pBuffer</i> structure itself, the SSP allocates any memory required to hold variable-sized members of the <i>pBuffer</i> structure. Memory allocated by the SSP must be freed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines QueryContextAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phContext A  handle to the security context to be queried.
 * @param {SECPKG_ATTR} ulAttribute 
 * @returns {Void} A pointer to a structure that receives the attributes. The structure type depends on the value of the <i>ulAttribute</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycontextattributesw
 * @since windows6.0.6000
 */
export QueryContextAttributesW(phContext, ulAttribute) {
    result := DllCall("SECUR32.dll\QueryContextAttributesW", SecHandle.Ptr, phContext, SECPKG_ATTR, ulAttribute, "ptr", &pBuffer := 0, "HRESULT")
    return pBuffer
}

/**
 * The QueryContextAttributesExW (Unicode) function (sspi.h) enables a transport application to query a security package for certain attributes of a security context.
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines QueryContextAttributesEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phContext A handle to the security context to be queried.
 * @param {SECPKG_ATTR} ulAttribute 
 * @param {Integer} pBuffer A pointer to a structure that receives the attributes. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
 * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
 * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
 * 
 * If the function fails, the return value is a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycontextattributesexw
 * @since windows5.1.2600
 */
export QueryContextAttributesExW(phContext, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SspiCli.dll\QueryContextAttributesExW", SecHandle.Ptr, phContext, SECPKG_ATTR, ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Lets a transport application query the Credential Security Support Provider (CredSSP) security package for certain attributes of a security context. (ANSI)
 * @remarks
 * The structure pointed to by the <i>pBuffer</i> parameter varies depending on the attribute being queried.
 * 
 * While  the caller must allocate the <i>pBuffer</i> structure itself, the SSP allocates any memory required to hold variable-sized members of the <i>pBuffer</i> structure. Memory allocated by the SSP must be freed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines QueryContextAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phContext A  handle to the security context to be queried.
 * @param {SECPKG_ATTR} ulAttribute 
 * @returns {Void} A pointer to a structure that receives the attributes. The structure type depends on the value of the <i>ulAttribute</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycontextattributesa
 * @since windows6.0.6000
 */
export QueryContextAttributesA(phContext, ulAttribute) {
    result := DllCall("SECUR32.dll\QueryContextAttributesA", SecHandle.Ptr, phContext, SECPKG_ATTR, ulAttribute, "ptr", &pBuffer := 0, "HRESULT")
    return pBuffer
}

/**
 * The QueryContextAttributesExA (ANSI) function (sspi.h) enables a transport application to query a security package for certain attributes of a security context.
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines QueryContextAttributesEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phContext A handle to the security context to be queried.
 * @param {SECPKG_ATTR} ulAttribute 
 * @param {Integer} pBuffer A pointer to a structure that receives the attributes. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
 * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
 * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
 * 
 * If the function fails, the return value is a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycontextattributesexa
 * @since windows5.1.2600
 */
export QueryContextAttributesExA(phContext, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SspiCli.dll\QueryContextAttributesExA", SecHandle.Ptr, phContext, SECPKG_ATTR, ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Enables a transport application to set attributes of a security context for a security package. This function is supported only by the Schannel security package. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SetContextAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phContext A handle to the security context to be set.
 * @param {SECPKG_ATTR} ulAttribute 
 * @param {Integer} pBuffer A pointer to a structure that contains  values to set  the attributes to. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
 * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This value is returned by Schannel kernel mode to indicate that this function is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-setcontextattributesw
 * @since windows5.1.2600
 */
export SetContextAttributesW(phContext, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SECUR32.dll\SetContextAttributesW", SecHandle.Ptr, phContext, SECPKG_ATTR, ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Enables a transport application to set attributes of a security context for a security package. This function is supported only by the Schannel security package. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SetContextAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phContext A handle to the security context to be set.
 * @param {SECPKG_ATTR} ulAttribute 
 * @param {Integer} pBuffer A pointer to a structure that contains  values to set  the attributes to. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
 * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This value is returned by Schannel kernel mode to indicate that this function is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-setcontextattributesa
 * @since windows5.1.2600
 */
export SetContextAttributesA(phContext, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SECUR32.dll\SetContextAttributesA", SecHandle.Ptr, phContext, SECPKG_ATTR, ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Retrieves the attributes of a credential, such as the name associated with the credential. (Unicode)
 * @remarks
 * The <b>QueryCredentialsAttributes</b> function allows an application to determine several characteristics of a credential, including the name associated with the specified credentials.
 * 
 * Querying the SECPKG_ATTR_CIPHER_STRENGTHS attribute returns a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a> structure. The cipher strength in this structure is the same as the cipher strength in the 
 * <a href="../schannel/ns-schannel-sch_credentials.md">SCH_CREDENTIALS</a> structure used when a credential was created.
 * 
 * <div class="alert"><b>Note</b>  An application can find the system default cipher strength by querying this attribute with a default credential. A default credential is created by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> with a <b>NULL</b> <i>pAuthData</i> parameter.</div>
 * <div> </div>
 * Querying the SECPKG_ATTR_SUPPORTED_ALGS attribute returns a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a> structure. The algorithms in this structure are compatible with those indicated in the <a href="../schannel/ns-schannel-sch_credentials.md">SCH_CREDENTIALS</a> structure used when a credential was created.
 * 
 * Querying the SECPKG_ATTR_SUPPORTED_PROTOCOLS attribute returns a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a> structure that contains a bit array compatible with the <i>grbitEnabledProtocols</i> field of the <a href="../schannel/ns-schannel-sch_credentials.md">SCH_CREDENTIALS</a> structure.
 * 
 * The caller must allocate the structure pointed to by the <i>pBuffer</i> parameter. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> allocates the buffer for any pointer returned in the <i>pBuffer</i> structure. The caller can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function to free any pointers allocated by the security package.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines QueryCredentialsAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phCredential A handle of the credentials to be queried.
 * @param {Integer} ulAttribute Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to query. This parameter can be any of the following attributes. 
 * 
 * 
 * 
 * 
 * 					
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_CRED_ATTR_CERT</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the certificate thumbprint in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_cert">SecPkgCredentials_Cert</a>.
 * 
 * This attribute is only supported by Kerberos.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This attribute is not available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_CRED_ATTR_NAMES</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the name of a credential in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_namesa">SecPkgCredentials_Names</a>.
 * 
 * This attribute is not supported by Schannel in WOW64 mode.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_SUPPORTED_ALGS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the supported algorithms in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a>. All supported algorithms are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_CIPHER_STRENGTHS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the cipher strengths in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a>.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_SUPPORTED_PROTOCOLS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the supported algorithms in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a>. All supported protocols are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} pBuffer A pointer to a buffer that receives the requested attribute. The type of structure returned depends on the value of <i>ulAttribute</i>.
 * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
 * 
 * If the function fails, the return value may be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The memory that is available is not sufficient to complete the request.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycredentialsattributesw
 * @since windows5.1.2600
 */
export QueryCredentialsAttributesW(phCredential, ulAttribute, pBuffer) {
    pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\QueryCredentialsAttributesW", SecHandle.Ptr, phCredential, "uint", ulAttribute, pBufferMarshal, pBuffer, "HRESULT")
    return result
}

/**
 * Query the attributes of a security context.
 * @param {Pointer<SecHandle>} phCredential The credential to query.
 * @param {Integer} ulAttribute The attribute to query.
 * @param {Integer} pBuffer The buffer to receive the attributes.
 * @param {Integer} cbBuffer The length of the buffer.
 * @returns {HRESULT} Returns **TRUE** if the function succeeds, **FALSE** otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycredentialsattributesexw
 */
export QueryCredentialsAttributesExW(phCredential, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SspiCli.dll\QueryCredentialsAttributesExW", SecHandle.Ptr, phCredential, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Retrieves the attributes of a credential, such as the name associated with the credential. (ANSI)
 * @remarks
 * The <b>QueryCredentialsAttributes</b> function allows an application to determine several characteristics of a credential, including the name associated with the specified credentials.
 * 
 * Querying the SECPKG_ATTR_CIPHER_STRENGTHS attribute returns a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a> structure. The cipher strength in this structure is the same as the cipher strength in the 
 * <a href="../schannel/ns-schannel-sch_credentials.md">SCH_CREDENTIALS</a> structure used when a credential was created.
 * 
 * <div class="alert"><b>Note</b>  An application can find the system default cipher strength by querying this attribute with a default credential. A default credential is created by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> with a <b>NULL</b> <i>pAuthData</i> parameter.</div>
 * <div> </div>
 * Querying the SECPKG_ATTR_SUPPORTED_ALGS attribute returns a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a> structure. The algorithms in this structure are compatible with those indicated in the <a href="../schannel/ns-schannel-sch_credentials.md">SCH_CREDENTIALS</a> structure used when a credential was created.
 * 
 * Querying the SECPKG_ATTR_SUPPORTED_PROTOCOLS attribute returns a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a> structure that contains a bit array compatible with the <i>grbitEnabledProtocols</i> field of the <a href="../schannel/ns-schannel-sch_credentials.md">SCH_CREDENTIALS</a> structure.
 * 
 * The caller must allocate the structure pointed to by the <i>pBuffer</i> parameter. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> allocates the buffer for any pointer returned in the <i>pBuffer</i> structure. The caller can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function to free any pointers allocated by the security package.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines QueryCredentialsAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phCredential A handle of the credentials to be queried.
 * @param {Integer} ulAttribute Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to query. This parameter can be any of the following attributes. 
 * 
 * 
 * 
 * 
 * 					
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_CRED_ATTR_CERT</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the certificate thumbprint in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_cert">SecPkgCredentials_Cert</a>.
 * 
 * This attribute is only supported by Kerberos.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This attribute is not available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_CRED_ATTR_NAMES</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the name of a credential in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_namesa">SecPkgCredentials_Names</a>.
 * 
 * This attribute is not supported by Schannel in WOW64 mode.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_SUPPORTED_ALGS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the supported algorithms in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a>. All supported algorithms are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_CIPHER_STRENGTHS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the cipher strengths in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a>.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_SUPPORTED_PROTOCOLS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns the supported algorithms in a <i>pbuffer</i> of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a>. All supported protocols are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} pBuffer A pointer to a buffer that receives the requested attribute. The type of structure returned depends on the value of <i>ulAttribute</i>.
 * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
 * 
 * If the function fails, the return value may be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The memory that is available is not sufficient to complete the request.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycredentialsattributesa
 * @since windows5.1.2600
 */
export QueryCredentialsAttributesA(phCredential, ulAttribute, pBuffer) {
    pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\QueryCredentialsAttributesA", SecHandle.Ptr, phCredential, "uint", ulAttribute, pBufferMarshal, pBuffer, "HRESULT")
    return result
}

/**
 * Query the attributes of a security context.
 * @param {Pointer<SecHandle>} phCredential The credential to query.
 * @param {Integer} ulAttribute The attribute to query.
 * @param {Integer} pBuffer The buffer to receive the attributes.
 * @param {Integer} cbBuffer The length of the buffer.
 * @returns {HRESULT} Returns **TRUE** if the function succeeds, **FALSE** otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querycredentialsattributesexa
 */
export QueryCredentialsAttributesExA(phCredential, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SspiCli.dll\QueryCredentialsAttributesExA", SecHandle.Ptr, phCredential, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Sets the attributes of a credential, such as the name associated with the credential. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SetCredentialsAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phCredential A handle of the credentials to be set.
 * @param {Integer} ulAttribute Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to set. This parameter can be any of the following attributes.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_CRED_ATTR_NAMES</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the name of a credential in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_namesa">SecPkgCredentials_Names</a>.
 * 
 * This attribute is not supported by Schannel in WOW64 mode.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the Kerberos proxy setting in a  <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw">SecPkgCredentials_KdcProxySettings</a>.
 * 
 * This attribute is only supported by Kerberos.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_SUPPORTED_ALGS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the supported algorithms in a  <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a>. All supported algorithms are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_CIPHER_STRENGTHS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the cipher strengths in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a>.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_SUPPORTED_PROTOCOLS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the supported algorithms in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a>. All supported protocols are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} pBuffer A pointer to a buffer that contains the new attribute value. The type of structure returned depends on the value of <i>ulAttribute</i>.
 * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> buffer.
 * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
 * 
 * If the function fails, the return value may be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to complete the request.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-setcredentialsattributesw
 * @since windows5.1.2600
 */
export SetCredentialsAttributesW(phCredential, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SECUR32.dll\SetCredentialsAttributesW", SecHandle.Ptr, phCredential, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Sets the attributes of a credential, such as the name associated with the credential. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SetCredentialsAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phCredential A handle of the credentials to be set.
 * @param {Integer} ulAttribute Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> to set. This parameter can be any of the following attributes.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_CRED_ATTR_NAMES</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the name of a credential in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_namesa">SecPkgCredentials_Names</a>.
 * 
 * This attribute is not supported by Schannel in WOW64 mode.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the Kerberos proxy setting in a  <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw">SecPkgCredentials_KdcProxySettings</a>.
 * 
 * This attribute is only supported by Kerberos.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_SUPPORTED_ALGS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the supported algorithms in a  <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380102(v=vs.85)">SecPkgCred_SupportedAlgs</a>. All supported algorithms are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_CIPHER_STRENGTHS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the cipher strengths in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380101(v=vs.85)">SecPkgCred_CipherStrengths</a>.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SECPKG_ATTR_SUPPORTED_PROTOCOLS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the supported algorithms in a <i>pBuffer</i> parameter of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380103(v=vs.85)">SecPkgCred_SupportedProtocols</a>. All supported protocols are included, regardless of whether they are supported by the provided certificate or enabled on the local computer.
 * 
 * This attribute is supported only by Schannel.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} pBuffer A pointer to a buffer that contains the new attribute value. The type of structure returned depends on the value of <i>ulAttribute</i>.
 * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> buffer.
 * @returns {HRESULT} If the function succeeds, the return value is SEC_E_OK.
 * 
 * If the function fails, the return value may be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle passed to the function is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attribute</a> is not supported by Schannel. This return value will only be returned when the Schannel SSP is being used.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to complete the request.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-setcredentialsattributesa
 * @since windows5.1.2600
 */
export SetCredentialsAttributesA(phCredential, ulAttribute, pBuffer, cbBuffer) {
    result := DllCall("SECUR32.dll\SetCredentialsAttributesA", SecHandle.Ptr, phCredential, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "HRESULT")
    return result
}

/**
 * Enables callers of security package functions to free memory buffers allocated by the security package.
 * @remarks
 * Memory buffers are typically allocated by the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> functions.
 * 
 * The <b>FreeContextBuffer</b> function can free any memory allocated by a security package.
 * @param {Pointer<Void>} pvContextBuffer A pointer to memory to be freed.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-freecontextbuffer
 * @since windows5.1.2600
 */
export FreeContextBuffer(pvContextBuffer) {
    pvContextBufferMarshal := pvContextBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\FreeContextBuffer", pvContextBufferMarshal, pvContextBuffer, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} lpIpAddress 
 * @param {Integer} cchIpAddress 
 * @returns {Integer} 
 */
export SecAllocateAndSetIPAddress(lpIpAddress, cchIpAddress) {
    result := DllCall("SspiCli.dll\SecAllocateAndSetIPAddress", "ptr", lpIpAddress, "uint", cchIpAddress, "int*", &FreeCallContext := 0, "HRESULT")
    return FreeCallContext
}

/**
 * 
 * @param {Integer} lpIpAddress 
 * @param {Integer} cchIpAddress 
 * @param {PWSTR} TargetName 
 * @returns {Integer} 
 */
export SecAllocateAndSetCallTarget(lpIpAddress, cchIpAddress, TargetName) {
    TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

    result := DllCall("SspiCli.dll\SecAllocateAndSetCallTarget", "ptr", lpIpAddress, "uint", cchIpAddress, "ptr", TargetName, "int*", &FreeCallContext := 0, "HRESULT")
    return FreeCallContext
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export SecFreeCallContext() {
    DllCall("SspiCli.dll\SecFreeCallContext")
}

/**
 * Generates a cryptographic checksum of the message, and also includes sequencing information to prevent message loss or insertion.
 * @remarks
 * The <b>MakeSignature</b> function generates a signature that is based on the message and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function verifies the messages signed by the <b>MakeSignature</b> function.
 * 
 * If the transport application created the security context to support sequence detection and the caller provides a sequence number, the function includes this information in the signature. This protects against reply, insertion, and suppression of messages. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> incorporates the sequence number passed down from the transport application.
 * @param {Pointer<SecHandle>} phContext A handle to the security context to use to sign the message.
 * @param {Integer} fQOP <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Package</a>-specific flags that indicate the quality of protection. A security package can use this parameter to enable the selection of cryptographic algorithms.
 * 
 * When using the Digest SSP, this parameter must be set to zero.
 * @param {Pointer<SecBufferDesc>} pMessage A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. On input, the structure references one or more 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that contain the message to be signed. The function does not process buffers with the SECBUFFER_READONLY_WITH_CHECKSUM  attribute.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure also references a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure of type SECBUFFER_TOKEN that receives the signature.
 * 
 * When the Digest SSP is used as an HTTP authentication protocol, the buffers should be configured as follows.
 * 
 * <table>
 * <tr>
 * <th>Buffer #/buffer type</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="0"></a><dl>
 * <dt><b>0</b></dt>
 * <dt>SECBUFFER_TOKEN</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Empty.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="1"></a><dl>
 * <dt><b>1</b></dt>
 * <dt>SECBUFFER_PKG_PARAMS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Method.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="2"></a><dl>
 * <dt><b>2</b></dt>
 * <dt>SECBUFFER_PKG_PARAMS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * URL.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="3"></a><dl>
 * <dt><b>3</b></dt>
 * <dt>SECBUFFER_PKG_PARAMS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * HEntity. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/input-buffers-for-the-digest-challenge-response">Input Buffers for the Digest Challenge Response</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="4"></a><dl>
 * <dt><b>4</b></dt>
 * <dt>SECBUFFER_PADDING</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Empty. Receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a>.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * When the Digest SSP is used as an SASL mechanism, the buffers should be configured as follows.
 * 
 * <table>
 * <tr>
 * <th>Buffer #/buffer type</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="0"></a><dl>
 * <dt><b>0</b></dt>
 * <dt>SECBUFFER_TOKEN</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Empty. Receives the signature. This buffer must be large enough to hold the largest possible signature. Determine the size required by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function and specifying SECPKG_ATTR_SIZES. Check the returned 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcontext_sizes">SecPkgContext_Sizes</a> structure member <b>cbMaxSignature</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="1"></a><dl>
 * <dt><b>1</b></dt>
 * <dt>SECBUFFER_DATA</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Message to be signed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="2"></a><dl>
 * <dt><b>2</b></dt>
 * <dt>SECBUFFER_PADDING</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Empty.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} MessageSeqNo The sequence number that the transport application assigned to the message. If the transport application does not maintain sequence numbers, this parameter is zero.
 * 
 * When using the Digest SSP, this parameter must be set to zero. The Digest SSP manages sequence numbering internally.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_I_RENEGOTIATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote party requires a new handshake sequence or the application has just initiated a shutdown. Return to the negotiation loop and call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> again. An empty input buffer is passed in the first call.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context handle specified by <i>phContext</i> is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>pMessage</i> did not contain a valid SECBUFFER_TOKEN buffer or contained too few buffers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/n-gly">nonce</a> count is out of sequence.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> (<i>phContext</i>) must be revalidated.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The nonce count is not numeric.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_QOP_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The quality of protection negotiated between the client and server did not include <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">integrity</a> checking.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-makesignature
 * @since windows5.1.2600
 */
export MakeSignature(phContext, fQOP, pMessage, MessageSeqNo) {
    result := DllCall("SECUR32.dll\MakeSignature", SecHandle.Ptr, phContext, "uint", fQOP, SecBufferDesc.Ptr, pMessage, "uint", MessageSeqNo, "HRESULT")
    return result
}

/**
 * Verifies that a message signed by using the MakeSignature function was received in the correct sequence and has not been modified.
 * @remarks
 * <div class="alert"><b>Warning</b>  <p class="note">The <b>VerifySignature</b> function will fail if the message was signed using the <a href="https://docs.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha512">RsaSignPssSha512</a> algorithm on a different version of Windows. For example, a message that was signed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function on Windows 8 will cause the <b>VerifySignature</b> function on Windows 8.1 to fail.
 * 
 * </div>
 * <div> </div>
 * @param {Pointer<SecHandle>} phContext A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> to use for the message.
 * @param {Pointer<SecBufferDesc>} pMessage Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that references a set of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that contain the message and signature to verify. The signature is in a <b>SecBuffer</b> structure of type SECBUFFER_TOKEN.
 * @param {Integer} MessageSeqNo Specifies the sequence number expected by the transport application, if any. If the transport application does not maintain sequence numbers, this parameter is zero.
 * @returns {Integer} Pointer to a <b>ULONG</b> variable that receives package-specific flags that indicate the quality of protection.
 * 
 * Some security packages ignore this parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-verifysignature
 * @since windows5.1.2600
 */
export VerifySignature(phContext, pMessage, MessageSeqNo) {
    result := DllCall("SECUR32.dll\VerifySignature", SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pMessage, "uint", MessageSeqNo, "uint*", &pfQOP := 0, "HRESULT")
    return pfQOP
}

/**
 * Encrypts a message to provide privacy by using Digest.
 * @remarks
 * The <b>EncryptMessage (Digest)</b> function encrypts a message based on the message and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> from a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
 * 
 * If the transport application created the security context to support sequence detection and the caller provides a sequence number, the function includes this information with the encrypted message. Including this information protects against replay, insertion, and suppression of messages. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> incorporates the sequence number passed down from the transport application.
 * 
 * When you use the Digest SSP, get the size of the output buffer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">QueryContextAttributes (Digest)</a> function and specifying SECPKG_ATTR_SIZES. The function will return a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcontext_sizes">SecPkgContext_Sizes</a> structure. The size of the output buffer is the sum of the values in the <b>cbMaxSignature</b> and <b>cbBlockSize</b> members.
 * 
 * <div class="alert"><b>Note</b>  These buffers must be supplied in the order shown.</div>
 * <div> </div>
 * <table>
 * <tr>
 * <th>Buffer type</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * SECBUFFER_STREAM_HEADER
 * 
 * </td>
 * <td>
 * Used internally. No initialization required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SECBUFFER_DATA
 * 
 * </td>
 * <td>
 * Contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a> message to be encrypted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SECBUFFER_STREAM_TRAILER
 * 
 * </td>
 * <td>
 * Used internally. No initialization required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SECBUFFER_EMPTY
 * 
 * </td>
 * <td>
 * Used internally. No initialization required. Size can be zero.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For optimal performance, the <i>pMessage</i> structures should be allocated from contiguous memory.
 * 
 * <b>Windows XP:  </b>This function was also known as <b>SealMessage</b>. Applications should now use <b>EncryptMessage (Digest)</b>  only.
 * @param {Pointer<SecHandle>} phContext A handle to the security <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a> to be used to encrypt the message.
 * @param {Integer} fQOP Package-specific flags that indicate the quality of protection. A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> can use this parameter to enable the selection of cryptographic algorithms.
 * 
 * When using the Digest SSP, this parameter must be set to zero.
 * @param {Pointer<SecBufferDesc>} pMessage A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. On input, the structure references one or more 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that can be of type SECBUFFER_DATA. That buffer contains the message to be encrypted. The  message is encrypted in place, overwriting the original contents of the structure.
 * 
 * The function does not process buffers with the SECBUFFER_READONLY attribute.
 * 
 * The length of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that contains the message must be no greater than <b>cbMaximumMessage</b>, which is obtained from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">QueryContextAttributes (Digest)</a> (SECPKG_ATTR_STREAM_SIZES) function.
 * 
 * When using the Digest SSP,  there must be a second buffer of type SECBUFFER_PADDING or SEC_BUFFER_DATA to hold <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a> information. To get the size of the output buffer, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">QueryContextAttributes (Digest)</a> function and specify SECPKG_ATTR_SIZES. The function will return a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcontext_sizes">SecPkgContext_Sizes</a> structure. The size of the output buffer is the sum of the values in the <b>cbMaxSignature</b> and <b>cbBlockSize</b> members.
 * 
 * Applications that do not use SSL must supply a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> of type SECBUFFER_PADDING.
 * @param {Integer} MessageSeqNo The sequence number that the transport application assigned to the message. If the transport application does not maintain sequence numbers, this parameter must be zero.
 * 
 * When using the Digest SSP, this parameter must be set to zero. The Digest SSP manages sequence numbering internally.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_BUFFER_TOO_SMALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The output buffer is too small. For more information, see Remarks.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_CONTEXT_EXPIRED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The application is referencing a context that has already been closed. A properly written application should not receive this error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_CRYPTO_SYSTEM_INVALID</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cipher</a> chosen for the security context is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough memory available to complete the requested action.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A context handle that is not valid was specified in the <i>phContext</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No SECBUFFER_DATA type buffer was found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_QOP_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Neither confidentiality nor <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">integrity</a> are supported by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-encryptmessage
 * @since windows5.1.2600
 */
export EncryptMessage(phContext, fQOP, pMessage, MessageSeqNo) {
    result := DllCall("SECUR32.dll\EncryptMessage", SecHandle.Ptr, phContext, "uint", fQOP, SecBufferDesc.Ptr, pMessage, "uint", MessageSeqNo, Int32)
    return result
}

/**
 * Decrypts a message by using Digest.
 * @remarks
 * Sometimes an application will read data from the remote party, attempt to decrypt it by using <b>DecryptMessage (Digest)</b>, and discover that <b>DecryptMessage (Digest)</b> succeeded but the output buffers are empty. This is normal behavior, and applications must be able to deal with it.
 * 
 * <b>Windows XP:  </b>This function was also known as <b>UnsealMessage</b>. Applications should now use <b>DecryptMessage (Digest)</b> only.
 * @param {Pointer<SecHandle>} phContext A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> to be used to decrypt the message.
 * @param {Pointer<SecBufferDesc>} pMessage A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. On input, the structure references one or more 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures. At least one of these must be of type SECBUFFER_DATA. That buffer contains the encrypted message. The encrypted message is decrypted in place, overwriting the original contents of its buffer.
 * 
 * When using the Digest SSP, on input, the structure references one or more 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures. One of these must be of type SECBUFFER_DATA or SECBUFFER_STREAM, and it must contain the encrypted message.
 * @param {Integer} MessageSeqNo The sequence number expected by the transport application, if any. If the transport application does not maintain sequence numbers, this parameter must be set to zero.
 * 
 * When using the Digest SSP, this parameter must be set to zero. The Digest SSP manages sequence numbering internally.
 * @returns {Integer} A pointer to a variable of type <b>ULONG</b> that receives package-specific flags that indicate the quality of protection.
 * 						
 * 
 * This parameter can be one of the following flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SECQOP_WRAP_NO_ENCRYPT"></a><a id="secqop_wrap_no_encrypt"></a><dl>
 * <dt><b>SECQOP_WRAP_NO_ENCRYPT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The message was not encrypted, but a header or trailer was produced.
 * 
 * <div class="alert"><b>Note</b>  KERB_WRAP_NO_ENCRYPT has the same value and the same meaning.</div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SIGN_ONLY_"></a><a id="sign_only_"></a><dl>
 * <dt><b>SIGN_ONLY </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When using the Digest SSP, use this flag when the security context is set to verify the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a> only. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/quality-of-protection">Quality of Protection</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-decryptmessage
 * @since windows5.1.2600
 */
export DecryptMessage(phContext, pMessage, MessageSeqNo) {
    result := DllCall("SECUR32.dll\DecryptMessage", SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pMessage, "uint", MessageSeqNo, "uint*", &pfQOP := 0, Int32)
    return pfQOP
}

/**
 * Returns an array of SecPkgInfo structures that provide information about the security packages available to the client. (Unicode)
 * @remarks
 * The caller can use the <b>Name</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure to specify a security package in a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines EnumerateSecurityPackages as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Integer>} pcPackages A pointer to a <b>ULONG</b> variable that receives the number of packages available on the system. This includes packages that are already loaded and packages available on demand.
 * @param {Pointer<Pointer<SecPkgInfoW>>} ppPackageInfo A pointer to a variable that receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structures. Each structure contains information from the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP) that describes the capabilities of the security package available within that SSP.
 * 
 * When you have finished using the array, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * @returns {HRESULT} If the function succeeds, the function returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code. Possible values include, but are not limited to, those in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * <dt>0x80090300L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There was not sufficient memory to allocate one or more of the buffers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE </b></dt>
 * <dt>0x80090301L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid handle was specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_SECPKG_NOT_FOUND</b></dt>
 * <dt>0x80090305L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified package was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-enumeratesecuritypackagesw
 * @since windows5.1.2600
 */
export EnumerateSecurityPackagesW(pcPackages, ppPackageInfo) {
    pcPackagesMarshal := pcPackages is VarRef ? "uint*" : "ptr"
    ppPackageInfoMarshal := ppPackageInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("SECUR32.dll\EnumerateSecurityPackagesW", pcPackagesMarshal, pcPackages, ppPackageInfoMarshal, ppPackageInfo, "HRESULT")
    return result
}

/**
 * Returns an array of SecPkgInfo structures that provide information about the security packages available to the client. (ANSI)
 * @remarks
 * The caller can use the <b>Name</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure to specify a security package in a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle (General)</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines EnumerateSecurityPackages as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Integer>} pcPackages A pointer to a <b>ULONG</b> variable that receives the number of packages available on the system. This includes packages that are already loaded and packages available on demand.
 * @param {Pointer<Pointer<SecPkgInfoA>>} ppPackageInfo A pointer to a variable that receives a pointer to an array of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structures. Each structure contains information from the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP) that describes the capabilities of the security package available within that SSP.
 * 
 * When you have finished using the array, free the memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * @returns {HRESULT} If the function succeeds, the function returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code. Possible values include, but are not limited to, those in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * <dt>0x80090300L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There was not sufficient memory to allocate one or more of the buffers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE </b></dt>
 * <dt>0x80090301L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid handle was specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_SECPKG_NOT_FOUND</b></dt>
 * <dt>0x80090305L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified package was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-enumeratesecuritypackagesa
 * @since windows5.1.2600
 */
export EnumerateSecurityPackagesA(pcPackages, ppPackageInfo) {
    pcPackagesMarshal := pcPackages is VarRef ? "uint*" : "ptr"
    ppPackageInfoMarshal := ppPackageInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("SECUR32.dll\EnumerateSecurityPackagesA", pcPackagesMarshal, pcPackages, ppPackageInfoMarshal, ppPackageInfo, "HRESULT")
    return result
}

/**
 * Retrieves information about a specified security package. This information includes the bounds on sizes of authentication information, credentials, and contexts. (Unicode)
 * @remarks
 * The caller must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function to free the buffer returned in <i>ppPackageInfo</i>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines QuerySecurityPackageInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszPackageName 
 * @returns {Pointer<SecPkgInfoW>} Pointer to a variable that receives a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure containing information about the specified security package.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querysecuritypackageinfow
 * @since windows5.1.2600
 */
export QuerySecurityPackageInfoW(pszPackageName) {
    pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

    result := DllCall("SECUR32.dll\QuerySecurityPackageInfoW", "ptr", pszPackageName, "ptr*", &ppPackageInfo := 0, "HRESULT")
    return ppPackageInfo
}

/**
 * Retrieves information about a specified security package. This information includes the bounds on sizes of authentication information, credentials, and contexts. (ANSI)
 * @remarks
 * The caller must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function to free the buffer returned in <i>ppPackageInfo</i>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines QuerySecurityPackageInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszPackageName Pointer to a null-terminated string that specifies the name of the security package.
 * @returns {Pointer<SecPkgInfoA>} Pointer to a variable that receives a pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure containing information about the specified security package.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querysecuritypackageinfoa
 * @since windows5.1.2600
 */
export QuerySecurityPackageInfoA(pszPackageName) {
    pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

    result := DllCall("SECUR32.dll\QuerySecurityPackageInfoA", "ptr", pszPackageName, "ptr*", &ppPackageInfo := 0, "HRESULT")
    return ppPackageInfo
}

/**
 * The ExportSecurityContext function creates a serialized representation of a security context that can later be imported into a different process by calling ImportSecurityContext.
 * @param {Pointer<SecHandle>} phContext A handle of the security context to be exported.
 * @param {EXPORT_SECURITY_CONTEXT_FLAGS} fFlags 
 * @param {Pointer<SecBuffer>} pPackedContext A pointer to a buffer of type <b>SECBUFFER_EMPTY</b> that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> security context. When you have finished using this context,  free it by calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
 * @returns {Pointer<Void>} A pointer to receive the handle of the context's token.
 * 
 * When you have finished using the user token, release the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-exportsecuritycontext
 * @since windows5.1.2600
 */
export ExportSecurityContext(phContext, fFlags, pPackedContext) {
    result := DllCall("SECUR32.dll\ExportSecurityContext", SecHandle.Ptr, phContext, EXPORT_SECURITY_CONTEXT_FLAGS, fFlags, SecBuffer.Ptr, pPackedContext, "ptr*", &pToken := 0, "HRESULT")
    return pToken
}

/**
 * Imports a security context. The security context must have been exported to the process calling ImportSecurityContext by a previous call to ExportSecurityContext. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines ImportSecurityContext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszPackage A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> was exported.
 * @param {Pointer<SecBuffer>} pPackedContext A pointer to a buffer that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> security context created by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-exportsecuritycontext">ExportSecurityContext</a>.
 * @param {Pointer<Void>} Token A handle to the context's token.
 * @param {Pointer<SecHandle>} phContext A handle of the new security context created from <i>pPackedContext</i>. When you have finished using the context, delete it by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNKNOWN_CREDENTIALS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The credentials supplied to the package were not recognized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No credentials are available in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NOT_OWNER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller of the function does not have the necessary credentials.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough memory available to complete the requested action.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred that did not map to an SSPI error code.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-importsecuritycontextw
 * @since windows5.1.2600
 */
export ImportSecurityContextW(pszPackage, pPackedContext, Token, phContext) {
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    TokenMarshal := Token is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\ImportSecurityContextW", "ptr", pszPackage, SecBuffer.Ptr, pPackedContext, TokenMarshal, Token, SecHandle.Ptr, phContext, "HRESULT")
    return result
}

/**
 * Imports a security context. The security context must have been exported to the process calling ImportSecurityContext by a previous call to ExportSecurityContext. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines ImportSecurityContext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszPackage A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> was exported.
 * @param {Pointer<SecBuffer>} pPackedContext A pointer to a buffer that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> security context created by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-exportsecuritycontext">ExportSecurityContext</a>.
 * @param {Pointer<Void>} Token A handle to the context's token.
 * @param {Pointer<SecHandle>} phContext A handle of the new security context created from <i>pPackedContext</i>. When you have finished using the context, delete it by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
 * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
 * 
 * If the function fails, it returns one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNKNOWN_CREDENTIALS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The credentials supplied to the package were not recognized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NO_CREDENTIALS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No credentials are available in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_NOT_OWNER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller of the function does not have the necessary credentials.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough memory available to complete the requested action.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error occurred that did not map to an SSPI error code.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-importsecuritycontexta
 * @since windows5.1.2600
 */
export ImportSecurityContextA(pszPackage, pPackedContext, Token, phContext) {
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    TokenMarshal := Token is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\ImportSecurityContextA", "ptr", pszPackage, SecBuffer.Ptr, pPackedContext, TokenMarshal, Token, SecHandle.Ptr, phContext, "HRESULT")
    return result
}

/**
 * The InitSecurityInterface function returns a pointer to an SSPI dispatch table. This function enables clients to use SSPI without binding directly to an implementation of the interface. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines InitSecurityInterface as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * > QueryContextAttributesExA and QueryCredentialsAttributesExA are not initialized.
 * @returns {Pointer<SecurityFunctionTableA>} If the function succeeds, the return value is a pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-securityfunctiontablea">SecurityFunctionTable</a> structure.
 * 
 * If the function fails, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-initsecurityinterfacea
 * @since windows5.1.2600
 */
export InitSecurityInterfaceA() {
    result := DllCall("SECUR32.dll\InitSecurityInterfaceA", SecurityFunctionTableA.Ptr)
    return result
}

/**
 * The InitSecurityInterface function returns a pointer to an SSPI dispatch table. This function enables clients to use SSPI without binding directly to an implementation of the interface. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines InitSecurityInterface as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @returns {Pointer<SecurityFunctionTableW>} If the function succeeds, the return value is a pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-securityfunctiontablea">SecurityFunctionTable</a> structure.
 * 
 * If the function fails, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-initsecurityinterfacew
 * @since windows5.1.2600
 */
export InitSecurityInterfaceW() {
    result := DllCall("SECUR32.dll\InitSecurityInterfaceW", SecurityFunctionTableW.Ptr)
    return result
}

/**
 * Lists the packages that provide a SASL interface. (ANSI)
 * @remarks
 * The current list is maintained in the registry under <pre><b>SYSTEM</b>
 *    <b>CurrentControlSet</b>
 *       <b>Control</b>
 *          <b>SecurityProviders</b>
 *             <b>SaslProfiles</b></pre>
 * 
 * 
 * A terminating <b>NULL</b> character is appended to the end of the list.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines SaslEnumerateProfiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<PSTR>} ProfileList Pointer to a list of Unicode or ANSI strings that contain the names of the packages with SASL wrapper support.
 * @param {Pointer<Integer>} ProfileCount Pointer to an unsigned <b>LONG</b> value that contains the number of packages with SASL wrapper support.
 * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK.
 * 
 * If the function fails, the return value is a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslenumerateprofilesa
 * @since windowsserver2003
 */
export SaslEnumerateProfilesA(ProfileList, ProfileCount) {
    ProfileListMarshal := ProfileList is VarRef ? "ptr*" : "ptr"
    ProfileCountMarshal := ProfileCount is VarRef ? "uint*" : "ptr"

    result := DllCall("SECUR32.dll\SaslEnumerateProfilesA", ProfileListMarshal, ProfileList, ProfileCountMarshal, ProfileCount, "HRESULT")
    return result
}

/**
 * Lists the packages that provide a SASL interface. (Unicode)
 * @remarks
 * The current list is maintained in the registry under <pre><b>SYSTEM</b>
 *    <b>CurrentControlSet</b>
 *       <b>Control</b>
 *          <b>SecurityProviders</b>
 *             <b>SaslProfiles</b></pre>
 * 
 * 
 * A terminating <b>NULL</b> character is appended to the end of the list.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The sspi.h header defines SaslEnumerateProfiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<PWSTR>} ProfileList Pointer to a list of Unicode or ANSI strings that contain the names of the packages with SASL wrapper support.
 * @param {Pointer<Integer>} ProfileCount Pointer to an unsigned <b>LONG</b> value that contains the number of packages with SASL wrapper support.
 * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK.
 * 
 * If the function fails, the return value is a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslenumerateprofilesw
 * @since windowsserver2003
 */
export SaslEnumerateProfilesW(ProfileList, ProfileCount) {
    ProfileListMarshal := ProfileList is VarRef ? "ptr*" : "ptr"
    ProfileCountMarshal := ProfileCount is VarRef ? "uint*" : "ptr"

    result := DllCall("SECUR32.dll\SaslEnumerateProfilesW", ProfileListMarshal, ProfileList, ProfileCountMarshal, ProfileCount, "HRESULT")
    return result
}

/**
 * Returns the package information for the specified package. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SaslGetProfilePackage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} ProfileName Unicode or ANSI string that contains the name of the SASL package.
 * @returns {Pointer<SecPkgInfoA>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that returns the package information for the package specified by the <i>ProfileName</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslgetprofilepackagea
 * @since windowsserver2003
 */
export SaslGetProfilePackageA(ProfileName) {
    ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName

    result := DllCall("SECUR32.dll\SaslGetProfilePackageA", "ptr", ProfileName, "ptr*", &PackageInfo := 0, "HRESULT")
    return PackageInfo
}

/**
 * Returns the package information for the specified package. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SaslGetProfilePackage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} ProfileName Unicode or ANSI string that contains the name of the SASL package.
 * @returns {Pointer<SecPkgInfoW>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that returns the package information for the package specified by the <i>ProfileName</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslgetprofilepackagew
 * @since windowsserver2003
 */
export SaslGetProfilePackageW(ProfileName) {
    ProfileName := ProfileName is String ? StrPtr(ProfileName) : ProfileName

    result := DllCall("SECUR32.dll\SaslGetProfilePackageW", "ptr", ProfileName, "ptr*", &PackageInfo := 0, "HRESULT")
    return PackageInfo
}

/**
 * Returns the negotiate prefix that matches the specified SASL negotiation buffer. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SaslIdentifyPackage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecBufferDesc>} pInput Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that specifies the SASL negotiation buffer for which to find the negotiate prefix.
 * @returns {Pointer<SecPkgInfoA>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that returns the negotiate prefix for the negotiation buffer specified by the <i>pInput</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslidentifypackagea
 * @since windowsserver2003
 */
export SaslIdentifyPackageA(pInput) {
    result := DllCall("SECUR32.dll\SaslIdentifyPackageA", SecBufferDesc.Ptr, pInput, "ptr*", &PackageInfo := 0, "HRESULT")
    return PackageInfo
}

/**
 * Returns the negotiate prefix that matches the specified SASL negotiation buffer. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SaslIdentifyPackage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecBufferDesc>} pInput Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that specifies the SASL negotiation buffer for which to find the negotiate prefix.
 * @returns {Pointer<SecPkgInfoW>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that returns the negotiate prefix for the negotiation buffer specified by the <i>pInput</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslidentifypackagew
 * @since windowsserver2003
 */
export SaslIdentifyPackageW(pInput) {
    result := DllCall("SECUR32.dll\SaslIdentifyPackageW", SecBufferDesc.Ptr, pInput, "ptr*", &PackageInfo := 0, "HRESULT")
    return PackageInfo
}

/**
 * Wraps a standard call to the Security Support Provider Interface InitializeSecurityContext (General) function and processes SASL server cookies from the server. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SaslInitializeSecurityContext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phCredential A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> returned by the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> function used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. Using the <b>SaslInitializeSecurityContext</b> function requires at least OUTBOUND credentials.
 * @param {Pointer<SecHandle>} phContext Pointer to a <b>CtxtHandle</b> structure. On the first call to the <b>SaslInitializeSecurityContext</b> function, this pointer is <b>NULL</b>. On the second call, this parameter is a pointer to the handle to the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
 * @param {PWSTR} pszTargetName Pointer to a Unicode or ANSI string that indicates the target of the context.
 * @param {ISC_REQ_FLAGS} fContextReq Bit flags that indicate the requirements of the context.  Flags used for this parameter are prefixed with ISC_REQ_; for example:  ISC_REQ_DELEGATE. Specify  combinations of the following attributes flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_REPLAY_DETECT"></a><a id="isc_req_replay_detect"></a><dl>
 * <dt><b>ISC_REQ_REPLAY_DETECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Detect replayed packets.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_SEQUENCE_DETECT"></a><a id="isc_req_sequence_detect"></a><dl>
 * <dt><b>ISC_REQ_SEQUENCE_DETECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Detect messages received out of sequence.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_CONFIDENTIALITY"></a><a id="isc_req_confidentiality"></a><dl>
 * <dt><b>ISC_REQ_CONFIDENTIALITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Encrypt messages.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_STREAM"></a><a id="isc_req_stream"></a><dl>
 * <dt><b>ISC_REQ_STREAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Support a stream-oriented connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_EXTENDED_ERROR"></a><a id="isc_req_extended_error"></a><dl>
 * <dt><b>ISC_REQ_EXTENDED_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When errors occur, the remote party will be notified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_CONNECTION"></a><a id="isc_req_connection"></a><dl>
 * <dt><b>ISC_REQ_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security context will not handle formatting messages.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_MUTUAL_AUTH"></a><a id="isc_req_mutual_auth"></a><dl>
 * <dt><b>ISC_REQ_MUTUAL_AUTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Client and server will be authenticated.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_INTEGRITY"></a><a id="isc_req_integrity"></a><dl>
 * <dt><b>ISC_REQ_INTEGRITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sign messages and verify signatures.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For  further descriptions of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
 * @param {Integer} Reserved1 Reserved value; must be zero.
 * @param {Integer} TargetDataRep Indicates the data representation, such as byte ordering, on the target. Can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
 * @param {Pointer<SecBufferDesc>} pInput Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the buffers supplied as input to the package. The pointer must be <b>NULL</b> on the first call to the function. On subsequent calls to the function, it is a pointer to a buffer allocated with enough memory to hold the token returned by the remote peer. 
 * 
 * SASL requires a single buffer of type <b>SECBUFFER_TOKEN</b> that contains the challenge received from the server.
 * @param {Integer} Reserved2 Reserved value; must be zero.
 * @param {Pointer<SecHandle>} phNewContext Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to the <b>SaslInitializeSecurityContext</b> function, this pointer receives the new context handle. On the second call, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
 * @param {Pointer<SecBufferDesc>} pOutput Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives the output data. If a buffer was typed as SEC_READWRITE in the input, it will be there on output. The system will allocate a buffer for the security token if requested (through ISC_REQ_ALLOCATE_MEMORY) and fill in the address in the buffer descriptor for the security token.
 * @param {Pointer<Integer>} pfContextAttr Pointer to a variable to receive a set of bit flags that indicate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> of the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. 
 * 
 * Flags used for this parameter are prefixed with ISC_RET_, such as ISC_RET_DELEGATE. 
 * 
 * 
 *  For a list of valid values, see the <i>fContextReq</i> parameter.
 * 
 * Do not check for security-related attributes until the final function call returns successfully. Attribute flags not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
 * 
 * <div class="alert"><b>Note</b>  Particular context attributes can change during a negotiation with a remote peer.</div>
 * <div> </div>
 * @param {Pointer<Integer>} ptsExpiry Pointer to a <b>TimeStamp</b> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. This parameter is optional and <b>NULL</b> should be passed for short-lived clients.
 * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible failure return values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_ALGORITHM_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authz processing is not permitted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to complete the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No Token buffer is located in the <i>pOutput</i> parameter, or the message failed to decrypt.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslinitializesecuritycontextw
 * @since windowsserver2003
 */
export SaslInitializeSecurityContextW(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("SECUR32.dll\SaslInitializeSecurityContextW", SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, "ptr", pszTargetName, ISC_REQ_FLAGS, fContextReq, "uint", Reserved1, "uint", TargetDataRep, SecBufferDesc.Ptr, pInput, "uint", Reserved2, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, Int32)
    return result
}

/**
 * Wraps a standard call to the Security Support Provider Interface InitializeSecurityContext (General) function and processes SASL server cookies from the server. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SaslInitializeSecurityContext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SecHandle>} phCredential A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> returned by the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> function used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. Using the <b>SaslInitializeSecurityContext</b> function requires at least OUTBOUND credentials.
 * @param {Pointer<SecHandle>} phContext Pointer to a <b>CtxtHandle</b> structure. On the first call to the <b>SaslInitializeSecurityContext</b> function, this pointer is <b>NULL</b>. On the second call, this parameter is a pointer to the handle to the partially formed context returned in the <i>phNewContext</i> parameter by the first call.
 * @param {PSTR} pszTargetName Pointer to a Unicode or ANSI string that indicates the target of the context.
 * @param {ISC_REQ_FLAGS} fContextReq Bit flags that indicate the requirements of the context.  Flags used for this parameter are prefixed with ISC_REQ_; for example:  ISC_REQ_DELEGATE. Specify  combinations of the following attributes flags.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_REPLAY_DETECT"></a><a id="isc_req_replay_detect"></a><dl>
 * <dt><b>ISC_REQ_REPLAY_DETECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Detect replayed packets.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_SEQUENCE_DETECT"></a><a id="isc_req_sequence_detect"></a><dl>
 * <dt><b>ISC_REQ_SEQUENCE_DETECT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Detect messages received out of sequence.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_CONFIDENTIALITY"></a><a id="isc_req_confidentiality"></a><dl>
 * <dt><b>ISC_REQ_CONFIDENTIALITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Encrypt messages.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_STREAM"></a><a id="isc_req_stream"></a><dl>
 * <dt><b>ISC_REQ_STREAM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Support a stream-oriented connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_EXTENDED_ERROR"></a><a id="isc_req_extended_error"></a><dl>
 * <dt><b>ISC_REQ_EXTENDED_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * When errors occur, the remote party will be notified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_CONNECTION"></a><a id="isc_req_connection"></a><dl>
 * <dt><b>ISC_REQ_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security context will not handle formatting messages.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_MUTUAL_AUTH"></a><a id="isc_req_mutual_auth"></a><dl>
 * <dt><b>ISC_REQ_MUTUAL_AUTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Client and server will be authenticated.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ISC_REQ_INTEGRITY"></a><a id="isc_req_integrity"></a><dl>
 * <dt><b>ISC_REQ_INTEGRITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sign messages and verify signatures.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For  further descriptions of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>.
 * @param {Integer} Reserved1 Reserved value; must be zero.
 * @param {Integer} TargetDataRep Indicates the data representation, such as byte ordering, on the target. Can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
 * @param {Pointer<SecBufferDesc>} pInput Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the buffers supplied as input to the package. The pointer must be <b>NULL</b> on the first call to the function. On subsequent calls to the function, it is a pointer to a buffer allocated with enough memory to hold the token returned by the remote peer. 
 * 
 * SASL requires a single buffer of type <b>SECBUFFER_TOKEN</b> that contains the challenge received from the server.
 * @param {Integer} Reserved2 Reserved value; must be zero.
 * @param {Pointer<SecHandle>} phNewContext Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to the <b>SaslInitializeSecurityContext</b> function, this pointer receives the new context handle. On the second call, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
 * @param {Pointer<SecBufferDesc>} pOutput Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains pointers to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives the output data. If a buffer was typed as SEC_READWRITE in the input, it will be there on output. The system will allocate a buffer for the security token if requested (through ISC_REQ_ALLOCATE_MEMORY) and fill in the address in the buffer descriptor for the security token.
 * @param {Pointer<Integer>} pfContextAttr Pointer to a variable to receive a set of bit flags that indicate the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> of the established <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. 
 * 
 * Flags used for this parameter are prefixed with ISC_RET_, such as ISC_RET_DELEGATE. 
 * 
 * 
 *  For a list of valid values, see the <i>fContextReq</i> parameter.
 * 
 * Do not check for security-related attributes until the final function call returns successfully. Attribute flags not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
 * 
 * <div class="alert"><b>Note</b>  Particular context attributes can change during a negotiation with a remote peer.</div>
 * <div> </div>
 * @param {Pointer<Integer>} ptsExpiry Pointer to a <b>TimeStamp</b> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. This parameter is optional and <b>NULL</b> should be passed for short-lived clients.
 * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible failure return values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_ALGORITHM_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authz processing is not permitted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to complete the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No Token buffer is located in the <i>pOutput</i> parameter, or the message failed to decrypt.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslinitializesecuritycontexta
 * @since windowsserver2003
 */
export SaslInitializeSecurityContextA(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("SECUR32.dll\SaslInitializeSecurityContextA", SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, "ptr", pszTargetName, ISC_REQ_FLAGS, fContextReq, "uint", Reserved1, "uint", TargetDataRep, SecBufferDesc.Ptr, pInput, "uint", Reserved2, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, Int32)
    return result
}

/**
 * Wraps a standard call to the Security Support Provider Interface AcceptSecurityContext (General) function and includes creation of SASL server cookies.
 * @remarks
 * The final call of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function that returns SEC_E_OK is identified.  If a return token is produced, SASL processing is suspended for one round trip back to the client to allow the final  token to be processed. After the  exchange is completed, SEC_E_CONTINUE_NEEDED is returned to the application with an additional SASL server cookie encrypted with SSPI message functions. The initial server cookie indicates if INTEGRITY and PRIVACY are supported.  This initial server cookie is processed by the client, and the client returns a client cookie to indicate which services the client requests.  The client cookie is then decrypted by the server and the final services are determined for the following message traffic.
 * @param {Pointer<SecHandle>} phCredential A handle to the server's credentials. The server calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> function with the INBOUND flag set to retrieve this handle.
 * @param {Pointer<SecHandle>} phContext Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a>, this pointer is <b>NULL</b>. On subsequent calls, <i>phContext</i> is the handle to the partially formed context that was returned in the <i>phNewContext</i> parameter by the first call.
 * @param {Pointer<SecBufferDesc>} pInput Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure generated by a client call to 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> function that contains the input buffer descriptor.
 * 
 * SASL requires a single buffer of type <b>SECBUFFER_TOKEN</b>. The buffer is empty for the first call to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function and contains the challenge response received from the client for the second call.
 * @param {ASC_REQ_FLAGS} fContextReq Bit flags that specify the attributes required by the server to establish the context. Bit flags can be combined using bitwise-<b>OR</b> operations. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ASC_REQ_CONFIDENTIALITY"></a><a id="asc_req_confidentiality"></a><dl>
 * <dt><b>ASC_REQ_CONFIDENTIALITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Encrypt and decrypt messages. 
 * 
 * Valid with the Digest SSP for SASL only.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ASC_REQ_HTTP"></a><a id="asc_req_http"></a><dl>
 * <dt><b>ASC_REQ_HTTP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Use Digest for HTTP. Omit this flag to use Digest as an SASL mechanism.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} TargetDataRep Indicates the data representation, such as byte ordering, on the target. This value can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
 * @param {Pointer<SecHandle>} phNewContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-handles">CtxtHandle</a> structure. On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a>, this pointer receives the new context handle. On subsequent calls, <i>phNewContext</i> can be the same as the handle specified in the <i>phContext</i> parameter.
 * @param {Pointer<SecBufferDesc>} pOutput Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the output buffer descriptor. This buffer is sent to the client for input into additional calls to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a>. An output buffer may be generated even if the function returns SEC_E_OK. Any buffer generated must be sent back to the client application.
 * @param {Pointer<Integer>} pfContextAttr Pointer to a variable that receives a set of bit flags indicating the attributes of the established context. For a description of the various attributes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/context-requirements">Context Requirements</a>. Flags used for this parameter are prefixed with ASC_RET, such as ASC_RET_DELEGATE.
 * 
 * Do not check for security-related attributes until the final function call returns successfully. Attribute flags not related to security, such as the ASC_RET_ALLOCATED_MEMORY flag, can be checked before the final return.
 * @param {Pointer<Integer>} ptsExpiry Pointer to a <b>TimeStamp</b> structure that receives the expiration time of the context. It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return this value in local time. 
 * 
 * 
 * 
 * 
 * <div class="alert"><b>Note</b>  Until the last call of the authentication process, the expiration time for the context can be incorrect because more information will be provided during later stages of the negotiation. Therefore, <i>ptsTimeStamp</i> must be <b>NULL</b> until the last call to the function.</div>
 * <div> </div>
 * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible failure return values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_ALGORITHM_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Authz processing is not permitted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INSUFFICIENT_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not enough memory is available to complete the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No Token buffer is located in the <i>pOutput</i> parameter, or the message failed to decrypt.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslacceptsecuritycontext
 * @since windowsserver2003
 */
export SaslAcceptSecurityContext(phCredential, phContext, pInput, fContextReq, TargetDataRep, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
    pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
    ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

    result := DllCall("SECUR32.dll\SaslAcceptSecurityContext", SecHandle.Ptr, phCredential, SecHandle.Ptr, phContext, SecBufferDesc.Ptr, pInput, ASC_REQ_FLAGS, fContextReq, "uint", TargetDataRep, SecHandle.Ptr, phNewContext, SecBufferDesc.Ptr, pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, Int32)
    return result
}

/**
 * Sets the value of the specified property for the specified SASL context.
 * @param {Pointer<SecHandle>} ContextHandle Handle of the SASL context.
 * @param {Integer} Option Property to set for the SASL context. The following table lists the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SASL_OPTION_AUTHZ_PROCESSING"></a><a id="sasl_option_authz_processing"></a><dl>
 * <dt><b>SASL_OPTION_AUTHZ_PROCESSING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data type of buffer: <b>ULONG</b>
 * 
 * State of SASL processing of the Authz value provided by the SASL application. The valid states for processing are Sasl_AuthZIDForbidden  and Sasl_AuthZIDProcessed. The default value is Sasl_AuthZIDProcessed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SASL_OPTION_AUTHZ_STRING"></a><a id="sasl_option_authz_string"></a><dl>
 * <dt><b>SASL_OPTION_AUTHZ_STRING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data type of buffer: Array of binary characters
 * 
 * String of characters passed from the SASL client to the server.  If the AuthZ_Processing state is Sasl_AuthZIDForbidden, the  return value SEC_E_UNSUPPORTED_FUNCTION is returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SASL_OPTION_RECV_SIZE"></a><a id="sasl_option_recv_size"></a><dl>
 * <dt><b>SASL_OPTION_RECV_SIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data type of buffer: <b>ULONG</b>
 * 
 * Maximum size of the receiving buffer on the local computer. The default value is 0x0FFFF bytes.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SASL_OPTION_SEND_SIZE"></a><a id="sasl_option_send_size"></a><dl>
 * <dt><b>SASL_OPTION_SEND_SIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data type of buffer: <b>ULONG</b>
 * 
 * Maximum message data size that can be transmitted.  This value is  the maximum buffer size that can be transmitted to the remote SASL process minus the block size, the trailer size, and the maximum signature size. The default value is 0x0FFFF bytes.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} Value A pointer to a buffer that contains the value to set to  the requested property. For the data type of the buffer for each value of the <i>Option</i> parameter, see the <i>Option</i> parameter.
 * @param {Integer} _Size The size, in bytes, of the buffer specified by the <i>Value</i> parameter.
 * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible error return values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_BUFFER_TOO_SMALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by the <i>Value</i> parameter is not large enough to contain the data value of the property specified by the <i>Option</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SASL context handle specified by the <i>ContextHandle</i> parameter was not found in the SASL list.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option specified in the <i>Option</i> parameter is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslsetcontextoption
 * @since windowsserver2003
 */
export SaslSetContextOption(ContextHandle, Option, Value, _Size) {
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\SaslSetContextOption", SecHandle.Ptr, ContextHandle, "uint", Option, ValueMarshal, Value, "uint", _Size, "HRESULT")
    return result
}

/**
 * Retrieves the specified property of the specified SASL context.
 * @param {Pointer<SecHandle>} ContextHandle Handle of the SASL context.
 * @param {Integer} Option Property to return from the SASL context. The following table lists the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SASL_OPTION_AUTHZ_PROCESSING"></a><a id="sasl_option_authz_processing"></a><dl>
 * <dt><b>SASL_OPTION_AUTHZ_PROCESSING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data type of buffer: <b>ULONG</b>
 * 
 * State of SASL processing of the Authz value provided by the SASL application. The valid states for processing are Sasl_AuthZIDForbidden  and Sasl_AuthZIDProcessed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SASL_OPTION_AUTHZ_STRING"></a><a id="sasl_option_authz_string"></a><dl>
 * <dt><b>SASL_OPTION_AUTHZ_STRING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data type of buffer: Array of binary characters
 * 
 * String of characters passed from the SASL client to the server.  If the AuthZ_Processing state is Sasl_AuthZIDForbidden, the  return value SEC_E_UNSUPPORTED_FUNCTION is returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SASL_OPTION_RECV_SIZE"></a><a id="sasl_option_recv_size"></a><dl>
 * <dt><b>SASL_OPTION_RECV_SIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data type of buffer: <b>ULONG</b>
 * 
 * Maximum size of the receiving buffer on the local computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SASL_OPTION_SEND_SIZE"></a><a id="sasl_option_send_size"></a><dl>
 * <dt><b>SASL_OPTION_SEND_SIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Data type of buffer: <b>ULONG</b>
 * 
 * Maximum message data size that can be transmitted.  This value is  the maximum buffer size that can be transmitted to the remote SASL process minus the block size, the trailer size, and the maximum signature size.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} Value A pointer to a buffer that receives the requested property. For the data type of the buffer for each value of the <i>Option</i> parameter, see the <i>Option</i> parameter.
 * @param {Integer} _Size The size, in bytes, of the buffer specified by the <i>Value</i> parameter.
 * @param {Pointer<Integer>} Needed A pointer to an unsigned <b>LONG</b> value that returns the value if the buffer specified by the <i>Value</i> parameter is not large enough to contain the data value of the property specified by the <i>Option</i> parameter.
 * @returns {HRESULT} If the call is completed successfully, this function returns SEC_E_OK. The following table shows some possible error return values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_BUFFER_TOO_SMALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by the <i>Value</i> parameter is not large enough to contain the data value of the property specified by the <i>Option</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SASL context handle specified by the <i>ContextHandle</i> parameter was not found in the SASL list.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option specified in the <i>Option</i> parameter is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-saslgetcontextoption
 * @since windowsserver2003
 */
export SaslGetContextOption(ContextHandle, Option, Value, _Size, Needed) {
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"
    NeededMarshal := Needed is VarRef ? "uint*" : "ptr"

    result := DllCall("SECUR32.dll\SaslGetContextOption", SecHandle.Ptr, ContextHandle, "uint", Option, ValueMarshal, Value, "uint", _Size, NeededMarshal, Needed, "HRESULT")
    return result
}

/**
 * Allows a Security Support Provider Interface (SSPI) application to prompt a user to enter credentials. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SspiPromptForCredentials as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszTargetName The name of the target to use.
 * @param {Pointer<Void>} pUiInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure that contains information for customizing the appearance of the dialog box that this function displays. 
 *    
 * 
 * 
 * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is not <b>NULL</b>, this function displays a modal dialog box centered on the parent window.
 * 
 * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is <b>NULL</b>, the function displays a dialog box centered on the screen.
 * 
 * This function ignores the  <b>hbmBanner</b> member of the <b>CREDUI_INFO</b> structure.
 * @param {Integer} dwAuthError A Windows error code, defined in Winerror.h, that is displayed in the dialog box. If credentials previously collected were not valid, the caller uses this parameter to pass the error message from the API that collected the credentials (for example, Winlogon) to this function. The corresponding error message is formatted and displayed in the dialog box. Set the  value of this parameter to zero to display no error message.
 * @param {PWSTR} pszPackage The name of the security package to use.
 * @param {Pointer<Void>} pInputAuthIdentity An identity structure that is used to populate credential fields in the dialog box. To leave the credential fields empty, set the value of this parameter to <b>NULL</b>.
 * @param {Pointer<Pointer<Void>>} ppAuthIdentity An identity structure that represents the  credentials this function collects.
 * 
 * When you have finished using this structure, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
 * @param {Pointer<Integer>} pfSave A pointer to a Boolean value that, on input, specifies whether the <b>Save</b> check box is selected in the dialog box that this function displays. On output, the value of this parameter specifies whether the <b>Save</b> check box was selected when the user clicked the <b>Submit</b> button in the dialog box. Set this parameter to <b>NULL</b> to ignore the <b>Save</b> check box.
 * 
 * This parameter is ignored if the <b>CREDUIWIN_CHECKBOX</b> flag is not set in the <i>dwFlags</i> parameter.
 * @param {Integer} dwFlags Flags that determine the behavior of this function. The following flag is currently defined.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SSPIPFC_CREDPROV_DO_NOT_SAVE"></a><a id="sspipfc_credprov_do_not_save"></a><dl>
 * <dt><b>SSPIPFC_CREDPROV_DO_NOT_SAVE</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value of the <i>pfSave</i> parameter is ignored, and the credentials collected by this function are not saved.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>The value of the <i>pfSave</i> parameter is ignored, and the credentials collected by this function are not saved. Only the name of this possible value was SSPIPFC_SAVE_CRED_BY_CALLER. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SSPIPFC_NO_CHECKBOX"></a><a id="sspipfc_no_checkbox"></a><dl>
 * <dt><b>SSPIPFC_NO_CHECKBOX</b></dt>
 * <dt>0x00000002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value signifies that password and smart card credential providers  will not display the "Remember my credentials" checkbox to the user. The <b>SspiPromptForCredentials</b> function passes this flag value, SSPIPFC_NO_CHECKBOX,  in the <i>pvInAuthBuffer</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> function.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspipromptforcredentialsw
 * @since windows6.1
 */
export SspiPromptForCredentialsW(pszTargetName, pUiInfo, dwAuthError, pszPackage, pInputAuthIdentity, ppAuthIdentity, pfSave, dwFlags) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    pUiInfoMarshal := pUiInfo is VarRef ? "ptr" : "ptr"
    pInputAuthIdentityMarshal := pInputAuthIdentity is VarRef ? "ptr" : "ptr"
    ppAuthIdentityMarshal := ppAuthIdentity is VarRef ? "ptr*" : "ptr"
    pfSaveMarshal := pfSave is VarRef ? "int*" : "ptr"

    result := DllCall("credui.dll\SspiPromptForCredentialsW", "ptr", pszTargetName, pUiInfoMarshal, pUiInfo, "uint", dwAuthError, "ptr", pszPackage, pInputAuthIdentityMarshal, pInputAuthIdentity, ppAuthIdentityMarshal, ppAuthIdentity, pfSaveMarshal, pfSave, "uint", dwFlags, UInt32)
    return result
}

/**
 * Allows a Security Support Provider Interface (SSPI) application to prompt a user to enter credentials. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SspiPromptForCredentials as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszTargetName The name of the target to use.
 * @param {Pointer<Void>} pUiInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure that contains information for customizing the appearance of the dialog box that this function displays. 
 *    
 * 
 * 
 * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is not <b>NULL</b>, this function displays a modal dialog box centered on the parent window.
 * 
 * If the <b>hwndParent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credui_infoa">CREDUI_INFO</a> structure is <b>NULL</b>, the function displays a dialog box centered on the screen.
 * 
 * This function ignores the  <b>hbmBanner</b> member of the <b>CREDUI_INFO</b> structure.
 * @param {Integer} dwAuthError A Windows error code, defined in Winerror.h, that is displayed in the dialog box. If credentials previously collected were not valid, the caller uses this parameter to pass the error message from the API that collected the credentials (for example, Winlogon) to this function. The corresponding error message is formatted and displayed in the dialog box. Set the  value of this parameter to zero to display no error message.
 * @param {PSTR} pszPackage The name of the security package to use.
 * @param {Pointer<Void>} pInputAuthIdentity An identity structure that is used to populate credential fields in the dialog box. To leave the credential fields empty, set the value of this parameter to <b>NULL</b>.
 * @param {Pointer<Pointer<Void>>} ppAuthIdentity An identity structure that represents the  credentials this function collects.
 * 
 * When you have finished using this structure, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
 * @param {Pointer<Integer>} pfSave A pointer to a Boolean value that, on input, specifies whether the <b>Save</b> check box is selected in the dialog box that this function displays. On output, the value of this parameter specifies whether the <b>Save</b> check box was selected when the user clicked the <b>Submit</b> button in the dialog box. Set this parameter to <b>NULL</b> to ignore the <b>Save</b> check box.
 * 
 * This parameter is ignored if the <b>CREDUIWIN_CHECKBOX</b> flag is not set in the <i>dwFlags</i> parameter.
 * @param {Integer} dwFlags Flags that determine the behavior of this function. The following flag is currently defined.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SSPIPFC_CREDPROV_DO_NOT_SAVE"></a><a id="sspipfc_credprov_do_not_save"></a><dl>
 * <dt><b>SSPIPFC_CREDPROV_DO_NOT_SAVE</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value of the <i>pfSave</i> parameter is ignored, and the credentials collected by this function are not saved.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>The value of the <i>pfSave</i> parameter is ignored, and the credentials collected by this function are not saved. Only the name of this possible value was SSPIPFC_SAVE_CRED_BY_CALLER. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SSPIPFC_NO_CHECKBOX"></a><a id="sspipfc_no_checkbox"></a><dl>
 * <dt><b>SSPIPFC_NO_CHECKBOX</b></dt>
 * <dt>0x00000002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value signifies that password and smart card credential providers  will not display the "Remember my credentials" checkbox to the user. The <b>SspiPromptForCredentials</b> function passes this flag value, SSPIPFC_NO_CHECKBOX,  in the <i>pvInAuthBuffer</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> function.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspipromptforcredentialsa
 * @since windows6.1
 */
export SspiPromptForCredentialsA(pszTargetName, pUiInfo, dwAuthError, pszPackage, pInputAuthIdentity, ppAuthIdentity, pfSave, dwFlags) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName
    pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

    pUiInfoMarshal := pUiInfo is VarRef ? "ptr" : "ptr"
    pInputAuthIdentityMarshal := pInputAuthIdentity is VarRef ? "ptr" : "ptr"
    ppAuthIdentityMarshal := ppAuthIdentity is VarRef ? "ptr*" : "ptr"
    pfSaveMarshal := pfSave is VarRef ? "int*" : "ptr"

    result := DllCall("credui.dll\SspiPromptForCredentialsA", "ptr", pszTargetName, pUiInfoMarshal, pUiInfo, "uint", dwAuthError, "ptr", pszPackage, pInputAuthIdentityMarshal, pInputAuthIdentity, ppAuthIdentityMarshal, ppAuthIdentity, pfSaveMarshal, pfSave, "uint", dwFlags, UInt32)
    return result
}

/**
 * Generates a target name and credential type from the specified identity structure.
 * @param {Pointer<Void>} AuthIdentity The identity structure from which to generate the credentials to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credreada">CredRead</a> function.
 * @param {PWSTR} pszTargetName A target name that can be modified by this function depending on the value of the <i>AuthIdentity</i> parameter.
 * @param {Pointer<Integer>} pCredmanCredentialType The credential type to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credreada">CredRead</a> function.
 * @param {Pointer<PWSTR>} ppszCredmanTargetName The target name to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credreada">CredRead</a> function.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiprepareforcredread
 * @since windows6.1
 */
export SspiPrepareForCredRead(AuthIdentity, pszTargetName, pCredmanCredentialType, ppszCredmanTargetName) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"
    pCredmanCredentialTypeMarshal := pCredmanCredentialType is VarRef ? "uint*" : "ptr"
    ppszCredmanTargetNameMarshal := ppszCredmanTargetName is VarRef ? "ptr*" : "ptr"

    result := DllCall("SECUR32.dll\SspiPrepareForCredRead", AuthIdentityMarshal, AuthIdentity, "ptr", pszTargetName, pCredmanCredentialTypeMarshal, pCredmanCredentialType, ppszCredmanTargetNameMarshal, ppszCredmanTargetName, "HRESULT")
    return result
}

/**
 * Generates values from an identity structure that can be passed as the values of parameters in a call to the CredWrite function.
 * @param {Pointer<Void>} AuthIdentity The identity structure from which to generate the credentials to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
 * @param {PWSTR} pszTargetName A target name that can be modified by this function depending on the value of the <i>AuthIdentity</i> parameter.
 * 
 * Set the value of this parameter to <b>NULL</b> to use the user name as the target.
 * @param {Pointer<Integer>} pCredmanCredentialType The credential type to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
 * @param {Pointer<PWSTR>} ppszCredmanTargetName The target name to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
 * @param {Pointer<PWSTR>} ppszCredmanUserName The user name to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
 * @param {Pointer<Pointer<Integer>>} ppCredentialBlob The credential <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> to send to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credwritea">CredWrite</a> function.
 * @param {Pointer<Integer>} pCredentialBlobSize The size, in bytes, of the <i>ppCredentialBlob</i> buffer.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiprepareforcredwrite
 * @since windows6.1
 */
export SspiPrepareForCredWrite(AuthIdentity, pszTargetName, pCredmanCredentialType, ppszCredmanTargetName, ppszCredmanUserName, ppCredentialBlob, pCredentialBlobSize) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"
    pCredmanCredentialTypeMarshal := pCredmanCredentialType is VarRef ? "uint*" : "ptr"
    ppszCredmanTargetNameMarshal := ppszCredmanTargetName is VarRef ? "ptr*" : "ptr"
    ppszCredmanUserNameMarshal := ppszCredmanUserName is VarRef ? "ptr*" : "ptr"
    ppCredentialBlobMarshal := ppCredentialBlob is VarRef ? "ptr*" : "ptr"
    pCredentialBlobSizeMarshal := pCredentialBlobSize is VarRef ? "uint*" : "ptr"

    result := DllCall("SECUR32.dll\SspiPrepareForCredWrite", AuthIdentityMarshal, AuthIdentity, "ptr", pszTargetName, pCredmanCredentialTypeMarshal, pCredmanCredentialType, ppszCredmanTargetNameMarshal, ppszCredmanTargetName, ppszCredmanUserNameMarshal, ppszCredmanUserName, ppCredentialBlobMarshal, ppCredentialBlob, pCredentialBlobSizeMarshal, pCredentialBlobSize, "HRESULT")
    return result
}

/**
 * Encrypts the specified identity structure.
 * @param {Pointer<Void>} AuthData On input, the identity structure to encrypt. On output, the encrypted identity structure.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiencryptauthidentity
 * @since windows6.1
 */
export SspiEncryptAuthIdentity(AuthData) {
    AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\SspiEncryptAuthIdentity", AuthDataMarshal, AuthData, "HRESULT")
    return result
}

/**
 * Encrypts a SEC_WINNT_AUTH_IDENTITY_OPAQUE structure.
 * @remarks
 * To transfer credentials securely across processes, applications typically call this function with the SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON option,  followed by <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspimarshalauthidentity">SspiMarshalAuthIdentity</a> to obtain a marshaled authentication buffer and its length. 
 * For example, Online Identity Credential Provider does this to return the authentication buffer from their <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-getserialization">ICredentialProviderCredential::GetSerialization</a> method.
 * @param {Integer} Options 
 * @param {Pointer<Void>} AuthData On input, a pointer to an identity buffer to encrypt. This buffer must be prepared for encryption prior to the call to this function. This can be done by calling the function <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentity">SspiEncryptAuthIdentity</a>. On output, the encrypted identity buffer.
 * @returns {HRESULT} If the function succeeds, it returns SEC_E_OK.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiencryptauthidentityex
 * @since windows8.0
 */
export SspiEncryptAuthIdentityEx(Options, AuthData) {
    AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

    result := DllCall("SspiCli.dll\SspiEncryptAuthIdentityEx", "uint", Options, AuthDataMarshal, AuthData, "HRESULT")
    return result
}

/**
 * Decrypts the specified encrypted credential.
 * @param {Pointer<Void>} EncryptedAuthData On input, a  pointer to the encrypted credential structure to be decrypted. On output, a pointer to the decrypted credential structure.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspidecryptauthidentity
 * @since windows6.1
 */
export SspiDecryptAuthIdentity(EncryptedAuthData) {
    EncryptedAuthDataMarshal := EncryptedAuthData is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\SspiDecryptAuthIdentity", EncryptedAuthDataMarshal, EncryptedAuthData, "HRESULT")
    return result
}

/**
 * Decrypts a SEC_WINNT_AUTH_IDENTITY_OPAQUE structure.
 * @param {Integer} Options 
 * @param {Pointer<Void>} EncryptedAuthData This buffer is the output of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a> function.
 * @returns {HRESULT} If the function succeeds, it returns SEC_E_OK.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspidecryptauthidentityex
 * @since windows8.0
 */
export SspiDecryptAuthIdentityEx(Options, EncryptedAuthData) {
    EncryptedAuthDataMarshal := EncryptedAuthData is VarRef ? "ptr" : "ptr"

    result := DllCall("SspiCli.dll\SspiDecryptAuthIdentityEx", "uint", Options, EncryptedAuthDataMarshal, EncryptedAuthData, "HRESULT")
    return result
}

/**
 * Indicates whether the specified identity structure is encrypted.
 * @param {Pointer<Void>} EncryptedAuthData The identity structure to test.
 * @returns {BOOLEAN} <b>TRUE</b> if the identity structure specified by the <i>EncryptedAuthData</i> parameter is encrypted; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiisauthidentityencrypted
 * @since windows6.1
 */
export SspiIsAuthIdentityEncrypted(EncryptedAuthData) {
    EncryptedAuthDataMarshal := EncryptedAuthData is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\SspiIsAuthIdentityEncrypted", EncryptedAuthDataMarshal, EncryptedAuthData, BOOLEAN)
    return result
}

/**
 * Encodes the specified authentication identity as three strings.
 * @param {Pointer<Void>} pAuthIdentity The credential structure to be encoded.
 * @param {Pointer<PWSTR>} ppszUserName The marshaled user name of the identity specified by the <i>pAuthIdentity</i> parameter.
 * 
 * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
 * @param {Pointer<PWSTR>} ppszDomainName The marshaled domain name of the identity specified by the <i>pAuthIdentity</i> parameter.
 * 
 * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
 * @param {Pointer<PWSTR>} ppszPackedCredentialsString An encoded string version of a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure that specifies the users credentials.
 * 
 * When you have finished using this string, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code. Possible values include, but are not limited to, those in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
 * <dt>0xC000000D</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <b>SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED</b> flag is set in the identity  structure specified by the <i>pAuthIdentity</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiencodeauthidentityasstrings
 * @since windows6.1
 */
export SspiEncodeAuthIdentityAsStrings(pAuthIdentity, ppszUserName, ppszDomainName, ppszPackedCredentialsString) {
    pAuthIdentityMarshal := pAuthIdentity is VarRef ? "ptr" : "ptr"
    ppszUserNameMarshal := ppszUserName is VarRef ? "ptr*" : "ptr"
    ppszDomainNameMarshal := ppszDomainName is VarRef ? "ptr*" : "ptr"
    ppszPackedCredentialsStringMarshal := ppszPackedCredentialsString is VarRef ? "ptr*" : "ptr"

    result := DllCall("SECUR32.dll\SspiEncodeAuthIdentityAsStrings", pAuthIdentityMarshal, pAuthIdentity, ppszUserNameMarshal, ppszUserName, ppszDomainNameMarshal, ppszDomainName, ppszPackedCredentialsStringMarshal, ppszPackedCredentialsString, "HRESULT")
    return result
}

/**
 * Indicates whether the specified identity structure is valid.
 * @param {Pointer<Void>} AuthData The identity structure to test.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>, which indicates that the identity structure specified by the <i>AuthData</i> parameter is valid.
 * 
 * If the function fails, it returns a nonzero error code that indicates that the identity structure specified by the <i>AuthData</i> parameter is not valid.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspivalidateauthidentity
 * @since windows6.1
 */
export SspiValidateAuthIdentity(AuthData) {
    AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\SspiValidateAuthIdentity", AuthDataMarshal, AuthData, "HRESULT")
    return result
}

/**
 * Creates a copy of the specified opaque credential structure.
 * @param {Pointer<Void>} AuthData The credential structure to be copied.
 * @returns {Pointer<Void>} The structure that receives the copy of the structure specified by the <i>AuthData</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspicopyauthidentity
 * @since windows6.1
 */
export SspiCopyAuthIdentity(AuthData) {
    AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\SspiCopyAuthIdentity", AuthDataMarshal, AuthData, "ptr*", &AuthDataCopy := 0, "HRESULT")
    return AuthDataCopy
}

/**
 * Frees the memory allocated for the specified identity structure.
 * @param {Pointer<Void>} AuthData The identity structure to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspifreeauthidentity
 * @since windows6.1
 */
export SspiFreeAuthIdentity(AuthData) {
    AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

    DllCall("SECUR32.dll\SspiFreeAuthIdentity", AuthDataMarshal, AuthData)
}

/**
 * Fills the block of memory associated with the specified identity structure with zeros.
 * @param {Pointer<Void>} AuthData The identity structure to fill with zeros.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspizeroauthidentity
 * @since windows6.1
 */
export SspiZeroAuthIdentity(AuthData) {
    AuthDataMarshal := AuthData is VarRef ? "ptr" : "ptr"

    DllCall("SECUR32.dll\SspiZeroAuthIdentity", AuthDataMarshal, AuthData)
}

/**
 * Frees the memory associated with the specified buffer.
 * @param {Pointer<Void>} DataBuffer The buffer to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspilocalfree
 * @since windows6.1
 */
export SspiLocalFree(DataBuffer) {
    DataBufferMarshal := DataBuffer is VarRef ? "ptr" : "ptr"

    DllCall("SECUR32.dll\SspiLocalFree", DataBufferMarshal, DataBuffer)
}

/**
 * Encodes a set of three credential strings as an authentication identity structure.
 * @param {PWSTR} pszUserName The user name associated with the identity to encode.
 * @param {PWSTR} pszDomainName The domain name associated with the identity to encode.
 * @param {PWSTR} pszPackedCredentialsString An encoded string version of a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure that specifies the user's credentials.
 * @returns {Pointer<Void>} A pointer to the encoded identity structure.
 * 
 * When you have finished using this structure, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspifreeauthidentity">SspiFreeAuthIdentity</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiencodestringsasauthidentity
 * @since windows6.1
 */
export SspiEncodeStringsAsAuthIdentity(pszUserName, pszDomainName, pszPackedCredentialsString) {
    pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
    pszDomainName := pszDomainName is String ? StrPtr(pszDomainName) : pszDomainName
    pszPackedCredentialsString := pszPackedCredentialsString is String ? StrPtr(pszPackedCredentialsString) : pszPackedCredentialsString

    result := DllCall("SECUR32.dll\SspiEncodeStringsAsAuthIdentity", "ptr", pszUserName, "ptr", pszDomainName, "ptr", pszPackedCredentialsString, "ptr*", &ppAuthIdentity := 0, "HRESULT")
    return ppAuthIdentity
}

/**
 * Compares the two specified credentials.
 * @param {Pointer<Void>} AuthIdentity1 A pointer to an opaque structure that specifies the first credential to compare.
 * @param {Pointer<Void>} AuthIdentity2 A pointer to an opaque structure that specifies the second credential to compare.
 * @param {Pointer<BOOLEAN>} SameSuppliedUser <b>TRUE</b> if the user account specified by the <i>AuthIdentity1</i> parameter is the same as the user account specified by the <i>AuthIdentity2</i> parameter; otherwise, <b>FALSE</b>.
 * @param {Pointer<BOOLEAN>} SameSuppliedIdentity <b>TRUE</b> if the identity specified by the <i>AuthIdentity1</i> parameter is the same as the identity specified by the <i>AuthIdentity2</i> parameter; otherwise, <b>FALSE</b>.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspicompareauthidentities
 * @since windows6.1
 */
export SspiCompareAuthIdentities(AuthIdentity1, AuthIdentity2, SameSuppliedUser, SameSuppliedIdentity) {
    AuthIdentity1Marshal := AuthIdentity1 is VarRef ? "ptr" : "ptr"
    AuthIdentity2Marshal := AuthIdentity2 is VarRef ? "ptr" : "ptr"
    SameSuppliedUserMarshal := SameSuppliedUser is VarRef ? "char*" : "ptr"
    SameSuppliedIdentityMarshal := SameSuppliedIdentity is VarRef ? "char*" : "ptr"

    result := DllCall("SECUR32.dll\SspiCompareAuthIdentities", AuthIdentity1Marshal, AuthIdentity1, AuthIdentity2Marshal, AuthIdentity2, SameSuppliedUserMarshal, SameSuppliedUser, SameSuppliedIdentityMarshal, SameSuppliedIdentity, "HRESULT")
    return result
}

/**
 * Serializes the specified identity structure into a byte array.
 * @param {Pointer<Void>} AuthIdentity The identity structure to serialize.
 * @param {Pointer<Integer>} AuthIdentityLength The length, in bytes, of the <i>AuthIdentityByteArray</i> array.
 * @param {Pointer<Pointer<Integer>>} AuthIdentityByteArray A pointer to an array of byte values that represents the identity specified by the <i>AuthIdentity</i> parameter.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspimarshalauthidentity
 * @since windows6.1
 */
export SspiMarshalAuthIdentity(AuthIdentity, AuthIdentityLength, AuthIdentityByteArray) {
    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"
    AuthIdentityLengthMarshal := AuthIdentityLength is VarRef ? "uint*" : "ptr"
    AuthIdentityByteArrayMarshal := AuthIdentityByteArray is VarRef ? "ptr*" : "ptr"

    result := DllCall("SECUR32.dll\SspiMarshalAuthIdentity", AuthIdentityMarshal, AuthIdentity, AuthIdentityLengthMarshal, AuthIdentityLength, AuthIdentityByteArrayMarshal, AuthIdentityByteArray, "HRESULT")
    return result
}

/**
 * Deserializes the specified array of byte values into an identity structure.
 * @param {Integer} AuthIdentityLength The size, in bytes, of the <i>AuthIdentityByteArray</i> array.
 * @param {Integer} AuthIdentityByteArray The array of byte values to deserialize.
 * @returns {Pointer<Void>} The deserialized identity structure.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiunmarshalauthidentity
 * @since windows6.1
 */
export SspiUnmarshalAuthIdentity(AuthIdentityLength, AuthIdentityByteArray) {
    result := DllCall("SECUR32.dll\SspiUnmarshalAuthIdentity", "uint", AuthIdentityLength, "ptr", AuthIdentityByteArray, "ptr*", &ppAuthIdentity := 0, "HRESULT")
    return ppAuthIdentity
}

/**
 * Indicates whether an error returned after a call to either the InitializeSecurityContext or the AcceptSecurityContext function requires an additional call to the SspiPromptForCredentials function.
 * @param {Integer} ErrorOrNtStatus The error to test.
 * @returns {BOOLEAN} <b>TRUE</b> if the error specified by the <i>ErrorOrNtStatus</i> parameter indicates that an additional call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspipromptforcredentialsa">SspiPromptForCredentials</a> is necessary; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiispromptingneeded
 * @since windows6.1
 */
export SspiIsPromptingNeeded(ErrorOrNtStatus) {
    result := DllCall("credui.dll\SspiIsPromptingNeeded", "uint", ErrorOrNtStatus, BOOLEAN)
    return result
}

/**
 * Gets the host name associated with the specified target.
 * @param {PWSTR} pszTargetName The target for which to get the host name.
 * @returns {PWSTR} The name of the host associated with the target specified by the <i>pszTargetName</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspigettargethostname
 * @since windows6.1
 */
export SspiGetTargetHostName(pszTargetName) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

    result := DllCall("SECUR32.dll\SspiGetTargetHostName", "ptr", pszTargetName, PWSTR.Ptr, &pszHostName := 0, "HRESULT")
    return pszHostName
}

/**
 * Creates a new identity structure that is a copy of the specified identity structure modified to exclude the specified security support provider (SSP).
 * @param {Pointer<Void>} AuthIdentity The identity structure to modify.
 * @param {PWSTR} pszPackageName The SSP to exclude.
 * @returns {Pointer<Void>} The modified identity structure.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiexcludepackage
 * @since windows6.1
 */
export SspiExcludePackage(AuthIdentity, pszPackageName) {
    pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

    AuthIdentityMarshal := AuthIdentity is VarRef ? "ptr" : "ptr"

    result := DllCall("SECUR32.dll\SspiExcludePackage", AuthIdentityMarshal, AuthIdentity, "ptr", pszPackageName, "ptr*", &ppNewAuthIdentity := 0, "HRESULT")
    return ppNewAuthIdentity
}

/**
 * 
 * @param {Pointer<SecPkgContext_Bindings>} pBindings 
 * @param {Integer} flags 
 * @returns {HRESULT} 
 */
export SspiSetChannelBindingFlags(pBindings, flags) {
    result := DllCall("SspiCli.dll\SspiSetChannelBindingFlags", SecPkgContext_Bindings.Ptr, pBindings, "uint", flags, "HRESULT")
    return result
}

/**
 * Adds a security support provider to the list of providers supported by Microsoft Negotiate. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines AddSecurityPackage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszPackageName The name of the package to add.
 * @param {Pointer<SECURITY_PACKAGE_OPTIONS>} pOptions A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-security_package_options">SECURITY_PACKAGE_OPTIONS</a> structure that specifies additional information about the security package.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-addsecuritypackagea
 * @since windows6.1
 */
export AddSecurityPackageA(pszPackageName, pOptions) {
    pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

    result := DllCall("SECUR32.dll\AddSecurityPackageA", "ptr", pszPackageName, SECURITY_PACKAGE_OPTIONS.Ptr, pOptions, "HRESULT")
    return result
}

/**
 * Adds a security support provider to the list of providers supported by Microsoft Negotiate. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines AddSecurityPackage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszPackageName The name of the package to add.
 * @param {Pointer<SECURITY_PACKAGE_OPTIONS>} pOptions A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-security_package_options">SECURITY_PACKAGE_OPTIONS</a> structure that specifies additional information about the security package.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-addsecuritypackagew
 * @since windows6.1
 */
export AddSecurityPackageW(pszPackageName, pOptions) {
    pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

    result := DllCall("SECUR32.dll\AddSecurityPackageW", "ptr", pszPackageName, SECURITY_PACKAGE_OPTIONS.Ptr, pOptions, "HRESULT")
    return result
}

/**
 * Deletes a security support provider from the list of providers supported by Microsoft Negotiate. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines DeleteSecurityPackage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszPackageName The name of the security provider to delete.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-deletesecuritypackagea
 * @since windows6.1
 */
export DeleteSecurityPackageA(pszPackageName) {
    pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

    result := DllCall("SECUR32.dll\DeleteSecurityPackageA", "ptr", pszPackageName, "HRESULT")
    return result
}

/**
 * Deletes a security support provider from the list of providers supported by Microsoft Negotiate. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines DeleteSecurityPackage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszPackageName The name of the security provider to delete.
 * @returns {HRESULT} If the function succeeds, it returns <b>SEC_E_OK</b>.
 * 
 * If the function fails, it returns a nonzero error code.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-deletesecuritypackagew
 * @since windows6.1
 */
export DeleteSecurityPackageW(pszPackageName) {
    pszPackageName := pszPackageName is String ? StrPtr(pszPackageName) : pszPackageName

    result := DllCall("SECUR32.dll\DeleteSecurityPackageW", "ptr", pszPackageName, "HRESULT")
    return result
}

/**
 * Serializes the specified target into an array of byte values.
 * @param {Pointer<CREDENTIAL_TARGET_INFORMATIONW>} InTargetInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version of the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credential_target_informationa">CREDENTIAL_TARGET_INFORMATION</a> structure that specifies the target to serialize.
 * @param {Pointer<Pointer<Integer>>} _Buffer The serialized array of byte values that represents the target specified by the <i>InTargetInfo</i> parameter.
 * @param {Pointer<Integer>} BufferSize The size, in bytes, of the <i>Buffer</i> array.
 * @returns {NTSTATUS} If the function succeeds, it returns <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, it returns an error code that indicates the reason it failed.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nf-ntsecpkg-credmarshaltargetinfo
 * @since windows6.0.6000
 */
export CredMarshalTargetInfo(InTargetInfo, _Buffer, BufferSize) {
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"
    BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("SECUR32.dll\CredMarshalTargetInfo", CREDENTIAL_TARGET_INFORMATIONW.Ptr, InTargetInfo, _BufferMarshal, _Buffer, BufferSizeMarshal, BufferSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Pointer<CREDENTIAL_TARGET_INFORMATIONW>>} RetTargetInfo 
 * @param {Pointer<Integer>} RetActualSize 
 * @returns {NTSTATUS} 
 */
export CredUnmarshalTargetInfo(_Buffer, BufferSize, RetTargetInfo, RetActualSize) {
    RetTargetInfoMarshal := RetTargetInfo is VarRef ? "ptr*" : "ptr"
    RetActualSizeMarshal := RetActualSize is VarRef ? "uint*" : "ptr"

    result := DllCall("SECUR32.dll\CredUnmarshalTargetInfo", "ptr", _Buffer, "uint", BufferSize, RetTargetInfoMarshal, RetTargetInfo, RetActualSizeMarshal, RetActualSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes the specified string from the Schannel cache. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The schannel.h header defines SslEmptyCache as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszTargetName A pointer to a null-terminated string that specifies the entry to remove from the cache. If the value of this parameter is <b>NULL</b>, all entries are removed from the cache.
 * @param {Integer} dwFlags This parameter is not used.
 * @returns {BOOL} Returns nonzero if the specified entries are removed from the Schannel cache or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/nf-schannel-sslemptycachea
 * @since windows5.1.2600
 */
export SslEmptyCacheA(pszTargetName, dwFlags) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

    result := DllCall("SCHANNEL.dll\SslEmptyCacheA", "ptr", pszTargetName, "uint", dwFlags, BOOL)
    return result
}

/**
 * Removes the specified string from the Schannel cache. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The schannel.h header defines SslEmptyCache as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszTargetName A pointer to a null-terminated string that specifies the entry to remove from the cache. If the value of this parameter is <b>NULL</b>, all entries are removed from the cache.
 * @param {Integer} dwFlags This parameter is not used.
 * @returns {BOOL} Returns nonzero if the specified entries are removed from the Schannel cache or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/nf-schannel-sslemptycachew
 * @since windows5.1.2600
 */
export SslEmptyCacheW(pszTargetName, dwFlags) {
    pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

    result := DllCall("SCHANNEL.dll\SslEmptyCacheW", "ptr", pszTargetName, "uint", dwFlags, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} pRandomData 
 * @param {Integer} cRandomData 
 * @returns {String} Nothing - always returns an empty string
 */
export SslGenerateRandomBits(pRandomData, cRandomData) {
    pRandomDataMarshal := pRandomData is VarRef ? "char*" : "ptr"

    DllCall("SCHANNEL.dll\SslGenerateRandomBits", pRandomDataMarshal, pRandomData, "int", cRandomData)
}

/**
 * Returns an X509Certificate structure with the information contained in the specified certificate BLOB.
 * @param {Pointer<Integer>} pbCertificate The certificate BLOB from which to create the new <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-x509certificate">X509Certificate</a> structure.
 * @param {Integer} cbCertificate The length, in bytes, of the BLOB contained in the <i>pbCertificate</i> parameter.
 * @param {Integer} dwFlags Set this value to <b>CF_CERT_FROM_FILE</b> to specify that the certificate BLOB contained in the <i>pbCertificate</i> parameter is from a file.
 * @param {Pointer<Pointer<X509Certificate>>} ppCertificate On return, receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-x509certificate">X509Certificate</a> structure that this function creates.
 * 
 * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-x509certificate">X509Certificate</a> structure, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/schannel/nf-schannel-sslfreecertificate">SslFreeCertificate</a>.
 * @returns {BOOL} Returns nonzero if this function successfully created an <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-x509certificate">X509Certificate</a> structure or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/nf-schannel-sslcrackcertificate
 * @since windows5.1.2600
 */
export SslCrackCertificate(pbCertificate, cbCertificate, dwFlags, ppCertificate) {
    pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"
    ppCertificateMarshal := ppCertificate is VarRef ? "ptr*" : "ptr"

    result := DllCall("SCHANNEL.dll\SslCrackCertificate", pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "uint", dwFlags, ppCertificateMarshal, ppCertificate, BOOL)
    return result
}

/**
 * Frees a certificate that was allocated by a previous call to the SslCrackCertificate function.
 * @param {Pointer<X509Certificate>} pCertificate The certificate to free.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/schannel/nf-schannel-sslfreecertificate
 * @since windows5.1.2600
 */
export SslFreeCertificate(pCertificate) {
    DllCall("SCHANNEL.dll\SslFreeCertificate", X509Certificate.Ptr, pCertificate)
}

/**
 * 
 * @param {Integer} Reserved 
 * @returns {Integer} 
 */
export SslGetMaximumKeySize(Reserved) {
    result := DllCall("SCHANNEL.dll\SslGetMaximumKeySize", "uint", Reserved, UInt32)
    return result
}

/**
 * Gets the identity of the server.
 * @param {Integer} ClientHello The message from the client.
 * @param {Integer} ClientHelloSize The size of the client message.
 * @param {Pointer<Pointer<Integer>>} ServerIdentity The pointer inside the message where the server name starts.
 * @param {Pointer<Integer>} ServerIdentitySize The length of the server name.
 * @param {Integer} Flags This parameter is reserved and must be zero.
 * @returns {HRESULT} The status of the call to the function.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function was successful.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters <i>ClientHello</i>, <i>ServerIdentity</i>, or <i>ServerIdentitySize</i> is <b>NULL</b>. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SEC_E_INCOMPLETE_MESSAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The  <i>ServerIdentitySize</i> parameter is smaller than the <i>ClientHelloSize</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/schannel/nf-schannel-sslgetserveridentity
 * @since windows8.0
 */
export SslGetServerIdentity(ClientHello, ClientHelloSize, ServerIdentity, ServerIdentitySize, Flags) {
    ServerIdentityMarshal := ServerIdentity is VarRef ? "ptr*" : "ptr"
    ServerIdentitySizeMarshal := ServerIdentitySize is VarRef ? "uint*" : "ptr"

    result := DllCall("SCHANNEL.dll\SslGetServerIdentity", "ptr", ClientHello, "uint", ClientHelloSize, ServerIdentityMarshal, ServerIdentity, ServerIdentitySizeMarshal, ServerIdentitySize, "uint", Flags, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Integer>} clientHello 
 * @param {Integer} clientHelloByteSize 
 * @param {Pointer<SCH_EXTENSION_DATA>} genericExtensions 
 * @param {Integer} genericExtensionsCount 
 * @param {SchGetExtensionsOptions} flags 
 * @returns {Integer} 
 */
export SslGetExtensions(clientHello, clientHelloByteSize, genericExtensions, genericExtensionsCount, flags) {
    clientHelloMarshal := clientHello is VarRef ? "char*" : "ptr"

    result := DllCall("SCHANNEL.dll\SslGetExtensions", clientHelloMarshal, clientHello, "uint", clientHelloByteSize, SCH_EXTENSION_DATA.Ptr, genericExtensions, "char", genericExtensionsCount, "uint*", &bytesToRead := 0, SchGetExtensionsOptions, flags, "HRESULT")
    return bytesToRead
}

/**
 * 
 * @param {CRYPT_INTEGER_BLOB} SerializedCertificateStore 
 * @returns {Pointer<CERT_CONTEXT>} 
 */
export SslDeserializeCertificateStore(SerializedCertificateStore) {
    result := DllCall("SCHANNEL.dll\SslDeserializeCertificateStore", CRYPT_INTEGER_BLOB, SerializedCertificateStore, "ptr*", &ppCertContext := 0, "HRESULT")
    return ppCertContext
}

/**
 * Constructs one token binding that contains the exported public key and signature by using the specified key type for the token binding, a target identifier string for creating and retrieving the token binding key, and the unique data.
 * @remarks
 * You can call <b>TokenBindingGenerateBinding</b> from user mode.
 * @param {TOKENBINDING_KEY_PARAMETERS_TYPE} keyType The negotiated key type to use. Use a value from the list of key types that you retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesclient">TokenBindingGetKeyTypesClient</a> function.
 * @param {PWSTR} targetURL The target string to use in conjunction with the key type  to generate or retrieve a token binding key for the NCrypt operations that build the buffer for the <i>tokenBinding</i> parameter.
 * @param {TOKENBINDING_TYPE} bindingType The type of token binding that <b>TokenBindingGenerateBinding</b> should generate.
 * @param {Integer} tlsEKM A pointer to the buffer that contains unique data.
 * @param {Integer} tlsEKMSize The size of the buffer that the <i>tlsUnique</i> parameter points to, in bytes.
 * @param {TOKENBINDING_EXTENSION_FORMAT} extensionFormat The format to use to interpret the data in the <i>extensionData</i> parameter. This value must be <b>TOKENBINDING_EXTENSION_FORMAT_UNDEFINED</b>.
 * @param {Pointer<Void>} extensionData A pointer to a buffer that contains extension data. The value of the <i>extensionFormat</i> parameter determines how to interpret this data.
 * @param {Pointer<Pointer<Void>>} tokenBinding A pointer that receives the address of the token binding buffer. Use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate the memory for this buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function to free that memory.
 * @param {Pointer<Integer>} tokenBindingSize Pointer to a variable that receives the size of the buffer allocated for the <i>tokenBinding</i> parameter, in bytes.
 * @param {Pointer<Pointer<TOKENBINDING_RESULT_DATA>>} resultData A pointer that receives the address of the buffer that contains result data that includes the token binding identifier of the token binding that  <b>TokenBindingGenerateBinding</b> generates. Use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate the memory for this buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> function to free that memory. Specify NULL is you do not need this information.
 * @returns {HRESULT} Returns a status code that indicates the success or failure of the function.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/nf-tokenbinding-tokenbindinggeneratebinding
 * @since windows10.0.10240
 */
export TokenBindingGenerateBinding(keyType, targetURL, bindingType, tlsEKM, tlsEKMSize, extensionFormat, extensionData, tokenBinding, tokenBindingSize, resultData) {
    targetURL := targetURL is String ? StrPtr(targetURL) : targetURL

    extensionDataMarshal := extensionData is VarRef ? "ptr" : "ptr"
    tokenBindingMarshal := tokenBinding is VarRef ? "ptr*" : "ptr"
    tokenBindingSizeMarshal := tokenBindingSize is VarRef ? "uint*" : "ptr"
    resultDataMarshal := resultData is VarRef ? "ptr*" : "ptr"

    result := DllCall("TOKENBINDING.dll\TokenBindingGenerateBinding", TOKENBINDING_KEY_PARAMETERS_TYPE, keyType, "ptr", targetURL, TOKENBINDING_TYPE, bindingType, "ptr", tlsEKM, "uint", tlsEKMSize, TOKENBINDING_EXTENSION_FORMAT, extensionFormat, extensionDataMarshal, extensionData, tokenBindingMarshal, tokenBinding, tokenBindingSizeMarshal, tokenBindingSize, resultDataMarshal, resultData, "HRESULT")
    return result
}

/**
 * Assembles the list of token bindings and generates the final message for the client device to the server.
 * @remarks
 * You can call <b>TokenBindingGenerateMessage</b> from user mode.
 * @param {Pointer<Pointer<Void>>} tokenBindings Pointer to an array of token binding structures.
 * @param {Pointer<Integer>} tokenBindingsSize An array that contains the sizes of the corresponding token binding structures that the array in the <i>tokenBindings</i> parameter contains, in bytes.
 * @param {Integer} tokenBindingsCount The number of elements that the array in the <i>tokenBindings</i> parameter contains. This value cannot be 0.
 * @param {Pointer<Pointer<Void>>} tokenBindingMessage A pointer that receives the address of the buffer that is allocated for the token binding message.  Use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate the memory for this buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> method to free that memory.
 * @param {Pointer<Integer>} tokenBindingMessageSize A pointer to a variable that contains the size of the buffer allocated for the <i>tokenBindingMessage</i> parameter.
 * @returns {HRESULT} Returns a status code that indicates the success or failure of the function.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/nf-tokenbinding-tokenbindinggeneratemessage
 * @since windows10.0.10240
 */
export TokenBindingGenerateMessage(tokenBindings, tokenBindingsSize, tokenBindingsCount, tokenBindingMessage, tokenBindingMessageSize) {
    tokenBindingsMarshal := tokenBindings is VarRef ? "ptr*" : "ptr"
    tokenBindingsSizeMarshal := tokenBindingsSize is VarRef ? "uint*" : "ptr"
    tokenBindingMessageMarshal := tokenBindingMessage is VarRef ? "ptr*" : "ptr"
    tokenBindingMessageSizeMarshal := tokenBindingMessageSize is VarRef ? "uint*" : "ptr"

    result := DllCall("TOKENBINDING.dll\TokenBindingGenerateMessage", tokenBindingsMarshal, tokenBindings, tokenBindingsSizeMarshal, tokenBindingsSize, "uint", tokenBindingsCount, tokenBindingMessageMarshal, tokenBindingMessage, tokenBindingMessageSizeMarshal, tokenBindingMessageSize, "HRESULT")
    return result
}

/**
 * Validates the token binding message and verifies the token bindings that the message contains.
 * @remarks
 * You can call <b>TokenBindingVerifyMessage</b> from both user mode and kernel mode. o call this function in kernel mode,  link to Ksecdd.sys, and use the functions mentioned in the description for the <i>resultList</i> parameter for allocating and freeing memory.
 * @param {Integer} tokenBindingMessage A pointer to the buffer that contains the token binding message.
 * @param {Integer} tokenBindingMessageSize The size of the buffer that the <i>tokenBindingMessage</i> parameter points to, in bytes.
 * @param {TOKENBINDING_KEY_PARAMETERS_TYPE} keyType The negotiated key algorithm to use. Use a value from the list of key types that you retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesserver">TokenBindingGetKeyTypesServer</a> function.
 * @param {Integer} tlsEKM A pointer to a buffer that contains unique data.
 * @param {Integer} tlsEKMSize The size of the buffer that the <i>tlsUnique</i> parameter points to, in bytes.
 * @returns {Pointer<TOKENBINDING_RESULT_LIST>} A pointer that receives the address for the buffer that contains the results for each of the token bindings that <b>TokenBindingVerifyMessage</b>   verifies.
 * 
 * In user mode, use <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> to free that memory. In kernel mode, use <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-exallocatepoolwithtag">ExAllocatePoolWithTag</a>  to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddk/nf-ntddk-exfreepool">ExFreePool</a> to free that memory.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/nf-tokenbinding-tokenbindingverifymessage
 * @since windows10.0.10240
 */
export TokenBindingVerifyMessage(tokenBindingMessage, tokenBindingMessageSize, keyType, tlsEKM, tlsEKMSize) {
    result := DllCall("TOKENBINDING.dll\TokenBindingVerifyMessage", "ptr", tokenBindingMessage, "uint", tokenBindingMessageSize, TOKENBINDING_KEY_PARAMETERS_TYPE, keyType, "ptr", tlsEKM, "uint", tlsEKMSize, "ptr*", &resultList := 0, "HRESULT")
    return resultList
}

/**
 * Retrieves a list of the key types that the client device supports.
 * @remarks
 * You can call <b>TokenBindingGetKeyTypesClient</b> from user mode.
 * @returns {Pointer<TOKENBINDING_KEY_TYPES>} A pointer to a buffer that contains the list of key types that the client device supports. <b>TokenBindingGetKeyTypesClient</b> returns the string identifiers for well-known algorithms that correspond to the keys that the client device supports. Use <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> to free that memory.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesclient
 * @since windows10.0.10240
 */
export TokenBindingGetKeyTypesClient() {
    result := DllCall("TOKENBINDING.dll\TokenBindingGetKeyTypesClient", "ptr*", &keyTypes := 0, "HRESULT")
    return keyTypes
}

/**
 * Retrieves a list of the key types that the server supports.
 * @remarks
 * You can call <b>TokenBindingGetKeyTypesServer</b> from both user mode and kernel mode. To call this function in kernel mode,  link to Ksecdd.sys, and use the functions mentioned in the description for the <i>keyTypes</i> parameter for allocating and freeing memory.
 * @returns {Pointer<TOKENBINDING_KEY_TYPES>} A pointer to a buffer that contains the list of key types that the server supports. <b>TokenBindingGetKeyTypesServer</b> returns the string identifiers for well-known algorithms that correspond to the keys that the server supports.
 * 
 * In user mode, use <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> to free that memory. In kernel mode, use <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-exallocatepoolwithtag">ExAllocatePoolWithTag</a>  to allocate the memory for the buffer, and <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ntddk/nf-ntddk-exfreepool">ExFreePool</a> to free that memory.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesserver
 * @since windows10.0.10240
 */
export TokenBindingGetKeyTypesServer() {
    result := DllCall("TOKENBINDING.dll\TokenBindingGetKeyTypesServer", "ptr*", &keyTypes := 0, "HRESULT")
    return keyTypes
}

/**
 * Deletes the token binding key that is associated with the specified target string.
 * @remarks
 * You can call <b>TokenBindingDeleteBinding</b> from user mode.
 * @param {PWSTR} targetURL The target string for which <b>TokenBindingDeleteBinding</b> should delete the associated token binding key.
 * @returns {HRESULT} Returns a status code that indicates the success or failure of the function.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/nf-tokenbinding-tokenbindingdeletebinding
 * @since windows10.0.10240
 */
export TokenBindingDeleteBinding(targetURL) {
    targetURL := targetURL is String ? StrPtr(targetURL) : targetURL

    result := DllCall("TOKENBINDING.dll\TokenBindingDeleteBinding", "ptr", targetURL, "HRESULT")
    return result
}

/**
 * Deletes all token binding keys that are associated with the calling user or app container.
 * @remarks
 * You can call <b>TokenBindingDeleteAllBindings</b> from user mode.
 * @returns {HRESULT} Returns a status code that indicates the success or failure of the function.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/nf-tokenbinding-tokenbindingdeleteallbindings
 * @since windows10.0.10240
 */
export TokenBindingDeleteAllBindings() {
    result := DllCall("TOKENBINDING.dll\TokenBindingDeleteAllBindings", "HRESULT")
    return result
}

/**
 * Constructs the token binding identifier by extracting the signature algorithm from the key type and copying the exported public key.
 * @remarks
 * You can call <b>TokenBindingGenerateID</b> from user mode.
 * @param {TOKENBINDING_KEY_PARAMETERS_TYPE} keyType The negotiated key type to use. Use a value from the list of key types that you retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/nf-tokenbinding-tokenbindinggetkeytypesclient">TokenBindingGetKeyTypesClient</a> function.
 * @param {Integer} publicKey An exported public key blob.
 * @param {Integer} publicKeySize The size of the exported public key blob.
 * @returns {Pointer<TOKENBINDING_RESULT_DATA>} A pointer that receives the address of the buffer that is allocated for the token binding result data.  The token binding result data contains the token binding identifier. 
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function to allocate the memory for this buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a> method to free that memory.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/nf-tokenbinding-tokenbindinggenerateid
 * @since windows10.0.10240
 */
export TokenBindingGenerateID(keyType, publicKey, publicKeySize) {
    result := DllCall("TOKENBINDING.dll\TokenBindingGenerateID", TOKENBINDING_KEY_PARAMETERS_TYPE, keyType, "ptr", publicKey, "uint", publicKeySize, "ptr*", &resultData := 0, "HRESULT")
    return resultData
}

/**
 * 
 * @param {TOKENBINDING_KEY_PARAMETERS_TYPE} keyType 
 * @param {PWSTR} targetUri 
 * @returns {Pointer<TOKENBINDING_RESULT_DATA>} 
 */
export TokenBindingGenerateIDForUri(keyType, targetUri) {
    targetUri := targetUri is String ? StrPtr(targetUri) : targetUri

    result := DllCall("TOKENBINDING.dll\TokenBindingGenerateIDForUri", TOKENBINDING_KEY_PARAMETERS_TYPE, keyType, "ptr", targetUri, "ptr*", &resultData := 0, "HRESULT")
    return resultData
}

/**
 * 
 * @param {Pointer<Integer>} majorVersion 
 * @param {Pointer<Integer>} minorVersion 
 * @returns {HRESULT} 
 */
export TokenBindingGetHighestSupportedVersion(majorVersion, minorVersion) {
    majorVersionMarshal := majorVersion is VarRef ? "char*" : "ptr"
    minorVersionMarshal := minorVersion is VarRef ? "char*" : "ptr"

    result := DllCall("TOKENBINDING.dll\TokenBindingGetHighestSupportedVersion", majorVersionMarshal, majorVersion, minorVersionMarshal, minorVersion, "HRESULT")
    return result
}

/**
 * Retrieves the name of the user or other security principal associated with the calling thread. You can specify the format of the returned name. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The secext.h header defines GetUserNameEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {EXTENDED_NAME_FORMAT} NameFormat The format of the name. This parameter is a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be <b>NameUnknown</b>. If the user account is not in a domain, only <b>NameSamCompatible</b> is supported.
 * @param {PSTR} lpNameBuffer A pointer to a buffer that receives the name in the specified format. The buffer must include space for the terminating null character.
 * @param {Pointer<Integer>} nSize On input, this variable specifies the size of the <i>lpNameBuffer</i> buffer, in <b>TCHARs</b>. If the function is successful, the variable receives the number of <b>TCHARs</b> copied to the buffer, not including the terminating null character. 
 * 
 * 
 * 
 * 
 * If <i>lpNameBuffer</i> is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. This parameter receives the required buffer size, in Unicode characters (whether or not Unicode is being used), including the terminating null character.
 * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>lpNameBuffer</i> buffer is too small. The <i>lpnSize</i> parameter contains the number of bytes required to receive the name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The domain controller is not available to perform the lookup
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NONE_MAPPED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name is not available in the specified format.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/secext/nf-secext-getusernameexa
 * @since windows5.0
 */
export GetUserNameExA(NameFormat, lpNameBuffer, nSize) {
    lpNameBuffer := lpNameBuffer is String ? StrPtr(lpNameBuffer) : lpNameBuffer

    nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("SECUR32.dll\GetUserNameExA", EXTENDED_NAME_FORMAT, NameFormat, "ptr", lpNameBuffer, nSizeMarshal, nSize, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the name of the user or other security principal associated with the calling thread. You can specify the format of the returned name. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The secext.h header defines GetUserNameEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {EXTENDED_NAME_FORMAT} NameFormat The format of the name. This parameter is a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be <b>NameUnknown</b>. If the user account is not in a domain, only <b>NameSamCompatible</b> is supported.
 * @param {PWSTR} lpNameBuffer A pointer to a buffer that receives the name in the specified format. The buffer must include space for the terminating null character.
 * @param {Pointer<Integer>} nSize On input, this variable specifies the size of the <i>lpNameBuffer</i> buffer, in <b>TCHARs</b>. If the function is successful, the variable receives the number of <b>TCHARs</b> copied to the buffer, not including the terminating null character. 
 * 
 * 
 * 
 * 
 * If <i>lpNameBuffer</i> is too small, the function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA. This parameter receives the required buffer size, in Unicode characters (whether or not Unicode is being used), including the terminating null character.
 * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>lpNameBuffer</i> buffer is too small. The <i>lpnSize</i> parameter contains the number of bytes required to receive the name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SUCH_DOMAIN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The domain controller is not available to perform the lookup
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NONE_MAPPED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user name is not available in the specified format.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/secext/nf-secext-getusernameexw
 * @since windows5.0
 */
export GetUserNameExW(NameFormat, lpNameBuffer, nSize) {
    lpNameBuffer := lpNameBuffer is String ? StrPtr(lpNameBuffer) : lpNameBuffer

    nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("SECUR32.dll\GetUserNameExW", EXTENDED_NAME_FORMAT, NameFormat, "ptr", lpNameBuffer, nSizeMarshal, nSize, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the local computer's name in a specified format. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The secext.h header defines GetComputerObjectName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {EXTENDED_NAME_FORMAT} NameFormat The format for the name. This parameter is a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be NameUnknown.
 * @param {PSTR} lpNameBuffer A pointer to a buffer that receives the name in the specified format. 
 * 
 * 
 * 
 * 
 * If this parameter is <b>NULL</b>, either the function succeeds and the <i>lpnSize</i> parameter receives the required size, or the function fails with ERROR_INSUFFICIENT_BUFFER and <i>lpnSize</i> receives the required size. The behavior depends on the value of <i>NameFormat</i> and the version of the operating system.
 * @param {Pointer<Integer>} nSize On input, specifies the size of the <i>lpNameBuffer</i> buffer, in <b>TCHARs</b>. On success, receives the size of the name copied to the buffer. If the <i>lpNameBuffer</i> buffer is too small to hold the name, the function fails and <i>lpnSize</i> receives the required buffer size.
 * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/secext/nf-secext-getcomputerobjectnamea
 * @since windows5.0
 */
export GetComputerObjectNameA(NameFormat, lpNameBuffer, nSize) {
    lpNameBuffer := lpNameBuffer is String ? StrPtr(lpNameBuffer) : lpNameBuffer

    nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("SECUR32.dll\GetComputerObjectNameA", EXTENDED_NAME_FORMAT, NameFormat, "ptr", lpNameBuffer, nSizeMarshal, nSize, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the local computer's name in a specified format. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The secext.h header defines GetComputerObjectName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {EXTENDED_NAME_FORMAT} NameFormat The format for the name. This parameter is a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be NameUnknown.
 * @param {PWSTR} lpNameBuffer A pointer to a buffer that receives the name in the specified format. 
 * 
 * 
 * 
 * 
 * If this parameter is <b>NULL</b>, either the function succeeds and the <i>lpnSize</i> parameter receives the required size, or the function fails with ERROR_INSUFFICIENT_BUFFER and <i>lpnSize</i> receives the required size. The behavior depends on the value of <i>NameFormat</i> and the version of the operating system.
 * @param {Pointer<Integer>} nSize On input, specifies the size of the <i>lpNameBuffer</i> buffer, in <b>TCHARs</b>. On success, receives the size of the name copied to the buffer. If the <i>lpNameBuffer</i> buffer is too small to hold the name, the function fails and <i>lpnSize</i> receives the required buffer size.
 * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/secext/nf-secext-getcomputerobjectnamew
 * @since windows5.0
 */
export GetComputerObjectNameW(NameFormat, lpNameBuffer, nSize) {
    lpNameBuffer := lpNameBuffer is String ? StrPtr(lpNameBuffer) : lpNameBuffer

    nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("SECUR32.dll\GetComputerObjectNameW", EXTENDED_NAME_FORMAT, NameFormat, "ptr", lpNameBuffer, nSizeMarshal, nSize, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Converts a directory service object name from one format to another. (ANSI)
 * @remarks
 * <b>TranslateName</b> fails if it cannot bind to Active Directory on a domain controller.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The secext.h header defines TranslateName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpAccountName The name to be translated.
 * @param {EXTENDED_NAME_FORMAT} AccountNameFormat The format of the name to be translated. This parameter is a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type.
 * @param {EXTENDED_NAME_FORMAT} DesiredNameFormat The format of the converted name. This parameter is a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be NameUnknown.
 * @param {PSTR} lpTranslatedName A pointer to a buffer that receives the converted name.
 * @param {Pointer<Integer>} nSize On input, the variable indicates the size of the <i>lpTranslatedName</i> buffer, in <b>TCHARs</b>. On output, the variable returns the size of the returned string, in <b>TCHARs</b>, including the terminating <b>null</b> character. 
 * 
 * 
 * 
 * 
 * If <i>lpTranslated</i> is <b>NULL</b> and <i>nSize</i> is 0, the function succeeds and <i>nSize</i> receives the required buffer size.
 * 
 * If the <i>lpTranslatedName</i> buffer is too small to hold the converted name, the function fails and <i>nSize</i> receives the required buffer size.
 * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/secext/nf-secext-translatenamea
 * @since windows5.0
 */
export TranslateNameA(lpAccountName, AccountNameFormat, DesiredNameFormat, lpTranslatedName, nSize) {
    lpAccountName := lpAccountName is String ? StrPtr(lpAccountName) : lpAccountName
    lpTranslatedName := lpTranslatedName is String ? StrPtr(lpTranslatedName) : lpTranslatedName

    nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("SECUR32.dll\TranslateNameA", "ptr", lpAccountName, EXTENDED_NAME_FORMAT, AccountNameFormat, EXTENDED_NAME_FORMAT, DesiredNameFormat, "ptr", lpTranslatedName, nSizeMarshal, nSize, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Converts a directory service object name from one format to another. (Unicode)
 * @remarks
 * <b>TranslateName</b> fails if it cannot bind to Active Directory on a domain controller.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The secext.h header defines TranslateName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpAccountName The name to be translated.
 * @param {EXTENDED_NAME_FORMAT} AccountNameFormat The format of the name to be translated. This parameter is a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type.
 * @param {EXTENDED_NAME_FORMAT} DesiredNameFormat The format of the converted name. This parameter is a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/secext/ne-secext-extended_name_format">EXTENDED_NAME_FORMAT</a> enumeration type. It cannot be NameUnknown.
 * @param {PWSTR} lpTranslatedName A pointer to a buffer that receives the converted name.
 * @param {Pointer<Integer>} nSize On input, the variable indicates the size of the <i>lpTranslatedName</i> buffer, in <b>TCHARs</b>. On output, the variable returns the size of the returned string, in <b>TCHARs</b>, including the terminating <b>null</b> character. 
 * 
 * 
 * 
 * 
 * If <i>lpTranslated</i> is <b>NULL</b> and <i>nSize</i> is 0, the function succeeds and <i>nSize</i> receives the required buffer size.
 * 
 * If the <i>lpTranslatedName</i> buffer is too small to hold the converted name, the function fails and <i>nSize</i> receives the required buffer size.
 * @returns {BOOLEAN} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/secext/nf-secext-translatenamew
 * @since windows5.0
 */
export TranslateNameW(lpAccountName, AccountNameFormat, DesiredNameFormat, lpTranslatedName, nSize) {
    lpAccountName := lpAccountName is String ? StrPtr(lpAccountName) : lpAccountName
    lpTranslatedName := lpTranslatedName is String ? StrPtr(lpTranslatedName) : lpTranslatedName

    nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("SECUR32.dll\TranslateNameW", "ptr", lpAccountName, EXTENDED_NAME_FORMAT, AccountNameFormat, EXTENDED_NAME_FORMAT, DesiredNameFormat, "ptr", lpTranslatedName, nSizeMarshal, nSize, BOOLEAN)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Initializes the Software Licensing Client (SLC) and connects SLC to the Software Licensing Service (SLS).
 * @returns {Pointer<Void>} Type: <b>HSLC*</b>
 * 
 * A pointer to a context handle returned from the Software Licensing Service.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slopen
 * @since windows8.0
 */
export SLOpen() {
    result := DllCall("SLC.dll\SLOpen", "ptr*", &phSLC := 0, "HRESULT")
    return phSLC
}

/**
 * Closes the Software Licensing Client (SLC) context handle.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slclose
 * @since windows8.0
 */
export SLClose(hSLC) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLClose", hSLCMarshal, hSLC, "HRESULT")
    return result
}

/**
 * Registers the product key with SL.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {PWSTR} pwszPKeyAlgorithm Type: <b>PCWSTR</b>
 * 
 * The product key algorithm.
 * @param {PWSTR} pwszPKeyString Type: <b>PCWSTR</b>
 * 
 * The product key string.
 * @param {Integer} cbPKeySpecificData Type: <b>UINT</b>
 * 
 * The size, in bytes, of product key specific data. If there is no PKey specific data, set <i>cbPKeySpecificData</i> to 0.
 * @param {Integer} pbPKeySpecificData Type: <b>PBYTE</b>
 * 
 * A pointer to the product key specific data. If there is no PKey specific data, set <i>pbPKeySpecificData</i> to <b>NULL</b>.
 * @param {Pointer<Guid>} pPkeyId Type: <b>SLID*</b>
 * 
 * A pointer to an identifier of the registered product key. This <b>SLID</b> can be used to reference PKey information later.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_ACCESSDENIED</b></dt>
 * <dt>0x80070005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access denied (API requires admin privileges).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_LUA_ACCESSDENIED</b></dt>
 * <dt>0xC004F025</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The action requires administrator privilege.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_INVALID_PKEY</b></dt>
 * <dt>0xC004F010</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The product key is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED</b></dt>
 * <dt>0xC004F015</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license is not installed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PKEY_INVALID_UPGRADE</b></dt>
 * <dt>0xC004F061</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This specified product key can only be used for upgrading, not for clean installations.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slinstallproofofpurchase
 * @since windows8.0
 */
export SLInstallProofOfPurchase(hSLC, pwszPKeyAlgorithm, pwszPKeyString, cbPKeySpecificData, pbPKeySpecificData, pPkeyId) {
    pwszPKeyAlgorithm := pwszPKeyAlgorithm is String ? StrPtr(pwszPKeyAlgorithm) : pwszPKeyAlgorithm
    pwszPKeyString := pwszPKeyString is String ? StrPtr(pwszPKeyString) : pwszPKeyString

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLInstallProofOfPurchase", hSLCMarshal, hSLC, "ptr", pwszPKeyAlgorithm, "ptr", pwszPKeyString, "uint", cbPKeySpecificData, "ptr", pbPKeySpecificData, Guid.Ptr, pPkeyId, "HRESULT")
    return result
}

/**
 * Unregisters the product key information.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pPKeyId Type: <b>const SLID*</b>
 * 
 * A pointer to the identifier of the registered product key.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_ACCESSDENIED</b></dt>
 * <dt>0x80070005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access denied (API requires admin privileges).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_LUA_ACCESSDENIED</b></dt>
 * <dt>0xC004F025</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The action requires administrator privilege.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
 * <dt>0xC004F014</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The product key is not available.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-sluninstallproofofpurchase
 * @since windows8.0
 */
export SLUninstallProofOfPurchase(hSLC, pPKeyId) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLUninstallProofOfPurchase", hSLCMarshal, hSLC, Guid.Ptr, pPKeyId, "HRESULT")
    return result
}

/**
 * Stores the specified license and returns a license file ID.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Integer} cbLicenseBlob Type: <b>UINT</b>
 * 
 * Size of license BLOB.
 * @param {Integer} pbLicenseBlob Type: <b>const BYTE*</b>
 * 
 * A pointer to the licenses in the BLOB.
 * @param {Pointer<Guid>} pLicenseFileId Type: <b>SLID*</b>
 * 
 * A pointer to the license file ID.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_ACCESSDENIED</b></dt>
 * <dt>0x80070005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access denied (API requires admin privileges).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_LUA_ACCESSDENIED</b></dt>
 * <dt>0xC004F025</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The action requires administrator privilege.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_INVALID_LICENSE</b></dt>
 * <dt>0xC004F01F</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slinstalllicense
 * @since windows8.0
 */
export SLInstallLicense(hSLC, cbLicenseBlob, pbLicenseBlob, pLicenseFileId) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLInstallLicense", hSLCMarshal, hSLC, "uint", cbLicenseBlob, "ptr", pbLicenseBlob, Guid.Ptr, pLicenseFileId, "HRESULT")
    return result
}

/**
 * Uninstalls the license specified by the license file ID and target user option.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pLicenseFileId Type: <b>const SLID*</b>
 * 
 * A pointer to the license file ID.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_ACCESSDENIED</b></dt>
 * <dt>0x80070005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access denied (API requires admin privileges)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_LUA_ACCESSDENIED</b></dt>
 * <dt>0xC004F025</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The action requires administrator privilege.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_LICENSE_FILE_NOT_INSTALLED</b></dt>
 * <dt>0xC004F011</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license file is not installed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-sluninstalllicense
 * @since windows8.0
 */
export SLUninstallLicense(hSLC, pLicenseFileId) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLUninstallLicense", hSLCMarshal, hSLC, Guid.Ptr, pLicenseFileId, "HRESULT")
    return result
}

/**
 * Let an application to exercise rights on a locally-stored licenses.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pAppId Type: <b>const SLID*</b>
 * 
 * A pointer to the identifier of the application who's right is going to be          
 * 		consumed.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer to the identifier of product SKU. If set to <b>NULL</b>, all of the  product  SKU's          
 * 		licenses will be consumed.
 * @param {PWSTR} pwszRightName Type: <b>PCWSTR</b>
 * 
 * The name of right to be consumed.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_RIGHT_NOT_GRANTED</b></dt>
 * <dt>0xC004F013</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have permission to run the software.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED </b></dt>
 * <dt>0xC004F015</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license is not installed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slconsumeright
 * @since windows8.0
 */
export SLConsumeRight(hSLC, pAppId, pProductSkuId, pwszRightName) {
    static pvReserved := 0 ;Reserved parameters must always be NULL

    pwszRightName := pwszRightName is String ? StrPtr(pwszRightName) : pwszRightName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLConsumeRight", hSLCMarshal, hSLC, Guid.Ptr, pAppId, Guid.Ptr, pProductSkuId, "ptr", pwszRightName, "ptr", pvReserved, "HRESULT")
    return result
}

/**
 * Gets information about the specified product SKU.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer to the SKU ID.
 * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
 * 
 * The name associated with the value to retrieve.  The following names are valid.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_NAME"></a><a id="sl_info_key_name"></a><dl>
 * <dt><b>SL_INFO_KEY_NAME</b></dt>
 * <dt>L"Name"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The product name
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_DESCRIPTION"></a><a id="sl_info_key_description"></a><dl>
 * <dt><b>SL_INFO_KEY_DESCRIPTION</b></dt>
 * <dt>L"Description" </dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Description of the product
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_AUTHOR"></a><a id="sl_info_key_author"></a><dl>
 * <dt><b>SL_INFO_KEY_AUTHOR</b></dt>
 * <dt>L"Author"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Author of the product
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<SLDATATYPE>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
 * 
 * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
 * <dt><b>SL_DATA_SZ</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * UNICODE string
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
 * <dt><b>SL_DATA_DWORD</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * DWORD
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
 * <dt><b>SL_DATA_BINARY</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Binary BLOB
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
 * 
 * A pointer to the size, in bytes,  of the <i>ppbValue</i> buffer.
 * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
 * 
 * If successful, the data is returned in the buffer allocated by SLC.         
 * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value for the input key was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetproductskuinformation
 * @since windows8.0
 */
export SLGetProductSkuInformation(hSLC, pProductSkuId, pwszValueName, peDataType, pcbValue, ppbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
    ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetProductSkuInformation", hSLCMarshal, hSLC, Guid.Ptr, pProductSkuId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "HRESULT")
    return result
}

/**
 * Gets the information of the specified product key.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pPKeyId Type: <b>const SLID*</b>
 * 
 * A pointer to the PKey ID.
 * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
 * 
 * The name associated with the value to retrieve.  The following names are valid.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_DIGITAL_PID"></a><a id="sl_info_key_digital_pid"></a><dl>
 * <dt><b>SL_INFO_KEY_DIGITAL_PID</b></dt>
 * <dt>L"DigitalPID" </dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Formatted PID structure for a PID4
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_DIGITAL_PID2"></a><a id="sl_info_key_digital_pid2"></a><dl>
 * <dt><b>SL_INFO_KEY_DIGITAL_PID2</b></dt>
 * <dt>L"DigitalPID2"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Formatted PID structure for a PID2
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_PARTIAL_PRODUCT_KEY"></a><a id="sl_info_key_partial_product_key"></a><dl>
 * <dt><b>SL_INFO_KEY_PARTIAL_PRODUCT_KEY</b></dt>
 * <dt>L"PartialProductKey"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * First 5 characters of product key
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_PRODUCT_SKU_ID"></a><a id="sl_info_key_product_sku_id"></a><dl>
 * <dt><b>SL_INFO_KEY_PRODUCT_SKU_ID</b></dt>
 * <dt>L"ProductSkuId"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * SKU SLID
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_CHANNEL"></a><a id="sl_info_key_channel"></a><dl>
 * <dt><b>SL_INFO_KEY_CHANNEL</b></dt>
 * <dt>L"Channel" </dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Channel ID
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<SLDATATYPE>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
 * 
 * The data type.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
 * <dt><b>SL_DATA_SZ</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * UNICODE string
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
 * <dt><b>SL_DATA_DWORD</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * DWORD
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
 * <dt><b>SL_DATA_BINARY</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Binary BLOB
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
 * 
 * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
 * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
 * 
 * A pointer to the data returned by SLC.          
 * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
 * <dt>0xC004F014</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The product key is not available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_NOT_SUPPORTED</b></dt>
 * <dt>0xC004F016</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetpkeyinformation
 * @since windows8.0
 */
export SLGetPKeyInformation(hSLC, pPKeyId, pwszValueName, peDataType, pcbValue, ppbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
    ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetPKeyInformation", hSLCMarshal, hSLC, Guid.Ptr, pPKeyId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "HRESULT")
    return result
}

/**
 * Gets the specified license information.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pSLLicenseId Type: <b>const SLID*</b>
 * 
 * A pointer to the license ID.
 * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
 * 
 * The name associated with the value to retrieve.. The following values are valid.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_DESCRIPTION"></a><a id="sl_info_key_description"></a><dl>
 * <dt><b>SL_INFO_KEY_DESCRIPTION</b></dt>
 * <dt>L"Description"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The description of the license.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_LICENSE_TYPE"></a><a id="sl_info_key_license_type"></a><dl>
 * <dt><b>SL_INFO_KEY_LICENSE_TYPE</b></dt>
 * <dt>L"LicenseType"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The type of the license.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_VERSION"></a><a id="sl_info_key_version"></a><dl>
 * <dt><b>SL_INFO_KEY_VERSION</b></dt>
 * <dt>L"Version"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The version of the license.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<SLDATATYPE>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
 * 
 * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer. Acceptable values are:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
 * <dt><b>SL_DATA_SZ</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * UNICODE string
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
 * <dt><b>SL_DATA_DWORD</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * DWORD
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
 * <dt><b>SL_DATA_BINARY</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Binary BLOB
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
 * 
 * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
 * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
 * 
 * If successful, the data is returned in the buffer allocated by SLC.     
 * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value for the input key was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetlicenseinformation
 * @since windows8.0
 */
export SLGetLicenseInformation(hSLC, pSLLicenseId, pwszValueName, peDataType, pcbValue, ppbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
    ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetLicenseInformation", hSLCMarshal, hSLC, Guid.Ptr, pSLLicenseId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "HRESULT")
    return result
}

/**
 * Gets the licensing status of the specified application or SKU.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * Handle to the current SLC context.
 * @param {Pointer<Guid>} pAppID Type: <b>const SLID*</b>
 * 
 * A pointer to a <b>SLID</b> that represents the application ID.
 * 		
 * 
 * <table>
 * <tr>
 * <th>pAppID</th>
 * <th>pProductSkuId</th>
 * <th>Results</th>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * Get previous right consumption result.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * Not <b>NULL</b>
 * 
 * </td>
 * <td>
 * Get licensing status of this SKU.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Not <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * Get licensing status of this application.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Not <b>NULL</b>
 * 
 * </td>
 * <td>
 * Not <b>NULL</b>
 * 
 * </td>
 * <td>
 * Get licensing status of this application/SKU.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer to a <b>SLID</b> that represents the product ID.
 * 		
 * 
 * <table>
 * <tr>
 * <th>pAppID</th>
 * <th>pProductSkuId</th>
 * <th>Results</th>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * Get previous right consumption result.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * Not <b>NULL</b>
 * 
 * </td>
 * <td>
 * Get licensing status of this SKU.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Not <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * Get licensing status of this application.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Not <b>NULL</b>
 * 
 * </td>
 * <td>
 * Not <b>NULL</b>
 * 
 * </td>
 * <td>
 * Get licensing status of this application/SKU.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {PWSTR} pwszRightName Type: <b>PCWSTR</b>
 * 
 * Must be <b>NULL</b>.
 * @param {Pointer<Integer>} pnStatusCount Type: <b>UINT*</b>
 * 
 * A pointer to the number of the SKU's status.
 * @param {Pointer<Pointer<SL_LICENSING_STATUS>>} ppLicensingStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_licensing_status">SL_LICENSING_STATUS</a>**</b>
 * 
 * A pointer to the licensing status of the SKU.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_RIGHT_NOT_CONSUMED</b></dt>
 * <dt>0xC004F002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The rights consumption failed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetlicensingstatusinformation
 * @since windows8.0
 */
export SLGetLicensingStatusInformation(hSLC, pAppID, pProductSkuId, pwszRightName, pnStatusCount, ppLicensingStatus) {
    pwszRightName := pwszRightName is String ? StrPtr(pwszRightName) : pwszRightName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    pnStatusCountMarshal := pnStatusCount is VarRef ? "uint*" : "ptr"
    ppLicensingStatusMarshal := ppLicensingStatus is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetLicensingStatusInformation", hSLCMarshal, hSLC, Guid.Ptr, pAppID, Guid.Ptr, pProductSkuId, "ptr", pwszRightName, pnStatusCountMarshal, pnStatusCount, ppLicensingStatusMarshal, ppLicensingStatus, "HRESULT")
    return result
}

/**
 * Gets the policy information after right has been consumed successfully. (SLGetPolicyInformation)
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
 * 
 * The policy name.
 * @param {Pointer<SLDATATYPE>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
 * 
 * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
 * <dt><b>SL_DATA_SZ</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * UNICODE string
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
 * <dt><b>SL_DATA_DWORD</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * DWORD
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
 * <dt><b>SL_DATA_BINARY</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Binary BLOB
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
 * 
 * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
 * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
 * 
 * If successful, the data is returned in the buffer allocated by SLC. 
 * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value for the input key was not found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_RIGHT_NOT_GRANTED</b></dt>
 * <dt>0xC004F013</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have permission to run the software.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetpolicyinformation
 * @since windows8.0
 */
export SLGetPolicyInformation(hSLC, pwszValueName, peDataType, pcbValue, ppbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
    ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetPolicyInformation", hSLCMarshal, hSLC, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "HRESULT")
    return result
}

/**
 * Gets the policy information after right has been consumed successfully. (SLGetPolicyInformationDWORD)
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
 * 
 * The policy name.
 * @returns {Integer} Type: <b>DWORD*</b>
 * 
 * A pointer to the return value.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetpolicyinformationdword
 * @since windows8.0
 */
export SLGetPolicyInformationDWORD(hSLC, pwszValueName) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLGetPolicyInformationDWORD", hSLCMarshal, hSLC, "ptr", pwszValueName, "uint*", &pdwValue := 0, "HRESULT")
    return pdwValue
}

/**
 * Gets global data information.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
 * 
 * The name associated with the value to retrieve.  The following names are valid.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_VERSION"></a><a id="sl_info_key_version"></a><dl>
 * <dt><b>SL_INFO_KEY_VERSION</b></dt>
 * <dt>L"Version"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Version of SL service. e.g. "1.2.3.4"
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_SYSTEM_STATE"></a><a id="sl_info_key_system_state"></a><dl>
 * <dt><b>SL_INFO_KEY_SYSTEM_STATE</b></dt>
 * <dt>L"SystemState"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * System State
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_ACTIVE_PLUGINS"></a><a id="sl_info_key_active_plugins"></a><dl>
 * <dt><b>SL_INFO_KEY_ACTIVE_PLUGINS</b></dt>
 * <dt>L"ActivePlugins" </dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Fully-qualified DLL paths for all active plugins         
 * 				(<b>NULL</b> delimited and double <b>NULL</b>-terminated)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_SECURE_STORE_ID"></a><a id="sl_info_key_secure_store_id"></a><dl>
 * <dt><b>SL_INFO_KEY_SECURE_STORE_ID</b></dt>
 * <dt>L"SecureStoreId"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Secure store ID (GUID)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_SESSION_MACHINE_ID"></a><a id="sl_info_key_session_machine_id"></a><dl>
 * <dt><b>SL_INFO_KEY_SESSION_MACHINE_ID</b></dt>
 * <dt>L"SessionMachineId"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Session machine ID (Binary BLOB)
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<SLDATATYPE>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
 * 
 * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
 * <dt><b>SL_DATA_SZ</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <b>UNICODE</b> string
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
 * <dt><b>SL_DATA_DWORD</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <b>DWORD</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
 * <dt><b>SL_DATA_BINARY</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Binary blob
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_MULTI_SZ"></a><a id="sl_data_multi_sz"></a><dl>
 * <dt><b>SL_DATA_MULTI_SZ</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Double null-terminated <b>UNICODE</b> string array
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
 * 
 * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
 * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
 * 
 * If successful, the data is returned in the buffer allocated by SLC.    
 * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value for the input key was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetserviceinformation
 * @since windows8.0
 */
export SLGetServiceInformation(hSLC, pwszValueName, peDataType, pcbValue, ppbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
    ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetServiceInformation", hSLCMarshal, hSLC, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "HRESULT")
    return result
}

/**
 * Gets information about the specified application.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pApplicationId Type: <b>const SLID*</b>
 * 
 * A pointer to the application ID.
 * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_IS_KMS"></a><a id="sl_info_key_is_kms"></a><dl>
 * <dt><b>SL_INFO_KEY_IS_KMS</b></dt>
 * <dt>L"IsKeyManagementService"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates whether the machine has a Key Management Service (KMS) enabled.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_CURRENT_COUNT"></a><a id="sl_info_key_kms_current_count"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_CURRENT_COUNT</b></dt>
 * <dt>L"KeyManagementServiceCurrentCount" </dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The number of volume clients on a KMS host that are currently active.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_REQUIRED_CLIENT_COUNT"></a><a id="sl_info_key_kms_required_client_count"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_REQUIRED_CLIENT_COUNT</b></dt>
 * <dt>L"KeyManagementServiceRequiredClientCount"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The minimum number of VL clients required to connect to a KMS host for enabling activation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_UNLICENSED_REQUESTS"></a><a id="sl_info_key_kms_unlicensed_requests"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_UNLICENSED_REQUESTS</b></dt>
 * <dt>L"KeyManagementServiceUnlicensedRequests"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The number of KMS requests from VL clients with License Status=Unlicensed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_LICENSED_REQUESTS"></a><a id="sl_info_key_kms_licensed_requests"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_LICENSED_REQUESTS</b></dt>
 * <dt>L"KeyManagementServiceLicensedRequests"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The number of KMS requests from VL clients with License Status=Licensed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_OOB_GRACE_REQUESTS"></a><a id="sl_info_key_kms_oob_grace_requests"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_OOB_GRACE_REQUESTS</b></dt>
 * <dt>L"KeyManagementServiceOOBGraceRequests"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The number of KMS requests from VL clients with License Status=OOB Grace.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_OOT_GRACE_REQUESTS"></a><a id="sl_info_key_kms_oot_grace_requests"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_OOT_GRACE_REQUESTS</b></dt>
 * <dt>L"KeyManagementServiceOOTGraceRequests"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The number of KMS requests from VL clients with License Status=OOT Grace.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_NON_GENUINE_GRACE_REQUESTS"></a><a id="sl_info_key_kms_non_genuine_grace_requests"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_NON_GENUINE_GRACE_REQUESTS</b></dt>
 * <dt>L"KeyManagementServiceNonGenuineGraceRequests"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The number of KMS requests from VL clients with License Status=Non-Genuine Grace.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_NOTIFICATION_REQUESTS"></a><a id="sl_info_key_kms_notification_requests"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_NOTIFICATION_REQUESTS</b></dt>
 * <dt>L"KeyManagementServiceNotificationRequests"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The number of KMS requests from VL clients with License Status=Notification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_TOTAL_REQUESTS"></a><a id="sl_info_key_kms_total_requests"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_TOTAL_REQUESTS</b></dt>
 * <dt>L"KeyManagementServiceTotalRequests"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Total number of valid KMS requests.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INFO_KEY_KMS_FAILED_REQUESTS"></a><a id="sl_info_key_kms_failed_requests"></a><dl>
 * <dt><b>SL_INFO_KEY_KMS_FAILED_REQUESTS</b></dt>
 * <dt>L"KeyManagementServiceFailedRequests"</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Total number of failed KMS requests.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<SLDATATYPE>} peDataType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a>*</b>
 * 
 * A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the ppbValue buffer.  The following values are valid.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_SZ"></a><a id="sl_data_sz"></a><dl>
 * <dt><b>SL_DATA_SZ</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * UNICODE string
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_DWORD"></a><a id="sl_data_dword"></a><dl>
 * <dt><b>SL_DATA_DWORD</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * DWORD
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DATA_BINARY"></a><a id="sl_data_binary"></a><dl>
 * <dt><b>SL_DATA_BINARY</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Binary blob
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pcbValue Type: <b>UINT*</b>
 * 
 * A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
 * @param {Pointer<Pointer<Integer>>} ppbValue Type: <b>PBYTE*</b>
 * 
 * If successful, the data is returned in the buffer allocated by the SLC.       
 * 		When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are  not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value for the input key was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetapplicationinformation
 * @since windows8.0
 */
export SLGetApplicationInformation(hSLC, pApplicationId, pwszValueName, peDataType, pcbValue, ppbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
    ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetApplicationInformation", hSLCMarshal, hSLC, Guid.Ptr, pApplicationId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "HRESULT")
    return result
}

/**
 * Acquires a use license from the Software License Server (SLS).
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 *  A pointer to the product ID.
 * @param {Integer} cbAppSpecificData Type: <b>UINT</b>
 * 
 * The size of application specific data.
 * @param {Pointer<Void>} pvAppSpecificData Type: <b>const PVOID</b>
 * 
 * A pointer to application specific data. The license server can use this     
 * 		information to embed application specific run-time information.
 * @param {Pointer<SL_ACTIVATION_INFO_HEADER>} pActivationInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_activation_info_header">SL_ACTIVATION_INFO_HEADER</a>*</b>
 * 
 * A pointer to additional product activation information.
 * @param {PWSTR} pwszProxyServer Type: <b>PCWSTR</b>
 * 
 * The proxy server name. Set this to <b>NULL</b> to use automatic proxy discovery.
 * @param {Integer} wProxyPort Type: <b>WORD</b>
 * 
 * The proxy server port. To use the default port, set <i>wProxyPort</i> to 0.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PUBLISHING_LICENSE_NOT_INSTALLED</b></dt>
 * <dt>0xC004F017</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license is not installed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
 * <dt>0xC004F014
 * </dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The product key is not available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED</b></dt>
 * <dt>0xc004f015</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license is not installed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slactivateproduct
 * @since windows8.0
 */
export SLActivateProduct(hSLC, pProductSkuId, cbAppSpecificData, pvAppSpecificData, pActivationInfo, pwszProxyServer, wProxyPort) {
    pwszProxyServer := pwszProxyServer is String ? StrPtr(pwszProxyServer) : pwszProxyServer

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    pvAppSpecificDataMarshal := pvAppSpecificData is VarRef ? "ptr" : "ptr"

    result := DllCall("slcext.dll\SLActivateProduct", hSLCMarshal, hSLC, Guid.Ptr, pProductSkuId, "uint", cbAppSpecificData, pvAppSpecificDataMarshal, pvAppSpecificData, SL_ACTIVATION_INFO_HEADER.Ptr, pActivationInfo, "ptr", pwszProxyServer, "ushort", wProxyPort, "HRESULT")
    return result
}

/**
 * Checks the server status according to the specified URL and RequestType.
 * @remarks
 * Callers can either pass in the URL kept by themselves or get the SKU    
 * 	specific URL by calling the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slgetproductskuinformation">GetProductSkuInformation</a> function and query each     
 * 	URL.
 * @param {PWSTR} pwszServerURL Type: <b>PCWSTR</b>
 * 
 * The URL of the server.
 * @param {PWSTR} pwszAcquisitionType Type: <b>PCWSTR</b>
 * 
 * The acquisition type.
 * @param {PWSTR} pwszProxyServer Type: <b>PCWSTR</b>
 * 
 * The proxy server name. Set to <b>NULL</b> for automatic proxy discovery.
 * @param {Integer} wProxyPort Type: <b>WORD</b>
 * 
 * The proxy server port. Set to 0 to use the default port.
 * @returns {HRESULT} Type: <b>HRESULT*</b>
 * 
 * A pointer to the server status.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetserverstatus
 * @since windows8.0
 */
export SLGetServerStatus(pwszServerURL, pwszAcquisitionType, pwszProxyServer, wProxyPort) {
    pwszServerURL := pwszServerURL is String ? StrPtr(pwszServerURL) : pwszServerURL
    pwszAcquisitionType := pwszAcquisitionType is String ? StrPtr(pwszAcquisitionType) : pwszAcquisitionType
    pwszProxyServer := pwszProxyServer is String ? StrPtr(pwszProxyServer) : pwszProxyServer

    result := DllCall("slcext.dll\SLGetServerStatus", "ptr", pwszServerURL, "ptr", pwszAcquisitionType, "ptr", pwszProxyServer, "ushort", wProxyPort, "int*", &phrStatus := 0, "HRESULT")
    return phrStatus
}

/**
 * Generates the Installation ID (IID).
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer to the product ID.
 * @returns {PWSTR} Type: <b>PWSTR*</b>
 * 
 * The Installation ID string. Once you are finished, call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to      
 * 		free the memory.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgenerateofflineinstallationid
 * @since windows8.0
 */
export SLGenerateOfflineInstallationId(hSLC, pProductSkuId) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLGenerateOfflineInstallationId", hSLCMarshal, hSLC, Guid.Ptr, pProductSkuId, PWSTR.Ptr, &ppwszInstallationId := 0, "HRESULT")
    return ppwszInstallationId
}

/**
 * Generates Installation ID (IID).
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer the product ID.
 * @param {Pointer<SL_ACTIVATION_INFO_HEADER>} pActivationInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_activation_info_header">SL_ACTIVATION_INFO_HEADER</a>*</b>
 * 
 * A pointer to additional information.
 * @returns {PWSTR} Type: <b>PWSTR*</b>
 * 
 * The Installation ID string. Once you are finished, call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to      
 * 		free the memory.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgenerateofflineinstallationidex
 * @since windows8.0
 */
export SLGenerateOfflineInstallationIdEx(hSLC, pProductSkuId, pActivationInfo) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLGenerateOfflineInstallationIdEx", hSLCMarshal, hSLC, Guid.Ptr, pProductSkuId, SL_ACTIVATION_INFO_HEADER.Ptr, pActivationInfo, PWSTR.Ptr, &ppwszInstallationId := 0, "HRESULT")
    return ppwszInstallationId
}

/**
 * Deposits Installation ID (IID) and Confirmation ID (CID) for offline activation. (SLDepositOfflineConfirmationId)
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer to the product ID.
 * @param {PWSTR} pwszInstallationId Type: <b>PCWSTR</b>
 * 
 * The Installation ID generated by the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slgenerateofflineinstallationid">SLGenerateOfflineInstallationId</a> function.
 * @param {PWSTR} pwszConfirmationId Type: <b>PCWSTR</b>
 * 
 * The confirmation ID CSR.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_CIDIID_INVALID_CHECK_DIGITS</b></dt>
 * <dt>0xC004F04D</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Installation ID (IID) or the Confirmation ID (CID) is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED</b></dt>
 * <dt>0xC004F015</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license is not installed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-sldepositofflineconfirmationid
 * @since windows8.0
 */
export SLDepositOfflineConfirmationId(hSLC, pProductSkuId, pwszInstallationId, pwszConfirmationId) {
    pwszInstallationId := pwszInstallationId is String ? StrPtr(pwszInstallationId) : pwszInstallationId
    pwszConfirmationId := pwszConfirmationId is String ? StrPtr(pwszConfirmationId) : pwszConfirmationId

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLDepositOfflineConfirmationId", hSLCMarshal, hSLC, Guid.Ptr, pProductSkuId, "ptr", pwszInstallationId, "ptr", pwszConfirmationId, "HRESULT")
    return result
}

/**
 * Deposits Installation ID (IID) and Confirmation ID (CID) for offline activation. (SLDepositOfflineConfirmationIdEx)
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer to the product ID.
 * @param {Pointer<SL_ACTIVATION_INFO_HEADER>} pActivationInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_activation_info_header">SL_ACTIVATION_INFO_HEADER</a>*</b>
 * 
 * A pointer to additional information.
 * @param {PWSTR} pwszInstallationId Type: <b>PCWSTR</b>
 * 
 * The Installation ID generated by the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slgenerateofflineinstallationid">SLGenerateOfflineInstallationId</a> function.
 * @param {PWSTR} pwszConfirmationId Type: <b>PCWSTR</b>
 * 
 * The Confirmation ID CSR.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_CIDIID_INVALID_CHECK_DIGITS</b></dt>
 * <dt>0xC004F04D</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Installation ID (IID) or the Confirmation ID (CID) is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PRODUCT_SKU_NOT_INSTALLED</b></dt>
 * <dt>0xC004F015</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license is not installed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-sldepositofflineconfirmationidex
 * @since windows8.0
 */
export SLDepositOfflineConfirmationIdEx(hSLC, pProductSkuId, pActivationInfo, pwszInstallationId, pwszConfirmationId) {
    pwszInstallationId := pwszInstallationId is String ? StrPtr(pwszInstallationId) : pwszInstallationId
    pwszConfirmationId := pwszConfirmationId is String ? StrPtr(pwszConfirmationId) : pwszConfirmationId

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLDepositOfflineConfirmationIdEx", hSLCMarshal, hSLC, Guid.Ptr, pProductSkuId, SL_ACTIVATION_INFO_HEADER.Ptr, pActivationInfo, "ptr", pwszInstallationId, "ptr", pwszConfirmationId, "HRESULT")
    return result
}

/**
 * Gets the registered product key ID associated with the product.
 * @param {Pointer<Void>} hSLC The handle to the current SLC context.
 * @param {PWSTR} pwszPKeyAlgorithm The product key algorithm.
 * @param {PWSTR} pwszPKeyString The product key string.
 * @param {Integer} cbPKeySpecificData The size, in bytes, of the product key specific data. If there is no PKey specific data, set <i>cbPKeySpecificData</i> to 0.
 * @param {Integer} pbPKeySpecificData A pointer to the product key specific data. If there is no PKey specific data, set <i>pbPKeySpecificData</i> to <b>NULL</b>.
 * @param {Pointer<Guid>} pPKeyId A pointer to the product key ID.
 * @returns {HRESULT} If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
 * <dt>0xC004F014</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The product key is not available.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetpkeyid
 * @since windows8.0
 */
export SLGetPKeyId(hSLC, pwszPKeyAlgorithm, pwszPKeyString, cbPKeySpecificData, pbPKeySpecificData, pPKeyId) {
    pwszPKeyAlgorithm := pwszPKeyAlgorithm is String ? StrPtr(pwszPKeyAlgorithm) : pwszPKeyAlgorithm
    pwszPKeyString := pwszPKeyString is String ? StrPtr(pwszPKeyString) : pwszPKeyString

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLGetPKeyId", hSLCMarshal, hSLC, "ptr", pwszPKeyAlgorithm, "ptr", pwszPKeyString, "uint", cbPKeySpecificData, "ptr", pbPKeySpecificData, Guid.Ptr, pPKeyId, "HRESULT")
    return result
}

/**
 * This function returns a list of product key IDs associated with the specified Product SKU ID.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC session.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer to the product SKU ID.
 * @param {Pointer<Integer>} pnProductKeyIds Type: <b>UINT*</b>
 * 
 * A pointer to the number of product Key IDs returned.
 * @param {Pointer<Pointer<Guid>>} ppProductKeyIds Type: <b>SLID**</b>
 * 
 * A pointer to an array of the product Key IDs.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value for the input key was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetinstalledproductkeyids
 * @since windows8.0
 */
export SLGetInstalledProductKeyIds(hSLC, pProductSkuId, pnProductKeyIds, ppProductKeyIds) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    pnProductKeyIdsMarshal := pnProductKeyIds is VarRef ? "uint*" : "ptr"
    ppProductKeyIdsMarshal := ppProductKeyIds is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetInstalledProductKeyIds", hSLCMarshal, hSLC, Guid.Ptr, pProductSkuId, pnProductKeyIdsMarshal, pnProductKeyIds, ppProductKeyIdsMarshal, ppProductKeyIds, "HRESULT")
    return result
}

/**
 * Sets the current product key to the previously installed product key.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pProductSkuId Type: <b>const SLID*</b>
 * 
 * A pointer to the product SKU ID.
 * @param {Pointer<Guid>} pProductKeyId Type: <b>const SLID*</b>
 * 
 * A pointer to the product key ID.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_MISMATCHED_PRODUCT_SKU</b></dt>
 * <dt>0xC004F069</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The product SKU is not found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_PKEY_NOT_INSTALLED</b></dt>
 * <dt>0xC004F014</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The product key is not available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_OPERATION_NOT_ALLOWED</b></dt>
 * <dt>0xC004F06A</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested operation is not allowed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slsetcurrentproductkey
 * @since windows8.0
 */
export SLSetCurrentProductKey(hSLC, pProductSkuId, pProductKeyId) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLSetCurrentProductKey", hSLCMarshal, hSLC, Guid.Ptr, pProductSkuId, Guid.Ptr, pProductKeyId, "HRESULT")
    return result
}

/**
 * Gets a list of SLIDs according to the input query ID type and the ID value.
 * @remarks
 * The following queries combinations are supported.
 * 
 * 
 * <table>
 * <tr>
 * <th>eQueryIdType</th>
 * <th>pQueryId</th>
 * <th>eReturnIdType</th>
 * <th>Results</th>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_APPLICATION</b>
 * 
 * </td>
 * <td>
 * SLID_ALL
 * 
 * </td>
 * <td>
 * <b>SL_ID_APPLICATION</b>
 * 
 * </td>
 * <td>
 * Get all installed application IDs.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_PRODUCT_SKU</b>
 * 
 * </td>
 * <td>
 * SLID_ALL
 * 
 * </td>
 * <td>
 * <b>SL_ID_PRODUCT_SKU</b>
 * 
 * </td>
 * <td>
 * Get all installed product SKU IDs.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_APPLICATION</b>
 * 
 * </td>
 * <td>
 * appId
 * 
 * </td>
 * <td>
 * <b>SL_ID_PRODUCT_SKU</b>
 * 
 * </td>
 * <td>
 * Get SKU IDs according to the input application ID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_PRODUCT_SKU</b>
 * 
 * </td>
 * <td>
 * skuId
 * 
 * </td>
 * <td>
 * <b>SL_ID_APPLICATION</b>
 * 
 * </td>
 * <td>
 * Get application IDs according to the input SKU ID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_PRODUCT_SKU</b>
 * 
 * </td>
 * <td>
 * skuId
 * 
 * </td>
 * <td>
 * <b>SL_ID_PKEY</b>
 * 
 * </td>
 * <td>
 * Get license PKey IDs according to the input SKU ID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_PRODUCT_SKU</b>
 * 
 * </td>
 * <td>
 * skuId
 * 
 * </td>
 * <td>
 * <b>SL_ID_LICENSE_FILE</b>
 * 
 * </td>
 * <td>
 * Get license file Ids according to the input SKU ID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_LICENSE_FILE</b>
 * 
 * </td>
 * <td>
 * fileId
 * 
 * </td>
 * <td>
 * <b>SL_ID_LICENSE</b>
 * 
 * </td>
 * <td>
 * Get license IDs according to the input license file ID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_LICENSE</b>
 * 
 * </td>
 * <td>
 * LicenseId
 * 
 * </td>
 * <td>
 * <b>SL_ID_LICENSE_FILE</b>
 * 
 * </td>
 * <td>
 * Get license file ID according to the input license ID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_LICENSE</b>
 * 
 * </td>
 * <td>
 * LicenseId
 * 
 * </td>
 * <td>
 * <b>SL_ID_APPLICATION</b>
 * 
 * </td>
 * <td>
 * Get union of all application IDs or SKU IDs from all grants of   
 * 			a token activation license. Returns <b>SL_E_NOT_SUPPORTED</b>   
 * 			if the license ID is valid but doesn't refer to a token   
 * 			activation license.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>SL_ID_LICENSE</b>
 * 
 * </td>
 * <td>
 * LicenseId
 * 
 * </td>
 * <td>
 * <b>SL_ID_PRODUCT_SKU</b>
 * 
 * </td>
 * <td>
 * Get union of all application IDs or SKU IDs from all grants of   
 * 			a token activation license. Returns <b>SL_E_NOT_SUPPORTED</b>   
 * 			if the license ID is valid but doesn't refer to a token   
 * 			activation license.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {SLIDTYPE} eQueryIdType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-slidtype">SLIDTYPE</a></b>
 * 
 * The type of input ID.
 * @param {Pointer<Guid>} pQueryId Type: <b>const SLID*</b>
 * 
 * A pointer to the input ID.
 * @param {SLIDTYPE} eReturnIdType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-slidtype">SLIDTYPE</a></b>
 * 
 * The type of returned IDs.
 * @param {Pointer<Integer>} pnReturnIds Type: <b>UINT*</b>
 * 
 * A pointer to the number of returned IDs.
 * @param {Pointer<Pointer<Guid>>} ppReturnIds Type: <b>SLID**</b>
 * 
 * An array of returned IDs.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value for the input key was not found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_NOT_SUPPORT</b></dt>
 * <dt>0xC004F016</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetslidlist
 * @since windows8.0
 */
export SLGetSLIDList(hSLC, eQueryIdType, pQueryId, eReturnIdType, pnReturnIds, ppReturnIds) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    pnReturnIdsMarshal := pnReturnIds is VarRef ? "uint*" : "ptr"
    ppReturnIdsMarshal := ppReturnIds is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetSLIDList", hSLCMarshal, hSLC, SLIDTYPE, eQueryIdType, Guid.Ptr, pQueryId, SLIDTYPE, eReturnIdType, pnReturnIdsMarshal, pnReturnIds, ppReturnIdsMarshal, ppReturnIds, "HRESULT")
    return result
}

/**
 * Checks if the license BLOB has been installed already.
 * @param {Pointer<Void>} hSLC The handle to the current SLC context.
 * @param {Integer} cbLicenseBlob The size, in bytes, of the license BLOB.
 * @param {Integer} pbLicenseBlob A pointer to the number of licenses in the BLOB.
 * @param {Pointer<Guid>} pLicenseFileId A pointer to the license file ID.
 * @returns {HRESULT} If the License has been previously installed, it returns a <b>SLID</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_INVALID_LICENSE</b></dt>
 * <dt>0xC004F01F</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_LICENSE_FILE_NOT_INSTALLED</b></dt>
 * <dt>0xC004F011</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license file is not installed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetlicensefileid
 * @since windows8.0
 */
export SLGetLicenseFileId(hSLC, cbLicenseBlob, pbLicenseBlob, pLicenseFileId) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLGetLicenseFileId", hSLCMarshal, hSLC, "uint", cbLicenseBlob, "ptr", pbLicenseBlob, Guid.Ptr, pLicenseFileId, "HRESULT")
    return result
}

/**
 * Returns the license file BLOB.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {Pointer<Guid>} pLicenseFileId Type: <b>const SLID*</b>
 * 
 * A pointer to the license file ID.
 * @param {Pointer<Integer>} pcbLicenseFile Type: <b>UINT*</b>
 * 
 * A pointer to the size, in bytes, of the license file BLOB.
 * @param {Pointer<Pointer<Integer>>} ppbLicenseFile Type: <b>PBYTE*</b>
 * 
 * The license file BLOB.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_LICENSE_FILE_NOT_INSTALLED</b></dt>
 * <dt>0xC004F011</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The license file is not installed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetlicense
 * @since windows8.0
 */
export SLGetLicense(hSLC, pLicenseFileId, pcbLicenseFile, ppbLicenseFile) {
    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"
    pcbLicenseFileMarshal := pcbLicenseFile is VarRef ? "uint*" : "ptr"
    ppbLicenseFileMarshal := ppbLicenseFile is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetLicense", hSLCMarshal, hSLC, Guid.Ptr, pLicenseFileId, pcbLicenseFileMarshal, pcbLicenseFile, ppbLicenseFileMarshal, ppbLicenseFile, "HRESULT")
    return result
}

/**
 * Sends a specified event to a registered listener.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC context.
 * @param {PWSTR} pwszEventId Type: <b>PCWSTR</b>
 * 
 * The ID of the event to be fired.
 * @param {Pointer<Guid>} pApplicationId Type: <b>const SLID*</b>
 * 
 * A pointer to the application ID.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_ACCESSDENIED</b></dt>
 * <dt>0x80070005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Access denied (API requires admin privileges).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_INVALID_EVENT_ID</b></dt>
 * <dt>0xC004F019</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested event ID is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_EVENT_NOT_REGISTERED</b></dt>
 * <dt>0xC004F01A</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested event is not registered with the service.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slfireevent
 * @since windows8.0
 */
export SLFireEvent(hSLC, pwszEventId, pApplicationId) {
    pwszEventId := pwszEventId is String ? StrPtr(pwszEventId) : pwszEventId

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLFireEvent", hSLCMarshal, hSLC, "ptr", pwszEventId, Guid.Ptr, pApplicationId, "HRESULT")
    return result
}

/**
 * Registers an event in the SL service.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC session.
 * @param {PWSTR} pwszEventId Type: <b>PCWSTR</b>
 * 
 * The predefined SL event identifier.
 * @param {Pointer<Guid>} pApplicationId Type: <b>const SLID*</b>
 * 
 * A pointer to the  application ID to which the event will be registered.
 * @param {HANDLE} hEvent Type: <b>HANDLE</b>
 * 
 *  The event handle used for notification.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_INVALID_EVENT_ID</b></dt>
 * <dt>0xC004F019</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested event ID is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slregisterevent
 * @since windows8.0
 */
export SLRegisterEvent(hSLC, pwszEventId, pApplicationId, hEvent) {
    pwszEventId := pwszEventId is String ? StrPtr(pwszEventId) : pwszEventId

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLRegisterEvent", hSLCMarshal, hSLC, "ptr", pwszEventId, Guid.Ptr, pApplicationId, HANDLE, hEvent, "HRESULT")
    return result
}

/**
 * Unregisters a registered event in the SL service.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle to the current SLC session.
 * @param {PWSTR} pwszEventId Type: <b>PCWSTR</b>
 * 
 * The predefined SL event identifier that will be unregistered.
 * @param {Pointer<Guid>} pApplicationId Type: <b>const SLID*</b>
 * 
 * A pointer to the application ID that the event will be unregistered from.
 * @param {HANDLE} hEvent Type: <b>HANDLE</b>
 * 
 * The registered event handle.
 * @returns {HRESULT} Type: <b>HRESULT WINAPI</b>
 * 
 * If this function succeeds, it return <b>S_OK</b>.  Otherwise,  it returns an <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_INVALID_EVENT_ID</b></dt>
 * <dt>0xC004F019</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested event ID is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_EVENT_NOT_REGISTERED</b></dt>
 * <dt>0xC004F01A</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested event is not registered with the service.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slunregisterevent
 * @since windows8.0
 */
export SLUnregisterEvent(hSLC, pwszEventId, pApplicationId, hEvent) {
    pwszEventId := pwszEventId is String ? StrPtr(pwszEventId) : pwszEventId

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("SLC.dll\SLUnregisterEvent", hSLCMarshal, hSLC, "ptr", pwszEventId, Guid.Ptr, pApplicationId, HANDLE, hEvent, "HRESULT")
    return result
}

/**
 * Retrieves the value portion of a name-value pair from the licensing policy of a software component.
 * @param {PWSTR} pwszValueName A pointer to a null-terminated string that contains the name associated with the value to retrieve.
 * @param {Pointer<SLDATATYPE>} peDataType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
 * @param {Pointer<Integer>} pcbValue A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
 * @param {Pointer<Pointer<Integer>>} ppbValue A pointer to an array of <b>BYTE</b> pointers that specifies the value associated with the name specified by the <i>pwszValueName</i> parameter.
 * 
 * When you have finished using this array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
 * 
 * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
 * 
 * This function can return the following values defined in Slerror.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified name-value pair was not found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_RIGHT_NOT_GRANTED</b></dt>
 * <dt>0xC004F013</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the permissions necessary to call this function.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetwindowsinformation
 * @since windows6.0.6000
 */
export SLGetWindowsInformation(pwszValueName, peDataType, pcbValue, ppbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
    ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetWindowsInformation", "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "HRESULT")
    return result
}

/**
 * Retrieves the DWORD value portion of a name-value pair from the licensing policy of a software component.
 * @param {PWSTR} pwszValueName A pointer to a null-terminated string that contains the name associated with the value to retrieve.
 * @returns {Integer} A pointer to the value associated with the name specified by the <i>pwszValueName</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetwindowsinformationdword
 * @since windows6.0.6000
 */
export SLGetWindowsInformationDWORD(pwszValueName) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    result := DllCall("SLC.dll\SLGetWindowsInformationDWORD", "ptr", pwszValueName, "uint*", &pdwValue := 0, "HRESULT")
    return pdwValue
}

/**
 * Checks whether the specified application is a genuine Windows installation.
 * @remarks
 * This function checks the <b>Tampered</b> flag of the license associated with the specified application. If the license is not valid, or if the <b>Tampered</b> flag of the license is set, the installation is not considered valid.
 * @param {Pointer<Guid>} pAppId A pointer to an <b>SLID</b> structure that specifies the application to check.
 * @param {Pointer<SL_NONGENUINE_UI_OPTIONS>} pUIOptions A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_nongenuine_ui_options">SL_NONGENUINE_UI_OPTIONS</a> structure that specifies a dialog box to display if the installation is not genuine. If the value of this parameter is <b>NULL</b>, no dialog box is displayed.
 * @returns {SL_GENUINE_STATE} A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sl_genuine_state">SL_GENUINE_STATE</a> enumeration that specifies the state of the installation.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slisgenuinelocal
 * @since windows6.0.6000
 */
export SLIsGenuineLocal(pAppId, pUIOptions) {
    result := DllCall("SLWGA.dll\SLIsGenuineLocal", Guid.Ptr, pAppId, "int*", &pGenuineState := 0, SL_NONGENUINE_UI_OPTIONS.Ptr, pUIOptions, "HRESULT")
    return pGenuineState
}

/**
 * Gets a XrML genuine ticket acquired from the Software Licensing Server (SLS).
 * @param {Pointer<Pointer<Void>>} ppTicketBlob The address of a pointer to a buffer that receives the ticket BLOB. When you have finished using this buffer, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @param {Pointer<Integer>} pcbTicketBlob A pointer to the size, in bytes, of the <i>ppTicketBlob</i> buffer.
 * @param {PWSTR} pwszTemplateId A pointer to a null-terminated string that contains the ID of the BLOB template stored on the SLS.
 * @param {PWSTR} pwszServerUrl A pointer to a null-terminated string that contains the URL of the SLS.
 * @param {PWSTR} pwszClientToken Reserved.
 * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
 * 
 * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slacquiregenuineticket
 * @since windows6.0.6000
 */
export SLAcquireGenuineTicket(ppTicketBlob, pcbTicketBlob, pwszTemplateId, pwszServerUrl, pwszClientToken) {
    pwszTemplateId := pwszTemplateId is String ? StrPtr(pwszTemplateId) : pwszTemplateId
    pwszServerUrl := pwszServerUrl is String ? StrPtr(pwszServerUrl) : pwszServerUrl
    pwszClientToken := pwszClientToken is String ? StrPtr(pwszClientToken) : pwszClientToken

    ppTicketBlobMarshal := ppTicketBlob is VarRef ? "ptr*" : "ptr"
    pcbTicketBlobMarshal := pcbTicketBlob is VarRef ? "uint*" : "ptr"

    result := DllCall("slcext.dll\SLAcquireGenuineTicket", ppTicketBlobMarshal, ppTicketBlob, pcbTicketBlobMarshal, pcbTicketBlob, "ptr", pwszTemplateId, "ptr", pwszServerUrl, "ptr", pwszClientToken, "HRESULT")
    return result
}

/**
 * Specifies information about the genuine status of a Windows computer. (SLSetGenuineInformation)
 * @param {Pointer<Guid>} pQueryId A pointer to an <b>SLID</b> structure that specifies the application for which to set information.
 * @param {PWSTR} pwszValueName A pointer to a null-terminated string that contains the name associated with the value to set. The following names are valid.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_BRT_DATA"></a><a id="sl_brt_data"></a><dl>
 * <dt><b>SL_BRT_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Set information about the genuine state of the computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_BRT_COMMIT"></a><a id="sl_brt_commit"></a><dl>
 * <dt><b>SL_BRT_COMMIT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If the <b>SL_BRT_DATA</b> value  is set, setting <b>SL_BRT_COMMIT</b> puts the computer in nongenuine grace period mode.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {SLDATATYPE} eDataType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>pbValue</i> buffer.
 * @param {Integer} cbValue A pointer to the size, in bytes, of the <i>pbValue</i> buffer.
 * @param {Integer} pbValue A pointer to an array of <b>BYTE</b> values that specify the value associated with the name specified by the <i>pwszValueName</i> parameter.
 * 
 * Some name-value pairs allow this parameter to be <b>NULL</b>. In this case, the existing value of the name-value pair is deleted.
 * 
 * When you have finished using this array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
 * 
 * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
 * 
 * This function can return the following values defined in Winerror.h and Slerror.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_ACCESS_DENIED</b></dt>
 * <dt>0x80070005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have administrative privileges.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80000003</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbValue</i> parameter cannot be <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>(HRESULT_FROM_WIN32)ERROR_BUFFER_OVERFLOW</b></dt>
 * <dt>0x111</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbValue</i> buffer is too small to hold the data.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_DATATYPE_MISMATCHED</b></dt>
 * <dt>0xC004F01E</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The data type of the <i>pbValue</i> parameter does not match the type specified by the <i>eDataType</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_DEPENDENT_PROPERTY_NOT_SET</b></dt>
 * <dt>0xC004F066</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified name-value pair is dependent on a name-value pair that has not been set.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_NOT_SUPPORTED</b></dt>
 * <dt>0xC004F016</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The name specified by the <i>pwszValueName</i> parameter is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slsetgenuineinformation
 * @since windows6.0.6000
 */
export SLSetGenuineInformation(pQueryId, pwszValueName, eDataType, cbValue, pbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    result := DllCall("SLC.dll\SLSetGenuineInformation", Guid.Ptr, pQueryId, "ptr", pwszValueName, SLDATATYPE, eDataType, "uint", cbValue, "ptr", pbValue, "HRESULT")
    return result
}

/**
 * Gets referral information for the specified product.
 * @param {Pointer<Void>} hSLC Type: <b>HSLC</b>
 * 
 * The handle retrieved by previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slopen">SLOpen</a> function.
 * @param {SLREFERRALTYPE} eReferralType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-slreferraltype">SLREFERRALTYPE</a></b>
 * 
 * The referral type.
 * @param {Pointer<Guid>} pSkuOrAppId Type: <b>const SLID*</b>
 * 
 * A pointer to the <b>SLID</b> of the application or SKU from which to obtain information.
 * @param {PWSTR} pwszValueName Type: <b>PCWSTR</b>
 * 
 * The name associated with the value to retrieve.  The following names are valid.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_PARTNERID"></a><a id="sl_partnerid"></a><dl>
 * <dt><b>SL_PARTNERID</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Partner ID for the license reseller
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_REFERRALID"></a><a id="sl_referralid"></a><dl>
 * <dt><b>SL_REFERRALID</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Referral ID for the license reseller
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_MERCHANTCOMMERCEURL"></a><a id="sl_merchantcommerceurl"></a><dl>
 * <dt><b>SL_MERCHANTCOMMERCEURL</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The merchant URL to purchase additional licenses
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_MERCHANTUPGRADEURL"></a><a id="sl_merchantupgradeurl"></a><dl>
 * <dt><b>SL_MERCHANTUPGRADEURL</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The merchant URL to purchase additional licenses
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_DOWNLOADURL"></a><a id="sl_downloadurl"></a><dl>
 * <dt><b>SL_DOWNLOADURL</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A forward link to download the associated application
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_INSTALLATIONPARAMETERS"></a><a id="sl_installationparameters"></a><dl>
 * <dt><b>SL_INSTALLATIONPARAMETERS</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Any parameters that are used when running the associated application's installer
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_MERCHANTSUPPORTPHONENUMBER"></a><a id="sl_merchantsupportphonenumber"></a><dl>
 * <dt><b>SL_MERCHANTSUPPORTPHONENUMBER</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The merchant support phone number(s)
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_MERCHANTSUPPORTEMAIL"></a><a id="sl_merchantsupportemail"></a><dl>
 * <dt><b>SL_MERCHANTSUPPORTEMAIL</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The merchant support email address
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_MERCHANTSUPPORTURL"></a><a id="sl_merchantsupporturl"></a><dl>
 * <dt><b>SL_MERCHANTSUPPORTURL</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The merchant support URL
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_SERIALIZEDDATA"></a><a id="sl_serializeddata"></a><dl>
 * <dt><b>SL_SERIALIZEDDATA</b></dt>
 * <dt></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A generic data BLOB
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {PWSTR} Type: <b>PWSTR*</b>
 * 
 * The value to store. When finished using the memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetreferralinformation
 * @since windows8.0
 */
export SLGetReferralInformation(hSLC, eReferralType, pSkuOrAppId, pwszValueName) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    hSLCMarshal := hSLC is VarRef ? "ptr" : "ptr"

    result := DllCall("slcext.dll\SLGetReferralInformation", hSLCMarshal, hSLC, SLREFERRALTYPE, eReferralType, Guid.Ptr, pSkuOrAppId, "ptr", pwszValueName, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * Gets information about the genuine state of a Windows computer.
 * @param {Pointer<Guid>} pQueryId A pointer to an <b>SLID</b> structure that specifies the application to check.
 * @param {PWSTR} pwszValueName A pointer to a null-terminated string that contains the name associated with the value to retrieve. The following names are valid.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_BRT_DATA"></a><a id="sl_brt_data"></a><dl>
 * <dt><b>SL_BRT_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Get a value that specifies whether the computer is genuine.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_BRT_COMMIT"></a><a id="sl_brt_commit"></a><dl>
 * <dt><b>SL_BRT_COMMIT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Get a value that specifies whether the computer is in nongenuine grace period mode.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_GENUINE_RESULT"></a><a id="sl_genuine_result"></a><dl>
 * <dt><b>SL_GENUINE_RESULT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Get the value returned from the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slacquiregenuineticket">SLAcquireGenuineTicket</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SL_NONGENUINE_GRACE_FLAG"></a><a id="sl_nongenuine_grace_flag"></a><dl>
 * <dt><b>SL_NONGENUINE_GRACE_FLAG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Gets the cause of the computer being put into nongenuine grace period mode.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<SLDATATYPE>} peDataType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sldatatype">SLDATATYPE</a> enumeration that specifies the type of data in the <i>ppbValue</i> buffer.
 * @param {Pointer<Integer>} pcbValue A pointer to the size, in bytes, of the <i>ppbValue</i> buffer.
 * @param {Pointer<Pointer<Integer>>} ppbValue The address of a pointer to an array of <b>BYTE</b> pointers that specifies the value associated with the name specified by the <i>pwszValueName</i> parameter.
 * 
 * When you have finished using this array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
 * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
 * 
 * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
 * 
 * This function can return the following values defined in Slerror.h.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_NOT_SUPPORTED</b></dt>
 * <dt>0xC004F016</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The name specified by the <i>pwszValueName</i> parameter is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified name-value pair was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slgetgenuineinformation
 * @since windows6.0.6000
 */
export SLGetGenuineInformation(pQueryId, pwszValueName, peDataType, pcbValue, ppbValue) {
    pwszValueName := pwszValueName is String ? StrPtr(pwszValueName) : pwszValueName

    peDataTypeMarshal := peDataType is VarRef ? "uint*" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"
    ppbValueMarshal := ppbValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("SLC.dll\SLGetGenuineInformation", Guid.Ptr, pQueryId, "ptr", pwszValueName, peDataTypeMarshal, peDataType, pcbValueMarshal, pcbValue, ppbValueMarshal, ppbValue, "HRESULT")
    return result
}

/**
 * Gets the value for the specified component policy.
 * @remarks
 * Your app must have the restricted slapiQueryLicenseValue capability to call the <b>SLQueryLicenseValueFromApp</b> function.
 * @param {PWSTR} _valueName The name of the policy for which you want to get information.
 * @param {Pointer<Integer>} valueType The data type of the policy value. The following table describes the values that this parameter can 
 *        receive.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>REG_DWORD</td>
 * <td>A 32-bit integer.  For this type, the size of the buffer that the <i>dataBuffer</i> 
 *          parameter specifies should be at least 4 bytes.</td>
 * </tr>
 * <tr>
 * <td>REG_BINARY</td>
 * <td>A binary value.</td>
 * </tr>
 * <tr>
 * <td>REG_SZ</td>
 * <td>A wide-character, null-terminated string, including the last null character.</td>
 * </tr>
 * </table>
 * @param {Integer} dataBuffer A buffer that receives the value of the component policy.
 * @param {Integer} dataSize The size of the supplied buffer, in bytes.
 * @param {Pointer<Integer>} resultDataSize The actual size of the data received for the policy value, in bytes.
 * @returns {HRESULT} If this function succeeds, it return <b>S_OK</b>.  Otherwise, it returns an 
 *       <b>HRESULT</b> error code.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * <dt>0x80070057</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>SL_E_VALUE_NOT_FOUND</b></dt>
 * <dt>0xC004F012</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified name-value pair was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/nf-slpublic-slquerylicensevaluefromapp
 * @since windows10.0.10240
 */
export SLQueryLicenseValueFromApp(_valueName, valueType, dataBuffer, dataSize, resultDataSize) {
    _valueName := _valueName is String ? StrPtr(_valueName) : _valueName

    valueTypeMarshal := valueType is VarRef ? "uint*" : "ptr"
    resultDataSizeMarshal := resultDataSize is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-core-slapi-l1-1-0.dll\SLQueryLicenseValueFromApp", "ptr", _valueName, valueTypeMarshal, valueType, "ptr", dataBuffer, "uint", dataSize, resultDataSizeMarshal, resultDataSize, "HRESULT")
    return result
}

/**
 * Simulates a secure attention sequence (SAS).
 * @remarks
 * To successfully call the <b>SendSAS</b> function, an application must either be running as a service or have the <b>uiAccess</b> attribute of the <b>requestedExecutionLevel</b> element set to "true" in its application manifest. If an application is not running as a service, it must be running as either the current user or the LocalSystem account to call <b>SendSAS</b>. In addition, if an application is not running as a service, <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/user-account-control">User Account Control</a> must be turned on to call <b>SendSAS</b>. 
 * 
 * <div class="alert"><b>Important</b>  Applications with the <b>uiAccess</b> attribute set to "true" must be signed by using <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms537359(v=vs.85)">Authenticode</a>. In addition, the application must reside in a protected location in the file system. Currently, there are two allowable protected locations:<dl>
 * <dd><b>\Program Files\</b></dd>
 * <dd><b>\windows\system32\</b></dd>
 * </dl>
 * </div>
 * <div> </div>
 * The local security policy of a computer must be configured to allow services and applications to simulate a SAS. To configure the policy, modify settings in the Group Policy Editor (GPE) Microsoft Management Console (MMC) snap-in. The GPE settings that control delegation are in the following location:
 * 
 * <b>Computer Configuration | Administrative Templates | Windows Components | Windows Logon Options | Disable or enable software Secure Attention Sequence</b>
 * 
 * A service can impersonate the token of another process that calls that service. In this case, a call to the <b>SendSAS</b> function by that service simulates a SAS on the session associated with the impersonated token.
 * 
 * <b>Windows Server 2008 and Windows Vista:  </b>Sas.dll is not available natively. You must download the Windows 7 version of the Microsoft Windows Software Development Kit (SDK)  to use this function. In addition, an application must refer to Sas.dll to call this function.
 * @param {BOOL} AsUser <b>TRUE</b> if the caller is running as the current user; otherwise, <b>FALSE</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/sas/nf-sas-sendsas
 * @since windows6.1
 */
export SendSAS(AsUser) {
    DllCall("SAS.dll\SendSAS", BOOL, AsUser)
}

;@endregion Functions
