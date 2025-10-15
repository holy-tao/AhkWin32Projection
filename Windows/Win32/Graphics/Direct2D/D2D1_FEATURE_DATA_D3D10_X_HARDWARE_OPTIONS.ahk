#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes compute shader support, which is an option on D3D10 feature level.
 * @remarks
 * 
  * You can fill this structure by passing a D2D1_ FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS structure to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-checkfeaturesupport">ID2D1EffectContext::CheckFeatureSupport</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ns-d2d1effectauthor-d2d1_feature_data_d3d10_x_hardware_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Shader model 4 compute shaders are supported.
     * @type {BOOL}
     */
    computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x{
        get {
            if(!this.HasProp("__computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x"))
                this.__computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x := BOOL(this.ptr + 0)
            return this.__computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x
        }
    }
}
