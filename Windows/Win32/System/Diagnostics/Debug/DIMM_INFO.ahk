#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIMM_ADDR_VALID_BITS_DDR4.ahk" { DIMM_ADDR_VALID_BITS_DDR4 }
#Import ".\DIMM_ADDR_VALID_BITS_DDR5.ahk" { DIMM_ADDR_VALID_BITS_DDR5 }
#Import ".\DIMM_ADDR_VALID_BITS.ahk" { DIMM_ADDR_VALID_BITS }
#Import ".\DIMM_ADDRESS.ahk" { DIMM_ADDRESS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DIMM_INFO {
    #StructPack 8

    DimmAddress : DIMM_ADDRESS

    ValidBits : DIMM_ADDR_VALID_BITS

}
