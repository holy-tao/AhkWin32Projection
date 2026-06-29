#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_WAVE_MMA_TIER.ahk" { D3D12_WAVE_MMA_TIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Indicates whether or not support exists for mesh shaders, values of *SV_RenderTargetArrayIndex* that are 8 or greater, typed resource 64-bit integer atomics, derivative and derivative-dependent texture sample operations, and the level of support for WaveMMA (wave_matrix) operations.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options9
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS9 {
    #StructPack 4

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not mesh shaders are supported. `true` if supported, otherwise `false`.
     */
    MeshShaderPipelineStatsSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not values of *SV_RenderTargetArrayIndex* that are 8 or greater are supported. `true` if supported, otherwise `false`.
     */
    MeshShaderSupportsFullRangeRenderTargetArrayIndex : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not typed resource 64-bit integer atomics are supported. `true` if supported, otherwise `false`.
     */
    AtomicInt64OnTypedResourceSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not 64-bit integer atomics are supported on `groupshared` variables. `true` if supported, otherwise `false`.
     */
    AtomicInt64OnGroupSharedSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not derivative and derivative-dependent texture sample operations are supported. `true` if supported, otherwise `false`.
     */
    DerivativesInMeshAndAmplificationShadersSupported : BOOL

    /**
     * Type: \_Out\_ **[D3D12_WAVE_MMA_TIER](ne-d3d12-d3d12_wave_mma_tier.md)**
     * 
     * Indicates the level of support for WaveMMA (wave_matrix) operations.
     */
    WaveMMATier : D3D12_WAVE_MMA_TIER

}
