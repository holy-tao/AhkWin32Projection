#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_DPC_RP_PIO_TLPPREFIXLOG_REGISTER {
    #StructPack 4

    PioTlpPrefixLogRegister : UInt32[4]

}
