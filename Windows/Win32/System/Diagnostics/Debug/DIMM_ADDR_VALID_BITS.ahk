#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DIMM_ADDR_VALID_BITS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {Integer}
     */
    VB_DDR4 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VB_DDR5 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AsUINT32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
