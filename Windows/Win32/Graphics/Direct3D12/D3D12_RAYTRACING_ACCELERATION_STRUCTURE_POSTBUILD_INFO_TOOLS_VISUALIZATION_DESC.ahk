#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the space requirement for decoding an acceleration structure into a form that can be visualized by tools.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_tools_visualization_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TOOLS_VISUALIZATION_DESC {
    #StructPack 8

    /**
     * The space requirement for decoding an acceleration structure into a form that can be visualized by tools.
     */
    DecodedSizeInBytes : Int64

}
