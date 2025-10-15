#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_USER_ENTITY_INFORMATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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

    /**
     * @type {PWSTR}
     */
    pwszDisplayName{
        get {
            if(!this.HasProp("__pwszDisplayName"))
                this.__pwszDisplayName := PWSTR(this.ptr + 32)
            return this.__pwszDisplayName
        }
    }
}
