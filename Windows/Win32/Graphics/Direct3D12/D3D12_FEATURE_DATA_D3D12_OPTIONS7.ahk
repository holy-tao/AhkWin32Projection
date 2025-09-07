#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support that the adapter provides for mesh and amplification shaders, and for sampler feedback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options7
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS7 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: \_Out\_ **[D3D12_MESH_SHADER_TIER](ne-d3d12-d3d12_mesh_shader_tier.md)**
     * 
     * Indicates the level of support for mesh and amplification shaders.
     * @type {Integer}
     */
    MeshShaderTier {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: \_Out\_ **[D3D12_SAMPLER_FEEDBACK_TIER](ne-d3d12-d3d12_sampler_feedback_tier.md)**
     * 
     * Indicates the level of support for sampler feedback.
     * @type {Integer}
     */
    SamplerFeedbackTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
