#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_COMPILER_VALUE_TYPE.ahk" { D3D12_COMPILER_VALUE_TYPE }
#Import ".\D3D12_COMPILER_CACHE_CONST_VALUE.ahk" { D3D12_COMPILER_CACHE_CONST_VALUE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMPILER_CACHE_TYPED_CONST_VALUE {
    #StructPack 8

    Type : D3D12_COMPILER_VALUE_TYPE

    Value : D3D12_COMPILER_CACHE_CONST_VALUE

}
