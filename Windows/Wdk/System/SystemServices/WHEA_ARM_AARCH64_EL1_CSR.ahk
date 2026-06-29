#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_AARCH64_EL1_CSR {
    #StructPack 8

    ELR_EL1 : Int64

    ESR_EL2 : Int64

    FAR_EL1 : Int64

    ISR_EL1 : Int64

    MAIR_EL1 : Int64

    MIDR_EL1 : Int64

    MPIDR_EL1 : Int64

    SCTLR_EL1 : Int64

    SP_EL0 : Int64

    SP_EL1 : Int64

    SPSR_EL1 : Int64

    TCR_EL1 : Int64

    TPIDR_EL0 : Int64

    TPIDR_EL1 : Int64

    TPIDRRO_EL0 : Int64

    TTBR0_EL1 : Int64

    TTBR1_EL1 : Int64

}
