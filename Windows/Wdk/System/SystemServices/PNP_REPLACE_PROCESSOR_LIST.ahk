#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PNP_REPLACE_PROCESSOR_LIST {
    #StructPack 8

    Affinity : IntPtr

    GroupCount : UInt32

    AllocatedCount : UInt32

    Count : UInt32

    ApicIds : UInt32[1]

}
