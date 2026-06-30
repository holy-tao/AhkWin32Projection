#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DIMM_ADDRESS.ahk
#Include .\DIMM_INFO.ahk
#Include .\DIMM_ADDR_VALID_BITS.ahk
#Include .\DIMM_ADDR_VALID_BITS_DDR4.ahk
#Include .\DIMM_ADDR_VALID_BITS_DDR5.ahk
#Include .\PAGE_OFFLINE_ERROR_TYPES.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class MEMORY_DEFECT extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DIMM_INFO}
     */
    DimmInfo {
        get {
            if(!this.HasProp("__DimmInfo"))
                this.__DimmInfo := DIMM_INFO(8, this)
            return this.__DimmInfo
        }
    }

    /**
     * @type {PAGE_OFFLINE_ERROR_TYPES}
     */
    ErrType {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
