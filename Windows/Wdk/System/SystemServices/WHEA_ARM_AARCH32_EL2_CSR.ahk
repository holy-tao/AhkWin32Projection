#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_AARCH32_EL2_CSR {
    #StructPack 4

    ELR_hyp : UInt32

    HAMAIR0 : UInt32

    HAMAIR1 : UInt32

    HCR : UInt32

    HCR2 : UInt32

    HDFAR : UInt32

    HIFAR : UInt32

    HPFAR : UInt32

    HSR : UInt32

    HTCR : UInt32

    HTPIDR : UInt32

    HTTBR : UInt32

    SPSR_hyp : UInt32

    VTCR : UInt32

    VTTBR : UInt32

    DACR32_EL2 : UInt32

}
