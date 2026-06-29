#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_NODE_GPU_INPUT {
    #StructPack 8

    EntrypointIndex : UInt32

    NumRecords : UInt32

    Records : D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE

}
