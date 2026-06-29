#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RAYTRACING_OPACITY_MICROMAP_FORMAT.ahk" { D3D12_RAYTRACING_OPACITY_MICROMAP_FORMAT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_OPACITY_MICROMAP_HISTOGRAM_ENTRY {
    #StructPack 4

    Count : UInt32

    SubdivisionLevel : UInt32

    Format : D3D12_RAYTRACING_OPACITY_MICROMAP_FORMAT

}
