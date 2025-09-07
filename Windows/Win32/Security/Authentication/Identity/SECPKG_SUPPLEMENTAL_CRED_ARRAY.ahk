#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\SECPKG_SUPPLEMENTAL_CRED.ahk

/**
 * The SECPKG_SUPPLEMENTAL_CRED_ARRAY structure contains supplemental credentials information. This structure is used by the LsaApLogonUserEx2 and UpdateCredentials functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_supplemental_cred_array
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_SUPPLEMENTAL_CRED_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of supplemental credentials in the <b>Credentials</b> member.
     * @type {Integer}
     */
    CredentialCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array containing supplemental credentials.
     * @type {Array<SECPKG_SUPPLEMENTAL_CRED>}
     */
    Credentials{
        get {
            if(!this.HasProp("__CredentialsProxyArray"))
                this.__CredentialsProxyArray := Win32FixedArray(this.ptr + 8, 8, SECPKG_SUPPLEMENTAL_CRED, "")
            return this.__CredentialsProxyArray
        }
    }
}
