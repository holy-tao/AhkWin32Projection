#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class MD_CHANGE_OBJECT_W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszMDPath{
        get {
            if(!this.HasProp("__pszMDPath"))
                this.__pszMDPath := PWSTR(this.ptr + 0)
            return this.__pszMDPath
        }
    }

    /**
     * @type {Integer}
     */
    dwMDChangeType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwMDNumDataIDs {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pdwMDDataIDs {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
