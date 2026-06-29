#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MSV1_0_PROFILE_BUFFER_TYPE.ahk" { MSV1_0_PROFILE_BUFFER_TYPE }
#Import ".\MSV_SUB_AUTHENTICATION_FILTER.ahk" { MSV_SUB_AUTHENTICATION_FILTER }

/**
 * Contains information about a network logon session.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_lm20_logon_profile
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_LM20_LOGON_PROFILE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_profile_buffer_type">MSV1_0_PROFILE_BUFFER_TYPE</a> value identifying the type of logon requested. The type of logon determines the format and content of the profile data returned. This member must be set to <b>MsV1_0LM20LogonProfile</b>.
     */
    MessageType : MSV1_0_PROFILE_BUFFER_TYPE

    /**
     * Time when the system should force user logoff. This is an absolute-format Windows standard time value.
     */
    KickOffTime : Int64

    /**
     * Time when the user should log off. This is an absolute-format Windows standard time value.
     */
    LogoffTime : Int64

    UserFlags : MSV_SUB_AUTHENTICATION_FILTER

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> specific to the session and user. This session key can be used to encrypt and decrypt information sent between the client and server. This string is MSV1_0_USER_SESSION_KEY_LENGTH characters long. The array is not null-terminated and can contain embedded null characters.
     */
    UserSessionKey : Int8[16]

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the logon domain.
     */
    LogonDomainName : LSA_UNICODE_STRING

    /**
     * Contains the Lanman session key. This string is MSV1_0_LANMAN_SESSION_KEY_LENGTH characters long. It is not null-terminated and can contain embedded null characters.
     */
    LanmanSessionKey : Int8[8]

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the server that processed the logon request.
     */
    LogonServer : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing user parameters. These parameters are primarily used by RAS to store RAS dial-in permissions for the user. In general, developers should not modify this member.
     */
    UserParameters : LSA_UNICODE_STRING

}
