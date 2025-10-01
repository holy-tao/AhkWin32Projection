#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the size and layout of the serialized acceleration structure and header.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_serialization_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of the serialized acceleration structure, including a header.  The header is <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_serialized_raytracing_acceleration_structure_header">D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER</a> followed by followed by a list of pointers to bottom-level acceleration structures.
     * @type {Integer}
     */
    SerializedSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumBottomLevelAccelerationStructurePointers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumBottomLevelAccelerationStructureHeaderAndPointerListPairs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
