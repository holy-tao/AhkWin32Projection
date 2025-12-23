#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information about a network logon session.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_lm20_logon_profile
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_LM20_LOGON_PROFILE extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_profile_buffer_type">MSV1_0_PROFILE_BUFFER_TYPE</a> value identifying the type of logon requested. The type of logon determines the format and content of the profile data returned. This member must be set to <b>MsV1_0LM20LogonProfile</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Time when the system should force user logoff. This is an absolute-format Windows standard time value.
     * @type {Integer}
     */
    KickOffTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Time when the user should log off. This is an absolute-format Windows standard time value.
     * @type {Integer}
     */
    LogoffTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    UserFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> specific to the session and user. This session key can be used to encrypt and decrypt information sent between the client and server. This string is MSV1_0_USER_SESSION_KEY_LENGTH characters long. The array is not null-terminated and can contain embedded null characters.
     * @type {Array<Byte>}
     */
    UserSessionKey{
        get {
            if(!this.HasProp("__UserSessionKeyProxyArray"))
                this.__UserSessionKeyProxyArray := Win32FixedArray(this.ptr + 28, 16, Primitive, "char")
            return this.__UserSessionKeyProxyArray
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the logon domain.
     * @type {LSA_UNICODE_STRING}
     */
    LogonDomainName{
        get {
            if(!this.HasProp("__LogonDomainName"))
                this.__LogonDomainName := LSA_UNICODE_STRING(48, this)
            return this.__LogonDomainName
        }
    }

    /**
     * Contains the Lanman session key. This string is MSV1_0_LANMAN_SESSION_KEY_LENGTH characters long. It is not null-terminated and can contain embedded null characters.
     * @type {Array<Byte>}
     */
    LanmanSessionKey{
        get {
            if(!this.HasProp("__LanmanSessionKeyProxyArray"))
                this.__LanmanSessionKeyProxyArray := Win32FixedArray(this.ptr + 64, 8, Primitive, "char")
            return this.__LanmanSessionKeyProxyArray
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the server that processed the logon request.
     * @type {LSA_UNICODE_STRING}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := LSA_UNICODE_STRING(72, this)
            return this.__LogonServer
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing user parameters. These parameters are primarily used by RAS to store RAS dial-in permissions for the user. In general, developers should not modify this member.
     * @type {LSA_UNICODE_STRING}
     */
    UserParameters{
        get {
            if(!this.HasProp("__UserParameters"))
                this.__UserParameters := LSA_UNICODE_STRING(88, this)
            return this.__UserParameters
        }
    }
}
