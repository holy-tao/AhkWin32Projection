#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_CPU_PAGE_PROPERTY.ahk" { D3D12_CPU_PAGE_PROPERTY }
#Import ".\D3D12_HEAP_TYPE.ahk" { D3D12_HEAP_TYPE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_MEMORY_POOL.ahk" { D3D12_MEMORY_POOL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_HEAP_PROPERTIES.ahk" { D3D12_HEAP_PROPERTIES }
#Import ".\D3D12_RESOURCE_DIMENSION.ahk" { D3D12_RESOURCE_DIMENSION }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_PLACED_RESOURCE_SUPPORT_INFO {
    #StructPack 4

    Format : DXGI_FORMAT

    Dimension : D3D12_RESOURCE_DIMENSION

    DestHeapProperties : D3D12_HEAP_PROPERTIES

    Supported : BOOL

}
