#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PMEM_ERROR_SECTION {
    #StructPack 8

    ValidBits : IntPtr

    LocationInfo : Int8[64]

    ErrorStatus : IntPtr

    NFITHandle : UInt32

    PageRangeCount : UInt32

    PageRange : IntPtr[1]

}
