#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * Specifies a message to add, remove, or replace an extra server credential for a logon session.
 * @remarks
 * 
  * Calling  the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function with this structure affects only the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (Kerberos)</a> function. Using this structure allows multiple physical and virtual servers to share a single identity.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_add_credentials_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_ADD_CREDENTIALS_REQUEST extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbAddExtraCredentialsMessage</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The user name for the credential.
     * @type {LSA_UNICODE_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__UserName
        }
    }

    /**
     * The domain name for the credential.
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__DomainName
        }
    }

    /**
     * The password for the credential.
     * @type {LSA_UNICODE_STRING}
     */
    Password{
        get {
            if(!this.HasProp("__Password"))
                this.__Password := LSA_UNICODE_STRING(this.ptr + 40)
            return this.__Password
        }
    }

    /**
     * The logon ID of the credential. The value of this member can be <b>NULL</b>.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 56)
            return this.__LogonId
        }
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
