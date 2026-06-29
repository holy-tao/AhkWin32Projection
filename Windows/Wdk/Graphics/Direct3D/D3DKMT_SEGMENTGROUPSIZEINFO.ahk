#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SEGMENTGROUPSIZEINFO {
    #StructPack 8

    PhysicalAdapterIndex : UInt32

    LegacyInfo : IntPtr

    LocalMemory : Int64

    NonLocalMemory : Int64

    NonBudgetMemory : Int64

}
