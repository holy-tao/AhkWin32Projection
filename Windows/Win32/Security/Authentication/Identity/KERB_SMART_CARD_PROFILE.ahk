#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_INTERACTIVE_PROFILE.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_SMART_CARD_PROFILE extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {KERB_INTERACTIVE_PROFILE}
     */
    Profile{
        get {
            if(!this.HasProp("__Profile"))
                this.__Profile := KERB_INTERACTIVE_PROFILE(0, this)
            return this.__Profile
        }
    }

    /**
     * @type {Integer}
     */
    CertificateSize {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Pointer<Integer>}
     */
    CertificateData {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }
}
