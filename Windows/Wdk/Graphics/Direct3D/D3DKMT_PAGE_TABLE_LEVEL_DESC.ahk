#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PAGE_TABLE_LEVEL_DESC {
    #StructPack 8

    IndexBitCount : UInt32

    IndexMask : Int64

    IndexShift : Int64

    LowerLevelsMask : Int64

    EntryCoverageInPages : Int64

}
