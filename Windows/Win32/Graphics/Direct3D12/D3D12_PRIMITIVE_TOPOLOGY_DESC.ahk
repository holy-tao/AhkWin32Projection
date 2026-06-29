#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_PRIMITIVE_TOPOLOGY_TYPE.ahk" { D3D12_PRIMITIVE_TOPOLOGY_TYPE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_PRIMITIVE_TOPOLOGY_DESC {
    #StructPack 4

    PrimitiveTopology : D3D12_PRIMITIVE_TOPOLOGY_TYPE

}
