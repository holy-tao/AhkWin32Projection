#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether or not support exists for mesh shaders, values of *SV_RenderTargetArrayIndex* that are 8 or greater, typed resource 64-bit integer atomics, derivative and derivative-dependent texture sample operations, and the level of support for WaveMMA (wave_matrix) operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options9
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS9 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not mesh shaders are supported. `true` if supported, otherwise `false`.
     * @type {Integer}
     */
    MeshShaderPipelineStatsSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not values of *SV_RenderTargetArrayIndex* that are 8 or greater are supported. `true` if supported, otherwise `false`.
     * @type {Integer}
     */
    MeshShaderSupportsFullRangeRenderTargetArrayIndex {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not typed resource 64-bit integer atomics are supported. `true` if supported, otherwise `false`.
     * @type {Integer}
     */
    AtomicInt64OnTypedResourceSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not 64-bit integer atomics are supported on `groupshared` variables. `true` if supported, otherwise `false`.
     * @type {Integer}
     */
    AtomicInt64OnGroupSharedSupported {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not derivative and derivative-dependent texture sample operations are supported. `true` if supported, otherwise `false`.
     * @type {Integer}
     */
    DerivativesInMeshAndAmplificationShadersSupported {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: \_Out\_ **[D3D12_WAVE_MMA_TIER](ne-d3d12-d3d12_wave_mma_tier.md)**
     * 
     * Indicates the level of support for WaveMMA (wave_matrix) operations.
     * @type {Integer}
     */
    WaveMMATier {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
