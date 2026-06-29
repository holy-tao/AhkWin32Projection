#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_MESH_SHADER_TIER.ahk" { D3D12_MESH_SHADER_TIER }
#Import ".\D3D12_SAMPLER_FEEDBACK_TIER.ahk" { D3D12_SAMPLER_FEEDBACK_TIER }

/**
 * Indicates the level of support that the adapter provides for mesh and amplification shaders, and for sampler feedback.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options7
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS7 {
    #StructPack 4

    /**
     * Type: \_Out\_ **[D3D12_MESH_SHADER_TIER](ne-d3d12-d3d12_mesh_shader_tier.md)**
     * 
     * Indicates the level of support for mesh and amplification shaders.
     */
    MeshShaderTier : D3D12_MESH_SHADER_TIER

    /**
     * Type: \_Out\_ **[D3D12_SAMPLER_FEEDBACK_TIER](ne-d3d12-d3d12_sampler_feedback_tier.md)**
     * 
     * Indicates the level of support for sampler feedback.
     */
    SamplerFeedbackTier : D3D12_SAMPLER_FEEDBACK_TIER

}
