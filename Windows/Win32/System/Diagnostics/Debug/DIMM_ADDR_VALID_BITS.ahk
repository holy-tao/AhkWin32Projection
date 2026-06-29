#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIMM_ADDR_VALID_BITS_DDR4.ahk" { DIMM_ADDR_VALID_BITS_DDR4 }
#Import ".\DIMM_ADDR_VALID_BITS_DDR5.ahk" { DIMM_ADDR_VALID_BITS_DDR5 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DIMM_ADDR_VALID_BITS {
    #StructPack 1

    VB_DDR4 : DIMM_ADDR_VALID_BITS_DDR4

    static __New() {
        DefineProp(this.Prototype, 'VB_DDR5', { type: DIMM_ADDR_VALID_BITS_DDR5, offset: 0 })
        DefineProp(this.Prototype, 'AsUINT32', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
