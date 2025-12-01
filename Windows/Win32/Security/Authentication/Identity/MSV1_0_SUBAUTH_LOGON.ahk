#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\LSA_STRING.ahk

/**
 * Used by subauthentication DLLs.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_SUBAUTH_LOGON extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_logon_submit_type">MSV1_0_LOGON_SUBMIT_TYPE</a> value that indicates the type of logon being requested. This value must be set to <b>MsV1_0SubAuthLogon</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the logon domain. The specified domain name must be a Windows domain or a mixed domain that is trusted by this computer. If the logon domain name is not known (for example, for clients that do not supply this information), this member should be passed in as a zero-length string. This is the authenticating authority.
     * @type {LSA_UNICODE_STRING}
     */
    LogonDomainName{
        get {
            if(!this.HasProp("__LogonDomainName"))
                this.__LogonDomainName := LSA_UNICODE_STRING(8, this)
            return this.__LogonDomainName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the account name of the user. The name can be up to 255 bytes long. The name is treated as case insensitive.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the computer name of the workstation where the user logon request was initiated.
     * @type {LSA_UNICODE_STRING}
     */
    Workstation{
        get {
            if(!this.HasProp("__Workstation"))
                this.__Workstation := LSA_UNICODE_STRING(40, this)
            return this.__Workstation
        }
    }

    /**
     * Contains the challenge returned from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a>, when <b>MsV1_0Lm20ChallengeRequest</b> was specified as the message type. For more information, see the description of <b>MsV1_0Lm20ChallengeRequest</b> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a>. This enables the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">authentication package</a> to determine whether the challenge response is correct.
     * @type {Array<Byte>}
     */
    ChallengeToClient{
        get {
            if(!this.HasProp("__ChallengeToClientProxyArray"))
                this.__ChallengeToClientProxyArray := Win32FixedArray(this.ptr + 56, 8, Primitive, "char")
            return this.__ChallengeToClientProxyArray
        }
    }

    /**
     * Contains <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subauthentication package</a>–specific information. For more information, see the subauthentication package documentation.
     * @type {LSA_STRING}
     */
    AuthenticationInfo1{
        get {
            if(!this.HasProp("__AuthenticationInfo1"))
                this.__AuthenticationInfo1 := LSA_STRING(64, this)
            return this.__AuthenticationInfo1
        }
    }

    /**
     * Contains subauthentication package specific information. For more information, see the subauthentication package documentation.
     * @type {LSA_STRING}
     */
    AuthenticationInfo2{
        get {
            if(!this.HasProp("__AuthenticationInfo2"))
                this.__AuthenticationInfo2 := LSA_STRING(80, this)
            return this.__AuthenticationInfo2
        }
    }

    /**
     * 
     * @type {Integer}
     */
    ParameterControl {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Contains the subauthentication package identifier. This value is set by the subauthentication package vendor.
     * @type {Integer}
     */
    SubAuthPackageId {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }
}
