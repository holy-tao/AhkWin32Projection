#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BANNER_NOTIFICATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    event {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    providerIdentity{
        get {
            if(!this.HasProp("__providerIdentity"))
                this.__providerIdentity := PWSTR(this.ptr + 8)
            return this.__providerIdentity
        }
    }

    /**
     * @type {PWSTR}
     */
    contentId{
        get {
            if(!this.HasProp("__contentId"))
                this.__contentId := PWSTR(this.ptr + 16)
            return this.__contentId
        }
    }
}
