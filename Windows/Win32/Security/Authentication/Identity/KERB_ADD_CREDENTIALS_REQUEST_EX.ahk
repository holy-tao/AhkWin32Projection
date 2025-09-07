#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include .\KERB_ADD_CREDENTIALS_REQUEST.ahk

/**
 * Specifies a message to add, remove, or replace an extra server credential for a logon session, and the service principal names (SPNs) to be associated with that credential.
 * @remarks
 * Calling the   <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function with this structure affects only the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (Kerberos)</a> function. Using this structure allows multiple physical and virtual servers to share a single identity.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_add_credentials_request_ex
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_ADD_CREDENTIALS_REQUEST_EX extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_add_credentials_request">KERB_ADD_CREDENTIALS_REQUEST</a> structure that specifies the credentials to add, remove, or replace.
     * @type {KERB_ADD_CREDENTIALS_REQUEST}
     */
    Credentials{
        get {
            if(!this.HasProp("__Credentials"))
                this.__Credentials := KERB_ADD_CREDENTIALS_REQUEST(this.ptr + 0)
            return this.__Credentials
        }
    }

    /**
     * The number of elements in the <b>PrincipalNames</b> array.
     * @type {Integer}
     */
    PrincipalNameCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * An array of SPNs to be associated with the user account specified by the <b>Credentials</b> member
     * @type {Array<LSA_UNICODE_STRING>}
     */
    PrincipalNames{
        get {
            if(!this.HasProp("__PrincipalNamesProxyArray"))
                this.__PrincipalNamesProxyArray := Win32FixedArray(this.ptr + 80, 8, LSA_UNICODE_STRING, "")
            return this.__PrincipalNamesProxyArray
        }
    }
}
