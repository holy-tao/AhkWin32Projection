#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Specifies a certificate used for S4U logon.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-pku2u_certificate_s4u_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PKU2U_CERTIFICATE_S4U_LOGON extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-pku2u_logon_submit_type">PKU2U_LOGON_SUBMIT_TYPE</a> enumeration that indicates the logon type.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * This member is reserved. Do not use it.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The name of the user who is attempting to authenticate.
     * @type {LSA_UNICODE_STRING}
     */
    UserPrincipalName{
        get {
            if(!this.HasProp("__UserPrincipalName"))
                this.__UserPrincipalName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__UserPrincipalName
        }
    }

    /**
     * This member is reserved. Do not use it.
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
     * The size, in bytes, of the <b>Certificate</b> buffer.
     * @type {Integer}
     */
    CertificateLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The certificate data.
     * @type {Pointer<Byte>}
     */
    Certificate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
