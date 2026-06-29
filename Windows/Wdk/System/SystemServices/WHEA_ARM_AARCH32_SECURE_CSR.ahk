#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_AARCH32_SECURE_CSR {
    #StructPack 4

    SCTLR : UInt32

    SPSR_mon : UInt32

}
