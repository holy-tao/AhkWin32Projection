#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_ROOT_PARAMETER1.ahk" { D3D12_ROOT_PARAMETER1 }
#Import ".\D3D12_ROOT_SIGNATURE_FLAGS.ahk" { D3D12_ROOT_SIGNATURE_FLAGS }
#Import ".\D3D12_STATIC_SAMPLER_DESC1.ahk" { D3D12_STATIC_SAMPLER_DESC1 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_ROOT_SIGNATURE_DESC2 {
    #StructPack 8

    NumParameters : UInt32

    pParameters : D3D12_ROOT_PARAMETER1.Ptr

    NumStaticSamplers : UInt32

    pStaticSamplers : D3D12_STATIC_SAMPLER_DESC1.Ptr

    Flags : D3D12_ROOT_SIGNATURE_FLAGS

}
