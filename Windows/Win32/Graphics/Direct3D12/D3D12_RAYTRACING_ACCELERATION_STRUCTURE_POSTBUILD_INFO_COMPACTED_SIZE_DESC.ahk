#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the space requirement for acceleration structure after compaction.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_compacted_size_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_COMPACTED_SIZE_DESC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The space requirement for acceleration structure after compaction.
     * 
     * It is guaranteed that a compacted acceleration structure doesn’t consume more space than a non-compacted acceleration structure.
     * 
     * Pre-compaction, it is guaranteed that the size requirements reported by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device5-getraytracingaccelerationstructureprebuildinfo">GetRaytracingAccelerationStructurePrebuildInfo</a> for a given build configuration (triangle counts etc.) will be sufficient to store any acceleration structure whose build inputs are reduced (e.g. reducing triangle counts).  This non-increasing property for smaller builds does not apply post-compaction, however.  In other words, it is not guaranteed that having fewer items in an acceleration structure means it compresses to a smaller size than compressing an acceleration structure with more items.
     * @type {Integer}
     */
    CompactedSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
