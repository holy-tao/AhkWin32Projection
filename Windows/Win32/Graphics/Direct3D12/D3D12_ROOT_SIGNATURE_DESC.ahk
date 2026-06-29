#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_ROOT_SIGNATURE_FLAGS.ahk" { D3D12_ROOT_SIGNATURE_FLAGS }
#Import ".\D3D12_ROOT_PARAMETER.ahk" { D3D12_ROOT_PARAMETER }
#Import ".\D3D12_STATIC_SAMPLER_DESC.ahk" { D3D12_STATIC_SAMPLER_DESC }

/**
 * Describes the layout of a root signature version 1.0.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12serializerootsignature">D3D12SerializeRootSignature</a> function
 *         and is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12rootsignaturedeserializer-getrootsignaturedesc">ID3D12RootSignatureDeserializer::GetRootSignatureDesc</a> method.
 *       
 * 
 * There is one graphics root signature, and one compute root signature.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_signature_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_ROOT_SIGNATURE_DESC {
    #StructPack 8

    /**
     * The number of slots in the root signature. This number is also the number of elements in the <i>pParameters</i> array.
     */
    NumParameters : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter">D3D12_ROOT_PARAMETER</a> structures for the slots in the root signature.
     */
    pParameters : D3D12_ROOT_PARAMETER.Ptr

    /**
     * Specifies the number of static samplers.
     */
    NumStaticSamplers : UInt32

    /**
     * Pointer to one or more <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_static_sampler_desc">D3D12_STATIC_SAMPLER_DESC</a> structures.
     */
    pStaticSamplers : D3D12_STATIC_SAMPLER_DESC.Ptr

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_signature_flags">D3D12_ROOT_SIGNATURE_FLAGS</a>-typed values that are combined by using a bitwise OR operation.
     *             The resulting value specifies options for the root signature layout.
     */
    Flags : D3D12_ROOT_SIGNATURE_FLAGS

}
