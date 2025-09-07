#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents prebuild information about a raytracing acceleration structure. Get an instance of this structure by calling GetRaytracingAccelerationStructurePrebuildInfo.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_prebuild_info
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Size required to hold the result of an acceleration structure build based on the specified inputs.
     * @type {Integer}
     */
    ResultDataMaxSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Scratch storage on the GPU required during acceleration structure build based on the specified inputs.
     * @type {Integer}
     */
    ScratchDataSizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    UpdateScratchDataSizeInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
