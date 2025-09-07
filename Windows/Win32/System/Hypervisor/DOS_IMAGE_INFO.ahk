#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class DOS_IMAGE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    PdbName{
        get {
            if(!this.HasProp("__PdbName"))
                this.__PdbName := PSTR(this.ptr + 0)
            return this.__PdbName
        }
    }

    /**
     * @type {Integer}
     */
    ImageBaseAddress {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ImageSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Timestamp {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
