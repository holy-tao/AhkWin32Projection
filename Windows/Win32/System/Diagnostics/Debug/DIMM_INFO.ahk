#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DIMM_ADDRESS.ahk
#Include .\DIMM_ADDR_VALID_BITS_DDR4.ahk
#Include .\DIMM_ADDR_VALID_BITS_DDR5.ahk
#Include .\DIMM_ADDR_VALID_BITS.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DIMM_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {DIMM_ADDRESS}
     */
    DimmAddress{
        get {
            if(!this.HasProp("__DimmAddress"))
                this.__DimmAddress := DIMM_ADDRESS(this.ptr + 0)
            return this.__DimmAddress
        }
    }

    /**
     * @type {DIMM_ADDR_VALID_BITS}
     */
    ValidBits{
        get {
            if(!this.HasProp("__ValidBits"))
                this.__ValidBits := DIMM_ADDR_VALID_BITS(this.ptr + 48)
            return this.__ValidBits
        }
    }
}
