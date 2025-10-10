#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the space currently used by an acceleration structure..
 * @remarks
 * 
  * The information in this structure is useful for tools to be able to determine how much memory is occupied by an arbitrary acceleration structure currently sitting in memory.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_current_size_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_CURRENT_SIZE_DESC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Space currently used by an acceleration structure.  If the acceleration structure hasn’t had a compaction operation performed on it, this size is the same one reported by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device5-getraytracingaccelerationstructureprebuildinfo">GetRaytracingAccelerationStructurePrebuildInfo</a>, and if it has been compacted this size is the same reported for post-build info with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_type">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_COMPACTED_SIZE</a>.
     * @type {Integer}
     */
    CurrentSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
