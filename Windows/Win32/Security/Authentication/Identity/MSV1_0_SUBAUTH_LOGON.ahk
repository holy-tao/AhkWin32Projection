#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_STRING.ahk" { LSA_STRING }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MSV_SUBAUTH_LOGON_PARAMETER_CONTROL.ahk" { MSV_SUBAUTH_LOGON_PARAMETER_CONTROL }
#Import ".\MSV1_0_LOGON_SUBMIT_TYPE.ahk" { MSV1_0_LOGON_SUBMIT_TYPE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used by subauthentication DLLs.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_SUBAUTH_LOGON {
    #StructPack 8

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_logon_submit_type">MSV1_0_LOGON_SUBMIT_TYPE</a> value that indicates the type of logon being requested. This value must be set to <b>MsV1_0SubAuthLogon</b>.
     */
    MessageType : MSV1_0_LOGON_SUBMIT_TYPE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the logon domain. The specified domain name must be a Windows domain or a mixed domain that is trusted by this computer. If the logon domain name is not known (for example, for clients that do not supply this information), this member should be passed in as a zero-length string. This is the authenticating authority.
     */
    LogonDomainName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the account name of the user. The name can be up to 255 bytes long. The name is treated as case insensitive.
     */
    UserName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the computer name of the workstation where the user logon request was initiated.
     */
    Workstation : LSA_UNICODE_STRING

    /**
     * Contains the challenge returned from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a>, when <b>MsV1_0Lm20ChallengeRequest</b> was specified as the message type. For more information, see the description of <b>MsV1_0Lm20ChallengeRequest</b> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a>. This enables the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">authentication package</a> to determine whether the challenge response is correct.
     */
    ChallengeToClient : Int8[8]

    /**
     * Contains <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subauthentication package</a>–specific information. For more information, see the subauthentication package documentation.
     */
    AuthenticationInfo1 : LSA_STRING

    /**
     * Contains subauthentication package specific information. For more information, see the subauthentication package documentation.
     */
    AuthenticationInfo2 : LSA_STRING

    ParameterControl : MSV_SUBAUTH_LOGON_PARAMETER_CONTROL

    /**
     * Contains the subauthentication package identifier. This value is set by the subauthentication package vendor.
     */
    SubAuthPackageId : UInt32

}
