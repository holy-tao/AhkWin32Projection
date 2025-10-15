#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_SP_AGENCY_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<SPC_LINK>}
     */
    pPolicyInformation {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pwszPolicyDisplayText{
        get {
            if(!this.HasProp("__pwszPolicyDisplayText"))
                this.__pwszPolicyDisplayText := PWSTR(this.ptr + 8)
            return this.__pwszPolicyDisplayText
        }
    }

    /**
     * @type {Pointer<SPC_IMAGE>}
     */
    pLogoImage {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<SPC_LINK>}
     */
    pLogoLink {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
