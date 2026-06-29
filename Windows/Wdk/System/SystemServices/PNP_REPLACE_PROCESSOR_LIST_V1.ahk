#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PNP_REPLACE_PROCESSOR_LIST_V1 {
    #StructPack 8

    AffinityMask : IntPtr

    AllocatedCount : UInt32

    Count : UInt32

    ApicIds : UInt32[1]

}
