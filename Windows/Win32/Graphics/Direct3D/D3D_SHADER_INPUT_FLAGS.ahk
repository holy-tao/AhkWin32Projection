#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that identify shader-input options.
 * @remarks
 * 
 * <b>D3D_SHADER_INPUT_FLAGS</b>-typed values are specified in
 *           the <b>uFlags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_input_bind_desc">D3D11_SHADER_INPUT_BIND_DESC</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_shader_input_flags
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_INPUT_FLAGS extends Win32Enum{

    /**
     * Assign a shader input to a register based on the register assignment in the HLSL code (instead of letting the compiler choose the register).
     * @type {Integer (Int32)}
     */
    static D3D_SIF_USERPACKED => 1

    /**
     * Use a comparison sampler, which uses the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmp">SampleCmp (DirectX HLSL Texture Object)</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmplevelzero">SampleCmpLevelZero (DirectX HLSL Texture Object)</a> sampling functions.
     * @type {Integer (Int32)}
     */
    static D3D_SIF_COMPARISON_SAMPLER => 2

    /**
     * A 2-bit value for encoding texture components.
     * @type {Integer (Int32)}
     */
    static D3D_SIF_TEXTURE_COMPONENT_0 => 4

    /**
     * A 2-bit value for encoding texture components.
     * @type {Integer (Int32)}
     */
    static D3D_SIF_TEXTURE_COMPONENT_1 => 8

    /**
     * A 2-bit value for encoding texture components.
     * @type {Integer (Int32)}
     */
    static D3D_SIF_TEXTURE_COMPONENTS => 12

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static D3D_SIF_UNUSED => 16

    /**
     * Assign a shader input to a register based on the register assignment in the HLSL code (instead of letting the compiler choose the register).
     * @type {Integer (Int32)}
     */
    static D3D10_SIF_USERPACKED => 1

    /**
     * Use a comparison sampler, which uses the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmp">SampleCmp (DirectX HLSL Texture Object)</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmplevelzero">SampleCmpLevelZero (DirectX HLSL Texture Object)</a> sampling functions.
     * @type {Integer (Int32)}
     */
    static D3D10_SIF_COMPARISON_SAMPLER => 2

    /**
     * A 2-bit value for encoding texture components.
     * @type {Integer (Int32)}
     */
    static D3D10_SIF_TEXTURE_COMPONENT_0 => 4

    /**
     * A 2-bit value for encoding texture components.
     * @type {Integer (Int32)}
     */
    static D3D10_SIF_TEXTURE_COMPONENT_1 => 8

    /**
     * A 2-bit value for encoding texture components.
     * @type {Integer (Int32)}
     */
    static D3D10_SIF_TEXTURE_COMPONENTS => 12
}
