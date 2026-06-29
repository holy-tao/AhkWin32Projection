#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D12RootSignature.ahk" { ID3D12RootSignature }
#Import ".\D3D12_SHADER_BYTECODE.ahk" { D3D12_SHADER_BYTECODE }
#Import ".\D3D12_PIPELINE_STATE_FLAGS.ahk" { D3D12_PIPELINE_STATE_FLAGS }
#Import ".\D3D12_CACHED_PIPELINE_STATE.ahk" { D3D12_CACHED_PIPELINE_STATE }

/**
 * Describes a compute pipeline state object.
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcomputepipelinestate">CreateComputePipelineState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMPUTE_PIPELINE_STATE_DESC {
    #StructPack 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignature">ID3D12RootSignature</a> object.
     */
    pRootSignature : ID3D12RootSignature

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode">D3D12_SHADER_BYTECODE</a> structure that describes the compute shader.
     */
    CS : D3D12_SHADER_BYTECODE

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the  device's physical adapters) for which the compute pipeline state is to apply.
     *             Each bit in the mask corresponds to a single node.
     *             Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     */
    NodeMask : UInt32

    /**
     * A cached pipeline state object, as a <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_cached_pipeline_state">D3D12_CACHED_PIPELINE_STATE</a> structure. pCachedBlob and CachedBlobSizeInBytes may be set to NULL and 0 respectively.
     */
    CachedPSO : D3D12_CACHED_PIPELINE_STATE

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_pipeline_state_flags">D3D12_PIPELINE_STATE_FLAGS</a> enumeration constant such as for "tool debug".
     */
    Flags : D3D12_PIPELINE_STATE_FLAGS

}
