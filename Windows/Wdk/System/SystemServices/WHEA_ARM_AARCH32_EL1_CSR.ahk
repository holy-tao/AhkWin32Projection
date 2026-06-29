#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_AARCH32_EL1_CSR {
    #StructPack 4

    DFAR : UInt32

    DFSR : UInt32

    IFAR : UInt32

    ISR : UInt32

    MAIR0 : UInt32

    MAIR1 : UInt32

    MIDR : UInt32

    MPIDR : UInt32

    NMRR : UInt32

    PRRR : UInt32

    SCTLR : UInt32

    SPSR : UInt32

    SPSR_abt : UInt32

    SPSR_fiq : UInt32

    SPSR_irq : UInt32

    SPSR_svc : UInt32

    SPSR_und : UInt32

    TPIDRPRW : UInt32

    TPIDRURO : UInt32

    TPIDRURW : UInt32

    TTBCR : UInt32

    TTBR0 : UInt32

    TTBR1 : UInt32

    DACR : UInt32

}
