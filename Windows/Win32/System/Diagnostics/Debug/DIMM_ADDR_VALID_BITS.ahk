#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DIMM_ADDR_VALID_BITS_DDR4.ahk
#Include .\DIMM_ADDR_VALID_BITS_DDR5.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DIMM_ADDR_VALID_BITS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {DIMM_ADDR_VALID_BITS_DDR4}
     */
    VB_DDR4{
        get {
            if(!this.HasProp("__VB_DDR4"))
                this.__VB_DDR4 := DIMM_ADDR_VALID_BITS_DDR4(this.ptr + 0)
            return this.__VB_DDR4
        }
    }

    /**
     * @type {DIMM_ADDR_VALID_BITS_DDR5}
     */
    VB_DDR5{
        get {
            if(!this.HasProp("__VB_DDR5"))
                this.__VB_DDR5 := DIMM_ADDR_VALID_BITS_DDR5(this.ptr + 0)
            return this.__VB_DDR5
        }
    }

    /**
     * @type {Integer}
     */
    AsUINT32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
