#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER.ahk

/**
 * Defines the header for a serialized raytracing acceleration structure.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_serialized_raytracing_acceleration_structure_header
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The driver-matching identifier.
     * @type {D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER}
     */
    DriverMatchingIdentifier{
        get {
            if(!this.HasProp("__DriverMatchingIdentifier"))
                this.__DriverMatchingIdentifier := D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER(0, this)
            return this.__DriverMatchingIdentifier
        }
    }

    /**
     * The size of serialized data.
     * @type {Integer}
     */
    SerializedSizeInBytesIncludingHeader {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Size of the memory that will be consumed when the acceleration structure is deserialized.  This value is less than or equal to the size of the original acceleration structure before it was serialized.
     * @type {Integer}
     */
    DeserializedSizeInBytes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Size of the array of <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12_gpu_virtual_address">D3D12_GPU_VIRTUAL_ADDRESS</a> values that follow the header.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_serialization_desc">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION_DESC</a>.
     * @type {Integer}
     */
    NumBottomLevelAccelerationStructurePointersAfterHeader {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
