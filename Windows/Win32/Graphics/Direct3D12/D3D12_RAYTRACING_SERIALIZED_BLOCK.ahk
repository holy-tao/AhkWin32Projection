#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SERIALIZED_BLOCK_TYPE.ahk" { D3D12_SERIALIZED_BLOCK_TYPE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_SERIALIZED_BLOCK {
    #StructPack 8

    Type : D3D12_SERIALIZED_BLOCK_TYPE

    NumBlockPointersAfterHeader : Int64

}
