#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The structure containing the COSE credential parameter information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cose_credential_parameter
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_COSE_CREDENTIAL_PARAMETER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Well-known credential type specifying a credential to create.
     * @type {PWSTR}
     */
    pwszCredentialType{
        get {
            if(!this.HasProp("__pwszCredentialType"))
                this.__pwszCredentialType := PWSTR(this.ptr + 8)
            return this.__pwszCredentialType
        }
    }

    /**
     * Well-known COSE algorithm specifying the algorithm to use for the credential.
     * @type {Integer}
     */
    lAlg {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
