#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARMV8_AARCH64_EL3_CSR {
    #StructPack 8

    ELR_EL3 : Int64

    ESR_EL3 : Int64

    FAR_EL3 : Int64

    MAIR_EL3 : Int64

    SCTLR_EL3 : Int64

    SP_EL3 : Int64

    SPSR_EL3 : Int64

    TCR_EL3 : Int64

    TPIDR_EL3 : Int64

    TTBR0_EL3 : Int64

}
