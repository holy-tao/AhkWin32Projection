#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_UNICODEINDEX2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    szLocaleName{
        get {
            if(!this.HasProp("__szLocaleName"))
                this.__szLocaleName := PWSTR(this.ptr + 0)
            return this.__szLocaleName
        }
    }

    /**
     * @type {Integer}
     */
    dwMapFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
