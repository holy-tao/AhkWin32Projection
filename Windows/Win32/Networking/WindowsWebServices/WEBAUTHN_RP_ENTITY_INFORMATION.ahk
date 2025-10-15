#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_RP_ENTITY_INFORMATION extends Win32Struct
{
    static sizeof => 32

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
    pwszId{
        get {
            if(!this.HasProp("__pwszId"))
                this.__pwszId := PWSTR(this.ptr + 8)
            return this.__pwszId
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 16)
            return this.__pwszName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszIcon{
        get {
            if(!this.HasProp("__pwszIcon"))
                this.__pwszIcon := PWSTR(this.ptr + 24)
            return this.__pwszIcon
        }
    }
}
