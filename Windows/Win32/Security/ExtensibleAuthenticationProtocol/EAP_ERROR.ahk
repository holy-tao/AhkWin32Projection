#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EAP_TYPE.ahk
#Include .\EAP_METHOD_TYPE.ahk

/**
 * Contains information about an error that occurred during an EAPHost operation.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_error
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_ERROR extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Error code from winerror.h.
     * @type {Integer}
     */
    dwWinError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that identifies the EAP method that raised the error.
     * @type {EAP_METHOD_TYPE}
     */
    type{
        get {
            if(!this.HasProp("__type"))
                this.__type := EAP_METHOD_TYPE(4, this)
            return this.__type
        }
    }

    /**
     * The reason code for the error.
     * @type {Integer}
     */
    dwReasonCode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A unique ID that identifies cause of error in EAPHost. An EAP method can define a new GUID and associate the GUID with a specific root cause.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Default"></a><a id="guid_eaphost_default"></a><a id="GUID_EAPHOST_DEFAULT"></a><dl>
     * <dt><b>GUID_EapHost_Default</b></dt>
     * <dt>{0x00000000, 0x0000, 0x0000, 0, 0, 0, 0, 0, 0, 0, 0}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The default error cause.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_MethodDLLNotFound"></a><a id="guid_eaphost_cause_methoddllnotfound"></a><a id="GUID_EAPHOST_CAUSE_METHODDLLNOTFOUND"></a><dl>
     * <dt><b>GUID_EapHost_Cause_MethodDLLNotFound</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 1}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost cannot locate the DLL for the EAP method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_EapNegotiationFailed"></a><a id="guid_eaphost_cause_eapnegotiationfailed"></a><a id="GUID_EAPHOST_CAUSE_EAPNEGOTIATIONFAILED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_EapNegotiationFailed</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x1C}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication failed because Windows does not have the authentication method required for this network. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_ThirdPartyMethod_Host_Reset"></a><a id="guid_eaphost_cause_thirdpartymethod_host_reset"></a><a id="GUID_EAPHOST_CAUSE_THIRDPARTYMETHOD_HOST_RESET"></a><dl>
     * <dt><b>GUID_EapHost_Cause_ThirdPartyMethod_Host_Reset</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 2, 0x12}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The host of the third party method is not responding and was automatically restarted. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_XmlMalformed"></a><a id="guid_eaphost_cause_xmlmalformed"></a><a id="GUID_EAPHOST_CAUSE_XMLMALFORMED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_XmlMalformed</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x1D}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The EAPHost configuration schema validation failed. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_MethodDoesNotSupportOperation"></a><a id="guid_eaphost_cause_methoddoesnotsupportoperation"></a><a id="GUID_EAPHOST_CAUSE_METHODDOESNOTSUPPORTOPERATION"></a><dl>
     * <dt><b>GUID_EapHost_Cause_MethodDoesNotSupportOperation</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x1E}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost returns this error when a configured EAP method does not support a requested operation (procedure call). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_EapQecInaccessible"></a><a id="guid_eaphost_cause_eapqecinaccessible"></a><a id="GUID_EAPHOST_CAUSE_EAPQECINACCESSIBLE"></a><dl>
     * <dt><b>GUID_EapHost_Cause_EapQecInaccessible</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 3, 0x12}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost not able to communicate with EAP quarantine enforcement client (QEC) on a Network Access Protection (NAP) enabled client. This error may occur when the NAP service is not responding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_Generic_AuthFailure"></a><a id="guid_eaphost_cause_generic_authfailure"></a><a id="GUID_EAPHOST_CAUSE_GENERIC_AUTHFAILURE"></a><dl>
     * <dt><b>GUID_EapHost_Cause_Generic_AuthFailure</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 1, 4}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost returns this error on a generic, unspecified authentication failure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_IdentityUnknown"></a><a id="guid_eaphost_cause_identityunknown"></a><a id="GUID_EAPHOST_CAUSE_IDENTITYUNKNOWN"></a><dl>
     * <dt><b>GUID_EapHost_Cause_IdentityUnknown</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 2, 4}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost returns this error if the authenticator fails the authentication after the peer identity was submitted. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_CertStoreInaccessible"></a><a id="guid_eaphost_cause_certstoreinaccessible"></a><a id="GUID_EAPHOST_CAUSE_CERTSTOREINACCESSIBLE"></a><dl>
     * <dt><b>GUID_EapHost_Cause_CertStoreInaccessible</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 4}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Neither the authenticator or peer can access the certificate store. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_CertExpired"></a><a id="guid_eaphost_cause_user_certexpired"></a><a id="GUID_EAPHOST_CAUSE_USER_CERTEXPIRED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_CertExpired</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 9}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost found an expired user certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_CertInvalid"></a><a id="guid_eaphost_cause_user_certinvalid"></a><a id="GUID_EAPHOST_CAUSE_USER_CERTINVALID"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_CertInvalid</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0xA}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user certificate being user for authentication does not have proper extended key usage (EKU) set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_CertNotFound"></a><a id="guid_eaphost_cause_user_certnotfound"></a><a id="GUID_EAPHOST_CAUSE_USER_CERTNOTFOUND"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_CertNotFound</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0xB}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost could not find a user certificate for authentication. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_CertOtherError"></a><a id="guid_eaphost_cause_user_certothererror"></a><a id="GUID_EAPHOST_CAUSE_USER_CERTOTHERERROR"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_CertOtherError</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0xC}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown error occurred with the user certification being used for authentication. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_CertRejected"></a><a id="guid_eaphost_cause_user_certrejected"></a><a id="GUID_EAPHOST_CAUSE_USER_CERTREJECTED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_CertRejected</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0xD}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authenticator rejected the user certification. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_CertRevoked"></a><a id="guid_eaphost_cause_user_certrevoked"></a><a id="GUID_EAPHOST_CAUSE_USER_CERTREVOKED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_CertRevoked</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0xE}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user certificate  being used for authentication has been revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_Account_OtherProblem"></a><a id="guid_eaphost_cause_user_account_otherproblem"></a><a id="GUID_EAPHOST_CAUSE_USER_ACCOUNT_OTHERPROBLEM"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_Account_OtherProblem</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 1, 0xE}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An EAP failure was received after an identity exchange, indicating the likelihood of a problem with the authenticating user's account. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_CredsRejected"></a><a id="guid_eaphost_cause_user_credsrejected"></a><a id="GUID_EAPHOST_CAUSE_USER_CREDSREJECTED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_CredsRejected</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 2, 0xE}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authenticator rejected user credentials for authentication.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_Server_CertExpired"></a><a id="guid_eaphost_cause_server_certexpired"></a><a id="GUID_EAPHOST_CAUSE_SERVER_CERTEXPIRED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_Server_CertExpired</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 5}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost found an expired server certificate. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_Server_CertInvalid"></a><a id="guid_eaphost_cause_server_certinvalid"></a><a id="GUID_EAPHOST_CAUSE_SERVER_CERTINVALID"></a><dl>
     * <dt><b>GUID_EapHost_Cause_Server_CertInvalid</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 6}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server certificate being user for authentication does not have a proper extended key usage (EKU) set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_Server_CertNotFound"></a><a id="guid_eaphost_cause_server_certnotfound"></a><a id="GUID_EAPHOST_CAUSE_SERVER_CERTNOTFOUND"></a><dl>
     * <dt><b>GUID_EapHost_Cause_Server_CertNotFound</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 7}} </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost could not find the server certificate for authentication. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_Server_CertOtherError"></a><a id="guid_eaphost_cause_server_certothererror"></a><a id="GUID_EAPHOST_CAUSE_SERVER_CERTOTHERERROR"></a><dl>
     * <dt><b>GUID_EapHost_Cause_Server_CertOtherError</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 1, 8}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown error occurred with the server certificate. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_Server_CertRevoked"></a><a id="guid_eaphost_cause_server_certrevoked"></a><a id="GUID_EAPHOST_CAUSE_SERVER_CERTREVOKED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_Server_CertRevoked</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 8}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  server certificate being used for authentication has been revoked. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_Root_CertExpired"></a><a id="guid_eaphost_cause_user_root_certexpired"></a><a id="GUID_EAPHOST_CAUSE_USER_ROOT_CERTEXPIRED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_Root_CertExpired</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0xF}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trusted root certificate needed for user certificate validation has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_Root_CertInvalid"></a><a id="guid_eaphost_cause_user_root_certinvalid"></a><a id="GUID_EAPHOST_CAUSE_USER_ROOT_CERTINVALID"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_Root_CertInvalid</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x10}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The authentication failed because the root certificate used for this network is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_User_Root_CertNotFound"></a><a id="guid_eaphost_cause_user_root_certnotfound"></a><a id="GUID_EAPHOST_CAUSE_USER_ROOT_CERTNOTFOUND"></a><dl>
     * <dt><b>GUID_EapHost_Cause_User_Root_CertNotFound</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x11}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost could not find a certificate in a trusted root certificate store for user certification validation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_Server_Root_CertNotFound"></a><a id="guid_eaphost_cause_server_root_certnotfound"></a><a id="GUID_EAPHOST_CAUSE_SERVER_ROOT_CERTNOTFOUND"></a><dl>
     * <dt><b>GUID_EapHost_Cause_Server_Root_CertNotFound</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 1, 0x12}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EAPHost could not find a root certificate in a trusted root certificate store for the server certification  validation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Cause_Server_Root_CertNameRequired"></a><a id="guid_eaphost_cause_server_root_certnamerequired"></a><a id="GUID_EAPHOST_CAUSE_SERVER_ROOT_CERTNAMEREQUIRED"></a><dl>
     * <dt><b>GUID_EapHost_Cause_Server_Root_CertNameRequired</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x12}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authentication failed because the certificate on the server computer does not have a server name specified. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Guid>}
     */
    rootCauseGuid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A  unique ID that maps to a localizable string that identifies the repair action that can be taken to fix the reported error.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Repair_ContactSysadmin"></a><a id="guid_eaphost_repair_contactsysadmin"></a><a id="GUID_EAPHOST_REPAIR_CONTACTSYSADMIN"></a><dl>
     * <dt><b>GUID_EapHost_Repair_ContactSysadmin</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 2}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user should contact the network administrator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Repair_Retry_Authentication"></a><a id="guid_eaphost_repair_retry_authentication"></a><a id="GUID_EAPHOST_REPAIR_RETRY_AUTHENTICATION"></a><dl>
     * <dt><b>GUID_EapHost_Repair_Retry_Authentication</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 1, 0x1B}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user should try to connect to the network again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Repair_User_AuthFailure"></a><a id="guid_eaphost_repair_user_authfailure"></a><a id="GUID_EAPHOST_REPAIR_USER_AUTHFAILURE"></a><dl>
     * <dt><b>GUID_EapHost_Repair_User_AuthFailure</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x19}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user should enter valid credentials for network authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Repair_User_GetNewCert"></a><a id="guid_eaphost_repair_user_getnewcert"></a><a id="GUID_EAPHOST_REPAIR_USER_GETNEWCERT"></a><dl>
     * <dt><b>GUID_EapHost_Repair_User_GetNewCert</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x1A}}
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user should obtain an updated certificate from the network administrator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Repair_User_SelectValidCert"></a><a id="guid_eaphost_repair_user_selectvalidcert"></a><a id="GUID_EAPHOST_REPAIR_USER_SELECTVALIDCERT"></a><dl>
     * <dt><b>GUID_EapHost_Repair_User_SelectValidCert</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x1B}} </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user should use a different and valid user certificate for authentication with the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Repair_Server_ClientSelectServerCert"></a><a id="guid_eaphost_repair_server_clientselectservercert"></a><a id="GUID_EAPHOST_REPAIR_SERVER_CLIENTSELECTSERVERCERT"></a><dl>
     * <dt><b>GUID_EapHost_Repair_Server_ClientSelectServerCert</b></dt>
     * <dt>{0x9612fc67, 0x6150, 0x4209, {0xa8, 0x5e, 0xa8, 0xd8, 0, 0, 0, 0x19}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user should use a different and valid server certificate for authentication with the network.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Guid>}
     */
    repairGuid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A unique ID that maps to a localizable string that specifies an URL for a page that contains additional information about an error or repair message.  An EAP method can potentially define a new GUID and associate with one specific help link.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Help_EapConfigureTypes"></a><a id="guid_eaphost_help_eapconfiguretypes"></a><a id="GUID_EAPHOST_HELP_EAPCONFIGURETYPES"></a><dl>
     * <dt><b>GUID_EapHost_Help_EapConfigureTypes</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL for the page with more information about configuring EAP types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Help_FailedAuth"></a><a id="guid_eaphost_help_failedauth"></a><a id="GUID_EAPHOST_HELP_FAILEDAUTH"></a><dl>
     * <dt><b>GUID_EapHost_Help_FailedAuth</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL for the page with more information about authentication failures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Help_ObtainingCerts"></a><a id="guid_eaphost_help_obtainingcerts"></a><a id="GUID_EAPHOST_HELP_OBTAININGCERTS"></a><dl>
     * <dt><b>GUID_EapHost_Help_ObtainingCerts</b></dt>
     * <dt>{0xf535eea3, 0x1bdd, 0x46ca, {0xa2, 0xfc, 0xa6, 0x65, 0x59, 0x39, 0xb7, 0xe8}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL for the page with more information about getting EAP certificates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Help_SelectingCerts"></a><a id="guid_eaphost_help_selectingcerts"></a><a id="GUID_EAPHOST_HELP_SELECTINGCERTS"></a><dl>
     * <dt><b>GUID_EapHost_Help_SelectingCerts</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL for the page with more information about selecting the appropriate certificate to use for authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Help_SetupEapServer"></a><a id="guid_eaphost_help_setupeapserver"></a><a id="GUID_EAPHOST_HELP_SETUPEAPSERVER"></a><dl>
     * <dt><b>GUID_EapHost_Help_SetupEapServer</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL for the page with more information about setting up an EAP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_EapHost_Help_Troubleshooting"></a><a id="guid_eaphost_help_troubleshooting"></a><a id="GUID_EAPHOST_HELP_TROUBLESHOOTING"></a><dl>
     * <dt><b>GUID_EapHost_Help_Troubleshooting</b></dt>
     * <dt>{0x33307acf, 0x0698, 0x41ba, {0xb0, 0x14, 0xea, 0x0a, 0x2e, 0xb8, 0xd0, 0xa8}}</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL for the page with more information about troubleshooting.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Guid>}
     */
    helpLinkGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A localized and readable string that describes the root cause of the error.
     * @type {PWSTR}
     */
    pRootCauseString {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A localized and readable string that describes the possible repair action.
     * @type {PWSTR}
     */
    pRepairString {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
