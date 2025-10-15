#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_COSE_CREDENTIAL_PARAMETER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
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
     * @type {Integer}
     */
    lAlg {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
