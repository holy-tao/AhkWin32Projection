#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Description of the post-build information to generate from an acceleration structure. Use this structure in calls to EmitRaytracingAccelerationStructurePostbuildInfo and BuildRaytracingAccelerationStructure.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Storage for the post-build info result.  Size required and the layout of the contents written by the system depend on the value of the <i>InfoType</i> field.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_UNORDERED_ACCESS</a>.  The memory must be aligned to the natural alignment for the members of the particular output structure being generated (e.g. 8 bytes for a struct with the largest members being UINT64).
     * @type {Integer}
     */
    DestBuffer {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of post-build information to retrieve.
     * @type {Integer}
     */
    InfoType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
