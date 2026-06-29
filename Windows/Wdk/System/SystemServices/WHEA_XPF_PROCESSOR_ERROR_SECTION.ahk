#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_XPF_PROCESSOR_ERROR_SECTION {
    #StructPack 8

    ValidBits : IntPtr

    LocalAPICId : Int64

    CpuId : Int8[48]

    VariableInfo : Int8[1]

}
