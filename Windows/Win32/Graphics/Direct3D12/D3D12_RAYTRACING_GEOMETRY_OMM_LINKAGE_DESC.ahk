#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_GEOMETRY_OMM_LINKAGE_DESC {
    #StructPack 8

    OpacityMicromapIndexBuffer : D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE

    OpacityMicromapIndexFormat : DXGI_FORMAT

    OpacityMicromapBaseLocation : UInt32

    OpacityMicromapArray : Int64

}
