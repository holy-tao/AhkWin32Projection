#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_HIT_GROUP_TYPE.ahk" { D3D12_HIT_GROUP_TYPE }

/**
 * Describes a raytracing hit group state subobject that can be included in a state object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_hit_group_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_HIT_GROUP_DESC {
    #StructPack 8

    /**
     * The name of the hit group.
     */
    HitGroupExport : PWSTR

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_hit_group_type">D3D12_HIT_GROUP_TYPE</a> enumeration specifying the type of the hit group.
     */
    Type : D3D12_HIT_GROUP_TYPE

    /**
     * Optional name of the any-hit shader associated with the hit group. This field can be used with all hit group types.
     */
    AnyHitShaderImport : PWSTR

    /**
     * Optional name of the closest-hit shader associated with the hit group. This field can be used with all hit group types.
     */
    ClosestHitShaderImport : PWSTR

    /**
     * Optional name of the intersection shader associated with the hit group.  This field can only be used with hit groups of type procedural primitive.
     */
    IntersectionShaderImport : PWSTR

}
