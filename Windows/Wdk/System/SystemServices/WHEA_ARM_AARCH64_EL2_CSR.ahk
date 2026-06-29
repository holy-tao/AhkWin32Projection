#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_AARCH64_EL2_CSR {
    #StructPack 8

    ELR_EL2 : Int64

    ESR_EL2 : Int64

    FAR_EL2 : Int64

    HACR_EL2 : Int64

    HCR_EL2 : Int64

    HPFAR_EL2 : Int64

    MAIR_EL2 : Int64

    SCTLR_EL2 : Int64

    SP_EL2 : Int64

    SPSR_EL2 : Int64

    TCR_EL2 : Int64

    TPIDR_EL2 : Int64

    TTBR0_EL2 : Int64

    VTCR_EL2 : Int64

    VTTBR_EL2 : Int64

}
