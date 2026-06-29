#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes compute shader support, which is an option on D3D10 feature level.
 * @remarks
 * You can fill this structure by passing a D2D1_ FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS structure to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-checkfeaturesupport">ID2D1EffectContext::CheckFeatureSupport</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_feature_data_d3d10_x_hardware_options
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS {
    #StructPack 4

    /**
     * Shader model 4 compute shaders are supported.
     */
    computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x : BOOL

}
