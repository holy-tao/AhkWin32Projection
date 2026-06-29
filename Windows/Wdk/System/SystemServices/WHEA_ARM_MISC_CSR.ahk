#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_MISC_CSR {
    #StructPack 8

    MRSEncoding : UInt16

    Value : Int64

}
