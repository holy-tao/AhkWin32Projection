#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\D3DKMT_MEMORY_SEGMENT_GROUP.ahk" { D3DKMT_MEMORY_SEGMENT_GROUP }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SEGMENT_CAPS {
    #StructPack 8

    Size : Int64

    PageSize : UInt32

    SegmentId : UInt32

    bAperture : BOOLEAN

    bReservedSysMem : BOOLEAN

    BudgetGroup : D3DKMT_MEMORY_SEGMENT_GROUP

}
