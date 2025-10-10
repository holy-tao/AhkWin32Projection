#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the GPU memory layout of an acceleration structure visualization.
 * @remarks
 * 
  * This structure functions like the inverse of the inputs to an acceleration structure build, focused on the instance or geometry details, depending on the acceleration structure type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_tools_visualization_header
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_TOOLS_VISUALIZATION_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The type of acceleration structure.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of descriptions.
     * @type {Integer}
     */
    NumDescs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
