#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SAMPLER_FLAGS.ahk" { D3D12_SAMPLER_FLAGS }
#Import ".\D3D12_STATIC_BORDER_COLOR.ahk" { D3D12_STATIC_BORDER_COLOR }
#Import ".\D3D12_SHADER_VISIBILITY.ahk" { D3D12_SHADER_VISIBILITY }
#Import ".\D3D12_COMPARISON_FUNC.ahk" { D3D12_COMPARISON_FUNC }
#Import ".\D3D12_TEXTURE_ADDRESS_MODE.ahk" { D3D12_TEXTURE_ADDRESS_MODE }
#Import ".\D3D12_FILTER.ahk" { D3D12_FILTER }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_STATIC_SAMPLER_DESC1 {
    #StructPack 4

    Filter : D3D12_FILTER

    AddressU : D3D12_TEXTURE_ADDRESS_MODE

    AddressV : D3D12_TEXTURE_ADDRESS_MODE

    AddressW : D3D12_TEXTURE_ADDRESS_MODE

    MipLODBias : Float32

    MaxAnisotropy : UInt32

    ComparisonFunc : D3D12_COMPARISON_FUNC

    BorderColor : D3D12_STATIC_BORDER_COLOR

    MinLOD : Float32

    MaxLOD : Float32

    ShaderRegister : UInt32

    RegisterSpace : UInt32

    ShaderVisibility : D3D12_SHADER_VISIBILITY

    Flags : D3D12_SAMPLER_FLAGS

}
