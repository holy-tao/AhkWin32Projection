#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes compute shader and raw and structured buffer support in the current graphics driver.
 * @remarks
 * 
  * Direct3D 11 devices (D3D_FEATURE_LEVEL_11_0) are required to support Compute Shader model 5.0. 
  *       Direct3D 10.x devices (D3D_FEATURE_LEVEL_10_0, D3D_FEATURE_LEVEL_10_1) can optionally support Compute Shader model 4.0 or 4.1.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_d3d10_x_hardware_options
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if compute shaders and raw and structured buffers are supported; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    ComputeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x{
        get {
            if(!this.HasProp("__ComputeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x"))
                this.__ComputeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x := BOOL(this.ptr + 0)
            return this.__ComputeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x
        }
    }
}
