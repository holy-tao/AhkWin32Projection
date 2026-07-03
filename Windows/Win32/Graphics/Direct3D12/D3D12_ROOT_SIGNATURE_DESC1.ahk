#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_ROOT_PARAMETER1.ahk" { D3D12_ROOT_PARAMETER1 }
#Import ".\D3D12_ROOT_SIGNATURE_FLAGS.ahk" { D3D12_ROOT_SIGNATURE_FLAGS }
#Import ".\D3D12_STATIC_SAMPLER_DESC.ahk" { D3D12_STATIC_SAMPLER_DESC }

/**
 * Describes the layout of a root signature version 1.1.
 * @remarks
 * Use this structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_signature_desc1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_ROOT_SIGNATURE_DESC1 {
    #StructPack 8

    /**
     * The number of slots in the root signature. This number is also the number of elements in the <i>pParameters</i> array.
     */
    NumParameters : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter1">D3D12_ROOT_PARAMETER1</a> structures for the slots in the root signature.
     */
    pParameters : D3D12_ROOT_PARAMETER1.Ptr

    /**
     * Specifies the number of static samplers.
     */
    NumStaticSamplers : UInt32

    /**
     * Pointer to one or more <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_static_sampler_desc">D3D12_STATIC_SAMPLER_DESC</a> structures.
     */
    pStaticSamplers : D3D12_STATIC_SAMPLER_DESC.Ptr

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_signature_flags">D3D12_ROOT_SIGNATURE_FLAGS</a> that determine the data volatility.
     */
    Flags : D3D12_ROOT_SIGNATURE_FLAGS

}
