#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PNP_REPLACE_MEMORY_LIST {
    #StructPack 8

    AllocatedCount : UInt32

    Count : UInt32

    TotalLength : Int64

    Address : Int64

    Length : Int64

}
